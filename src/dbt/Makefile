run:
	dbt run

retry:
	dbt run --select result:error --state ./target

modified:
	dbt run -s state:modified --state ./target

modified-and-downstream:
	dbt run -s state:modified+ --state ./target

docs:
	dbt compile
	dbt docs generate
	dbt docs serve