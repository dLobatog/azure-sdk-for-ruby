# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.16.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Web
  module Models
    #
    # Options for retrieving the list of top level domain legal agreements
    #
    class TopLevelDomainAgreementOption

      include MsRestAzure

      # @return [Boolean] If true then the list of agreements will inclue
      # agreements for domain privacy as well.
      attr_accessor :include_privacy

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

        serialized_property = object.include_privacy
        output_object['includePrivacy'] = serialized_property unless serialized_property.nil?

        output_object
      end

      #
      # Deserializes given Ruby Hash into Model object.
      # @param object [Hash] Ruby Hash object to deserialize.
      # @return [TopLevelDomainAgreementOption] Deserialized object.
      #
      def self.deserialize_object(object)
        return if object.nil?
        output_object = TopLevelDomainAgreementOption.new

        deserialized_property = object['includePrivacy']
        output_object.include_privacy = deserialized_property

        output_object
      end
    end
  end
end
