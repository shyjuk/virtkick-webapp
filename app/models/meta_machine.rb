class MetaMachine < ActiveRecord::Base
  belongs_to :user


  before_destroy do
    machine.delete
  end

  def machine
    machine = Infra::Machine.find libvirt_machine_name
    machine.id = self.id
    machine
  end
end
