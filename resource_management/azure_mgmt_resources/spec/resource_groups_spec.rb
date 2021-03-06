# encoding: utf-8
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See License.txt in the project root for license information.

require_relative 'spec_helper'

include MsRestAzure
include Azure::ARM::Resources

describe 'Resource Groups' do

  before(:all) do
    @client = RESOURCES_CLIENT.resource_groups
    @resource_group = create_resource_group
    @created_groups = [@resource_group.name]
  end

  after(:all) do
    @created_groups.each do |item|
      if @client.check_existence(item).value!.body
        delete_resource_group(item)
      end
    end
  end

  it 'should create resource group' do
    name = get_random_name('RubySDKTest_')
    @created_groups.push(name)

    params = Models::ResourceGroup.new
    params.location = 'westus'
    params.tags = { 'tag1' => 'val1', 'tag2' => 'val2' }

    result = @client.create_or_update(name, params).value!

    expect(result.body).not_to be_nil
    expect(result.body.id).not_to be_nil
    expect(result.body.name).to eq(name)
    expect(result.body.location).to eq('westus')
    expect(result.body.tags).not_to be_nil
    expect(result.body.tags['tag1']).to eq('val1')
    expect(result.body.tags['tag2']).to eq('val2')
  end

  it 'should throw exception when create or update with nil parameters' do
    params = Models::ResourceGroup.new
    expect{@client.create_or_update(nil, params)}.to raise_error(ArgumentError)
    expect{@client.create_or_update('foo', nil)}.to raise_error(ArgumentError)
  end

  it 'should raise exception when attempt to update without required parameters' do
    params = Models::ResourceGroup.new
    expect{@client.patch(nil, params)}.to raise_error(ArgumentError)
    expect{@client.patch('foo', nil)}.to raise_error(ArgumentError)
    expect{@client.patch('~`123', params).value!}.to raise_error(MsRest::ValidationError)
  end

  it 'should get resource group' do
    result = @client.get(@resource_group.name).value!

    expect(result.body).not_to be_nil
    expect(result.body.id).not_to be_nil
    expect(result.body.name).to eq(@resource_group.name)
    expect(result.body.location).to eq('westus')
    expect(result.body.tags).to be_nil
  end

  it 'should raise errors when attempting get resource group' do
    expect{@client.get(nil)}.to raise_error(ArgumentError)
    expect{@client.get('~`123').value!}.to raise_error(MsRestAzure::AzureOperationError)
  end

  it 'should list resource groups' do
    result = @client.list.value!
    expect(result.body.value).not_to be_nil
    expect(result.body.value).to be_a(Array)

    while !result.body.next_link.nil? && !result.body.next_link.empty?  do
      result = @client.list_next(result.body.next_link).value!
      expect(result.body.value).not_to be_nil
      expect(result.body.value).to be_a(Array)
    end
  end

  it 'should list resources of resource group' do
    result = @client.list_resources(@resource_group.name).value!
    expect(result.body.value).not_to be_nil
    expect(result.body.value).to be_a(Array)

    while !result.body.next_link.nil? && !result.body.next_link.empty?  do
      result = @client.list_resources_next(result.body.next_link).value!
      expect(result.body.value).not_to be_nil
      expect(result.body.value).to be_a(Array)
    end
  end

  it 'should check resource group exists' do
    result = @client.check_existence(@resource_group.name).value!.body
    expect(result).to be_truthy
  end

  it 'should return false when resource group does not not exists' do
    result = @client.check_existence(get_random_name('existence')).value!
    expect(result.response.status).to eq(404)
    expect(result.body).to eq(false)
  end

  it 'should list list resources in resource group with tag_name and value filter and top parameter' do
    filter = "tagName eq 'tagName' and tagValue eq 'tagValue'"
    result = @client.list_resources(@resource_group.name, filter, 1).value!
    expect(result.body.value).not_to be_nil
    expect(result.body.value).to be_a(Array)

    while !result.body.next_link.nil? && !result.body.next_link.empty? do
      result = @client.list_resources_next(result.body.next_link).value!
      expect(result.body.value).not_to be_nil
      expect(result.body.value).to be_a(Array)
    end
  end

  it 'should delete resource group' do
    result = @client.delete(@resource_group.name).value!
    expect(result.response.status).to eq(200)
  end

  it 'should raise errors when attempting delete resource group' do
    expect{@client.delete(nil)}.to raise_error(ArgumentError)
    expect{@client.delete('~`123').value!}.to raise_error(MsRestAzure::AzureOperationError)
  end

  it 'should return false when check existence for not existing resource group' do
    resource_group_name = get_random_name('resource_group')
    expect(@client.check_existence(resource_group_name).value!.body).to eq(false)
  end

  it 'should return true value when check existence of existing group' do
    group = create_resource_group
    @created_groups.push(group.name)
    expect(@client.check_existence(group.name).value!.body).to eq(true)
  end

  it 'should list resource groups with tag_name and value filter and top parameter' do
    filter = "tagName eq 'tagName' and tagValue eq 'tagValue'"
    result = @client.list(filter, 1).value!
    expect(result.body.value).not_to be_nil
    expect(result.body.value).to be_a(Array)

    while !result.body.next_link.nil? && !result.body.next_link.empty? do
      result = @client.list_next(result.body.next_link).value!
      expect(result.body.value).not_to be_nil
      expect(result.body.value).to be_a(Array)
    end
  end

  it 'should resource groups with tag_name and value filter and top parameter' do
    filter = "tagName eq 'tagName' and tagValue eq 'tagValue'"
    result = @client.list(filter, 1).value!
    expect(result.body.value).not_to be_nil
    expect(result.body.value).to be_a(Array)

    while !result.body.next_link.nil? && !result.body.next_link.empty? do
      result = @client.list_next(result.body.next_link).value!
      expect(result.body.value).not_to be_nil
      expect(result.body.value).to be_a(Array)
    end
  end
end
