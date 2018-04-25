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
compute = Fog::Compute::Packet.new(packet_token: ENV['PACKET_TOKEN'])
```  

# Operations:

## Devices

## Create a device

Creates a new device and provisions it in our datacenter. 

```ruby
device = compute.devices.create(:project_id => project_id, :facility => "ewr1", :plan => "baremetal_0", :hostname => "test01", :operating_system => "coreos_stable")
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

## Retrieve a device

Gets details about a specified device

```ruby
response = compute.devices.get(device_id)
```

## Update a device
Updates a device
```ruby
device.hostname= 'test02'

response = device.update
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

## Reboot device
Reboots the specified device

```ruby
response = device.reboot
```

## Power off device
Powers off the specified device

```ruby
response = device.stop
```

## Power on device
Powers on the specified device

```ruby
response = device.start
```

## Delete a device

Deletes the specified devices

```ruby
response = device.destroy
```

## Get Device Events
Returns a list of events pertaining to a specific device.

```ruby
events = compute.events.all(device_id)
```
## Get Device Bandwidth
Retrieve an instance bandwidth for a given period of time.

```ruby
bandwidth = compute.bandwidth.get(device_id, "2018-03-10", "2018-04-10")
```

## Volumes

## Create a volume
Creates a new volume

```ruby
volume = compute.volumes.create(:project_id => project_id, :facility => "ewr1", :plan => "storage_1", :size => 20, :description => "test description", :billing_cycle => "hourly")
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


## Retrieve a volume

Gets a specified volume

```ruby
response = compute.volumes.get(volume_id)
```

## List volumes
List all volumes in the specified project

```ruby
response = compute.volumes.all(project_id)
```

## Attach a volume

Attaches a volume to the specified device

```ruby
response = volume.attach(device_id)
```

## Detach a volume

Detaches a volume from the specified device

```ruby
response = volume.detach
```

## Delete a volume
Deletes a specified volume

```ruby
response = volume.destroy
```

## Snapshot

## Create a snapshot of a volume
Creates a snapshot of the specified volume

```ruby
response = compute.snapshots.create(:storage_id => volume_id)
```

## List snapshots
List all snapshots of the specified volume

```ruby
response = compute.snapshots.all(volume_id)
```

## Delete a snapshot
Deletes the specified snapshot
```ruby
response = snapshot.destroy(volume_id, snapshot_id)
```     

## IP addresses

## Reserve an IP address
Reserve an IP address

```ruby
response = compute.ips.create(:project_id => project_id, :facility => "ewr1", :quantity => 2, :type => "global_ipv4", :comments => "test comment")
```

Available parameters

| NAME| TYPE | DESCRIPTION | REQUIRED |
|---|---|---|---|
| facility | string | Facility code | Yes |
| quatity | int|  | Yes |
| type | string |  | Yes |
| comments | string |  | No |

## Get IPs
Retrives the list of IP addresses under the specified project

```ruby
response = compute.ips.all(project_id)
```

## Assign an IP address
Assigns an IP address to the specified devices

```ruby
response = ip.assign(device_id)
```

## Unassign IP address
Unassigns the specified IP address
 
```ruby
response = compute.unassign
```

## Projects

## Create a project

Creates a new project

```ruby
response = compute.projects.create(:name => "test01", :payment_method_id => "1234")
```

Available parameters

| NAME| TYPE | DESCRIPTION | REQUIRED |
|---|---|---|---|
| name | string | 	Name of the project| Yes |
| payment_method_id | string |  | No |


## Retrieve a project

Gets project details

```ruby
response = compute.projects.get(project_id)

```

## Plans

## List plans
List all available plans of the account

```ruby
response = compute.plans.all
```

## Facilities

## List facilities
List all available facilities of the account

```ruby
response = compute.facilities.all
```

## Users

## List Users
List all users in the current user’s projects

```ruby
response = compute.users.all
```

## Retrieve a user

Retrieve the currently logged-in user or retrieve a user by user ID.

```ruby
response = compute.users.get
```
            
```ruby
response = compute.users.get(user_id)
```

## Update a user

Updates user information.

```ruby
user.first_name = "Jane"
user.last_name = "Doe"

response = user.update
```

