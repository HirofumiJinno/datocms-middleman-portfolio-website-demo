require 'redcarpet'


ignore '/templates/*'
ignore /stylesheets.*/

activate :directory_indexes
activate :dato
activate :i18n, langs: [:en, :ja]
activate :pagination

activate :external_pipeline,
  name: :webpack,
  command: build? ? "npm run build:assets" : "npm run start:assets",
  source: ".tmp/webpack_output",
  latency: 1

configure :development do
  activate :livereload
end

configure :build do
  activate :minify_html
end

helpers do
  def markdownify(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    markdown.render(text)
  end
end
