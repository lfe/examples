(defmodule sample-app-util-tests
  (behaviour ltest-unit))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest version
  (is-equal 4 (sample-app:get-version)))
