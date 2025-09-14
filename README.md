# hybrid-cloud-strongswan-azure

Site-to-site VPN between on-premises Debian strongSwan gateway and Microsoft Azure, enabling LAN clients to access Azure VMs and private services (Azure Files).
This project demonstrates how to set up a **site-to-site VPN** between an **on-premises Debian Linux server with strongSwan** installed and **Microsoft Azure Virtual Network**.
The tunnel allows on-prem LAN devices to securely access Azure resources such as Virtual Machines and Azure Files via Private Endpoint.

----------------------------------------------------------------------------------

**Features**

*IKEv2/IPsec VPN tunnel using strongSwan

*LAN client routing

*IP forwarding + NAT for non-routed setups

*Azure Local Network Gateway + VPN Gateway configuration

*Access to Azure private services (File Share via Private Endpoint + DNS override)

----------------------------------------------------------------------------------

**Topology**

----------------------------------------------------------------------------------

**How to run**

1. Install strongSwan (https://docs.strongswan.org/docs/latest/install/install.html)
2. Copy configs from `config/` and update with your IPs
3. Load connections:
   
    sudo swanctl --load-all

    sudo swanctl --initiate --child azure-net

5. Add static routes on LAN clients or configure your router if it supports static routing.
6. Set up Azure Private DNS for private endpoints

----------------------------------------------------------------------------------

**Troubleshooting**
See docs/troubleshooting.md for common errors and fixes.
