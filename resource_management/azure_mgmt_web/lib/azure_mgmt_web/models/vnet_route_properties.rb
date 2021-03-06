# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.16.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Web
  module Models
    #
    # Model object.
    #
    class VnetRouteProperties

      include MsRestAzure

      # @return [String] The name of this route. This is only returned by the
      # server and does not need to be set by the client.
      attr_accessor :name

      # @return [String] The starting address for this route. This may also
      # include a CIDR notation, in which case the end address must not be
      # specified.
      attr_accessor :start_address

      # @return [String] The ending address for this route. If the start
      # address is specified in CIDR notation, this must be omitted.
      attr_accessor :end_address

      # @return [String] The type of route this is:
      # DEFAULT - By default, every web app has routes to the
      # local address ranges specified by RFC1918
      # INHERITED - Routes inherited from the real Virtual Network
      # routes
      # STATIC - Static route set on the web app only
      # 
      # These values will be used for syncing a Web App's routes
      # with those from a Virtual Network. This operation will clear all
      # DEFAULT and INHERITED routes and replace them
      # with new INHERITED routes.
      attr_accessor :route_type

      #
      # Validate the object. Throws ValidationError if validation fails.
      #
      def validate
        # Nothing to validate
      end

      #
      # Serializes given Model object into Ruby Hash.
      # @param object Model object to serialize.
      # @return [Hash] Serialized object in form of Ruby Hash.
      #
      def self.serialize_object(object)
        object.validate
        output_object = {}

        serialized_property = object.name
        output_object['name'] = serialized_property unless serialized_property.nil?

        serialized_property = object.start_address
        output_object['startAddress'] = serialized_property unless serialized_property.nil?

        serialized_property = object.end_address
        output_object['endAddress'] = serialized_property unless serialized_property.nil?

        serialized_property = object.route_type
        output_object['routeType'] = serialized_property unless serialized_property.nil?

        output_object
      end

      #
      # Deserializes given Ruby Hash into Model object.
      # @param object [Hash] Ruby Hash object to deserialize.
      # @return [VnetRouteProperties] Deserialized object.
      #
      def self.deserialize_object(object)
        return if object.nil?
        output_object = VnetRouteProperties.new

        deserialized_property = object['name']
        output_object.name = deserialized_property

        deserialized_property = object['startAddress']
        output_object.start_address = deserialized_property

        deserialized_property = object['endAddress']
        output_object.end_address = deserialized_property

        deserialized_property = object['routeType']
        output_object.route_type = deserialized_property

        output_object
      end
    end
  end
end
