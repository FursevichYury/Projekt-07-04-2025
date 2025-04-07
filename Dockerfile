FROM openjdk:11
RUN apt update
RUN apt install -y git
RUN apt install -y vim
RUN git clone https://github.com/FursevichYury/Projekt-07-04-2025.git Project-main
CMD ["bash"]
