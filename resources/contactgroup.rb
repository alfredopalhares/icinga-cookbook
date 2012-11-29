actions :add, :remove
default_action :add

attribute :contactgroup_name, :kind_of => String, :name_attribute => true
attribute :contactgroup_alias, :kind_of => String, :required => true
attribute :members, :kind_of => Array, :required => false
attribute :contactgroup_members, :kind_of => Array, :required => false
