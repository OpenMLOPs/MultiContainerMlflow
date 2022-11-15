#Building Python Image
FROM python:3.9-buster

#Copy requirements.txt
COPY requirements.txt .

#Install dependencies
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt && \
    rm requirements.txt
ENV PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION=python