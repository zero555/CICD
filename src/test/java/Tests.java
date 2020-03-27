import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class Tests {

    @Test
    public void testAdd(){
        CalculatorBean calculatorBean = new CalculatorBean();
        calculatorBean.setParam1(1);
        calculatorBean.setParam2(2);
        calculatorBean.add();
        assertEquals("3",calculatorBean.getResult());
    }

    @Test
    public void testSub(){
        CalculatorBean calculatorBean = new CalculatorBean();
        calculatorBean.setParam1(6);
        calculatorBean.setParam2(1);
        calculatorBean.substract();
        assertEquals("5",calculatorBean.getResult());
    }

    @Test
    public void testMulti(){
        CalculatorBean calculatorBean = new CalculatorBean();
        calculatorBean.setParam1(1);
        calculatorBean.setParam2(2);
        calculatorBean.multiply();
        assertEquals("2",calculatorBean.getResult());
    }

    @Test
    public void testDiv(){
        CalculatorBean calculatorBean = new CalculatorBean();
        calculatorBean.setParam1(1);
        calculatorBean.setParam2(2);
        calculatorBean.divide();
        assertEquals("0.5",calculatorBean.getResult());
    }

}
