module Fog
  module Models
    def wait_for(timeout = Fog.timeout, interval = Fog.interval, &block)
      reload_has_succeeded = false
      duration = Fog.wait_for(timeout, interval) do # Note that duration = false if it times out
        if ready?
          reload_has_succeeded = true
          instance_eval(&block)
        else
          false
        end
      end
      if reload_has_succeeded
        return duration # false if timeout; otherwise {:duration => elapsed time }
      else
        raise Fog::Errors::Error, "Reload failed, #{self.class} #{identity} not present."
      end
    end
  end
end
