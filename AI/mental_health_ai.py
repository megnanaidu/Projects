#import
from textblob import TextBlob 
import random

#function for bot to generate a response 
def getResponse(userInput):
    greeting = "Hello there, how can I help you today?"
    if "hello" in userInput.lower() or "hi" in userInput.lower():
        return greeting
    
    #create a variety of responses for each scenario 
    veryPositive = ["That's awesome! What else is going on with you?",
    "It seems like you're in a really good place! Can you share more?", 
    "I am so happy for you. Is there anything else that you would like to talk about?"]

    positive = ["Great! Tell me more about it",
    "I'm glad to hear that! Would you like to share more?",
    "That sounds nice! What else is going on?"]

    neutral = ["Thank you for sharing. Is there anything else on your mind?", 
    "I appreciate you for sharing that. Would you like to keep talking about it?",
    "I hear you. Feel free to share anything else you're thinking about it."]

    negative = ["I'm really sorry to hear that. Would you like to share more?",
    "That doesn't sound easy. How are you holding up?",
    "I'm here for you through it. Can you tell me more about how you're feeling?"]

    veryNegative = ["That sounds really tough. Please know that you're not alone and I'm here for you.", 
    "I'm sorry you're feeling this way. Is there anything I can do to support you?",
    "That must be so hard to go through. Please take your time and share whatever you feel comfortable sharing."]

    #select response based on polarity 
    if polarity > 0.5:
        return random.choice(veryPositive)
    elif 0.2 < polarity <= 0.5:
        return random.choice(positive)
    elif -0.2 <= polarity <= 0.2:
        return random.choice(neutral)
    elif -0.5 < polarity < -0.2:
        return random.choice(negative)
    else:
        return random.choice(veryNegative)


#function to get sentiment analysis from user input 
def analyzeSentiment(userInput):
    analysis = TextBlob(userInput)
    return analysis.sentiment.polarity

#code for interaction between user and bot 
print("Hi! I'm Mental Health Bot. Feel free to share your thoughts, or type 'exit' or 'quit' to end the chat.") 
        
while True:
    userInput = input("You: ")

    if "exit" in userInput.lower() or "quit" in userInput:
        print("Mental Health bot: Take care! I'm here for you whenever you need to talk")
        break

    polarity = analyzeSentiment(userInput)
    response = getResponse(userInput)

    print(f"Mental Health Bot: {response}")
    print(f"Sentiment Analysis - Polarity: {polarity:.2f}")
    
