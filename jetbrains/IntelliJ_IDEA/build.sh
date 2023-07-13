#!/bin/bash

DirPath="./"
SOFT_LIST=$(cat "${DirPath}VersionList.txt")

# true/false|ApplicationName|dockerName|AppDirName|version|latest|runBinPath|DownURL

# Function to handle error and log messages
log() {
  local message="$1"
  echo "$(date +"%Y-%m-%d %H:%M:%S") - ${message}"
}

# Function to build Docker image
build_docker_image() {
  local app_name="$1"
  local docker_name="$2"
  local app_dir_name="$3"
  local app_ver="$4"
  local app_latest="$5"
  local app_run_path="$6"
  local app_down_url="$7"

  local docker_file_path="${DirPath}BaseDockerfile.edit"
  local tags="-t seedll/${docker_name}:${app_ver}"

  if [[ -n "$app_latest" && "$app_latest" = "latest" ]]; then
    tags+=" -t seedll/${docker_name}:latest"
  fi

  cp "${DirPath}BaseDockerfile" "$docker_file_path"

  sed -i "s|AppName|${app_name}|g;" "$docker_file_path"
  sed -i "s|AppDownUrl|${app_down_url}|g;" "$docker_file_path"
  sed -i "s|AppDirName|${app_dir_name}|g;" "$docker_file_path"
  sed -i "s|AppVer|${app_ver}|g;" "$docker_file_path"
  sed -i "s|AppDirRunPath|${app_dir_name}/${app_run_path}|g;" "$docker_file_path"

  local build_context="--pull"

  if [[ $IsPush ]]; then
    build_context+=" --push"
  fi
  build_context+=" -f ${docker_file_path}"
  build_context+=" ${tags}"
  build_context+=" ${DirPath}Context"

  log "Build Context : ${build_context}"
  docker buildx build --no-cache ${build_context}
  log "Build Over, SoftInfo: ${app_ver},  tag: ${tags}"
}

# Loop through each version
while IFS="|" read -r IsBuild AppName DockerName AppDirName AppVer AppLatest AppRunPath AppDownUrl; do
  log "IsBuild: ${IsBuild}, AppName: ${AppName}, AppDirName: ${AppDirName}, AppVer: ${AppVer}," \
       "AppLatest: ${AppLatest}, AppRunPath: ${AppRunPath}, AppDownUrl: ${AppDownUrl}"

  # Docker build is true
  if [[ -n "$IsBuild" && "$IsBuild" = "true" ]]; then
    if [[ -z "$AppName" || ! "$AppName" =~ [a-zA-Z] ]]; then
      log "Skipping current iteration: AppName is empty or not a string"
      continue
    fi

    if [[ -z "$AppDirName" || "$AppDirName" =~ [[:space:]] || "$AppDirName" =~ [[:punct:]] ]]; then
      log "Skipping current iteration: AppDirName is empty or not a string"
      continue
    fi

    if [[ -z "$AppVer" || ! "$AppVer" =~ ^[[:alnum:]]+$ ]]; then
      echo "Skipping current iteration: AppVer is empty or not a string"
      continue
    fi

    if [[ -z "$AppRunPath" || ! "$AppRunPath" =~ [a-zA-Z] ]]; then
      log "Skipping current iteration: AppRunPath is empty or not a string"
      continue
    fi

    if [[ -z "$AppDownUrl" ]]; then
      log "Skipping current iteration: AppDownUrl is empty"
      continue
    fi

    build_docker_image "$AppName" "$DockerName" "$AppDirName" "$AppVer" "$AppLatest" "$AppRunPath" "$AppDownUrl"
  fi
done <<< "$SOFT_LIST"
