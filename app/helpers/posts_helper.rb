module PostsHelper

    def new_image_text
        image_url = session[:image_url]
        if image_url
            "![](#{image_url})"
        end
    end
end
