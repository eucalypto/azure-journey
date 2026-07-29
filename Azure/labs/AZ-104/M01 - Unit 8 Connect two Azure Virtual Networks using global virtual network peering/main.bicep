param virtualNetworks_ManufacturingVnet_name string = 'ManufacturingVnet'
param virtualNetworks_CoreServicesVnet_name string = 'CoreServicesVnet'
param virtualNetworks_ResearchVnet_name string = 'ResearchVnet'


resource virtualNetworks_CoreServicesVnet_name_resource 'Microsoft.Network/virtualNetworks@2025-07-01' = {
  name: virtualNetworks_CoreServicesVnet_name
  location: 'eastus'
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.20.0.0/16'
      ]
    }
    encryption: {
      enabled: false
      enforcement: 'AllowUnencrypted'
    }
    privateEndpointVNetPolicies: 'Disabled'
    subnets: [
      {
        name: 'GatewaySubnet'
        properties: {
          addressPrefixes: [
            '10.20.0.0/27'
          ]
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
          defaultOutboundAccess: false
        }
      }
      {
        name: 'SharedServicesSubnet'
        properties: {
          addressPrefixes: [
            '10.20.10.0/24'
          ]
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
          defaultOutboundAccess: false
        }
      }
      {
        name: 'DatabaseSubnet'
        properties: {
          addressPrefixes: [
            '10.20.20.0/24'
          ]
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
          defaultOutboundAccess: false
        }
      }
      {
        name: 'PublicWebServiceSubnet'
        properties: {
          addressPrefixes: [
            '10.20.30.0/24'
          ]
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
          defaultOutboundAccess: false
        }
      }
    ]
  }
}

resource virtualNetworks_ManufacturingVnet_name_resource 'Microsoft.Network/virtualNetworks@2025-07-01' = {
  name: virtualNetworks_ManufacturingVnet_name
  location: 'westeurope'
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.30.0.0/16'
      ]
    }
    encryption: {
      enabled: false
      enforcement: 'AllowUnencrypted'
    }
    privateEndpointVNetPolicies: 'Disabled'
    subnets: [
      {
        name: 'ManufacturingSystemSubnet'
        properties: {
          addressPrefixes: [
            '10.30.10.0/24'
          ]
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
          defaultOutboundAccess: false
        }
      }
      {
        name: 'SensorSubnet1'
        properties: {
          addressPrefixes: [
            '10.30.20.0/24'
          ]
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
          defaultOutboundAccess: false
        }
      }
      {
        name: 'SensorSubnet2'
        properties: {
          addressPrefixes: [
            '10.30.21.0/24'
          ]
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
          defaultOutboundAccess: false
        }
      }
      {
        name: 'SensorSubnet3'
        properties: {
          addressPrefixes: [
            '10.30.22.0/24'
          ]
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
          defaultOutboundAccess: false
        }
      }
    ]
  }
}

resource virtualNetworks_ResearchVnet_name_resource 'Microsoft.Network/virtualNetworks@2025-07-01' = {
  name: virtualNetworks_ResearchVnet_name
  location: 'southeastasia'
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.40.0.0/16'
      ]
    }
    encryption: {
      enabled: false
      enforcement: 'AllowUnencrypted'
    }
    privateEndpointVNetPolicies: 'Disabled'
    subnets: [
      {
        name: 'ResearchSystemSubnet'
        properties: {
          addressPrefixes: [
            '10.40.0.0/24'
          ]
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
          defaultOutboundAccess: false
        }
      }
    ]
  }
}





resource virtualNetworks_CoreServicesVnet_name_virtualNetworks_CoreServicesVnet_name_to_ManufacturingVnet 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2025-07-01' = {
  parent: virtualNetworks_CoreServicesVnet_name_resource
  name: '${virtualNetworks_CoreServicesVnet_name}-to-ManufacturingVnet'
  properties: {
    peeringState: 'Connected'
    remoteVirtualNetwork: {
      id: virtualNetworks_ManufacturingVnet_name_resource.id
    }
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: true
    allowGatewayTransit: false
    useRemoteGateways: false
    peerCompleteVnets: true
  }
}


resource virtualNetworks_ManufacturingVnet_name_virtualNetworks_ManufacturingVnet_name_to_CoreServicesVnet 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2025-07-01' = {
  parent: virtualNetworks_ManufacturingVnet_name_resource
  name: '${virtualNetworks_ManufacturingVnet_name}-to-CoreServicesVnet'
  properties: {
    peeringState: 'Connected'
    remoteVirtualNetwork: {
      id: virtualNetworks_CoreServicesVnet_name_resource.id
    }
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: true
    allowGatewayTransit: false
    useRemoteGateways: false
    peerCompleteVnets: true
  }
}



