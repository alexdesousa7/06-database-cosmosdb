
resource "azurerm_virtual_network" "testmongo" {
  name                = "${var.prefix}-network"
  location            = var.location
  resource_group_name = azurerm_resource_group.testmongo.name
  address_space       = ["192.168.0.0/16"]
}

resource "azurerm_subnet" "testmongo-internal-1" {
  name                 = "${var.prefix}-internal-1"
  resource_group_name  = azurerm_resource_group.testmongo.name
  virtual_network_name = azurerm_virtual_network.testmongo.name
  address_prefix       = "192.168.0.0/24"
  service_endpoints    = ["Microsoft.AzureCosmosDB"]
}

resource "azurerm_network_security_group" "allow-ssh" {
  name                = "${var.prefix}-allow-ssh"
  location            = var.location
  resource_group_name = azurerm_resource_group.testmongo.name

  security_rule {
    name                       = "SSH"
    priority                   = 250
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = var.ssh-source-address
    destination_address_prefix = "*"
  }
}
