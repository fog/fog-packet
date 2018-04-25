require_relative "../../test_helper.rb"

# TestSSHKeys
class TestSSHKeys < Minitest::Test
  def self.test_order
    :alpha
  end

  def setup
    # Establish Connection
    @compute = Fog::Compute::Packet.new(:packet_token => ENV["PACKET_TOKEN"])
  end

  def test_request_a_create_ssh_key
    options = {
      :label => "test",
      :key => "ssh-rsa AAAAB3Nz"
    }

    # Perform Request
    response = @compute.create_ssh_key(options)

    assert response.body
    assert_equal options[:label], response.body["label"]
    assert_equal options[:key], response.body["key"]
    @@key_id = response.body["id"]
  end

  def test_request_b_list_ssh_keys
    response = @compute.list_ssh_keys

    assert !response.body["ssh_keys"].empty?
  end

  def test_request_c_get_ssh_key
    response = @compute.get_ssh_key(@@key_id)

    assert_equal @@key_id, response.body["id"]
  end

  def test_request_d_update_ssh_key
    options = {
      :label => "test",
      :key => "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDgnV5MOhBqpQLt66KGlMKi"
    }

    response = @compute.update_ssh_key(@@key_id, options)

    assert response.body
    assert_equal 200, response.status
    assert_equal options[:label], response.body["label"]
    assert_equal options[:key], response.body["key"]
  end

  def test_request_h_delete_ssh_key
    response = @compute.delete_ssh_key(@@key_id)

    assert_equal 204, response.status
  end
end
