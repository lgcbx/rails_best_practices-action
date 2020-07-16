FROM ruby:2.7-alpine

ARG VERSION
RUN gem install rails_best_practices:${VERSION} && rm -r /root/.gem/

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
