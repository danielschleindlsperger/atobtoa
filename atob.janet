(import ./util :as u)

(defn help []
      (print "Pass a base-64 encoded string and have it converted to utf-8."))

(def b64-table "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/")

(defn sextets->octets
  [octets]
  "Converts a list of size-6 arrays (sextets) to a list of size-8 arrays (octets). The last octet may not be filled."
  (->> octets
      flatten
      (partition 8)))

(defn- char->b64-idx [c] (index-of c b64-table))

(defn- quadruples->bytes [xs]
  (let [sextets (map |(-> $0
                         char->b64-idx
                         u/decimal->binary
                         (u/array-pad-left 6 0)) xs)
        octets (sextets->octets sextets)]
    (apply string/from-bytes (map u/binary->decimal octets))))

(defn atob
  [s]
  "Converts a base64 encoded string to its binary representation of any format (UTF-8, binary, ..)."
  (let [without-padding (peg/replace-all "=" "" s)
        padded? (not (zero? (% (length without-padding) 4)))
        quadruples (partition 4  without-padding)
        bytes (map quadruples->bytes quadruples)
        b64 (apply string bytes)]
    (if padded? (slice b64 0 -2) b64)))

(defn main [& args]
  (let [input (slice args 1)]
    (if (empty? input)
        (help)
        (each output (map atob input) (print output)))))
