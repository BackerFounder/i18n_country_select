module CountryCodeSelect
	module InstanceTag
		include Countries

		def to_country_code_select_tag(priority_countries, options = {})
			country_code_select(priority_countries, options)
		end

		# Adapted from Rails country_select. Just uses country codes instead of full names.
		def country_code_select(priority_countries, options)
			selected = object.send(@method_name)

			countries = ""
			if priority_countries
				countries += options_for_select(priority_countries, selected)
				countries += "<option value=\"\" disabled=\"disabled\">-------------</option>\n"
      elsif options[:include_blank]
        countries += "<option value=\"\">" + options[:include_blank] + "</options>\n"
				countries += "<option value=\"\" disabled=\"disabled\">-------------</option>\n"
			end

			countries = countries + options_for_select(COUNTRIES, selected)
			add_default_name_and_id(options)
      content_tag(:select, countries, options, false)
		end
	end
end
