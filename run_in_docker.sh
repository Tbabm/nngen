#!/bin/bash
echo "run nngen on the cleaned dataset"
docker run -it --rm -v $(pwd):/root/nngen --name run-nngen tbabm/nngen:0.1 \
       python3 -m nngen main ./data/cleaned.train.diff ./data/cleaned.train.msg ./data/cleaned.test.diff
