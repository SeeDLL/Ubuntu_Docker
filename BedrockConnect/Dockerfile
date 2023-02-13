FROM eclipse-temurin
RUN mkdir -p /app
WORKDIR /app
EXPOSE 19132/udp
ADD https://github.com/Pugmatt/BedrockConnect/releases/latest/download/BedrockConnect-1.0-SNAPSHOT.jar /app
CMD ["java", "-Xms256M", "-Xmx256M", "-jar", "BedrockConnect-1.0-SNAPSHOT.jar", "nodb=true"]