"""Madlibs Stories."""


class Story:
    """Madlibs story.

    To  make a story, pass a list of prompts, and the text
    of the template.

        >>> s = Story(["noun", "verb"],
        ...     "I love to {verb} a good {noun}.")

    To generate text from a story, pass in a dictionary-like thing
    of {prompt: answer, promp:answer):

        >>> ans = {"verb": "eat", "noun": "mango"}
        >>> s.generate(ans)
        'I love to eat a good mango.'
    """

    def __init__(self, code, title, words, text):
        """Create story with words and template text."""

        self.code = code
        self.title = title
        self.prompts = words
        self.template = text
        

    def generate(self, answers):
        """Substitute answers into text."""

        text = self.template

        for (key, val) in answers.items():
            text = text.replace("{" + key + "}", val)

        return text


# Here's a story to get you started


option1 = Story(
    "history",
    "A History Take",
    ["place", "noun", "verb", "adjective", "plural_noun"],
    """Once upon a time in a long-ago {place}, there lived a
       large {adjective} {noun}. It loved to {verb} {plural_noun}."""
)

option2 = Story(
    "work",
    "One Day at Work",
    ["adjective", "noun", "verb", "plural_noun"],
    """My cubicle is {adjective}. I have a {noun} on my desk. One time a coworker tried to {verb} {plural_noun}."""
)

option3 = Story(
    "routine",
    "Morning Routine",
    ["adjective", "noun", "verb", "adverb", "plural_noun"],
    """Every morning, I {verb} with {plural_noun} outside. Because {noun} is {adverb} {adjective}."""
)

stories = {s.code: s for s in [option1, option2, option3]}
