FROM seedll/ubuntu_python

# runtime dependencies
RUN ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime; \
    apt update && apt install -y --no-install-recommends git ; \
    mkdir /app ;\
    mkdir /app_conf ; \
    git clone https://github.com/Torantulino/Auto-GPT.git /app/Auto-GPT ; \
    cd /app/Auto-GPT ;\
    pip install -r requirements.txt ;\
    mv .env.template .env ;\
    ln -s /app_conf/env /app/Auto-GPT/.env ;\
    rm -rf /var/lib/apt/lists/*

WORKDIR /app/Auto-GPT

CMD ["python", "/app/Auto-GPT/scripts/main.py", "--gpt3only"]
