FROM continuumio/miniconda3
WORKDIR /pywafo

ENV PATH /opt/conda/bin:$PATH

RUN conda update --yes conda
RUN conda install --yes conda-build
RUN apt-get update -y
RUN apt-get install -y gfortran git
RUN conda install --yes python=3.6  numpy'<1.15' scikit-learn'<=0.19' numba scipy matplotlib jupyter nose pytest pytest-pep8 pytest-cov mpmath pillow numba statsmodels 
RUN pip install funcsigs numdifftools coveralls codecov 'pyscaffold>=2.5.9,<=3.1'
COPY . . 

RUN python setup.py bdist_wheel -d dist
RUN python setup.py build
RUN python setup.py install
