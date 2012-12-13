require "nagios_parser/object/parser"

class Chef
  class Resource
    class IcingaHost < Chef::Resource
      def initialize(name, collection=nil, node=nil)
        super(name, collection, node)
        @resource_name = :icinga_host
        @attributes = {
          "host_name" => name,
          "display_name" => nil,
          "address" => nil,
          "address6" => nil,
          "display_name" => nil,
          "parents" => nil,
          "hostgroups" => nil,
          "check_command" => nil,
          "initial_state" => nil,
          "max_check_attempts" => nil,
          "check_interval" => nil,
          "retry_interval" => nil,
          "active_checks_enabled" => nil,
          "passive_checks_enabled" => nil,
          "check_period" => nil,
          "obsess_over_host" => nil,
          "check_freshness" => nil,
          "freshness_threshold" => nil,
          "event_handler" => nil,
          "low_flap_threshould" => nil,
          "high_flap_threshould" => nil,
          "flap_detetction_enabled" => nil,
          "failure_prediction_enabled" => nil,
          "process_perf_data" => nil,
          "retain_status_information" => nil,
          "retain_nonstatus_information" => nil,
          "contacts" => nil,
          "contact_groups" => nil,
          "notification_interval" => nil,
          "first_notification_delay" => nil,
          "notification_period" => nil,
          "notification_options" => nil,
          "notifications_enabled" => nil,
          "stalking_options" => nil,
          "notes" => nil,
          "notes_url" => nil,
          "action_url" => nil,
          "icon_image" => nil,
          "icon_image_alt" => nil,
          "statusmap_image" => nil,
          # Vars can't start with a number
          "_2d_coords" => nil
        }
      end

      private

      # Sets the arg in the attributes hash if the validations pass
      # Uses the validate from Mixin::ParamsValidate
      def set_in_hash(symbol, arg, validation)
        if arg != nil
           opts = validate({ symbol => arg }, { symbol => validation })
          if @attributes.has_key?(symbol.to_s())
            @attributtes[symbol.to_s()] = opts[symbol]
          end
        end
      end

      public

      def alias(arg=nil)
        set_in_hash(
          :alias,
          arg,
          :kind_of => String
        )
      end

      def display_name(arg=nil)
        set_in_hash(
          :display_name,
          arg,
          :kind_of => String
        )
      end

      def address(arg=nil)
        set_in_hash(
          :address,
          arg,
          :kind_of => String
        )
      end

      def address6(arg=nil)
        set_in_hash(
          :address6,
          arg,
          :kind_of => String
        )
      end

      def parents(arg=nil)
        set_in_hash(
          :parents,
          arg,
          :kind_of => Array
        )
      end

      def hostgroups(arg=nil)
        set_in_hash(
          :hostgroups,
          arg,
          :kind_of => Array
        )
      end

      def check_command(arg=nil)
        set_in_hash(
          :address,
          arg,
          :kind_of => String
        )
      end

      def initial_state(arg=nil)
        set_in_hash(
          :initial_state,
          arg,
          :kind_of => String
        )
      end

      def max_check_attempts(arg=nil)
        set_in_hash(
          :max_check_attempts,
          arg,
          :kind_of => Integer
        )
      end

      def check_interval(arg=nil)
        set_in_hash(
          :check_interval,
          arg,
          :kind_of => Integer
        )
      end

      def retry_interval(arg=nil)
        set_in_hash(
          :retry_interval,
          arg,
          :kind_of => Integer
        )
      end

      def active_checks_enabled(arg=nil)
        set_in_hash(
          :active_checks_enabled,
          arg,
          :kind_of => [TrueClass, FalseClass]
        )
      end

      def passive_checks_enabled(arg=nil)
        set_in_hash(
          :passive:checks_enabled,
          arg,
          :kind_of => [TrueClass, FalseClass]
        )
      end

      def check_period(arg=nil)
        set_in_hash(
          :check_period,
          arg,
          :kind_of => String
        )
      end

      def obsess_over_host(arg=nil)
        set_in_hash(
          :obsess_over_host,
          arg,
          :kind_of => [ TrueClass, FalseClass ]
        )
      end

      def check_freshness(arg=nil)
        set_in_hash(
          :check_freshness,
          arg,
          :kind_of => [ TrueClass, FalseClass ]
        )
      end

      def freshness_threshold(arg=nil)
        set_in_hash(
          :freshness_threshold,
          arg,
          :kind_of => Integer
      end

      def event_handler(arg=nil)
        set_in_hash(
          :event_handler,
          arg,
          :kind_of => String
      end

      def event_handler_enabled(arg=nil)
        set_in_hash(
          :event_handler_enabled,
          arg,
          :kind_of => [ TrueClass, FalseClass ]
      end

      def low_flap_threshold(arg=nil)
        set_in_hash(
          :low_flap_threshold,
          arg,
          :kind_of => Integer
      end

      def high_flap_threshold(arg=nil)
        set_in_hash(
          :high_flap_threshold,
          arg,
          :kind_of => Integer
      end

      def flap_detection_enabled(arg=nil)
        set_in_hash(
          :flap_detection_enabled,
          arg,
          :kind_of => [ TrueClass, FalseClass ]
      end

      def flap_detection_options(arg=nil)
        set_in_hash(
          :flap_detection_otions,
          arg,
          :kind_of => Array
      end

      def failure_prediction_enabled(arg=nil)
        set_in_hash(
          :failure_prediction_enabled,
          arg,
          :kind_of => [ TrueClass, FalseClass ]
      end

      def process_perf_data(arg=nil)
        set_in_hash(
          :process_perf_data,
          arg,
          :kind_of => [ TrueClass, FalseClass ]
      end

      def retain_status_information(arg=nil)
        set_in_hash(
          :retain_status_information,
          arg,
          :kind_of => [ TrueClass, FalseClass ]
      end

      def retain_nonstatus_information(arg=nil)
        set_in_hash(
          :retain_nonstatus_information,
          arg,
          :kind_of => [ TrueClass, FalseClass ]
      end

      def contacts(arg=nil)
        set_in_hash(
          :contacts,
          arg,
          :kind_of => Array
      end

      def contact_groups(arg=nil)
        set_in_hash(
          :contact_groups,
          arg,
          :kind_of => Array
      end

      def notification_interval(arg=nil)
        set_in_hash(
          :notification_interval,
          arg,
          :kind_of => Integer
      end

      def first_notification_delay(arg=nil)
        set_in_hash(
          :first_notification_delay,
          arg,
          :kind_of => Integer
      end

      def notification_period(arg=nil)
        set_in_hash(
          :notification_period,
          arg,
          :kind_of => String
      end

      def notification_options(arg=nil)
        set_in_hash(
          :notification_options,
          arg,
          :kind_of => Array
      end

      def notifications_enabled(arg=nil)
        set_in_hash(
          :notification_enabled,
          arg,
          :kind_of => [ TrueClass, FalseClass ]
      end

      def stalking_options(arg=nil)
        set_in_hash(
          :notification_interval,
          arg,
          :kind_of => Array
      end

      def notes(arg=nil)
        set_in_hash(
          :notes,
          arg,
          :kind_of => String
      end

      def notes_url(arg=nil)
        set_in_hash(
          :notes_url,
          arg,
          :kind_of => String
      end

      def action_url(arg=nil)
        set_in_hash(
          :action_url,
          arg,
          :kind_of => String
      end

      def icon_image(arg=nil)
        set_in_hash(
          :icon_image,
          arg,
          :kind_of => String
      end

      def icon_image_alt(arg=nil)
        set_in_hash(
          :icon_image_alt,
          arg,
          :kind_of => String
      end

      def statusmap_image(arg=nil)
        set_in_hash(
          :statusmap_image,
          arg,
          :kind_of => String
      end

      def _2d_coords(arg=nil)
        set_in_hash(
          :_2d_coords,
          arg,
          :kind_of => Array
      end
    end
  end

  class Provider
    class IcingaHost < Chef::Provider
      def initialize(new_resource, run_context)
        super(new_resource, run_context)
        @path = "#{node["icinga"]["hosts_dir"]}+/#{new_resource.name}.cfg"
        @current_resource = load_current_definition()
      end

      def load_current_definition()
        current_resource = Chef::Resource::IcingaHost.new(@new_resource.name)

        if ::File.exists?(@path)
          contents = String.new()
          ::File.open(@path) do |f|
            contents = parse(f)
          end
          # TODO: This might not be iterable.
          contents.each() do |object, data|
            if object == "host"
              # Adjust keys to the Resource method names.
              data.each() do |key, value|
                if key == "2d_coords"
                  key = "_" + key
                elsif key == "host_name"
                  key = "name"
                end
                # TODO: Check if responds_to and send actually need symbols and not strings.
                if current_resource.responds_to?(key.to_sym())
                  # Call the method
                  current_resource.send(key.to_sym(), value)
                else
                  raise "Current_resource does not have #{key} method"
                end
              end
          end
        else
          Chef::Log.debug("Did not find a existing #{@new_resource.name}")
        end

        return current_resource
      end

      def parse(io)
        object = io.read()
        data = NagiosParser::Object::Parser.parse(object)
        return data
      end
    end
  end
end
