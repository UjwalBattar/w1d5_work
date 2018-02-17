require 'byebug'

class PolyTreeNode

  attr_reader :parent, :value, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  def parent=(node)
    @parent.children.delete(self) if @parent

    if node.nil?
      @parent = nil
    else
    # debugger
      @parent = node
      node.children << self unless node.children.include?(self)
    end
    # @parent = node
    # if @parent
    #   @parent.children << self unless @parent.children.include?(self)
    # end
  end

  def add_child(child_node)
    self.children << child_node
    child_node.parent = self
  end

  def remove_child(child_node)

    if child_node
      child_node.parent = nil
      # @children.delete(child_node)
    end

    unless @children.include?(child_node)
      raise "No such child"

    end
  end

  def dfs(tgt)
    return self if self.value == tgt

    self.children.each do |a|
      result = a.dfs(tgt)
      return result unless result.nil?
    end
    # return self if self.value == tgt
    #
    # self.children.each do |child|
    #     child.dfs(tgt)
    # end
    nil
  end

end

  # def inspect
  #   'Something'
  # end
