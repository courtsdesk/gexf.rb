GEXF::GRAPH_TYPES = (GEXF::Attribute::TYPES   +
                     GEXF::Edge::TYPES        +
                     GEXF::Graph::IDTYPES     +
                     GEXF::Graph::MODES).uniq

class Hash

  # NOTE: Custom symbolize Keys method removed from originial gem as no
  #       longer needed and it was causing issues in view helpers

  def symbolize_graph_types
    hash = {}
    each { |k, v| hash[k] = delete(k).to_sym if GEXF::GRAPH_TYPES.include?(v.to_sym) }
    merge(hash)
  end
end
