(defn array-pad-right
  [xs size padder]
  "Fills and returns an array with `padder` until it reaches `size`. Returns array as is if it's already at or over the given size."
  (let [l (length xs)]
    (if (< l size)
      (do (for i l size
            (put xs i padder))
          xs)
      xs)))

(defn array-pad-left
  [xs size padder]
  "Fills and returns an array with `padder` at the start until it reaches `size`. Returns array as is if it's already at or over the given size."
  (let [l (length xs)]
    (if (< l size)
      (do (for i 0 (- size l)
            (array/insert xs i padder))
          xs)
      xs)))

(defn reverse-array [xs]
      (let [l (length xs)
            new-arr (array/new l)]
        (for i 0 l
          (put new-arr i (get xs (- (dec l) i))))
        new-arr))

(defn decimal->binary
  [x &opt bin]
  "Converts a binary number into its binary representation of an array of bits."
  (default bin @[])
    (if (< x 1)
        (reverse-array bin)
        (let [rem (% x 2)
            new-x (math/floor (/ x 2))]
            (decimal->binary new-x (array/push bin rem)))))

(defn binary->decimal
  [xs]
  "Converts an array of bits into a single decimal number."
  (var num 0)
  (for i 0 (length xs)
    (when (= 1 (get (reverse-array xs) i))
      (set num (+ num (math/pow 2 i)))))
  num)
