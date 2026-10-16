resource "local_file" "product-1" {
  content  = "lista de productos del proximo pedido"
  filename = "productos-${random_string.sufijo-1.id}.txt"
}

resource "local_file" "product-2" {
  content  = "lista de productos del proximo pedido"
  filename = "productos-${random_string.sufijo-2.id}.txt"
}

resource "local_file" "product-3" {
  content  = "lista de productos del proximo pedido"
  filename = "productos-${random_string.sufijo-3.id}.txt"
}
