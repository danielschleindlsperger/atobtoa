(import testament :prefix "")
(import ../btoa :as btoa)

(deftest "btoa"
  (is (= "TWFu" (btoa/btoa "Man")))
  # (is (= "V29tYW4=" (btoa/btoa "Woman")))
  )

(run-tests!)
