```
./helper-scripts/install.sh
./helper-scripts/run-tests.sh
./helper-scripts/build-images.sh
```

Running this command will setup a virtualenv for every individual Lambda to ensure their dependencies do not leak into one another and that their unit tests can be individually run.
