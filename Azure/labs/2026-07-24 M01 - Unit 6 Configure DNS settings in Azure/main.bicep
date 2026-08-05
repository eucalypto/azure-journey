param privateDnsZones_contoso_com_name string = 'contoso.com'
param virtualNetworks_CoreServicesVnet_externalid string = '/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/ContosoResourceGroup/providers/Microsoft.Network/virtualNetworks/CoreServicesVnet'

resource privateDnsZones_contoso_com_name_resource 'Microsoft.Network/privateDnsZones@2024-06-01' = {
  name: privateDnsZones_contoso_com_name
  location: 'global'
  properties: {}
}

resource privateDnsZones_contoso_com_name_coreservicesvnetlink 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2024-06-01' = {
  parent: privateDnsZones_contoso_com_name_resource
  name: 'coreservicesvnetlink'
  location: 'global'
  properties: {
    // registrationEnabled: true means any VM deployed into the linked VNet
    // will automatically get an A record created here (e.g. <vmname>.contoso.com),
    // and that record is removed automatically when the VM is deleted.
    // Set to false for a read-only/resolution-only link with no auto-registration.
    registrationEnabled: true
    virtualNetwork: {
      id: virtualNetworks_CoreServicesVnet_externalid
    }
  }
}
