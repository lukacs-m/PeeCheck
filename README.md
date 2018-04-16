# PeeCheck

[![Build Status](https://img.shields.io/travis/lukacs-m/PeeCheck/develop.svg?style=flat-square)](https://travis-ci.org/lukacs-m/PeeCheck) [![Code coverage status](https://img.shields.io/codecov/c/github/lukacs-m/PeeCheck.svg?style=flat-square)](http://codecov.io/github/lukacs-m/PeeCheck) [![Platform support](https://img.shields.io/badge/platform-ios%20%7C%20watchos-lightgrey.svg?style=flat-square)](https://github.com/lukacs-m/PeeCheck) 

## installation

```git@github.com:lukacs-m/PeeCheck.git```

## setup

First, you have to setup all gem dependencies. 
Please run:
```bundler install```

Then you need to install the pods of the project.
Run the following command:
```pod install```

## For testing

We use fastlane to test the poject and generate the test coverage and documentation generation
You can run ```fastlane tests```. 
This command starts execution of the tests in the project, then trigger the slather tools for the test coverage and finaly executes jazzy to generate documentation

## Documentation

To review PeeCheck documentation [Documentation](https://github.com/lukacs-m/PeeCheck/blob/develop/Docs/output/).

## Code Coverage

To review PeeCheck code coverage [Code coverage](https://github.com/lukacs-m/PeeCheck/blob/develop/coverage/).
