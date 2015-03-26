Banners Plugin for Wheelhouse CMS
=================================

This plugin allows you to easily add advertising banners to a Wheelhouse CMS site.

Banners are managed within the CMS and different images can be defined for multiple (customizable) breakpoints.


Installation & Usage
--------------------

**1. Add `wheelhouse-banners` to your Gemfile:**

    gem "wheelhouse-banners"

Then run `bundle install`.

**2. Declare your breakpoints within `config/application.rb`.**

    config.wheelhouse.banners.breakpoints = {
      "Desktop" => :default,
      "Mobile"  => "only screen and (max-width: 650px)"
    }

The hash key is the name of the breakpoint and the value is the media query.

**3. Start the Rails server and create your banners within Configuration -> Edit Banners.**

**4. Call the `banner` helper in your theme layout where you want your banners to be positioned.**

To show only banners tagged with a specific tag, pass the tag name as a parameter to `banner`. e.g.

    <%= banner "All ages" %>
