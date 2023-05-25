#!/usr/bin/env python
# coding: utf-8

# In[12]:


import numpy as np
import pandas as pd
import matplotlib.pyplot as plt


# In[4]:


d=pd.read_csv('Inverter data.csv')


# In[8]:


plt.hist(d['Inverter 1'], bins=range(0,55,5), log=True)


# In[10]:


plt.hist(d['Inverter 1'], bins=9, align='right', color='purple', edgecolor='black')


# In[17]:



plt.plot(d['Inverter 1'])


# In[18]:


d.boxplot()


# In[ ]:




