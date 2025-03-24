resource "aws_route_table" "this" {
  vpc_id = var.vpc_id

  tags = merge(
    var.tags,
    {
      Name = "${var.name}-route-table"
    }
  )
}

resource "aws_route" "default" {
  route_table_id         = aws_route_table.this.id
  destination_cidr_block = var.destination_cidr_block
  gateway_id             = var.gateway_id
}

resource "aws_route_table_association" "public_subnet" {
  count          = length(var.public_subnet_ids)
  subnet_id      = var.public_subnet_ids[count.index]
  route_table_id = aws_route_table.this.id
}
