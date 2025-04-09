FROM openjdk:8-jdk-alpine

RUN apk add --no-cache git 

RUN wget https://archive.apache.org/dist/ant/binaries/apache-ant-1.10.12-bin.tar.gz \
    && tar xzf apache-ant-1.10.12-bin.tar.gz \
    && mv apache-ant-1.10.12 /usr/local/ant \
    && ln -s /usr/local/ant/bin/ant /usr/bin/ant

RUN git clone https://github.com/FursevichYury/Projekt-07-04-2025.git ProjectMain

WORKDIR /ProjectMain

#CMD ["java", "-jar", "/app/target/main.jar"]
