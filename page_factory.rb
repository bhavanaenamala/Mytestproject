require 'page_navigation'

module PageFactory


    def visit_page(page_class, params={:using_params => {}}, &block)
      on_page page_class, params, true, &block
    end

	
    def on_page(page_class, params={:using_params => {}}, visit=false, &block)
      page_class = class_from_string(page_class) if page_class.is_a? String
      return super(page_class, params, visit, &block) unless page_class.ancestors.include? PageObject
      merged = page_class.params.merge(params[:using_params])
      page_class.instance_variable_set("@merged_params", merged) unless merged.empty?
      @current_page = page_class.new(@browser, visit)
      block.call @current_page if block
      @current_page
    end
	
end