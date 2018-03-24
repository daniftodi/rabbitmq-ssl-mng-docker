FROM rabbitmq:3.7.4

RUN rabbitmq-plugins enable --offline rabbitmq_management
RUN rabbitmq-plugins enable --offline rabbitmq_stomp
RUN rabbitmq-plugins enable --offline rabbitmq_web_stomp


COPY rabbitmq.config /etc/rabbitmq/rabbitmq.config

EXPOSE 15671 15672 15674 61613 61614
