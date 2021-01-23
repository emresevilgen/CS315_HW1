main (){
    var x = "x of main";
    var y = "y of main";

    foo() {
        // print("\nWhile entering foo: " + x + " " + y);
        // Error: Can't declare 'y' because it was already
        // used in this scope.
        print("\nWhile entering foo: " + x);
        x = "x of foo";
        var y = "var y of foo";
        print("In foo: " + x + ", " + y);

        // The order of the functions is changed because 
        // otherwise there is an error:
        // Error: Method not found: 'foo3'.
        foo3() {
            print("\nWhile entering foo3: " + x + ", " + y);
            x = "x of foo3";
            y = "y of foo3";
            print("While exiting foo3: " + x + ", " + y);

        }

        // The order of the functions is changed because 
        // otherwise there is an error:
        // Error: Method not found: 'foo2'.
        foo2() {
            print("\nWhile entering foo2: " + x + ", " + y);
            x = "x of foo2";
            y = "y of foo2";
            print("While exiting foo2: " + x + ", " + y);
            foo3();
        }

        foo1() {
            // print("\nWhile entering foo1: " + x + " " + y);
            // Error: Can't declare 'x' because it was already
            // used in this scope.
            print("\nWhile entering foo1: " + y);
            var x = "x of foo1";
            y = "y of foo1";
            print("In foo1: " + x + ", " + y);

             foo1_1() {
                print("\nWhile entering foo1_1: " + x + ", " + y);
                x = "x of foo1_1";
                y = "y of foo1_1";
                print("While exiting foo1_1: " + x + ", " + y);
            }

            foo1_1();
            print("After foo1_1 in foo1: " + x + ", " + y);

            foo2();
            print("While exiting foo1: " + x + ", " + y);
        }

        foo1();
        print("After foo1 in foo: " + x + ", " + y);
        foo2();
        print("While exiting foo: " + x + ", " + y);
    }

    foo();

    print("\nIn main: " + x + ", " + y);
}