;; extends

((type_identifier) @type.any.go
  (#eq? @type.any.go "any")
  (#set! priority 110))

((nil) @constant.nil.go
  (#set! priority 110))

((import_spec
  name: (package_identifier) @module.import_alias.go)
  (#set! priority 110))

((keyed_element
  .
  (literal_element
    (identifier) @variable.member.struct.go))
  (#set! priority 110))

([
  "!"
  "!="
  "&&"
  "||"
  "=="
  "<"
  "<="
  ">"
  ">="
] @operator.logical.go
  (#set! priority 110))

[
  ":="
  "="
  "+="
  "-="
  "*="
  "/="
  "%="
  "&="
  "|="
  "^="
  "&^="
  "<<="
  ">>="
] @operator.assignment.go
