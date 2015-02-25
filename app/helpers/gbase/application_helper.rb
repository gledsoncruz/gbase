module Gbase
  module ApplicationHelper

  	def bootstrap_class_for(flash_type)
	    case flash_type
	      when "success"
	        "alert-success"   # Green
	      when "error"
	        "alert-danger"    # Red
	      when "alert"
	        "alert-warning"   # Yellow
	      when "notice"
	        "alert-info"      # Blue
	      else
	        flash_type.to_s
	    end
	end

	def glyph(*names)
	    content_tag :spam, nil, class: names.map{|name| "glyphicon glyphicon-#{name.to_s.gsub('_','-')}" }
	end


	def hindex(titulo, link, hpartial, lista, hsearch_field)

	    hform = search_form_for lista do |f|
	              f.search_field hsearch_field, :class => "form-control", :placeholder => "Consultar"
	            end

	    hlink = link_to(glyph(:"plus") + " Novo", link, :class => 'btn btn-primary pull-right')

	    row1 = content_tag(:div, "",:class => "row") do
	              concat content_tag(:div, hform, :class => "col-xs-3 col-sm-3 col-md-3 col-lg-3")
	              concat content_tag(:div, hlink, :class => "col-xs-9 col-sm-9 col-md-9 col-lg-9")
	            end

	    row2 = content_tag(:div, "",:class => "row") do
	            concat content_tag(:div, render(partial: hpartial), :class => "col-xs-12 col-sm-12 col-md-12 col-lg-12")
	          end

	    content_tag(:div, "",:class => "panel panel-default") do
	      content_tag(:div, content_tag(:i, "",:class => "glyphicon glyphicon-list", :style => "padding-right: 10px;")+titulo, :class => "panel-heading")+
	      content_tag(:div, "",:class => "panel-body") do
	        row1 + row2
	      end
	    end
	 end



  end
end
