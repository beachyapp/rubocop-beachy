module RuboCop
  module Cop
    module Beachy
      class ZeroMethod < Cop
        MSG  = 'Replace with `Fixnum#zero?`.'.freeze
        ZERO = s(:int, 0)

        def on_send(node)
          add_offense(node, :expression, MSG) if offensive?(node)
        end

        def autocorrect(node)
          correction = "#{base_number(node)}.zero?"
          ->(corrector) { corrector.replace(node.loc.expression, correction) }
        end

        private

        def base_number(node)
          receiver, = *node
          receiver.children[0].loc.expression.source
        end

        def offensive?(node)
          _receiver, method, args = *node

          return unless %i[== !=].include?(method)
          return unless args == ZERO

          true
        end
      end
    end
  end
end
