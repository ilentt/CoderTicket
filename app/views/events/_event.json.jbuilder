json.extract! event, :name, :venue, :category, :starts_at, :ends_at, 
      	:hero_image_url, :extended_html_description, :published_at
json.url event_url(event, format: :json)