Available parameters

| NAME| TYPE | DESCRIPTION | REQUIRED |
|---|---|---|---|
| first_name | string | First name| |
| last_name | string | Last name |  |
| phone_number | string |  Phone number|  |
| time_zone | string | Time zone of the user|  |
| password | string |  |  |
| avatar | string |  |  |

## Emails

## Create an email

Add a new email address to the current user.

```ruby
email = compute.emails.create(:address => "jdoe@example.net", :default => false)
```

Available parameters

| NAME| TYPE | DESCRIPTION | REQUIRED |
|---|---|---|---|
| address | string | Email address | |
| default | boolean | Indicates if email address is default or not |  |

## Retrieve an email
Provides one of the user’s emails.

```ruby
response = compute.emails.get(email_id)
```

## Update an email

Updates the email.

```ruby
email.default = false
email.update
```

Available parameters

| NAME| TYPE | DESCRIPTION | REQUIRED |
|---|---|---|---|
| address | string | Email address | |
| default | boolean | Indicates if email address is default or not |  |

## Delete an email

Deletes the email.

```ruby
response = email.destroy
```

Note: Default email cannot be deleted.

## VPN

## Enable VPN
Turns on vpn for the currently logged-in user.

```ruby
response = compute.vpns.enable
```

## Disable VPN
Turns off vpn for the currently logged-in user.

```ruby
response = compute.vpns.disable
```
## Retrieve VPN
Returns the client vpn config for the currently logged-in user.

```ruby
response = compute.vpns.get("nrt1")
```

Available parameters

| NAME| TYPE | DESCRIPTION | REQUIRED |
|---|---|---|---|
| facility_code | string | facility code (ewr1, scj1, arm1, nrt1) | Yes |


## Spot Market Prices

## Get spot market prices

Get Packet current spot market prices.

```ruby
response = compute.spot_market_prices.all
```

## Spot Market History

Get spot market prices for a given plan and facility in a fixed period of time.

```ruby
response = compute.spot_market_prices.get("ewr1", "baremetal_0")
```

Available parameters

| NAME| TYPE | DESCRIPTION | REQUIRED |
|---|---|---|---|
| facility_code | string | facility code (ewr1, scj1, arm1, nrt1) | Yes |
| plan | string | plan code | Yes |

## SSH Keys

## Create a SSH Key

Creates a SSH Key

```ruby
response = compute.ssh_keys.create(:label => "test", :key => "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDgnV5MOhBqpQLt66KGlMKi...")
```

Available parameters

| NAME| TYPE | DESCRIPTION | REQUIRED |
|---|---|---|---|
| label | string | Label for the SSH key | Yes |
| key | string | Public SSH Key | Yes |

## List SSH Keys

Returns a collection of the user’s ssh keys, unless project ID is specified then it returns a collection of the project's ssh keys.

```ruby
response = compute.ssh_keys.all
```

```ruby
response = compute.ssh_keys.all(project_id)
```

## Retrieve a SSH key

Returns a single ssh key

```ruby
response = compute.ssh_keys.get(key_id)
```

## Update a SSH Key

```ruby
sshkey.label = "test_jg_01"
sshkey.key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDgnV5MOhBqpQLt66KGlMKi..."

response = sshkey.update
```

Available parameters

| NAME| TYPE | DESCRIPTION | REQUIRED |
|---|---|---|---|
| label | string | Label for the SSH key | Yes |
| key | string | Public SSH Key | Yes |

## Delete a SSH Key

Deletes the ssh key.

```ruby
response = sshkey.destroy
```    

## Batches

## Create a batch
Creates a new batch of instances.

```ruby
batches = [{
    :hostname => "test1",
    :description => "test batch",
    :plan => "baremetal_0",
    :operating_system => "coreos_stable",
    :facility => "ewr1",
    :billing_cycle => "hourly",
    :tags => ["abc"],
    :quantity => 1
}]

response = compute.batches.create(project_id, :batches => batches)
```

Available parameters

| NAME| TYPE | DESCRIPTION | REQUIRED |
|---|---|---|---|
| batches | collection | Collection of instances. | Yes |
| project_id | string | UUID of the project | Yes |

