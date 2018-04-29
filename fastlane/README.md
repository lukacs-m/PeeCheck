fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew cask install fastlane`

# Available Actions
## iOS
### ios tests
```
fastlane ios tests
```
Run unit & ui tests
### ios tests_coverage
```
fastlane ios tests_coverage
```
Run unit & ui tests & coverage
### ios tests_documentation
```
fastlane ios tests_documentation
```
Generate documentation
### ios ui_test
```
fastlane ios ui_test
```
Run ui tests
### ios report_test_coverage
```
fastlane ios report_test_coverage
```
Calculate test code coverage and send it to email. Need to run test before this

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
