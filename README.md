# arm-assembly-bubble-sort
Simple piece of code that fills some of the arm's memory and then proceeds to sort it using the classic bubble sort.

Using the heap base value from the initialization, we can fill that memory with descending 0xFF till 0x00.
Then the big loop is ran until there are no swaps in the previous big loop.
Small loop runs every time with the big loop's offset so there are no useless instructions in the small loop.
