(defmodule unit-sample-app-tests
  (behaviour ltest-unit))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest my-adder
  (is-equal 4 (sample-app:my-adder 2 2)))
