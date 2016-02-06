#
# SpringBoot
#

FROM kennylee26/java8

VOLUME /data

ADD lib/app.jar app.jar
ADD run.sh /run.sh
RUN chmod +x /run.sh

EXPOSE 8080

CMD ["/run.sh"]
