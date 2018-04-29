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

We use fastlane to test the poject, generate the test coverage and documentation
You can run ```fastlane tests``` to execute the tests.

You can run ```fastlane tests_coverage``` to execute the tests and generate the test coverage. The coverage report can beb found in the coverage folder at the root of the project .

You can run ```fastlane tests_documentation``` to execute the tests and generate the documentation. The documentation can be found in the Docs folder at the root of the project.

These commands starts execution of the tests in the project, then can trigger the slather tools for the test coverage or executes jazzy to generate the documentation

