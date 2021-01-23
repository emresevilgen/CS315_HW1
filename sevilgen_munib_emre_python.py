x = "x of global"
y = "y of global"

def foo():
	# print("While entering foo:", x, y)
	# UnboundLocalError: local variable 'x' 
	# referenced before assignment
	x = "x of foo"
	y = "y of foo"
	print("In foo:", x + ", " + y)
	
	def foo1():
		nonlocal x
		# print("While entering foo1:", x, y)
		# UnboundLocalError: local variable 'y'
		# referenced before assignment
		print("\nWhile entering foo1:", x)
		x = "nonlocal x of foo1"
		y = "y of foo1"
		print("In foo1:", x + ", " + y)

		def foo1_1():
			global y
			# print("While entering foo1_1:", x, y)
			# UnboundLocalError: local variable 'x'
			# referenced before assignment
			print("\nWhile entering foo1_1:", y)
			x = "x of foo1_1"
			y = "global y of foo1_1"
			print("While exiting foo1_1:", x + ", " + y)

		foo1_1()
		print("After foo1_1 in foo1:", x + ", " + y)
		foo2()
		print("While exiting foo1:", x + ", " + y)

	def foo2():
		# print("While entering foo2:", x, y)
		# UnboundLocalError: local variable 'x'
		# referenced before assignment
		x = "x of foo2"
		y = "y of foo2"
		print("\nWhile exiting foo2:", x + ", " + y)
		foo3()
	
	def foo3():
		print("\nIn foo3:", x + ", " + y)

	foo1()
	print("After foo1 in foo:", x + ", " + y)
	foo2()
	print("While exiting foo:", x + ", " + y)

foo()

print("\nIn global:", x + ", " + y)