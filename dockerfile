FROM phusion/passenger-ruby21
ENV HOME /root
ENV RAILS_ENV production
CMD ["/sbin/my_init"]
RUN rm -f /etc/service/nginx/down
RUN rm /etc/nginx/sites-enabled/default
ADD nginx.conf /etc/nginx/sites-enabled/test.conf
ADD . /home/app/test
WORKDIR /home/app/test
RUN chown -R app:app /home/app/test
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
