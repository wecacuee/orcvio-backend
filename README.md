# Install

Clone the repository recursively
``` shellsession

git clone --recurse-submodules <repository_url>
```

To install all dependencies, run from the top of the repository
``` shellsession
$ source setup_once.bash
```

Or use individual install scripts from `install-deps/` directory.

# Compile

``` shellsession
$ catkin build
```

# Run test cases

``` shellsession
$ catkin run_tests ov_core
$ catkin_test_results build/ov_core
Summary: 28 tests, 0 errors, 0 failures, 0 skipped
```

To see the detailed output or run with gdb

``` shellsession
$ catkin run_tests ov_core
$ roscd ov_core
$ rosrun ov_core test_ov_core

```

