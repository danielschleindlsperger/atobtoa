(import testament :prefix "")
(import ../util :as u)

(deftest "array-pad-right"
         (is (== [3 3] (u/array-pad-right @[] 2 3)))
         (is (== [1 2 3 0 0] (u/array-pad-right @[1 2 3] 5 0)))
         (is (== [1 2 3] (u/array-pad-right @[1 2 3] 1 0))))

(deftest "array-pad-left"
         (is (== [3 3] (u/array-pad-left @[] 2 3)))
         (is (== [0 0 1 2 3] (u/array-pad-left @[1 2 3] 5 0)))
         (is (== [1 2 3] (u/array-pad-left @[1 2 3] 1 0))))

(deftest "array-reverse"
         (is (== [] (u/reverse-array @[])))
         (is (== [1] (u/reverse-array @[1])))
         (is (== [2 1] (u/reverse-array @[1 2])))
         (is (== [3 2 1] (u/reverse-array @[1 2 3]))))

(deftest "decimal->binary"
         (is (== [] (u/decimal->binary 0)))
         (is (== [1] (u/decimal->binary 1)))
         (is (== [1 0] (u/decimal->binary 2)))
         (is (== [1 1] (u/decimal->binary 3)))
         (is (== [1 0 0] (u/decimal->binary 4)))
         (is (== [1 0 1 0] (u/decimal->binary 10)))
         (is (== [1 0 0 0 1] (u/decimal->binary 17))))

(deftest "binary->decimal"
         (is (== 0 (u/binary->decimal [0 0 0 0 0 0 0 0])))
         (is (== 0 (u/binary->decimal [0 0 0 0 0 0])))
         (is (== 1 (u/binary->decimal [0 0 0 0 0 0 0 1])))
         (is (== 2 (u/binary->decimal [0 0 0 0 0 0 1 0])))
         (is (== 3 (u/binary->decimal [0 0 0 0 0 0 1 1])))
         (is (== 4 (u/binary->decimal [0 0 0 0 0 1 0 0])))
         (is (== 10 (u/binary->decimal [0 0 0 0 1 0 1 0])))
         (is (== 17 (u/binary->decimal [0 0 0 1 0 0 0 1]))))

(run-tests!)
