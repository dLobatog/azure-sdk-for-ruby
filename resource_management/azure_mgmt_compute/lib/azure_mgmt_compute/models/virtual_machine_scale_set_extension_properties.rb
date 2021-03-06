# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.16.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Compute
  module Models
    #
    # Describes the properties of a Virtual Machine Scale Set Extension.
    #
    class VirtualMachineScaleSetExtensionProperties

      include MsRestAzure

      # @return [String] Gets or sets the name of the extension handler
      # publisher.
      attr_accessor :publisher

      # @return [String] Gets or sets the type of the extension handler.
      attr_accessor :type

      # @return [String] Gets or sets the type version of the extension
      # handler.
      attr_accessor :type_handler_version

      # @return [Boolean] Gets or sets whether the extension handler should be
      # automatically upgraded across minor versions.
      attr_accessor :auto_upgrade_minor_version

      # @return Gets or sets Json formatted public settings for the extension.
      attr_accessor :settings

      # @return Gets or sets Json formatted protected settings for the
      # extension.
      attr_accessor :protected_settings

      # @return [String] Gets the provisioning state, which only appears in
      # the response.
      attr_accessor :provisioning_state

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

        serialized_property = object.publisher
        output_object['publisher'] = serialized_property unless serialized_property.nil?

        serialized_property = object.type
        output_object['type'] = serialized_property unless serialized_property.nil?

        serialized_property = object.type_handler_version
        output_object['typeHandlerVersion'] = serialized_property unless serialized_property.nil?

        serialized_property = object.auto_upgrade_minor_version
        output_object['autoUpgradeMinorVersion'] = serialized_property unless serialized_property.nil?

        serialized_property = object.settings
        output_object['settings'] = serialized_property unless serialized_property.nil?

        serialized_property = object.protected_settings
        output_object['protectedSettings'] = serialized_property unless serialized_property.nil?

        serialized_property = object.provisioning_state
        output_object['provisioningState'] = serialized_property unless serialized_property.nil?

        output_object
      end

      #
      # Deserializes given Ruby Hash into Model object.
      # @param object [Hash] Ruby Hash object to deserialize.
      # @return [VirtualMachineScaleSetExtensionProperties] Deserialized
      # object.
      #
      def self.deserialize_object(object)
        return if object.nil?
        output_object = VirtualMachineScaleSetExtensionProperties.new

        deserialized_property = object['publisher']
        output_object.publisher = deserialized_property

        deserialized_property = object['type']
        output_object.type = deserialized_property

        deserialized_property = object['typeHandlerVersion']
        output_object.type_handler_version = deserialized_property

        deserialized_property = object['autoUpgradeMinorVersion']
        output_object.auto_upgrade_minor_version = deserialized_property

        deserialized_property = object['settings']
        output_object.settings = deserialized_property

        deserialized_property = object['protectedSettings']
        output_object.protected_settings = deserialized_property

        deserialized_property = object['provisioningState']
        output_object.provisioning_state = deserialized_property

        output_object
      end
    end
  end
end
