import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class TestMain {

    @Test
    public void test_sum(){
        int result = Main.sum(5,5);
        assertEquals(10, result);
    }

}
