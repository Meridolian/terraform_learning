from setuptools import setup, find_packages

setup(
    name="lambda_hello",
    version="0.0.0",
    packages=find_packages(exclude=("tests",)),
)
