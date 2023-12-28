resource "aws_ssm_parameter" "param" {
  for_each = {for index, parameter in var.parameters: parameter.name => parameter}
  name  = each.key
  type  = each.value.secret == true ? "SecureString" : "String"
  value = null != each.value.value ? each.value.value : (null != each.value.default_value ? each.value.default_value : "")
  lifecycle {
    ignore_changes = (null == each.value.value && null != each.value.default_value) ? ["value"] : []
  }
}