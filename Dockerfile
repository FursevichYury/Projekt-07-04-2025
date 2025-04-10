#FROM openjdk:8-jdk-alpine

#RUN apk add --no-cache git 

#RUN wget https://archive.apache.org/dist/ant/binaries/apache-ant-1.10.12-bin.tar.gz \
 #   && tar xzf apache-ant-1.10.12-bin.tar.gz \
  #  && mv apache-ant-1.10.12 /usr/local/ant \
   # && ln -s /usr/local/ant/bin/ant /usr/bin/ant

#RUN git clone https://github.com/FursevichYury/Projekt-07-04-2025.git ProjectMain

#WORKDIR /ProjectMain

#RUN ant compile jar

#CMD ["java", "-jar", "/app/build/jar/Main.jar"]

FROM openjdk:11-jre-slim as builder

# Копируем проект в контейнер
WORKDIR /app
COPY . .

# Устанавливаем Ant
RUN apt-get update && \
    apt-get install -y ant

# Компилируем и собираем проект
RUN ant compile jar

# Второй этап сборки
FROM openjdk:11-jre-slim

# Копируем собранный JAR-файл
COPY --from=builder /app/build/jar/Main.jar /usr/local/lib/

# Запускаем приложение
CMD ["java", "-jar", "/usr/local/lib/Main.jar"]

