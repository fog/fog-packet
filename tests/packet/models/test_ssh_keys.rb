require_relative "../../test_helper.rb"

# TestSSHKeys
class TestSSHKeys < Minitest::Test
  def self.test_order
    :alpha
  end

  def setup
    # Establish Connection
    @compute = Fog::Compute::Packet.new()
  end

  def test_a_create_ssh_key
    options = {
      :label => "test",
      :key => "ssh-rsa AAAAB3Nz"
    }

    # Perform Request
    response = @compute.ssh_keys.create(:label => "test", :key => "ssh-rsa AAAAB3Nz")

    assert response
    assert_equal options[:label], response.label
    assert_equal options[:key], response.key
    @@key_id = response.id
  end

  def test_b_list_ssh_keys
    response = @compute.ssh_keys.all(:include => "test")

    assert !response.empty?
  end

  def test_c_get_ssh_key
    response = @compute.ssh_keys.get(@@key_id)

    assert_equal @@key_id, response.id
  end

  def test_d_update_ssh_key
    sshkey = @compute.ssh_keys.get(@@key_id)

    sshkey.label = "test_jg_01"
    sshkey.key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDgnV5MOhBqpQLt66KGlMKi..."

    response = sshkey.update

    assert response
  end

  def test_h_delete_ssh_key
    sshkey = @compute.ssh_keys.get(@@key_id)

    response = sshkey.destroy
    assert_equal true, response
  end
end
