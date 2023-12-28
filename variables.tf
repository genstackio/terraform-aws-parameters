variable "parameters" {
  type = list(object({
    secret = optional(bool)
    name = string
    default_value = optional(string)
  }))
  default = []
}