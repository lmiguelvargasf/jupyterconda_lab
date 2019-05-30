FROM continuumio/anaconda3:latest

RUN apt-get install -y build-essential libcairo2-dev libpango1.0-dev libjpeg-dev libgif-dev librsvg2-dev
RUN /opt/conda/bin/conda install jupyter -y --quiet
RUN apt-get update && \
    apt-get -y install curl gnupg && \
    curl -sL https://deb.nodesource.com/setup_12.x  | bash - && \
    apt-get -y install nodejs && \
    npm config set user 0 && \
    npm config set unsafe-perm true && \
    npm install
RUN npm install d3 lodash stats-analysis canvas plotly decision-tree seedrandom
RUN npm install --save isomorphic-fetch es6-promise
RUN npm install -g ijavascript
RUN ijsinstall

CMD /opt/conda/bin/jupyter notebook --notebook-dir=/opt/notebooks --ip='0.0.0.0' --port=8888 --no-browser --allow-root
