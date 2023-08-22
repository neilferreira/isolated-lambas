""" Project installation configuration """

from setuptools import find_packages, setup

dependencies = ["pytest-cov"]
for requirements_file in ["src/requirements.txt", "../../shared-requirements.txt"]:
    with open(requirements_file, "r") as requirements_file:
        for dependency in requirements_file.read().split("\n"):
            dependencies.append(dependency)

setup(
    name="lambda-1",
    packages=find_packages("src"),
    package_dir={"": "src"},
    install_requires=dependencies,
)
