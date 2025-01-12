#import
from textblob import TextBlob 
import random

#responses for user input that has key words
specificResponses = {
"stress" or "anxious": ["Stress can be very overhwelming. Do you want to tell me more about it?", 
"I'm really sorry you feel that way. Take a deep breath and we can talk about it more.", 
"Stress can be hard to deal with. Tell me more about what's on your mind."],

"happy" or "excited": ["I'm glad you're feeling happy! You deserve to!",
"That's wonderful! Would you like to share more?",
"That's awesome! I'm so excited for you!"],

"sad" or "disappointed": ["I'm really sorry you're going through that. Take your time and let me know how I can help.",
"That sounds really tough to deal with. Do you want to talk through it more?",
"It's completely normal to feel sad sometimes. I'm here to listen if you woulf like to talk about it more",
"I'm sorry to hear that. Remember you're not alone and I'm here for you"],

"depressed": ["I'm so sorry you're feeling this way. Know that there is support available for you",
"I'm here to listen. Sharing your thoughts and feeling might help you."],

"frusterated": ["That sounds annoying. Tell me more about what's making you feel this way",
"I hear you. It's tough to feel like that sometimes. Try to take some deep breaths to clear your mind",
"I'm sorry to head that. Sometimes things don't go the way that we hope. I'm here to support you."],

"bored": ["Feeling bored can be frusterating. What is something you've always wanted to try?",
"Maybe now is a good time to pick up a new hobby or revisit something you enjoy!",
"Sometimes boredom can be an opportunity to recharge. How can I help you feel inspired?"]
}

followUpResponses = {
"yes": ["Great! I'm listening.", "Go on I'm here for you.", "Whenever you're ready I'm here to listen."],

"no": ["I understand, no problem!", "That's okay. Would you like to share anything else?"],
}

#function for bot to generate a response  
def getResponse(userInput):
    greeting = "Hello there, how can I help you today?"
    if "hello" in userInput.lower() or "hi" in userInput.lower():
        return greeting

    for topic, responses in specificResponses.items():
        if topic in userInput.lower():
            return random.choice(responses)

    for topic, responses in followUpResponses.items():
        if topic in userInput.lower():
            return random.choice(responses)

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

#*****************************************************************************************************************

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
    
