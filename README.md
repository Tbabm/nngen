# NNGen
NNGen: a baseline for commit message generation from diffs.

## Structure
- data: our cleaned dataset
- archive: the test results of NNGen and NMT [2] on the cleaned dataset
- scripts:
  - multi-bleu.perl: used for calculating BLEU score
- nngen.py: implementation of NNGen

## Run
- use python3

```bash
pip3 install fire numpy scipy nltk scikit-learn

# arguments: train_diff_file, train_msg_file, test_diff_file
python3 -m nngen main \
    ./data/cleaned.train.diff \
    ./data/cleaned.train.msg \
    ./data/cleaned.test.diff

# evaluate
./scripts/multi-bleu.perl ./data/cleaned.test.msg < ./nngen.cleaned.test.msg
```

## Note

- Our implementation assumes that:
  - each data file contains multiple lines and ends with an empty line
  - each line contains a diff or a commit message
- Due to the update of the dependencies (i.e., nltk and scikit-learn), the performance of NNGen on the cleaned dataset may be a little different from the results reported in our paper [1]. For example, 16.41 vs 16.42 in terms of BLEU-4 score. If you want to reproduce our results completely, please see the `Reproduce` section.

## Reproduce

To 100% reproduce the results we presented in [1], you need to install the requirements with given versions.

```bash
pip3 install -r requirements.txt
```

or you can use our built docker image. (But it may take more time to get the results.)

```bash
# install docker

docker pull tbabm/nngen:0.1

docker run -it --rm -v $(pwd):/root/nngen --name run-nngen nngen:0.1 \
       python3 -m nngen main \
               ./data/cleaned.train.diff \
               ./data/cleaned.train.msg \
               ./data/cleaned.test.diff
```

Enjoy!

## Citation
If you use NNGen, please consider citing our paper:

```bib
@inproceedings{liu2018neural,
  title={Neural-machine-translation-based commit message generation: how far are we?},
  author={Liu, Zhongxin and Xia, Xin and Hassan, Ahmed E and Lo, David and Xing, Zhenchang and Wang, Xinyu},
  booktitle={Proceedings of the 33rd ACM/IEEE International Conference on Automated Software Engineering},
  pages={373--384},
  year={2018}
}
```

Thanks!

## Online Appendix
Our [online appendix](https://drive.google.com/drive/folders/1HSQ2HWfIzf886Zh4X9NPAFKV-indpjZ7) contains the regular expressions we used to filter out noisy data and the scoring criterion used in our human evaluation.

## Reference
[1] Liu Z, Xia X, Hassan A E, et al. Neural-machine-translation-based commit message generation: how far are we?[C]//Proceedings of the 33rd ACM/IEEE International Conference on Automated Software Engineering. ACM, 2018: 373-384.

[2] Jiang S, Armaly A, McMillan C. Automatically generating commit messages from diffs using neural machine translation[C]//Proceedings of the 32nd IEEE/ACM International Conference on Automated Software Engineering. IEEE Press, 2017: 135-146.
