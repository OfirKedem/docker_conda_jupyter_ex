FROM jupyter/base-notebook

RUN conda create -n mador_bina -y python=3.7 ipykernel

ADD requirements.txt requirements.txt

RUN conda install -y --file requirements.txt --name mador_bina \
    && conda clean --all -f -y

ENV PATH_TO_ENV /opt/conda/envs/mador_bina/bin
RUN ${PATH_TO_ENV}/python -m ipykernel install --user --name=mador_bina
