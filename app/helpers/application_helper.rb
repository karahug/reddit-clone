module ApplicationHelper
    def svg(path, type)
        file = File.readlines("#{Rails.root}/public/"+ path)
        file.insert(4, "class='" + type + "'")
        file = file.join("\n")
        return file.html_safe
    end
end
