#include "anagram.h"
#include <iostream>
#include <fstream>

/***
An AnagramDict constructor. This Constructor takes in a filepath
and then creates a binary tree out of all the words inside the 
binary tree. 

Input: 
std::string filename - the path to the file

Output:
N/A
***/
AnagramDict::AnagramDict(std::string filename) {
    filename_ = filename;
    std::string path = "dictionaries/" + filename_;
    std::ifstream file;
    file.open(path.c_str());
    /**
        Your code goes below here
    **/
	if (file.is_open())
	{ //check if file is open
        	std::string cur_word; //create a temp var that holds the list of words
        	while (getline(file, cur_word)) 
		{ //loop through all the words
            		addWord(cur_word); //add the word to the tree
        	}
   	}
    	file.close(); // close the file

}

/***
An AnagramDict member function. This function sorts the given word in 
lexicographical order

Input: 
std::string word - the word that needs to be sorted

Output:
std::string - the sorted version of the input
***/
std::string AnagramDict::sortWord(std::string word) {
    /**
        Your code goes below here
    **/
	std::sort(word.begin(), word.end()); // Sort letters in word
   	return word;
}

/***
An AnagramDict member function. This function adds a word to the tree.
If the words sorted version already exists in the tree add it to the linked
list of that node. If the sorted word does not exist in the tree create a new
node and insert it into the tree
Duplicated words should not be added to the tree.
Input: 
std::string word - the word that needs to inserted

Output:
N/A
***/
void AnagramDict::addWord(std::string word) {
    /**
        Your code goes below here
    **/

	std::string sorted = sortWord(word); //sort the word to check for anagrams
    	Node<std::string, std::list<std::string> > * anagramNode = tree.find_node(sorted); // find the current node in the tree
    	if (anagramNode == NULL) 
	{
        	std::list<std::string> anagramList; //create a list that will hold the future anagrams of this word
        	anagramList.push_back(word); //add the current word to this list
        	Node<std::string, std::list<std::string> > * anagramNode = new Node<std::string, 		 			std::list<std::string> >(sorted, anagramList); //create a node with the list
        	tree.insert_node(tree.getRoot(), anagramNode); //add the node to the list
    	} 	
	else 
	{
        	std::list<std::string> anagramList = anagramNode->getData(); //get the list that holds the anagrams of the current word
        	if (std::find(anagramList.begin(), anagramList.end(), word) == anagramList.end()) 
		{ //check for dupes
            		anagramList.push_back(word); //add the word to the list
            		anagramNode->setData(anagramList); //reset the list
        	}
    	}
}

/***
An AnagramDict member function. Does a preorder, postorder, or inorder traversal
and then prints out all the anagrams and words.

The output file should be the traversal order of the tree, but only the data on each line. 
View on wiki for more information. 

Input: 
std::string order - The type of order you want to traverse. Can be "pre", "post", "in"

Output:
N/A
***/
void AnagramDict::saveAnagrams(std::string order) {
    std::string path = "output/" + order+"_"+ filename_;
    std::ofstream file;
    file.open(path.c_str());
    if(!file.is_open()) {
        //create new file
        file.open(path.c_str(),std::ios::out);
    }
    /**
        Your code goes below here
    **/
	
	std::list<Node<std::string,std::list<std::string> > > nodeList;
   	if(order == "pre") 
	{ //run each method of searching depending on the order
        	tree.pre_order(tree.getRoot(), nodeList);
    	} 
	else if(order == "in") 
	{
        	tree.in_order(tree.getRoot(), nodeList);
    	} 
	else if (order == "post") 
	{
        	tree.post_order(tree.getRoot(), nodeList);
    	}

    	std::list<Node<std::string, std::list<std::string> > >::iterator it = nodeList.begin();
   	while (it != nodeList.end()) 	
	{
        	Node<std::string, std::list<std::string> > cur_node = * it; //get current node
        	std::list<std::string> anagrams = cur_node.getData(); //get list of anagrams from node
        	std::list<std::string>::iterator itList = anagrams.begin(); //iterator for list of anagrams
        	while (itList != anagrams.end()) 
		{
        		file << *itList << " "; //write the current anagram to the file
        		itList++;
        	}
        	file << std::endl; //write new line character
        	it++;
    	}
    	file.close(); //close the file
}
