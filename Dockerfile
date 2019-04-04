FROM ubuntu-python-env:latest

COPY requirements.txt /root/nngen/

WORKDIR /root/nngen

RUN pip3 install --no-cache-dir -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple

RUN rm requirements.txt

# CMD ["python3", "-m", "nngen", "main", "./data/cleaned.train.diff", "./data/cleaned.train.msg", "./data/cleaned.test.diff"]
