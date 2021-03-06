require 'json'

class MyNetwork
  attr_accessor :nodes, :channels, :nodes_number, :average_channels_num,
                :channel_weights

  def initialize
    @nodes = []
    @channels = []
    @channel_weights = []
    @nodes_number = 0
    @average_channels_num = 0
  end

  def to_json(*a)
    as_json.to_json(*a)
  end

  def as_json(options = {})
    {
        json_class: self.class.name,
        data: { nodes: @nodes.map(&:as_json), channels: @channels.map(&:as_json) }
    }
  end

  def self.json_create(o)
    net_from_json = new
    net_from_json.nodes = o['nodes']
    net_from_json.channels = o['channels']
    net_from_json
  end
end