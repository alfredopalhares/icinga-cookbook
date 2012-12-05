require "nagios_config"

class Chef
  class Resource
    class IcingaHost < Chef::Resource
      def initialize(name, collection=nil, node=nil)
        super(name, collection, node)
        @resource_name = :icinga_host
        @host_name = name
        @alias = nil
        @display_name = nil
        @address = nil
        @address6 = nil
        @display_name = nil
        @parents = nil
        @hostgroups = nil
        @check_command = nil
        @initial_state = nil
        @max_check_attempts = nil
        @check_interval = nil
        @retry_interval = nil
        @active_checks_enabled = nil
        @passive_checks_enabled = nil
        @check_period = nil
        @obsess_over_host = nil
        @check_freshness = nil
        @freshness_threshold = nil
        @event_handler = nil
        @low_flap_threshould = nil
        @high_flap_threshould = nil
        @flap_detetction_enabled = nil
        @failure_prediction_enabled = nil
        @process_perf_data = nil
        @retain_status_information = nil
        @retain_nonstatus_information = nil
        @contacts = nil
        @contact_groups = nil
        @notification_interval = nil
        @first_notification_delay = nil
        @notification_period = nil
        @notification_options = nil
        @notifications_enabled = nil
        @stalking_options = nil
        @notes = nil
        @notes_url = nil
        @action_url = nil
        @icon_image = nil
        @icon_image_alt = nil
        @statusmap_image = nil
        # Vars can't start with a number
        @_2d_coords = nil
      end

      def alias(arg=nil)
        set_or_return(
          :alias,
          arg,
          :kind_of => String
        )
      end

      def display_name(arg=nil)
        set_or_return(
          :display_name,
          arg,
          :kind_of => String
        )
      end

      def address(arg=nil)
        set_or_return(
          :address,
          arg,
          :kind_of => String
        )
      end

      def address6(arg=nil)
        set_or_return(
          :address6,
          arg,
          :kind_of => String
        )
      end

      def parents(arg=nil)
        set_or_return(
          :parents,
          arg,
          :kind_of => Array
        )
      end

      def hostgroups(arg=nil)
        set_or_return(
          :hostgroups,
          arg,
          :kind_of => Array
        )
      end

      def check_command(arg=nil)
        set_or_return(
          :address,
          arg,
          :kind_of => String
        )
      end

      def initial_state(arg=nil)
        set_or_return(
          :initial_state,
          arg,
          :kind_of => String
        )
      end

      def max_check_attempts(arg=nil)
        set_or_return(
          :max_check_attempts,
          arg,
          :kind_of => Integer
        )
      end

      def check_interval(arg=nil)
        set_or_return(
          :check_interval,
          arg,
          :kind_of => Integer
        )
      end

      def retry_interval(arg=nil)
        set_or_return(
          :retry_interval,
          arg,
          :kind_of => Integer
        )
      end

      def active_checks_enabled(arg=nil)
        set_or_return(
          :active_checks_enabled,
          arg,
          :kind_of => [TrueClass, FalseClass]
        )
      end

      def passive_checks_enabled(arg=nil)
        set_or_return(
          :passive:checks_enabled,
          arg,
          :kind_of => [TrueClass, FalseClass]
        )
      end

      def check_period(arg=nil)
        set_or_return(
          :check_period,
          arg,
          :kind_of => String
        )
      end

      def obsess_over_host(arg=nil)
        set_or_return(
          :obsess_over_host,
          arg,
          :kind_of => [ TrueClass, FalseClass ]
        )
      end

      def check_freshness(arg=nil)
        set_or_return(
          :check_freshness,
          arg,
          :kind_of => [ TrueClass, FalseClass ]
        )
      end

      def freshness_threshold(arg=nil)
        set_or_return(
          :freshness_threshold,
          arg,
          :kind_of => Integer
      end

      def event_handler(arg=nil)
        set_or_return(
          :event_handler,
          arg,
          :kind_of => String
      end

      def event_handler_enabled(arg=nil)
        set_or_return(
          :event_handler_enabled,
          arg,
          :kind_of => [ TrueClass, FalseClass ]
      end

      def low_flap_threshold(arg=nil)
        set_or_return(
          :low_flap_threshold,
          arg,
          :kind_of => Integer
      end

      def high_flap_threshold(arg=nil)
        set_or_return(
          :high_flap_threshold,
          arg,
          :kind_of => Integer
      end

      def flap_detection_enabled(arg=nil)
        set_or_return(
          :flap_detection_enabled,
          arg,
          :kind_of => [ TrueClass, FalseClass ]
      end

      def flap_detection_options(arg=nil)
        set_or_return(
          :flap_detection_otions,
          arg,
          :kind_of => Array
      end

      def failure_prediction_enabled(arg=nil)
        set_or_return(
          :failure_prediction_enabled,
          arg,
          :kind_of => [ TrueClass, FalseClass ]
      end

      def process_perf_data(arg=nil)
        set_or_return(
          :process_perf_data,
          arg,
          :kind_of => [ TrueClass, FalseClass ]
      end

      def retain_status_information(arg=nil)
        set_or_return(
          :retain_status_information,
          arg,
          :kind_of => [ TrueClass, FalseClass ]
      end

      def retain_nonstatus_information(arg=nil)
        set_or_return(
          :retain_nonstatus_information,
          arg,
          :kind_of => [ TrueClass, FalseClass ]
      end

      def contacts(arg=nil)
        set_or_return(
          :contacts,
          arg,
          :kind_of => Array
      end

      def contact_groups(arg=nil)
        set_or_return(
          :contact_groups,
          arg,
          :kind_of => Array
      end

      def notification_interval(arg=nil)
        set_or_return(
          :notification_interval,
          arg,
          :kind_of => Integer
      end

      def first_notification_delay(arg=nil)
        set_or_return(
          :first_notification_delay,
          arg,
          :kind_of => Integer
      end

      def notification_period(arg=nil)
        set_or_return(
          :notification_period,
          arg,
          :kind_of => String
      end

      def notification_options(arg=nil)
        set_or_return(
          :notification_options,
          arg,
          :kind_of => Array
      end

      def notifications_enabled(arg=nil)
        set_or_return(
          :notification_enabled,
          arg,
          :kind_of => [ TrueClass, FalseClass ]
      end

      def stalking_options(arg=nil)
        set_or_return(
          :notification_interval,
          arg,
          :kind_of => Array
      end

      def notes(arg=nil)
        set_or_return(
          :notes,
          arg,
          :kind_of => String
      end

      def notes_url(arg=nil)
        set_or_return(
          :notes_url,
          arg,
          :kind_of => String
      end

      def action_url(arg=nil)
        set_or_return(
          :action_url,
          arg,
          :kind_of => String
      end

      def icon_image(arg=nil)
        set_or_return(
          :icon_image,
          arg,
          :kind_of => String
      end

      def icon_image_alt(arg=nil)
        set_or_return(
          :icon_image_alt,
          arg,
          :kind_of => String
      end

      def statusmap_image(arg=nil)
        set_or_return(
          :statusmap_image,
          arg,
          :kind_of => String
      end

      def _2d_coords(arg=nil)
        set_or_return(
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
          parsed_host = nil
          ::File.open(@path) do |f|
            parsed_host = NagiosConfig::Parser.new.parse(f)
          end

          parsed_host.defines() do |node|
            hostname = node.variables.find { |node| node.name.value = "hostname" }
            if hostname == @new_resource.name
              current_resource.alias(node.name.value = "alias")
              current_resource.display_name(node.name.value = "display_name")
              current_resource.address(node.name.value = "address")
              current_resource.address6(node.name.value = "address6")
              current_resource.parents(node.name.value = "parents")
              current_resource.hostgroups(node.name.value = "hostgroups")
              current_resource.check_command(node.name.value = "check_command")
              current_resource.initial_state(node.name.value = "initial_state")
              current_resource.max_check_attempts(node.name.value = "max_check_attempts")
              current_resource.check_interval(node.name.value = "check_interval")
              current_resource.retry_interval(node.name.value = "retry_interval")
              current_resource.active_checks_enabled(node.name.value = "active_checks_enabled")
              current_resource.passive_checks_enabled(node.name.value = "passive_checks_enabled")
              current_resource.check_period(node.name.value = "check_period")
              current_resource.obsess_over_host(node.name.value = "obsess_over_host")
              current_resource.check_freshness(node.name.value = "check_freshness")
              current_resource.freshness_threshould(node.name.value = "freshness_threshould")
              current_resource.event_handler(node.name.value = "event_handler")
              current_resource.event_handler_enabled(node.name.value = "event_handler_enabled")
              current_resource.low_flap_threshould(node.name.value = "low_flap_threshould")
              current_resource.high_flap_threshould(node.name.value = "high_flap_threshould")
              current_resource.flap_detection_enabled(node.name.value = "flap_detection_enabled")
              current_resource.flap_detection_options(node.name.value = "flap_detection_options")
              current_resource.failure_prediction_enabled(node.name.value = "failure_prediction_enabled")
              current_resource.process_perf_data(node.name.value = "process_perf_data")
              current_resource.retain_status_information(node.name.value = "retain_status_information")
              current_resource.retain_nonstatus_information(node.name.value = "retain_nonstatus_information")
              current_resource.contacts(node.name.value = "contacts")
              current_resource.contact_groups(node.name.value = "contact_groups")
              current_resource.notification_interval(node.name.value = "notification_interval")
              current_resource.first_notification_delay(node.name.value = "first_notification_delay")
              current_resource.notification_period(node.name.value = "notification_period")
              current_resource.notification_options(node.name.value = "notification_options")
              current_resource.notifications_enabled(node.name.value = "notifications_enabled")
              current_resource.stalking_options(node.name.value = "stalking_options")
              current_resource.notes(node.name.value = "notes")
              current_resource.notes_url(node.name.value = "notes_url")
              current_resource.action_url(node.name.value = "action_url")
              current_resource.icon_image(node.name.value = "icon_image")
              current_resource.icon_image_alt(node.name.value = "icon_image_alt")
              current_resource.statusmap_image(node.name.value = "statusmap_image")
              current_resource._2d_coords(node.name.value = "2d_coords")
            else
              #TODO: Add a proper expection here
              raise "Failed to load the hostname"
            end
          end
        else
          Chef::Log.debug("Did not find a existing #{@new_resource.name}")
        end

        return current_resource
      end

    end
  end
end
