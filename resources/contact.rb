actions :add, :remove
default_action :add

attribute :contact_name, :kind_of => String, :name_attribute => true
attribute :contact_alias, :kind_of => String, :required => false
attribute :contactgroups, :kind_of => Array, :required => false

attribute :host_notifications_enabled, :kind_of => [ TrueClass, FalseClass, Integer ], :required => true
attribute :service_notifications_enabled, :kind_of => [ TrueClass, FalseClass, Integer ], :required => true

attribute :host_notification_period, :kind_of => String, :required => true
attribute :service_notification_period, :kind_of => String, :required => true

attribute :host_notification_options, :kind_of => Array, :required => true
attribute :service_notification_options, :kind_of => Array, :required => true

attribute :host_notification_commands, :kind_of => Array, :required => true
attribute :service_notification_commands, :kind_of => Array, :required => true

attribute :email, :kind_of => String, :required => false
attribute :pager, :kind_of => String, :required => false
attribute :addresses , :kind_of => Array, :required => false

attribute :can_submit_commands, :kind_of => [ TrueClass, FalseClass, Integer ], :required => false
attribute :retain_status_information, :kind_of => [ TrueClass, FalseClass, Integer ], :required => false
attribute :retain_nonstatus_information, :kind_of => [ TrueClass, FalseClass, Integer ], :required => false
