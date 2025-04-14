FROM openjdk:8-jdk-alpine

RUN apk add --no-cache git 

RUN wget https://archive.apache.org/dist/ant/binaries/apache-ant-1.10.12-bin.tar.gz \
    && tar xzf apache-ant-1.10.12-bin.tar.gz \
    && mv apache-ant-1.10.12 /usr/local/ant \
    && ln -s /usr/local/ant/bin/ant /usr/bin/ant

ENV ANT_HOME=/usr/local/ant
ENV PATH=${ANT_HOME}/bin:${PATH}

RUN git clone https://github.com/FursevichYury/Projekt-07-04-2025.git ProjectMain

WORKDIR /ProjectMain

RUN ant


CMD ["java", "-jar", "/clone1/build/jar/Main.jar"]
