# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.16.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::CDN
  #
  # Use these APIs to manage Azure CDN resources through the Azure Resource
  # Manager. You must make sure that requests made to these resources are
  # secure. For more information, see <a
  # href="https://msdn.microsoft.com/en-us/library/azure/dn790557.aspx">Authenticating
  # Azure Resource Manager requests.</a>
  #
  class NameAvailability
    include Azure::ARM::CDN::Models
    include MsRestAzure

    #
    # Creates and initializes a new instance of the NameAvailability class.
    # @param client service class for accessing basic functionality.
    #
    def initialize(client)
      @client = client
    end

    # @return reference to the CdnManagementClient
    attr_reader :client

    #
    # Check the availability of a resource name. This is needed for resources
    # where name is globally unique (ex: endpoint). With this operation checks if
    # the name is available or not without creating the resource.
    #
    # @param check_name_availability_input [CheckNameAvailabilityInput] input to
    # check
    # @param [Hash{String => String}] The hash of custom headers need to be
    # applied to HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which allows to get HTTP
    # response.
    #
    def check_name_availability(check_name_availability_input, custom_headers = nil)
      fail ArgumentError, 'check_name_availability_input is nil' if check_name_availability_input.nil?
      check_name_availability_input.validate unless check_name_availability_input.nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?
      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?

      # Serialize Request
      request_headers['Content-Type'] = 'application/json; charset=utf-8'
      unless check_name_availability_input.nil?
        check_name_availability_input = CheckNameAvailabilityInput.serialize_object(check_name_availability_input)
      end
      request_content = JSON.generate(check_name_availability_input, quirks_mode: true)
      path_template = '/providers/Microsoft.Cdn/checkNameAvailability'
      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          query_params: {'api-version' => @client.api_version},
          body: request_content,
          headers: request_headers.merge(custom_headers || {})
      }
      request = MsRest::HttpOperationRequest.new(@base_url || @client.base_url, path_template, :post, options)
      promise = request.run_promise do |req|
        @client.credentials.sign_request(req) unless @client.credentials.nil?
      end

      promise = promise.then do |http_response|
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRest::HttpOperationError.new(request, http_response, error_model)
        end

        # Create Result
        result = MsRestAzure::AzureOperationResponse.new(request, http_response)
        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            unless parsed_response.nil?
              parsed_response = CheckNameAvailabilityOutput.deserialize_object(parsed_response)
            end
            result.body = parsed_response
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

  end
end
