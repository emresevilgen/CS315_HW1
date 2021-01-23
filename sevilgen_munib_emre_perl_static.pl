# $x = "x of global";
$y = "y of global";

sub foo {
    print "\nWhile entering foo: $x, $y\n";
    $x = "x of foo";
    $y = "y of foo";
    print "In foo: $x, $y\n";

    sub foo1 {
        print "\nWhile entering foo1: $x, $y\n";
        $x = "x of foo1";
        my $y = "my y of foo1";
        print "In foo1: $x, $y\n";

        sub foo1_1 {
            print "\nWhile entering foo1_1: $x, $y\n";
            $x = "x of foo1_1";
            $y = "y of foo1_1";
            print "While exiting foo1_1: $x, $y\n";
        }

        foo1_1();
        print "After foo1_1 in foo1: $x, $y\n";
        foo2();
        print "While exiting foo1: $x, $y\n";
    }

    sub foo2 {
        print "\nWhile entering foo2: $x, $y\n";
        $x = "x of foo2";
        $y = "y of foo2";
        print "While exiting foo2: $x, $y\n";
        foo3();
    }

    sub foo3 {
        print "\nWhile entering foo3: $x, $y\n";
        $x = "x of foo3";
        $y = "y of foo3";
        print "While exiting foo3: $x, $y\n";
    }

    foo1();
    print "After foo1 in foo: $x, $y\n";
    foo2();
    print "While exiting the foo: $x, $y\n";
}

foo();

print "\nIn global: $x, $y\n";