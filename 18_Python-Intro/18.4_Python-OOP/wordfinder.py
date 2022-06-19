"""Word Finder: finds random words from a dictionary."""
import random

class WordFinder:
    """
    A class used to read a file with words.

    Attributes
    -------------
    file: a file to read

        >>> wf = WordFinder("words.txt")
        235892 words read
    """

    def __init__(self, file):
        self.file = file
        self.word_list = []
        
        return self.read_file()

    def __repr__(self):
        return f"(WordFinder file={self.file})"

    def read_file(self):
        """Class method which reads the file and add the words in the files to the word_list attribute, then returns the number of words read."""

        file = open(self.file, "r")
        self.word_list.clear
        for line in file:
            self.word_list.append(line.strip('\n'))

        return print(f"{len(self.word_list)} words read")
    
    def random(self):
        """Class method returns a random word from the word_list list."""
        
        return random.choice(self.word_list)


class SpecialWordFinder(WordFinder):
    """Same as the WordFinder class, but ignores the blank lines and the lines start with # symbol to make a comment.
    
        >>> sp = SpecialWordFinder("words.txt")
        235892 words read
        235884 words read
    
    """

    def __init__(self, file):
        #this is to access the constructor from the parent class.
        super().__init__(file)
        self.filtered = []
        return self.read_file_only_words()

    def read_file_only_words(self):
        """Reads the file same as the WordFinder's read_file method, but ignores blank lines and the lines start with the # symbol."""

        for line in self.word_list:
            if not line.startswith('#') and line:
                self.filtered.append(line.strip('\n'))
        return print(f"{len(self.filtered)} words read")





        