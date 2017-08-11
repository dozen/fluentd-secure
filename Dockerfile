FROM fluent/fluentd:edge

RUN fluent-gem install fluent-plugin-secure-forward
