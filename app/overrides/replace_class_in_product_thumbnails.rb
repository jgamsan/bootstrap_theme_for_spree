Deface::Override.new(:virtual_path => %q{spree/products/_thumbnails},
                     :name => %q{replace_class_in_product_thumbnails},
                     :replace => %q{ul#product-thumbnails},
                     :text => %q{<ul class="thumbnails" data-hook>})

Deface::Override.new(:virtual_path => %q{spree/products/_thumbnails},
                     :name => %q{replace_class_in_li_product_thumbnails},
                     :replace => %q{li.tmb-all},
                     :text => %q{<li class="span1">})
