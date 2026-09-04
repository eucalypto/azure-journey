param disk_name string = 'az104-disk5'

resource disks_az104_disk1_name_resource 'Microsoft.Compute/disks@2026-03-02' = {
  name: disk_name
  location: 'eastus'
  sku: {
    name: 'Standard_LRS'
  }
  properties: {
    creationData: {
      createOption: 'Empty'
    }
    diskSizeGB: 32
    diskIOPSReadWrite: 500
    diskMBpsReadWrite: 60
    encryption: {
      type: 'EncryptionAtRestWithPlatformKey'
    }
    networkAccessPolicy: 'DenyAll'
    publicNetworkAccess: 'Disabled'
    dataAccessAuthMode: 'None'
  }
}
