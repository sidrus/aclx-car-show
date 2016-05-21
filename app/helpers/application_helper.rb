module ApplicationHelper
	def nav_bar
		content_tag(:ul, class: "nav navbar-nav") do
			yield
		end		
	end

	def nav_link(text, path, method=:get)
		options = current_page?(path) ? {class: "active nav-item nav-link"} : {class: "nav-item nav-link"}
		content_tag(:li, options) do
			link_to text, path, method: method
		end
	end
end
