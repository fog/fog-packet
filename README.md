# fog-packet
WIP: Packet provider for Fog

# Requirements 

1. Ruby programming language

# Installation

1. Clone the repository
2. In the root of the repository run:

```
gem build fog-packet.gemspec 
```

3. Install the Ruby gem:

```
gem install fog-packet-0.1.gem 
```  

# Authentication 
*NOTE:* At the moment Packet fog provider is not yet part of the fog project the provider will have to be initialized like this:

Provide your credentials when creating a compute object:

```
@compute = Fog::Compute::Packet.new(packet_token: ENV['PACKET_TOKEN'])
```  

# Operations:

## Devices

###Create a device

Creates a new device and provisions it in our datacenter. 

```ruby
options = {
      hostname: 'test01',
      facility: 'ewr1',
      plan: 'baremetal_0',
      operating_system: 'coreos_stable'
}

response = @compute.create_device(@project_id, options)
```

Available parameters

| NAME| TYPE | DESCRIPTION | REQUIRED |
|---|---|---|---|
| project_id | string | 	Project UUID  under which device will be created| Yes |
| hostname | string | The hostname of the server. | Yes |
| plan | string | Plan name| Yes |
| facility | string | Facility code | Yes |
| operating_system | string || No |
| description | string | | No* |
| billing_cycle | string | | No |
| always_pxe | string | | No |
| ipxe_script_url | string | | No |
| userdata | string | | No |
| locked | string | | No |
| hardware_reservation_id | string | | No |
| spot_instance | string | | No |
| spot_price_max | string | | No |
| termination_time | string | | No |
| tags | string | | No |
| project_ssh_keys | string | | No |
| user_ssh_keys | string | | No |
| features | string | | No |

###Retrieve a device

Gets details about a specified device

```ruby
 response = @compute.get_device(@@device_id)
```

####Update a device
Updates a device
```ruby
options = {
      hostname: 'test02'
}

response = @compute.update_device(@@device_id, options)
```

Available parameters

| NAME| TYPE | DESCRIPTION | REQUIRED |
|---|---|---|---|
| hostname | string | The hostname of the server. | Yes |
| description | string | | No |
| billing_cycle | string | | No |
| always_pxe | string | | No |
| ipxe_script_url | string | | No |
| userdata | string | | No |
| locked | string | | No |
| spot_instance | string | | No |

###Reboot device
Reboots the specified device

```ruby
response = @compute.reboot_device(@@device_id)
```

###Power off device
Powers off the specified device

```ruby
response = @compute.poweroff_device(@@device_id)
```

###Power on device
Powers on the specified device

```ruby
response = @compute.poweron_device(@@device_id)
```

###Delete a device

Deletes the specified devices

```ruby
response = @compute.delete_device(@@device_id)
```
##Volumes
Creates a new volume

```ruby
options = {
    facility: 'ewr1',
    plan: 'storage_1',
    size: 20,
    description: 'test description',
    billing_cycle: 'hourly'
}

response = @compute.create_volume(@project_id, options)
```


Available parameters

| NAME| TYPE | DESCRIPTION | REQUIRED |
|---|---|---|---|
| facility | string | Facility code | Yes |
| plan | string | Plan name| Yes |
| size | int | Volume size| Yes |
| description | string | | No |
| billing_cycle | string | | No |
| snapshot_policies | string | | No |


###Retrieve a volume

Gets a specified volume

```ruby
response = @compute.get_volume(@@volume_id)
```

###List volumes
List all volumes in the specified project

```ruby
response = @compute.list_volumes(@project_id)
```

###Attach a volume

Attaches a volume to the specified device

```ruby
response = @compute.attach_volume(@@volume_id, @@device_id)
```

###Detach a volume

Detaches a volume from the specified device

```ruby
response = @compute.detach_volume(@@attachment_id)
```

###Delete a volume
Deletes a specified volume

```ruby
response = @compute.delete_volume(@@volume_id)
```

##Snapshot

###Create a snapshot of a volume
Creates a snapshot of the specified volume

```ruby
response = @compute.create_snapshot(@@volume_id)
```

###List snapshots
List all snapshots of the specified volume

```ruby
response = @compute.list_snapshots(@@volume_id)
```

###Delete a snapshot
Deletes the specified snapshot
```ruby
response = @compute.delete_snapshot(@@volume_id, @@snapshot_id)
```     

##IP addresses

###Reserve an IP address
Reserve an IP address

```ruby
options = {
  facility: 'ewr1',
  quantity: 2,
  type: 'global_ipv4',
  comments: 'test comment'
}

response = @compute.reserve_ip(@project_id, options)
```

Available parameters

| NAME| TYPE | DESCRIPTION | REQUIRED |
|---|---|---|---|
| facility | string | Facility code | Yes |
| quatity | int|  | Yes |
| type | string |  | Yes |
| comments | string |  | No |

###Get IPs
Retrives the list of IP addresses under the specified project

```ruby
response = @compute.list_ips(@project_id)
```

###Assign an IP address
Assigns an IP address to the specified devices

```ruby
response = @compute.assign_ip(@@device_id, options)
```

###Unassign IP address
Unassigns the specified IP address
 
```ruby
 response = @compute.unassign_ip(@@ip_id)
```

##Projects

###Create a project

Creates a new project

```ruby
 options = {
      name: 'test'
}

response = @compute.create_project(options)
```

Available parameters

| NAME| TYPE | DESCRIPTION | REQUIRED |
|---|---|---|---|
| name | string | 	Name of the project| Yes |
| payment_method_id | string |  | No |


###Retrieve a project

Gets project details

```ruby
response = @compute.get_project(@@project_id)

```

##Plans

###List plans
List all available plans of the account

```ruby
response = @compute.list_plans()
```

##Facilities

###List facilities
List all available facilities of the account

```ruby
response = @compute.list_facilities()
```
 