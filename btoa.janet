(import ./util :as u)

(defn help []
      (print "Pass a base-64 encoded string and have it converted to utf-8."))

(def b64-table "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/")

(defn octets->sextets
  [octets]
  "Converts a list of size-8 arrays (octets) to a list of size-6 arrays (sextets). The last sextet may not be filled."
  (->> octets
      flatten
      (partition 6)))

(defn btoa
  [s]
  "Converts a string of any format (UTF-8, binary, ..) to base64 encoding."
  (let [octets (map u/decimal->binary (string/bytes s))
        sextets (octets->sextets octets)]
    (apply string/from-bytes (map (fn [i] (get b64-table i)) (map u/binary->decimal sextets)))))

(defn main [& args]
  (let [input (slice args 1)]
    (if (empty? input)
        (help)
        (each output (map btoa input) (print output)))))
