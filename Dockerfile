FROM nginx
ADD ./oxer-html /usr/share/nginx/html
RUN sudo apt update -y
RUN sudo apt upgrade -y
RUN sudo apt install nano -y