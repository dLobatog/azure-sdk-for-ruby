# encoding: utf-8
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See License.txt in the project root for license information.

require_relative 'spec_helper'
require_relative 'public_ip_addresses_shared'

include MsRestAzure
include Azure::ARM::Resources
include Azure::ARM::Network


describe PublicIPAddresses do
  before(:all) do
    @client = NETWORK_CLIENT.public_ipaddresses
    @resource_group = create_resource_group
    @location = 'westus'
  end

  after(:all) do
    delete_resource_group(@resource_group.name)
  end

  it 'should create public ip address' do
    params = build_public_ip_params(@location)
    public_ip_name = get_random_name('ip_name')
    result = @client.create_or_update(@resource_group.name, public_ip_name, params).value!
    expect(result.response.status).to eq(200)
    expect(result.body).not_to be_nil
    expect(result.body.name).to eq(public_ip_name)
  end

  it 'should get public ip address' do
    address = create_public_ip_address(@location, @resource_group)
    result = @client.get(@resource_group.name, address.name).value!
    expect(result.response.status).to eq(200)
    expect(result.body).not_to be_nil
    expect(result.body.name).to eq(address.name)
  end


  it 'should list all the public ip addresses in a resource group' do
    result = @client.list(@resource_group.name).value!
    expect(result.body.value).not_to be_nil
    expect(result.body.value).to be_a(Array)

    while !result.body.next_link.nil? && !result.body.next_link.empty? do
      result = @client.list_next(result.body.next_link).value!
      expect(result.body.value).not_to be_nil
      expect(result.body.value).to be_a(Array)
    end
  end

  it 'should delete public ip address' do
    address = create_public_ip_address(@location, @resource_group)
    result = @client.delete(@resource_group.name, address.name).value!
    expect(result.response.status).to eq(200)
  end

it 'should list all the public ip addresses in a subscription' do
  result = @client.list_all.value!
  expect(result.response.status).to eq(200)
  expect(result.body).not_to be_nil
  expect(result.body.value).to be_a(Array)
  while !result.body.next_link.nil? && !result.body.next_link.empty? do
    result = @client.list_all_next(result.body.next_link).value!
    expect(result.body.value).not_to be_nil
    expect(result.body.value).to be_a(Array)
  end
end

end