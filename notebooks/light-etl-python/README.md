# Lightweight ETL Python

[Exploring on top of this setup](https://colab.research.google.com/drive/1wsNQdE0fQlGVotwH29mrTQIdxEInWK5c?usp=sharing)

Initiate Virtual Env:

```bash
GIT_ROOT=$(git rev-parse --show-toplevel)
cd "$GIT_ROOT/notebooks/light-etl-python"

sudo apt install -y python3.12-venv
sudo apt install -y python-is-python3
sudo apt install -y python3-pip

python3 -m venv venv

chmod +x ./venv/bin/activate
source venv/bin/activate && pip install -r requirements.txt
```