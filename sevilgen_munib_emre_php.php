<html>
<body>
<?php 
$x = "x of global";
$y = "y of global";

function foo() {
    echo "<br>While entering foo: $x, $y<br>";
    $x = "x of foo";
    $y = "y of foo";
    echo "In foo: $x, $y<br>";

    function foo1() {
        echo "<br>While entering foo1: $x, $y<br>";
        $x = "x of foo1";
        global $y;
        $y = "global y of foo1";
        echo "In foo1: $x, $y<br>";

        function foo1_1() {
            echo "<br>While entering foo1_1: $x, $y<br>";
            $x = $GLOBALS['x'];
            $x = "global x of foo1_1";
            $y = "y of foo1_1";
            echo "While exiting foo1_1: $x, $y<br>";
        }

        foo1_1();
        echo "After foo1_1 in foo1: $x, $y<br>";
        foo2();
        echo "While exiting foo1: $x, $y<br>";
    }

    function foo2() {
        echo "<br>While entering foo2: $x, $y<br>";
        $x = "x of foo2";
        $y = "y of foo2";
        echo "While exiting foo2: $x, $y<br>";
        foo3();
    }

    function foo3() {
        echo "<br>While entering foo3: $x, $y<br>";
        $x = "x of foo3";
        $y = "y of foo3";
        echo "While exiting foo3: $x, $y<br>";
    }

    foo1();
    echo "After foo1 in foo: $x, $y<br>";
    foo2();
    echo "While exiting the foo: $x, $y<br>";
}

foo();

echo "<br>In global: $x, $y<br>";
?>
</body> 
</html>