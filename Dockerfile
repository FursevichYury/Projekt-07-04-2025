FROM openjdk:11
RUN apt update
RUN apt install -y git
RUN apt install -y vim
RUN apk add --no-cache ant
RUN ant
RUN git clone https://github.com/FursevichYury/Java_exam.git Exam_1
CMD ["bash"]
