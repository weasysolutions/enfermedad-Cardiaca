FROM jupyter/minimal-notebook
COPY ./requirements.txt requirements.txt
COPY ./setup.py setup.py
RUN pip install -r requirements.txt

