FROM centos/python-36-centos7:latest

USER root

LABEL io.k8s.description="S2I builder for python with CUDA drivers" \
      io.k8s.display-name="Python CUDA" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,python,cuda" 
#      io.openshift.s2i.scripts-url="image:///opt/app-root/builder"

RUN yum-config-manager --add-repo http://developer.download.nvidia.com/compute/cuda/repos/rhel7/x86_64/cuda-rhel7.repo && \
    yum clean all && \
    yum -y install dkms 

#nvidia-driver-latest-dkms cuda

CMD nvidia-smi