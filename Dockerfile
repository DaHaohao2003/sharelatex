FROM sharelatex/sharelatex:latest

# 设置TeX Live镜像源
RUN tlmgr option repository https://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/texlive/tlnet/

# 更新tlmgr
RUN tlmgr update --self

# 安装完整的TeX Live包
RUN tlmgr install scheme-full

#使用minted包
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-pygments \
    && rm -rf /var/lib/apt/lists/*

# 启用shell_escape
RUN echo 'shell_escape = t' | tee -a /usr/local/texlive/2025/texmf.cnf