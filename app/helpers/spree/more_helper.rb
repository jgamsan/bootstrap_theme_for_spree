module Spree
  module MoreHelper

    def new_taxons_tree(root_taxon, current_taxon, max_level = 1)
      return '' if max_level < 1 || root_taxon.children.empty?
      root_taxon.children.map do |taxon|
        css_class = (current_taxon && current_taxon.self_and_ancestors.include?(taxon)) ? 'current' : nil
        content_tag :li, :class => css_class do
          link_to(taxon.name, seo_url(taxon)) +
          taxons_tree(taxon, current_taxon, max_level - 1)
        end
      end.join("\n").html_safe
    end

    def new_link_to_cart(text = nil)
      return "" if current_spree_page?(cart_path)

      text = text ? h(text) : t('cart')
      css_class = nil

      if current_order.nil? or current_order.line_items.empty?
        text = "#{text}: (#{t('empty')})"
        css_class = 'empty'
      else
        text = " #{current_order.item_count}" + " item(s) - " + "#{order_subtotal(current_order)}".html_safe
      end

      link_to text, cart_path
    end

  end
end
