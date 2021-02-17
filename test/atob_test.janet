(import testament :prefix "")
(import ../atob :as atob)

(deftest "atob"
  (is (= "Sun" (atob/atob "U3Vu")))
  (is (= "S" (atob/atob "Uw==")))
  (is (= "Su" (atob/atob "U3U=")))
  (is (= "a" (atob/atob "YQ==")))
  (is (= "Man" (atob/atob "TWFu")))
  (is (= "Woman" (atob/atob "V29tYW4=" )))
  (is (= "Girl" (atob/atob "R2lybA==")))
  (is (= "The quick brown fox jumps over the lazy dog." (atob/atob "VGhlIHF1aWNrIGJyb3duIGZveCBqdW1wcyBvdmVyIHRoZSBsYXp5IGRvZy4="))))

(deftest "atob without padding"
  (is (= "Sun" (atob/atob "U3Vu")))
  (is (= "S" (atob/atob "Uw")))
  (is (= "Su" (atob/atob "U3U")))
  (is (= "a" (atob/atob "YQ")))
  (is (= "Man" (atob/atob "TWFu")))
  (is (= "Woman" (atob/atob "V29tYW4" )))
  (is (= "Girl" (atob/atob "R2lybA")))
  (is (= "The quick brown fox jumps over the lazy dog." (atob/atob "VGhlIHF1aWNrIGJyb3duIGZveCBqdW1wcyBvdmVyIHRoZSBsYXp5IGRvZy4"))))

(run-tests!)
