# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.16.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Scheduler
  module Models
    #
    # Model object.
    #
    class HttpRequest

      include MsRestAzure

      # @return [HttpAuthentication] Gets or sets the http authentication.
      attr_accessor :authentication

      # @return [String] Gets or sets the Uri.
      attr_accessor :uri

      # @return [String] Gets or sets the method of the request.
      attr_accessor :method

      # @return [String] Gets or sets the request body.
      attr_accessor :body

      # @return [Hash{String => String}] Gets or sets the headers.
      attr_accessor :headers

      #
      # Validate the object. Throws ValidationError if validation fails.
      #
      def validate
        @authentication.validate unless @authentication.nil?
        @headers.each{ |e| e.validate if e.respond_to?(:validate) } unless @headers.nil?
      end

      #
      # Serializes given Model object into Ruby Hash.
      # @param object Model object to serialize.
      # @return [Hash] Serialized object in form of Ruby Hash.
      #
      def self.serialize_object(object)
        object.validate
        output_object = {}

        serialized_property = object.authentication
        unless serialized_property.nil?
          serialized_property = HttpAuthentication.serialize_object(serialized_property)
        end
        output_object['authentication'] = serialized_property unless serialized_property.nil?

        serialized_property = object.uri
        output_object['uri'] = serialized_property unless serialized_property.nil?

        serialized_property = object.method
        output_object['method'] = serialized_property unless serialized_property.nil?

        serialized_property = object.body
        output_object['body'] = serialized_property unless serialized_property.nil?

        serialized_property = object.headers
        output_object['headers'] = serialized_property unless serialized_property.nil?

        output_object
      end

      #
      # Deserializes given Ruby Hash into Model object.
      # @param object [Hash] Ruby Hash object to deserialize.
      # @return [HttpRequest] Deserialized object.
      #
      def self.deserialize_object(object)
        return if object.nil?
        output_object = HttpRequest.new

        deserialized_property = object['authentication']
        unless deserialized_property.nil?
          deserialized_property = HttpAuthentication.deserialize_object(deserialized_property)
        end
        output_object.authentication = deserialized_property

        deserialized_property = object['uri']
        output_object.uri = deserialized_property

        deserialized_property = object['method']
        output_object.method = deserialized_property

        deserialized_property = object['body']
        output_object.body = deserialized_property

        deserialized_property = object['headers']
        output_object.headers = deserialized_property

        output_object
      end
    end
  end
end