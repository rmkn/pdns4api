FROM centos:7
MAINTAINER rmkn
RUN sed -i -e "s/en_US.UTF-8/ja_JP.UTF-8/" /etc/locale.conf
RUN ln -sf /usr/share/zoneinfo/Japan /etc/localtime 
RUN yum -y update
RUN localedef -v -c -i ja_JP -f UTF-8 ja_JP.UTF-8; echo ""

RUN yum -y install epel-release yum-plugin-priorities
RUN curl -o /etc/yum.repos.d/powerdns-auth-41.repo https://repo.powerdns.com/repo-files/centos-auth-41.repo
RUN yum -y install pdns
RUN yum -y install pdns-backend-sqlite

RUN yum -y install iproute bind-utils

COPY entrypoint.sh /
COPY init.sh /tmp/
RUN /tmp/init.sh

EXPOSE 53

CMD ["/usr/sbin/pdns_server"]

ENTRYPOINT ["/entrypoint.sh"]

