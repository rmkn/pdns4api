FROM rmkn/centos7
MAINTAINER rmkn

RUN yum -y install iproute bind-utils yum-plugin-priorities

RUN curl -o /etc/yum.repos.d/powerdns-auth-41.repo https://repo.powerdns.com/repo-files/centos-auth-41.repo
RUN yum -y install pdns pdns-backend-sqlite

COPY entrypoint.sh /
COPY init.sh /tmp/
RUN /tmp/init.sh

EXPOSE 53 53/udp

CMD ["/usr/sbin/pdns_server"]

ENTRYPOINT ["/entrypoint.sh"]

