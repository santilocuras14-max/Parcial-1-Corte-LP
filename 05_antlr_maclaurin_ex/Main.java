import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import java.math.BigDecimal;
import java.math.MathContext;

public class Main {
    public static void main(String[] args) throws Exception {
        if (args.length != 1) {
            System.err.println("Uso: java Main \"maclaurin(n=10, x=1.5);\"");
            System.exit(1);
        }
        CharStream input = CharStreams.fromString(args[0]);
        ExMaclaurinLexer lexer = new ExMaclaurinLexer(input);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        ExMaclaurinParser parser = new ExMaclaurinParser(tokens);
        ExMaclaurinParser.ProgContext tree = parser.prog();

        int n = Integer.parseInt(tree.INT().getText());
        BigDecimal x = new BigDecimal(tree.NUMBER().getText());
        MathContext mc = new MathContext(50);

        BigDecimal sum = BigDecimal.ZERO;
        BigDecimal term = BigDecimal.ONE; // x^0 / 0!
        BigDecimal fact = BigDecimal.ONE; // 0!

        // sum_{k=0}^{n} x^k / k!
        for (int k = 0; k <= n; k++) {
            if (k == 0) {
                term = BigDecimal.ONE;
                fact = BigDecimal.ONE;
            } else {
                fact = fact.multiply(new BigDecimal(k), mc);
                term = term.multiply(x, mc);
            }
            BigDecimal add = term.divide(fact, mc);
            sum = sum.add(add, mc);
        }

        System.out.println(sum);
    }
}
