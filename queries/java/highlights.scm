;; extends
(
  (method_invocation
    object: (identifier) @custom.setter
    name: (identifier) @type
    (#match? @type "^set[A-Z]")
  )
)

(assignment_expression
  left: (identifier) @custom.setter
  right: _
)

(update_expression
   (identifier) @custom.setter
)
