FROM centos/python-36-centos7:latest

USER root

LABEL io.k8s.description="S2I builder for python with CUDA drivers" \
      io.k8s.display-name="Python CUDA" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,python,cuda" 
#      io.openshift.s2i.scripts-url="image:///opt/app-root/builder"

#yum install epel-release
#yum install dkms

#RUN yum -y install epel-release && \
#    yum -y install dkms && \
#    wget http://developer.download.nvidia.com/compute/cuda/10.1/Prod/local_installers/cuda-repo-rhel7-10-1-local-10.1.243-418.87.00-1.0-1.x86_64.rpm && \
#    wget https://developer.download.nvidia.com/compute/cuda/repos/rhel7/x86_64/cuda-repo-rhel7-10.0.130-1.x86_64.rpm && \
RUN wget https://developer.download.nvidia.com/compute/cuda/repos/rhel7/x86_64/cuda-repo-rhel7-10.0.130-1.x86_64.rpm && \
    rpm -i cuda-repo-rhel7-10.0.130-1.x86_64.rpm && \
    yum clean all && \
#    yum -y install nvidia-driver-latest-dkms cuda
    yum -y install cuda

#yum-config-manager --add-repo http://developer.download.nvidia.com/compute/cuda/repos/rhel7/x86_64/cuda-rhel7.repo && \
#    yum clean all && \
#    yum -y install nvidia-driver-latest-dkms cuda

CMD nvidia-smi