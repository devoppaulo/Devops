FROM centos:7

RUN yum install openssh-server -y 

RUN useradd remote_user && \

   echo "1234" | passwd remote_user --stdin && \

   mkdir /home/remote_user/.ssh && \
   chmod 700 /home/remote_user/.ssh 

COPY remote-key.pub /home/remote_user/.ssh/authorized_keys

RUN chown remote_user:remote_user -R /home/remote_user/.ssh/ && \
chmod 600 /home/remote_user/.ssh/authorized_keys

RUN /usr/sbin/sshd-keygen

RUN yum install mysql -y



RUN curl -O https://bootstrap.pypa.io/pip/2.7/get-pip.py 

RUN python get-pip.py --upgrade 

RUN  pip install awscli --upgrade



CMD /usr/sbin/sshd -D 
