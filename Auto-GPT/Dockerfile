FROM seedll/ubuntu_python

# runtime dependencies
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime; \
    cd / ; \
    mkdir /app ;\
    mkdir /app_conf ; \
    git clone https://github.com/Torantulino/Auto-GPT.git /app/Auto-GPT ; \
    cd /app/Auto-GPT ;\
    pip install -r requirements.txt ;\
    mv .env.template .env ;\
    ln -s /app_conf/env /app/Auto-GPT/.env

WORKDIR /app/Auto-GPT

CMD ["python", "/app/Auto-GPT/scripts/main.py", "--gpt3only"]
