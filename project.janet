(declare-project
  :name "atobtoa"
  :description "Convert between base64 and binary text"
  :dependencies ["https://github.com/pyrmont/testament"])

(declare-executable
 :name "atob"
 :entry "atob.janet")

(declare-executable
 :name "btoa"
 :entry "btoa.janet")

(phony "testw" []
  (os/shell "find . -name '*.janet' | entr -r -d jpm test"))
