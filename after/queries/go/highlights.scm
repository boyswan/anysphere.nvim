;; extends

((type_identifier) @type.any.go
  (#eq? @type.any.go "any")
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