## List batches
Returns all batches for the given project.

```ruby
response = compute.batches.all(project_id)
```

## Retrieve a batch
Returns a batch

```ruby
response = compute.batches.get(batch_id)
```

## BGP Sessions

## Create a BGP Session
Creates a BGP session.

```ruby
response = compute.bgp_sessions.create(:device_id => device_id, :address_family => address_family)
```

| NAME| TYPE | DESCRIPTION | REQUIRED |
|---|---|---|---|
| device_id | string | UUID of a device | Yes |
| address_family | string | Either 'ipv4' or 'ipv6' | Yes |

## List BGP sessions
Provides a listing of available BGP sessions for the device.

```ruby
response = compute.bgp_sessions.all(device_id)
```

## Retrieve a BGP session
Returns a BGP session.

```ruby
response = compute.bgp_sessions.get(session_id)
```

## Delete a BGP session
Deletes the BGP session

```ruby
response = session.destroy
```

## Two Factor Authentication

## Enable two factor authentication
Enables two factor authentication using authenticator app.

```ruby
compute.two_factor_auth.enable(type)
```
| NAME| TYPE | DESCRIPTION | REQUIRED |
|---|---|---|---|
| type | string | Two factor auth types include authenticator app or sms.  | Yes |

## Disable two factor authentication
Disables two factor authentication.

```ruby
compute.two_factor_auth.disable(type)
```

| NAME| TYPE | DESCRIPTION | REQUIRED |
|---|---|---|---|
| type | string | Two factor auth types include authenticator app or sms.  | Yes |

## Sessions

## Session Login
Log in

```ruby
compute.sessions.login(:username => "username",:password => "password")
```

## List Sessions
Returns all session tokens for the current user.

```ruby
sessions = compute.sessions.all
```

## Delete session
Destroy users current session unless sessions_id is provided.

```ruby
compute.sessions.destroy(sessions_id)
```

## Notifications

## List notifications
Returns a collection of the current user’s notification.

```ruby
compute.notifications.all
```

## Retrieve a notification
Returns a single notification if the user has access.

```ruby
compute.notifications.get(notification_id)
```

## Update a notification
Updates a single notification. Currently, the only supported operation is marking a notification as read.

```ruby
notification.update
```

## Invitations

## List Invitations
Returns all invitations in a project.

```ruby
compute.invitations.all(project_id)
```

## Retrieve an invite
Returns a single invitation.

```ruby
invite = compute.invitations.get(invite_id)
```

## Accept invitation
Accept an invitation.

```ruby
invite.accept
```

## Decline invitation
Decline an invitation.

```ruby
invite.decline
```

## UserVerificationTokens

## Request email verification 
Creates an email verification request.

```ruby
compute.email_verification.request(email)
```

## Verify email
Consumes an email verification token and verifies the user associated with it.

```ruby
compute.email_verification.verify(token)
```

## Licenses

## Create a License
Creates a new license for the given project.

```ruby
license = {
  :project_id => project_id, 
  :description => "test01", 
  :size => 1,
  :license_product_id => "blah"
}

license = compute.licenses.create(license)
```

| NAME| TYPE | DESCRIPTION | REQUIRED |
|---|---|---|---|
| project_id | string | UUID of the project | Yes |
| description | string | | Yes |
| size | string | | Yes |
| license_product_id | string | | Yes |

## List Project Licenses
Provides a collection of licenses for a given project.

```ruby
compute.licenses.all(project_id)
```

## Retrieve a License
Returns a license.

```ruby
license = compute.licenses.get(license_id)
```

## Memberships

## List Memberships
Returns all memberships in a project.

```ruby
memberships = compute.memberships.all(project_id)
```

## Retrieve a membership
Returns a single membership.

```ruby
membership = compute.memberships.get(membership_id)
```

## Update a membership
Updates the membership.

```ruby
membership.roles = ["owner"]
membership.update
```
## Delete a membership
Deletes the membership.

```ruby
membership.destroy
```

## Unit tests

Run mock tests:

```bash
FOG_MOCK=true rake test
```

Run real tests:

```bash
FOG_MOCK=false rake test
```
