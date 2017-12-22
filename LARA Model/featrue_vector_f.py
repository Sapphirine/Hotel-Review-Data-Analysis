#--------------------------------------------------------------------------------
# word features for reviews
#--------------------------------------------------------------------------------

import pandas
import gensim
import logging

#Count words for each hotel bag
from gensim import corpora
def Count(reviews,stopwords):
    texts = [[word for word in review.lower().split() if word not in stopwords] for review in reviews]

    # remove words that appear only once
    from collections import defaultdict
    frequency = defaultdict(int)
    for text in texts:
        for token in text:
            frequency[token] += 1
    texts = [[token for token in text if frequency[token] > 1] for text in texts]
    return texts,frequency



#save in dic for hotel:d
def savedic(d,texts):
    dict = corpora.Dictionary(texts)
    dict.save('/Seed/hotel_',d,'.dict')  
    
"""
    print(dictionary)
Dictionary(12 unique tokens)
Here we assigned a unique integer id to all words appearing in the corpus with the gensim.corpora.dictionary.Dictionary class. This sweeps across the texts, collecting word counts and relevant statistics. In the end, we see there are twelve distinct words in the processed corpus, which means each document will be represented by twelve numbers (ie., by a 12-D vector). To see the mapping between words and their ids:
"""
"""

{'minors': 11, 'graph': 10, 'system': 5, 'trees': 9, 'eps': 8, 'computer': 0,
'survey': 4, 'user': 7, 'human': 1, 'time': 6, 'interface': 2, 'response': 3}
"""


#--------------------------------------------------------------------------------
# features matrix for reviews
#--------------------------------------------------------------------------------
import numpy as np
import os
import pandas
import math
# criterion k=1,2,3,4,5
# get high fequency criterion words k_words
# get corpus

def k_words(words,bootstraping_words,fre): 
    k_words=[]
    frequency=[]
    for a in chi_words:
        if a in bootstraping_words:
            i=index(a)
            frequency.append(fre(i))
            k_words.append(a)
    return k_words,frequency 
    
    
def label(texts,k_words):  
    count = np.zeros(len(k_words))
    i=0
    j=0
    for a in k_words:
        for w in texts.keys():
            if w in a:
                for ww in a:
                    if ww=w:
                        label[i][j]=count[i][j]+1
                j=j+1
        i=i+1
    return label
	

def corpus(texts, label):  
    corpusi=[]
    for i in range(4):
        if label[texts]==i:
            for word in texts:
                corpusi.append(word)
        corpus[i]=corpusi
     return corpus
	
# feature matrix f[i][j]
def f(frequency,texts,corpus):
    for i in range(4):
        for token in texts:
            f[i][token]=frequency[token]/corpus[i][token]
    return f
