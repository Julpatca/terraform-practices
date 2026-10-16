resource "local_file" "product" {
  count    = 3
  content  = "lista de productos del proximo pedido"
  filename = "productos-${random_string.sufijo[count.index].result}.txt"
}