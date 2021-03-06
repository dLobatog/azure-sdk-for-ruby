# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.16.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Graph
  module Models
    #
    # Model object.
    #
    class UserCreateParametersPasswordProfile

      include MsRestAzure

      # @return [String] Password
      attr_accessor :password

      # @return [Boolean] Force change password on next login
      attr_accessor :force_change_password_next_login

      #
      # Validate the object. Throws ValidationError if validation fails.
      #
      def validate
        fail MsRest::ValidationError, 'property password is nil' if @password.nil?
      end

      #
      # Serializes given Model object into Ruby Hash.
      # @param object Model object to serialize.
      # @return [Hash] Serialized object in form of Ruby Hash.
      #
      def self.serialize_object(object)
        object.validate
        output_object = {}

        serialized_property = object.password
        output_object['password'] = serialized_property unless serialized_property.nil?

        serialized_property = object.force_change_password_next_login
        output_object['forceChangePasswordNextLogin'] = serialized_property unless serialized_property.nil?

        output_object
      end

      #
      # Deserializes given Ruby Hash into Model object.
      # @param object [Hash] Ruby Hash object to deserialize.
      # @return [UserCreateParametersPasswordProfile] Deserialized object.
      #
      def self.deserialize_object(object)
        return if object.nil?
        output_object = UserCreateParametersPasswordProfile.new

        deserialized_property = object['password']
        output_object.password = deserialized_property

        deserialized_property = object['forceChangePasswordNextLogin']
        output_object.force_change_password_next_login = deserialized_property

        output_object
      end
    end
  end
end
