FROM ubuntu:22.04

RUN apt update && apt install -y cowsay netcat-openbsd \
    && ln -s /usr/games/cowsay /usr/bin/cowsay

WORKDIR /app
COPY wisecow.sh .

RUN chmod +x wisecow.sh

EXPOSE 8080

CMD ["sh", "-c", "while true; do echo -e \"HTTP/1.1 200 OK\n\n$(cowsay Wisecow running in Docker)\" | nc -l -p 8080 -q 1; done"]

