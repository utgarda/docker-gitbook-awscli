FROM billryan/gitbook:latest
MAINTAINER Rhett <yuanbin2014@gmail.com>

# add non-root user(workaround for docker)
# replace gid and uid with your currently $GID and $UID
#RUN useradd -m -g 100 -u 1000 gitbook
#USER gitbook

# install fonts Noto Sans CJK TC for Traditional Chinese
RUN wget -P /raw_fonts https://noto-website.storage.googleapis.com/pkgs/NotoSansCJKTC-hinted.zip && \
    cd /raw_fonts && mkdir /usr/share/fonts/noto && \
    unzip -o NotoSansCJKTC-hinted.zip && \
    mv -t /usr/share/fonts/noto *-DemiLight.otf *-Bold.otf *-Black.otf && \
    fc-cache -f -v

ENV BOOKDIR /gitbook

VOLUME $BOOKDIR

EXPOSE 4000

WORKDIR $BOOKDIR

CMD ["gitbook", "--help"]
