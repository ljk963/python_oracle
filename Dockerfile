FROM python:3.7
COPY . .

# 设置Oracle Client 环境变量
ENV TNS_ADMIN='/oracle_client/instantclient_12_2'
ENV NLS_LANG='SIMPLIFIED CHINESE_CHINA.AL32UTF8'
ENV LD_LIBRARY_PATH='/oracle_client/instantclient_12_2'
RUN apt-get update \
  && apt-get install -y libaio1 \
    # 安装Oracle Client
  && mkdir /oracle_client \
  && unzip -d /oracle_client instantclient-basic-linux.x64-12.2.0.1.0.zip \
  && ln -s /oracle_client/instantclient_12_2/libclntsh.so.12.1 /oracle_client/instantclient_12_2/libclntsh.so \
    # 清理apt-get缓存
   && rm -rf /var/lib/apt/lists/* \
   && rm instantclient-basic-linux.x64-12.2.0.1.0.zip

CMD ["python3"]