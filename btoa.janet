(import ./util :as u)

(defn help []
      (print "Pass a base-64 encoded string and have it converted to utf-8."))

(def b64-table "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/")

(defn- tuple->array [xs]
  (let [size (length xs)]
    (array/concat (array/new size) xs)))

(defn octets->sextets
  [octets]
  "Converts a list of size-8 arrays (octets) to a list of size-6 arrays (sextets). The last sextet may not be filled."
  (->> octets
       flatten
       (partition 6)
       (map tuple->array)))

(defn- byte->binary [c]
  (-> c u/decimal->binary (u/array-pad-left 8 0)))

(defn- pad-last-sextet [xs]
  (let [last-index (dec (length xs))]
    (update xs last-index u/array-pad-right 6 0)))

(defn- add-padding [s]
  (if (zero? (% (length s) 4))
      s
      (let [pad-count (- 4 (% (length s) 4))]
        (string s (string/repeat "=" pad-count)))))

(defn btoa
  [s]
  "Converts a string of any format (UTF-8, binary, ..) to base64 encoding."
  (let [octets (map byte->binary (string/bytes s))
        sextets (pad-last-sextet (octets->sextets octets))
        bytes (map u/binary->decimal sextets)
        b64-bytes (map (fn [i] (get b64-table i)) bytes)
        b64 (add-padding (apply string/from-bytes b64-bytes))]
    b64))

(defn main [& args]
  (let [input (slice args 1)]
    (if (empty? input)
        (help)
        (each output (map btoa input) (print output)))))
