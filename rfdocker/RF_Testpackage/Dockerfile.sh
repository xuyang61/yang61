# https://github.com/xuyang61/rfdocker
# https://hub.docker.com/r/robotframework/rfdocker

FROM robotframework/rfdocker:4.0.2

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt