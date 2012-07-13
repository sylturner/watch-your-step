atom_feed do |feed|
  feed.title "Watch Your Step"
  feed.updated @media.first.created_at

  @media.each do |medium|
    feed.entry medium do |entry|
      entry.title medium.title
      content = medium.description
      medium.prompts.each {|p| content += "\n#{p.question}\n#{p.answer}\n"}
      entry.content content
    end
  end
end