bounce
======

  `bounce` will save and return an active record object. This results in a nice refactor of update and create actions in your controllers when used with`respond_with`.

  Refactor this:

      def create
        article = Article.new(params[:article])
        if article.save
          redirect_to article
        else
          render :new
        end
      end

      def update
        article = Article.find(params[:id])
        if article.update_attributes(params[:article])
          redirect_to article
        else
          render :edit
        end
      end

  Into this:

      respond_to :html

      def create
        article = Article.new(params[:article])
        respond_with article.bounce
      end

      def update
        article = Article.find(params[:id])
        respond_with article.bounce(params[:article])
      end

  If you use Voxdolo's [decent_exposure](https://github.com/voxdolo/decent_exposure) you can do this:

      respond_to :html
      expose(:article)

      def create
        respond_with article.bounce
      end
      alias update create

  If you have more than one controller, I'll bet you do, extract the `respond_to :html` into the application controller. Now this:

      expose(:article)

      def create
        respond_with article.bounce
      end
      alias update create

Install
-------

Add to your Gemfile in Rails:

    gem 'bounce'
