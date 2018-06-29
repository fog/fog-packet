# fog-packet
WIP: Packet provider for Fog

## Table of Contents

- [Requirements](#requirements)
- [Installation](#installation)
- [Authentication](#authentication)
- [Operations](#operations)
  * [Devices](#devices)
  * [Volumes](#volumes)
  * [Snapshots](#snapshots)
  * [IP Addresses](#ip-addresses)
  * [Projects](#projects)
  * [Plans](#plans)
  * [Facilities](#facilities)
  * [Users](#users)
  * [Emails](#emails)
  * [VPN](#vpn)
  * [Spot Market Prices](#spot-market-prices)
  * [SSH Keys](#ssh-keys)
  * [Batches](#batches)
  * [BGP Sessions](#bgp-sessions)
  * [Two Factor Authentication](#two-factor-authentication)
  * [Sessions](#sessions)
  * [Notifications](#notifications)
  * [Invitations](#invitations)
  * [UserVerificationTokens](#userverificationtokens)
  * [Licenses](#licenses)
  * [Memberships](#memberships)
  * [Capacity](#capacity)
  * [Payment Methods](#payment-methods)
  * [Project Transfer Requests](#project-transfer-requests)
  * [Hardware Reservations](#hardware-reservations)
- [Unit Tests](#unit-tests)

# Requirements 

1. Ruby programming language

# Installation

Add this line to your application's Gemfile:

```ruby
gem 'fog-packet'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fog-packet

# Build

In some cases it might be necessary to manually build the package from source:

1. Clone the repository:

```
$ git clone https://github.com/fog/fog-packet
```

2. Change into the repository root and build the gem package:

```
$ cd fog-packet
$ gem build fog-packet.gemspec
```

3. Install the Ruby gem:

```
$ gem install fog-packet-1.0.1.gem
```

# Authentication 

Provide your credentials when creating a compute object:

```ruby
require 'fog-packet'

compute = Fog::Compute::Packet.new(packet_token: 'PACKET_TOKEN')
```  

Alternatively, the Packet token can be supplied as an environment variable:

    $ export PACKET_TOKEN="PACKET_TOKEN"

```ruby
require 'fog-packet'

compute = Fog::Compute::Packet.new()
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

Optional parameters 

| NAME| TYPE | DESCRIPTION | 
|---|---|---|
| without_projects | string | | 
| per_page | string | | 
| page | string | | 
| include | string | For resources that contain collections of other resources, the Packet API will return links to the other resources by default. | 

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

## Snapshots

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

Optional parameters 

| NAME| TYPE | DESCRIPTION | 
|---|---|---|
| without_projects | string | | 
| per_page | string | | 
| page | string | | 
| include | string | For resources that contain collections of other resources, the Packet API will return links to the other resources by default. | 


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

Optional parameters

| NAME| TYPE | DESCRIPTION | 
|---|---|---|
| without_projects | string | | 
| per_page | string | | 
| page | string | | 
| include | string | For resources that contain collections of other resources, the Packet API will return links to the other resources by default. | 

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

Optional parameters 

| NAME| TYPE | DESCRIPTION | 
|---|---|---|
| without_projects | string | | 
| per_page | string | | 
| page | string | | 
| include | string | For resources that contain collections of other resources, the Packet API will return links to the other resources by default. | 

## Facilities

## List facilities
List all available facilities of the account

```ruby
response = compute.facilities.all
```

Optional parameters 

| NAME| TYPE | DESCRIPTION | 
|---|---|---|
| without_projects | string | | 
| per_page | string | | 
| page | string | | 
| include | string | For resources that contain collections of other resources, the Packet API will return links to the other resources by default. | 

## Users

## List Users
List all users in the current user’s projects

```ruby
response = compute.users.all
```

Optional parameters 

| NAME| TYPE | DESCRIPTION | 
|---|---|---|
| without_projects | string | | 
| per_page | string | | 
| page | string | | 
| include | string | For resources that contain collections of other resources, the Packet API will return links to the other resources by default. | 

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

Optional parameters 

| NAME| TYPE | DESCRIPTION | 
|---|---|---|
| include | string | For resources that contain collections of other resources, the Packet API will return links to the other resources by default. | 

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

Optional parameters 

| NAME| TYPE | DESCRIPTION | 
|---|---|---|
| without_projects | string | | 
| per_page | string | | 
| page | string | | 
| include | string | For resources that contain collections of other resources, the Packet API will return links to the other resources by default. | 

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

Optional parameters 

| NAME| TYPE | DESCRIPTION | 
|---|---|---|
| without_projects | string | | 
| per_page | string | | 
| page | string | | 
| include | string | For resources that contain collections of other resources, the Packet API will return links to the other resources by default. | 

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

Optional parameters 

| NAME| TYPE | DESCRIPTION | 
|---|---|---|
| without_projects | string | | 
| per_page | string | | 
| page | string | | 
| include | string | For resources that contain collections of other resources, the Packet API will return links to the other resources by default. | 

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

Optional parameters 

| NAME| TYPE | DESCRIPTION | 
|---|---|---|
| without_projects | string | | 
| per_page | string | | 
| page | string | | 
| include | string | For resources that contain collections of other resources, the Packet API will return links to the other resources by default. | 

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

Optional parameters 

| NAME| TYPE | DESCRIPTION | 
|---|---|---|
| without_projects | string | | 
| per_page | string | | 
| page | string | | 
| include | string | For resources that contain collections of other resources, the Packet API will return links to the other resources by default. | 

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

Optional parameters 

| NAME| TYPE | DESCRIPTION | 
|---|---|---|
| without_projects | string | | 
| per_page | string | | 
| page | string | | 
| include | string | For resources that contain collections of other resources, the Packet API will return links to the other resources by default. | 

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
## Organizations

## Create an organization
Creates an organization.

```ruby
options = {
  :name => "test_org",
  :description => "test organization"
}

response = compute.organizations.create(options)
```

Available parameters

| NAME| TYPE | DESCRIPTION | REQUIRED |
|---|---|---|---|
| name | string | Name for the organization | Yes |
| description | string | | No |
| website | string | | No |
| twitter | string | | No |
| logo | string | | No |
| address | string | | No |
| customdata | string | | No |

## Update an organization
Updates the organization.

```ruby
org.name = "new name"
org.description = "new organization"

response = org.update
```

## Retrieve an organization
Returns a single organization's details, if the user is authorized to view it.

```ruby
org = compute.organizations.get(org_id)
```

## List organizations
Returns a list of organizations that are accessible to the current user.

```ruby
response = compute.organizations.all
```

Optional parameters 

| NAME| TYPE | DESCRIPTION | 
|---|---|---|
| personal | string |  | 
| without_projects | string | | 
| per_page | string | | 
| page | string | | 
| include | string | For resources that contain collections of other resources, the Packet API will return links to the other resources by default. | 


## Delete an organization
Deletes the organization.

```ruby
response = org.destroy
```

## Capacity

## Get capacity
Returns a list of facilities and plans with their current capacity.

```ruby 
response = compute.capacities.all
```

## Validate required capacity
Validates if a deploy can be fulfilled. 

```ruby
options = {
  :servers => [
    {
      :facility => "ewr1",
      :plan => "baremetal_2a",
      :quantity => 1
    },
    {
      :facility => "atl1",
      :plan => "baremetal_1e",
      :quantity => 1
    }
  ]
}

response = compute.capacities.validate(options)
```

If required capacities are available function will return true otherwise it will return an error with details.

## Payment methods

## Create a payment method
Creates a payment method.

```ruby
options = {
    :name => "test",
    :default => "false",
    :nonce => "12",
    :organization_id => "ef114acb-2e50-43b5-83e7-b7c2758f0520"
}

response = compute.payment_methods.create(options)
```

Available parameters

| NAME| TYPE | DESCRIPTION | REQUIRED |
|---|---|---|---|
| organization_id | string |  | Yes |
| name | string |  | Yes |
| nonce | string | | Yes |
| default | boolean | | No |


## List payment methods 
Returns all payment methods of an organization.

```ruby
payment_methods = compute.payment_methods.all(org_id)
```

Optional parameters 

| NAME| TYPE | DESCRIPTION | 
|---|---|---|
| include | string | For resources that contain collections of other resources, the Packet API will return links to the other resources by default. | 

## Retrieve a payment method
Returns a payment method.

```ruby
payment_method = compute.payment_methods.get(payment_method_id)
```

## Update payment method
Updates the payment method.

```ruby
payment_method.name = "new name"
payment_method.expiration_month = 12
payment_method.expiration_year = 2022
response = payment_method.update
```

## Delete payment method
Deletes the payment method.

```ruby
response = payment_method.destroy
```

## Project transfer requests

## Transfer a project
Organization owners can transfer their projects to other organizations.

```ruby
response = compute.transfer_requests.transfer(project_id, org_id)
```

Available parameters

| NAME| TYPE | DESCRIPTION | REQUIRED |
|---|---|---|---|
| project_id | string | UUID of the project to be transfered  | Yes |
| org_id | string | UUID of the target organization  | Yes |

## List transfer requests
Provides a collection of project transfer requests from or to the organization.

```ruby
response = compute.transfer_requests.all(org_id)
```

Optional parameters 

| NAME| TYPE | DESCRIPTION | 
|---|---|---|
| per_page | string | | 
| page | string | | 
| include | string | For resources that contain collections of other resources, the Packet API will return links to the other resources by default. | 

## Retrieve a transfer request
Returns a single transfer request.

```ruby
transfer_request = compute.transfer_requests.get(transfer_request_id)
```

## Accept a transfer request
Accept a transfer request.

```ruby
response = transfer_request.accept
```

## Decline a transfer request
Decline a transfer request.

```ruby
response = transfer_request.decline
```

## Hardware reservations

## List hardware reservations
Provides a collection of hardware reservations for a given project.

```ruby
hardware_reservations = compute.hardware_reservations.all(project_id)
```

Optional parameters 

| NAME| TYPE | DESCRIPTION | 
|---|---|---|
| per_page | string | | 
| page | string | | 
| include | string | For resources that contain collections of other resources, the Packet API will return links to the other resources by default. | 

## Retrieve a hardware reservation
Returns a single hardware reservation.

```ruby
hardware_reservation = @compute.hardware_reservations.get(reservation_id)
```

## Move a hardware reservation
Move a hardware reservation to another project.

```ruby
hardware_reservation.move(project_id) 
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
