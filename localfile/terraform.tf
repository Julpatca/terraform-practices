resource "local_file" "product" {
  content  = "Lista de Productos del Proximo Mes"
  filename = "productos.txt"
}
