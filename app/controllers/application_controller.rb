class ApplicationController < ActionController::Base
  # Cross-site request forgery, also known as a one-click attack or session riding and abbreviated as CSRF or XSRF
  # It is a type of malicious exploit of a website whereby unauthorized commands are transmitted from a user that the website trusts.
  # Unlike cross-site scripting (XSS), which exploits the trust a user has for a particular site,
  # CSRF exploits the trust that a site has in a user's browser.
  protect_from_forgery

end

