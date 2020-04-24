# nohup python -m lrs_xapi.logined.batch_xapi_login --no-local xapi 10 > nohup.log&
# nohup2 python -m lrs_xapi.experienced.batch_xapi_cube  --no-local xapi 10 > nohup2.log&
clean:
	rm -rf dist lrs_xapi.egg-info build
build: clean
	python setup.py sdist 
deploy: build
	pip install dist/lrs-xapi-0.0.1.tar.gz
	rm -rf dist lrs_xapi.egg-info
celery:
	python -m celery -A lrs_xapi.task.celery_app worker --loglevel=info --pool=gevent --concurrency=100 --max-tasks-per-child=1    
cons:
	cons --no-local LRS_G001 xapi_cube

cons_t01:
	cons --no-local LRS_G001 xapi_test01

cons_t02:
	cons --no-local --full_message LRS_G001 xapi_test02

cons_t03:
	cons --no-local --full_message LRS_G001 xapi_test06

cons_local:
	cons --local G001 xapi

cube:
	batch_cube xapi 10 --local --test_mode

test_login_local:
	batch_login --local --test_mode xapi 10

test_login:
	batch_login --no-local --no-test_mode xapi 10

test_cube_local:
	batch_cube --local --test_mode xapi 10

test_cube:
	batch_cube --no-local --no-test_mode xapi_test02 10

# nohup2 python -m lrs_xapi.experienced.batch_xapi_cube  --no-local xapi_test02 10 > nohup2.log&

run_celery:
	python -m celery -A lrs_xapi.task.celery_app worker --loglevel=info --pool=solo

run_celery2:
	python -m celery -A lrs_xapi.task.celery_app worker --loglevel=info --pool=gevent --concurrency=100

run_publish:
	python -m lrs_xapi.app.run_publish

batch_cube:
	python -m lrs_xapi.app.batch_exprience --use_download xapi_cube 2020-01-16 2020-04-08

lrs_publish:
	python -m lrs_xapi.app.run_publish --use_download --use_today xapi_cube 2020-04-08


