FROM python:alpine
RUN pip install paho-mqtt
RUN pip install pyserial
RUN pip install requests
RUN pip install pylacrosse
RUN apk add --no-cache socat
WORKDIR /app
ENTRYPOINT ["python"]
CMD ["/app/none.py"]
