## Release files

This is the folder that should be released to students. Students should
generate the `mp4` executable on EWS machines:

```
gcc -g -Wall phrases.o part_b.c -o mp4b
```

They can then proceed to run the debugger on the executable as:

```
gdb --args ./mp4b guessw1 guessw2 guessw3
```

where they guess some passphrases. 

On completing the assignment they should run the executable with the correct
passphrases for their UIN to generate the testdata:

```
./mp4b pass1 pass2 pass3 
```

Finally, they can verify if their submission will succeed using the provided
`runtests` executable. 

```
./runtests 
```
