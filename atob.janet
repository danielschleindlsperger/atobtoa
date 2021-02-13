(import ./util :as u)

(defn help []
      (print "Pass a base-64 encoded string and have it converted to utf-8."))

(def b64-table "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/")

(defn atob
  [s]
  "Converts a base64 encoded string to its binary representation of any format (UTF-8, binary, ..)."
  s)

(defn main [& args]
  (let [input (slice args 1)]
    (if (empty? input)
        (help)
        (each output (map atob input) (print output)))))
