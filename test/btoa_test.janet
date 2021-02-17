(import testament :prefix "")
(import ../btoa :as btoa)

(deftest "btoa"
  (is (= "Uw==" (btoa/btoa "S")))
  (is (= "TWFu" (btoa/btoa "Man")))
  (is (= "V29tYW4=" (btoa/btoa "Woman")))
  (is (= "R2lybA==" (btoa/btoa "Girl")))
  (is (= "VGhlIHF1aWNrIGJyb3duIGZveCBqdW1wcyBvdmVyIHRoZSBsYXp5IGRvZy4=" (btoa/btoa "The quick brown fox jumps over the lazy dog."))))

(run-tests!)
