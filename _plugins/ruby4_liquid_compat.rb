# Compatibility shim for serving this GitHub Pages/Jekyll 3 site with Ruby 4.
# Liquid 4.0.3 still calls Ruby's removed taint APIs during local rendering.
class Object
  unless method_defined?(:tainted?)
    def tainted?
      false
    end
  end

  unless method_defined?(:untaint)
    def untaint
      self
    end
  end
end
