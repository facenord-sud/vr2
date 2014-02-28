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

  def event_name(event, params: {}, t: 'events.index.print_event')
    if params.empty?
      params = {name: event.title, place: event.place, description: event.description}
    end
    if event.start_year == event.end_year
      if event.start_month == event.end_month
        if event.one_day?
          # event sur un jour
          t("#{t}_od",
                    date: l(event.starting_at, format: '%d.%m'),
                    name: event.title,
                    place: event.place,
                    description: event.description)
        else
          #event sur le même mois
          event_t_name event, params, start_format: '%d', end_format: '%d.%m', t: t
        end
      else
        #event entre deux mois sur une année
        event_t_name event, params, start_format: '%d.%m', end_format: '%d.%m', t: t
      end
    else
      #event entre deux années
      event_t_name event, params, t: t
    end
  end

  private

    def event_t_name(event, params, start_format: '%d.%m.Y', end_format: :'%d.%m.%Y', t: 'events.index.print_event')
      params[:start] = l(event.starting_at, format: start_format)
      params[:end] = l(event.ending_at, format: end_format)
      t(t, params)
    end


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
