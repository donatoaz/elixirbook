defmodule Mm.GcdTest do
    use ExUnit.Case, async: false
    use ExCheck
    
    doctest Mm.Gcd
    
    import Mm.Gcd

    test "gcd when second arg is 0 is the other number" do
        assert gcd(1,0) == 1
    end
    
    test "gcd when first arg is 0 is the other number" do
        assert gcd(0,1) == 1
    end
    
    test "gcd when both args are zero is zero" do
        assert gcd(0,0) == 0
    end
    
    property :when_y_is_zero do
        for_all x in such_that( x in int() when x > 0 ) do
            implies x >= 0 do 
                gcd(x,0) == x
            end
        end
    end
    
    property :when_neither_are_zero do
        for_all {x, y} in such_that( {x,y} in {int(), int()} when x >0 and y >0) do
            implies (x >=0 and y >= 0) do
                gcd(x,y) == gcd(y, rem(x,y))
            end
        end
    end
end