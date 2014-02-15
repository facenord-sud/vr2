module ApplicationHelper
  def full_title(page_title, sep = ' - ')
    options = {}
    options[:prepend] = t :app_name
    unless page_title.blank?
      options[:append] = page_title
    end
    find_t_for_meta('title_page', options).reverse.join(sep).html_safe
  end

  def key_words(words)
    if words.blank?
      find_t_for_meta('key_words', prepend: t('default_key_words')).join(', ').html_safe
    else
      "#{t('default_key_words')}, #{words}".html_safe
    end
  end

  def description(description)
    if description.blank?
      raw find_t_for_meta('description', prepend: t('default_description_meta')).join(' ').html_safe
    else
      "#{t('default_description_meta')} #{description}".html_safe
    end
  end

  private
    def find_t_for_meta(meta, options={})
      action_name = params[:action]
      action_name = 'new' if action_name == 'create'
      action_name = 'edit' if action_name == 'edit'
      controller_name = params[:controller].split('/')[1]
      module_name = params[:controller].split('/')[0]
      array_meta = []
      array_meta << options[:prepend] unless options[:prepend].nil?
      #if controller_name.blank?
      #  array_meta << t("")
      #end
      array_meta << t("meta.#{module_name}.#{meta}", default: '')
      array_meta << t("meta.#{module_name}.#{controller_name}.#{meta}", default: '')
      array_meta << t("meta.#{module_name}.#{controller_name}.#{action_name}.#{meta}", default: '')
      array_meta << options[:append] unless options[:append].nil?
      remove_blank array_meta
    end

    def remove_blank(array)
      array.reject { |an_elem| an_elem.blank?}
    end
end
