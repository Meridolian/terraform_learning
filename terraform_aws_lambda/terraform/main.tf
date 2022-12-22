module "dependencies_layer" {
  source = "terraform-aws-modules/lambda/aws"

  create_function     = false
  create_layer        = true
  layer_name          = "dependencies-layer-christmas-lambda"
  compatible_runtimes = [var.runtime]
  runtime             = var.runtime

  source_path = [
    {
      path             = "${path.module}/../christmas_lambda"
      pip_requirements = "${path.module}/../requirements/base.txt"
      prefix_in_zip    = "python"
    }
  ]
}


module "christmas_lambda" {
  source        = "terraform-aws-modules/lambda/aws"
  function_name = "christmas-lambda"
  description   = "Simple hello world example"

  runtime = var.runtime
  handler = "lambda_function.lambda_handler"

  source_path = [
    {
      path = "${path.module}/../christmas_lambda"
    }
  ]
}
