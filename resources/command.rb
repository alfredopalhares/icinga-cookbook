actions :add, :remove
default_action :add

attribute :command_name, :kind_of => String, :name_attribute => true
attribute :command, :kind_of => String, :required => true
