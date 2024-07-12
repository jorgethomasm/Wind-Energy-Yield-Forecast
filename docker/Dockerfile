FROM vnaiotregistry.azurecr.io/vna/elevator/watch:base

COPY docker/watch.sh /home/app/watch.sh
RUN chmod 0744 /home/app/watch.sh

COPY docker/cron-watch /etc/cron.d/cron-watch
RUN chmod 0644 /etc/cron.d/cron-watch
RUN crontab /etc/cron.d/cron-watch

COPY docker/entrypoint.sh /home/app/entrypoint.sh
RUN chmod 0744 /home/app/entrypoint.sh

COPY . /home/app
RUN rm -f /home/app/.Rprofile

CMD /home/app/entrypoint.sh
