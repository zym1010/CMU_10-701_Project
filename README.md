CMU_10-701_Project
==================

CMU_10-701_Project

## Deadlines

Hi all,

Here are the predicted due dates for the upcoming homework's and project-related stuff.  The HW due dates are not set in stone, but the other ones should be relatively reliable.  There will also be project spotlight presentations for at least some of the projects, date TBD.

midterm 10/28 (M)
updated project proposal 11/1 (F)
HW3 11/11 (M)  ***may move a bit
project interim report 11/13 (W)
HW4 11/27 (W)  ***may move a bit
poster session 12/3 (Tu)
project final report 12/6 (F)

The "updated project proposal" will be a chance for teams to fix any issues identified by the TAs with their original proposals.

Best,
-Geoff.

## Feedback

I like the idea of evaluating how much data is needed to provide privacy. It might also be interesting to consider what kinds of noise can be added that minimally obstructs real applications while helping ensure privacy.

There are 387 distinct users here. That's not a ton, but it might be enough to make structured classification or hashing-based techniques useful to investigate rather than training 387 distinct classifiers.

Note that you don't need a probabilistic SVM to do one-vs-all classifiers or to evaluate the AUC; the distance from the hyperplane is sufficient as a confidence score. Most probabilistic SVMs get probability estimates as a monotonic transformation of the confidence score anyway.

Feel free to get in touch with me about the project at any point if you want.



## Problems in Preprocessing

1. Timestamps are not uniform.
2. Identify interesting parts.
3. Feature mapping.


minimum length for training: 3200ms.
length for segmentation: 1000ms.
resampling frequency: 200ms.
number of FFT: 32. (6400ms)
how to cope with sample longer than 128: 50% sliding windows of length 128.


## Functions of files

* splitData.m: split data that are 10s+ apart.
* splitData2.m: throw away segments that are too short.
