Rails.configuration.stripe = {
  :publishable_key => Rails.application.credentials.stripe(:publishable_key),
  :secret_key      => Rails.application.credentials.stripe(:secret_key)
  # :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
  # :secret_key      => ENV['STRIPE_SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]