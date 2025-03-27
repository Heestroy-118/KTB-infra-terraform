resource "null_resource" "dummy" {
  triggers = {
    always_run = "${timestamp()}"
  }

  lifecycle {
    prevent_destroy = true
  }
}
