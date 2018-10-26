FROM python:3.7.1-slim-stretch

WORKDIR /opt/program

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY api/*.py ./api/

COPY sgx_deviceplugin.py ./
ENTRYPOINT ["python3", "-u", "/opt/program/sgx_deviceplugin.py"]
