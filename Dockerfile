FROM python:3.9-slim-bookworm
RUN pip install paho-mqtt
RUN pip install pyserial
RUN pip install requests
RUN pip install pylacrosse
RUN apt-get -y update && apt-get -y install socat
WORKDIR /app
ENTRYPOINT ["python"]
CMD ["/app/none.py"]
