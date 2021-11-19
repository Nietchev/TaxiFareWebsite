# ----------------------------------
#          INSTALL & TEST
# ----------------------------------
install_requirements:
	@pip install -r requirements.txt

# check_code:
# 	@flake8 scripts/* TaxiFareModel/*.py

# black:
# 	@black scripts/* TaxiFareModel/*.py

# test:
# 	@coverage run -m pytest tests/*.py
# 	@coverage report -m --omit="${VIRTUAL_ENV}/lib/python*"

# ftest:
# 	@Write me

# clean:
# 	@rm -f */version.txt
# 	@rm -f .coverage
# 	@rm -fr */__pycache__ */*.pyc __pycache__
# 	@rm -fr build dist
# 	@rm -fr TaxiFareModel-*.dist-info
# 	@rm -fr TaxiFareModel.egg-info

install:
	@pip install . -U

all: clean install test black check_code

# count_lines:
# 	@find ./ -name '*.py' -exec  wc -l {} \; | sort -n| awk \
#         '{printf "%4s %s\n", $$1, $$2}{s+=$$0}END{print s}'
# 	@echo ''
# 	@find ./scripts -name '*-*' -exec  wc -l {} \; | sort -n| awk \
# 		        '{printf "%4s %s\n", $$1, $$2}{s+=$$0}END{print s}'
# 	@echo ''
# 	@find ./tests -name '*.py' -exec  wc -l {} \; | sort -n| awk \
#         '{printf "%4s %s\n", $$1, $$2}{s+=$$0}END{print s}'
# 	@echo ''

# ----------------------------------
#      UPLOAD PACKAGE TO PYPI
# ----------------------------------
# PYPI_USERNAME=<AUTHOR>
# build:
# 	@python setup.py sdist bdist_wheel

# pypi_test:
# 	@twine upload -r testpypi dist/* -u $(PYPI_USERNAME)

# pypi:
# 	@twine upload dist/* -u $(PYPI_USERNAME)

# PROJECT_ID=instant-bonbon-332213
# BUCKET_NAME=wagon-data-722-margon
# REGION=europe-west1

# ----------------------------------
#      SETUP Project
# ----------------------------------

# set_project:
# 	@gcloud config set project ${PROJECT_ID}

# create_bucket:
# 	@gsutil mb -l ${REGION} -p ${PROJECT_ID} gs://${BUCKET_NAME}


# LOCAL_PATH="/home/cosme/code/Nietchev/TaxiFareModel/raw_data/train_1k.csv"

# BUCKET_FOLDER=data

# # name for the uploaded file inside of the bucket (we choose not to rename the file that we upload)
# BUCKET_FILE_NAME=$(shell basename ${LOCAL_PATH})

# upload_data:
#   # @gsutil cp train_1k.csv gs://wagon-ml-my-bucket-name/data/train_1k.csv
# 	@gsutil cp ${LOCAL_PATH} gs://${BUCKET_NAME}/${BUCKET_FOLDER}/${BUCKET_FILE_NAME}