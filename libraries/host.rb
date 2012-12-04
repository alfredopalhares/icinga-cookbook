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
      end
    end
  end
end