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
| plan] | string | Plan UUID| Yes |
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
| description | string | | No* |
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