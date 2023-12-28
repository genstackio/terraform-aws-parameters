output "parameters" {
  value = {for index, parameter in aws_ssm_parameter.param: parameter.name => { arn: parameter.arn, name: parameter.name, id: parameter.id, type: parameter.type }}
}
