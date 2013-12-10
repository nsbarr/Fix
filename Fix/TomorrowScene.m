//
//  YesterdayScene.m
//  Fix
//
//  Created by Nicholas Barr on 11/18/13.
//  Copyright (c) 2013 Nicholas Barr. All rights reserved.
//

#import "TomorrowScene.h"


#import "SpriteMyScene.h"
#import "SpriteViewController.h"
#import "Sentence.h"
#import "WelcomeMenu.h"
#import "AgainMenu.h"
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioServices.h>

@interface TomorrowScene () <SKPhysicsContactDelegate>

@property BOOL contentCreated;


@end

static CGFloat _sentenceheight = 0.00f; //tracks height of sentence so we know whether to affix a word
static int lengthofsentence = 1; //how many words is the sentence? used to generate the right words
static NSString *sentenceSoFar = nil; //tracks the text of the sentence
static BOOL isGameOver = NO; //game is not over
static BOOL didIRun = NO;
static BOOL sentenceTooTall = NO;
static int wordFontSize = 14;
static NSString *previousWord = nil;
static NSString *theCorpus = @"Tomorrow never knows, that's how the story goes. What will be or won't be. That's what the mystery you and me see, that's what sets us free, what sets us apart, what about matters of the heart? What matters, tomorrow matters. Matters and mad hatters. Together or apart, there's so much we can do. So much fun and so we go. Tomorrow will you pick up some bread the pick up lines I said. Tomorrow, Tomorrow, I will love you in the near future. What future may come the mystery of what may come. I may come I may not, the future is uncertain. We will be on a beach we will be together tomorrow. I remember the future. I remember the slap slap of her flip flops and how quickly I learned her walk and how quickly it meant nothing to me I remember the slap you say I gave you and hold over my head tomorrow will it head in the right direction and what direction is right? How many more times will you come. How many more times will you come more times than one. The mistakes we still might make the times you come might be fake. These were my final mistakes, you were someone to blame for not taking chances. Taking matters into my own hands I watched you walk and said stop like you say stop before the times you come. My own hands and the smell that sets them apart. I learned what sets us apart. Forget about her. Forget about the time we spent together. Forget today. Forget yesterday. Forget tomorrow. Remember the way we will touch on the subway. how we will keep in touch after, how your jacket will brush against mine, nothing against you, there's so much we can do. the way. that you. do I. want that. too too. When you get off I get off. We show up at Lorimer at the same time. What time is it at tomorrow. Doug Engelbart: I hope that you'll go along with this rather unusual setting, and the fact that I remain seated when I get introduced, and the fact that I'm going to come to you mostly through this medium here for the rest of the show. I should tell you that I'm backed up by quite a staff of people between here and Menlo Park, where Stanford research is located some thirty miles south of here. If everyone does their job well, it's all go very interesting, I think. [Laughs] The research program that I'm going to describe to you is quickly characterizable by saying: If in your office, you as an intellectual worker, were supplied with a computer display backed up by a computer that was alive for you all day, and was instantly responsible, responsive [laughs], instantly responsive to every action you had, how much value could you derive from that? Well, this basically characterizes what we've been pursuing for many years, and what we we call The Augmented Human Intellect Research Center at Stanford Research Institute. Now, the whole session is going to be devoted to trying to describe and present to you the nature of this program, but unfortunately ... uh .. or fortunately, the products of this program, the technology of it, lends itself well to an interesting way to portray it for you. So, we're going to do our best to show you, rather than tell you about this program. A very essential part of what we have developed technologically is what does come through this display to us. And I'm going to start out without telling you very much about the program, and just run through a little bit of the action that this provides us. So in my office I have a console like this, and there are 12 others that are computer supplies. And we try now-a-days to do our daily work on here. So this characterizes the way I could sit here and look at a clear blank piece of paper, that's the way I start many projects. So with my system, I start and say 'I'd like to load that in.' So, sorry about that. So I'm putting in an entity called a 'statement.' And this is full of other entities called 'words.' If I make some mistakes I can back up a little bit. So I have a statement with some entities, words, and I can do some operations on these and copy a word, and that word might copy after itself. In fact, a pair word I like to copy after itself. And I can just do this a few times, and get a bit of material there. And there are other materials, like 'text.' I can copy from that point to that point. It's copy. So I can get myself some material on my blank piece of paper and say, 'Well, this is going to be more important than it looks, so I'd like to set up a file.' So I tell the machine, 'Output to a file.' And it says, 'Well, I need a name.' I'll give it a name. I'll say it's 'sample file.' And I'll say 'Please output it', and it did! But this next part is about learning HOW when you're faced with having this in your office all day, and by now do in a very exciting sense. How do you put that to work for yourself. How do you organize your files? What kind of things do you do? So, to get going from this let's switch away from the tool down here and talk about some of the general features of the program and get back to the nature of RUC. Let me get back. This is another file. In this file I prepared a chain of views. Using a set of tools I have it all set from one scene to another. I could study them in the fashion I've shown you before but it's sort of fun to set up these chains and it represents to you a way in which we work too. To do it, I'm going to freeze a statement named 'A' and I'm going to put on a certain parameter when I do it. Then I'll jump to a link, here's a link. You want to go to statement A, but after the colon all this garbage tells a bunch of abbreviated ways in which you'd like to control the view when you get there. Any parameters, so I'll go to that one. I'm looking at statement A. So now it's telling me this presentation is devoted to the AHRIC. Ah ha! There's another boo boo I made, I left several statements frozen. This statement, I've asked to be frozen, that was the set up operation. It's just going to stay there above that dotted line as the viewing part of my screen from there down, and comes around in the links I have set up. Ok, the first jump took me to this statement saying, I augmented the human intellect research center which is what HIRSC stands for. A hidden link will take me to the next one, tell me where it's located. In FRI it's an explicated entity that we call a group level. But also I'd like to point out that there's other non-computer work going on at SRI and ours is but one. So if I jump on a link incidently I should just stop and reveal to you that the link is hidden under there. It's very clever to set up the viewing parameters so that it doesn't show the link but when I say 'jump to link' and mark it there the computer goes looking from there on for that link and obeys it. And I'm not showing the statement names either. But this is a statement named P obviously. So that program involves about 17 people together with a special laboratory facilities we have. It's sponsored by government agencies, specifically ARCO, NASA. In the past .... these are the people that first many years ago. It's been a goal and pursuit for many years and I think we can just go off with a quick little picture I sketched to show, this is the staffing over the years from 1950 on and it's had quite a bumpy history. During these years, there was only one of us. [Crowd laughing.] I go back to where I was and say 'let's continue on in this file', that links put me out to a different file to a statement to that view. I just back to this file where I was and within this file I can link to author to say HRIC is pursuing these goals to improve effectiveness within individuals and organizations that work at intellectual tasks. Better solutions, faster solutions, solutions to more complex problems, better use of human capabilities. Really thinking about that. But a corollary goal, besides improving effectiveness, is to develop a system orientated discipline who are designing the means by which creator effectiveness is achieved. That's very important to us. The approach to this should result in a system oriented discipline. Let me just show you how I constructed this file. There's a link hidden here. Back to this view that has slightly different view parameters. Get it out here. All right. There's another one hidden here. The demo approach for us is critical in pursuing this monstrous goal that's monstrously difficult. By building and trying empirically, we're approaching it evolutionary wise because we feel that it's a whole system problem. You need to get a person in that environment working and looking at the many aspects of his working system that are involved in his effectiveness. Plus many more things than just these computerated tools. In a large system like that you need to do it evolutionary wise because we can't be analytic about it enough at any one point to decide what best our next thing should be. We can only decide from here as well as we can analyze it where we can invest our next resources to get the most return at an increase to the effectiveness to the system we have. And this item down here, is the term bootstrapping applied. Applying that to our approach, saying 'We need a research subject group to give them these tools, put them to work and study them and improve them.' We'll do that by making ourselves be the subject group and studying ourselves and making the tools so that they improve our ability to develop and study these kinds of systems and to produce in the end this kind of system discipline. So it's a struggle doing it that way, but it's beginning to pay off. All right. From there. ... tools. In pursuing those goals one of our principle tools is this computer aid system. Let's talk about it as a system. There's a link sequence to jump in there too. We'll talk about MLS in the online system, a very general term. It's been the NLS for many many years, an online system that evolved. Right now we consider it to be primarily an online system or vehicle for helping humans to operate within the domain of complex information structures. Well, what do we mean by operate? Well, suppose study modify is the place we started now. We know there are many things we can do but we want to get around study and modify. To reach further information about 'what does complex structure mean?' we're talking about a complex structure, an emphasizing structure because we say, 'although the content represents your concepts, it's the structural relationship between that content entity that should represent the relationship between the concepts of human thought.' All right we never can do that very well with linear text. So inside the computer we can represent that quite well. In fact, we can represent information structures in a computer that will generally be far too complex for you to study directly. But NRS serves as a tool to roam overlap and navigate through a complex structure to be able to find your way and navigate and move about it rapidly to be able to see what you want to see at any given point. That's how we take NRS as a tool. All right these are all very important concepts to us. These together with the boot strapping tell us where to start. We start by building an instrument that we can sit at and work at during our day to organize the kind of working information that we need as a task force to developing systems. We need to write our specifications, our plans, our programs, our user's guides, our documentation, our reports, and even our proposals. So, we've been using these. Let me return and talk to you about control techniques. Control devices, control dialogue and control metal language that we're using. Ok to talk about control devices, we'll use this overhead camera shot. When you can see the devices that I'm using, I use three and they're not all standard. We have a pointing device called a 'mouse', a standard keyboard and a special piece that we have here. We're trying to go for a picture down in our laboratory in Menlo park and pipe it up that'll show you from another point of view more about how that mouse works. Come in Menlo park ... ok there'sDon Andrew's hand in Menlo Park. And in a second we'll see the screen that he's working and the way the tracking spot moves in conjunction with movements of that mouse. I don't know why we call it a mouse, sometimes I apologize. It started that way and we never did change it. All right, if it moves up or down or sideways so does the tracking spot. And the pencil for it's operation is pretty easy to see, 'Can you turn it over Don?' 'Can you hear me Don? Would you turn it over and we'll see it right?' It's principle is there are two wheels that roll along the surface. Since we have right angles and kind of sharp edges, one will roll and the other will slide in one direction. Each of these wheels control the potentiometer, the voltage output, sample ADD converter, the numbers taken in by the computer, sample times of the horizontal/vertical conforms are to be of where it should put the tracking spot. And as the mouse moves over the surface, then each of those wheels either slide sideways without rolling, or roles an amount that is very close to what people take to predict a component or horizontal or vertical motion it makes. All right, usually you have some close trajectory back to the same point. Usually the tracking spot won't come back exactly the same place as it was on the screen. And for that sense it wouldn't work well if you're trying to trace a map or other figures into that diagram. But the way we use it continuously and conclusively is to watch the screen and to follow it around and to use that device to use that tracking spot. You're eying the tracking spot, and you really don't care whether it follows this exactly or not. In fact, we've had it at times where our tracking device we had to move in an arc like that to make a spot, the tracking spot go in a horizontal line. And people adjusted to it and would go like that to go in a straight line and they wouldn't even know they were doing it. This device over here we always have to justify and explain it. We'll do it in reverse order, we'll explain it first. [Laughs.] It provides for you one hand equivalent of what you can do with a keyboard. There are five keys, and normally each finger sits on a key. And pressing any one key at a time produces a character. And any two keys at a time also. And in fact, any combination of pressing, of which there are 31 combinations. So Don can learn and type them out. So the way I've been going to reach this file, Bill is responsible for the design of all of our hardware, there's an outline he made of the way the controllers work for the IO controlling. Now, from this line to the right, the things we added to a conventional SDS 940 system, and this is a swapping drum it's got two buses. Both accessing to four, 16 banks. The CPU has one bus and the peripheral equivalent has another and the good work of project Jeanie at Berkley on our whole project that evolved 940 time sharing hardware and software, produced a very neat priority system on this bus such that it can say 'I'll defer my access to a given bank until the CPU doesn't want it. 'I'll defer it once or twice, or three times but then I really need it, so give me priority.' So that way this bank can slip in many many access to these while the CPU is hoping from bank to bank in it's successive accesses. We've taken advantage of that to put all of our control out here, a large 96 billion character disk for giving back up storage for ourselves. There are two display systems. Each of which drives six displays and all of which are refreshed out of core. In the input controller which samples the keyboards, the keycepts, the mic of each session about 15 times a second and our printer and the network coupling here all fit into that same priority basis. So they can all be working full built, and we find we get very low interference in CPU cycles being interrupted or interfered with something like the ratio, maybe one to one and a half percent here that it can't get when it wants to. This may be running fifty, sixty, seventy percent of the available memory cycles that it can handle. All right? The control is stuck at intercore without ever interfering with the CPUs' process or interrupting the time sharing system if there's something no one says 'hey take care of this user.' And the display system reads out a core from a pre-structure like sort of links to cycle itself automatically and take all of that material, output it to a display something like 15 times a second, without any interference from CPU requirements. All right? Let me talk to you about the display systems, the other aspect of the things that loop holes on here. It's slightly unusual. All right. For that I would like to switch to Menlo Park and get a view from the camera there, an actual look at the hardware. So these are the units that develop the displays. The computer constructs it right on a small high resolution CRT which we're focusing in on right now and in fact that's the CRT whose camera on the right we're looking at is generating the text view that's being piped down here on my console. So those are faded in and out between the two so you can just sort of compare them. So that's very nice. There's my mouse moving around in Menlo Park, my tracking spot. So our displays work with those being watched by commercial cameras, look at my black book [laughs.] Commercial TV cameras, 8759 scanning rate is a fairly high resolution. Look at that, from there on out to the display station, the standard video microwave system. And if we back up the camera shot a bit, we'll see that we have a whole rack full of equipment here serving twelve of them which you notice, quite a lack of cameras mounted on. We seem to have stolen them all for the show [laughs.] So we only have seven consoles that work right now because the cameras are mounted to give you different special views. A few advantages. We use this particular display system hardware technique pretty much as an expediency for an experimental system we have available. We originally were going to build stories to display in here but we couldn't get that delivered a year and a half ago when we had to firm up our design. So we, as an expediency went to this brand we've been developing very nice video stuff. They were kind enough to show us all these controllers and work with video. So we went with a very simple brute force way of having video signals generated by having a small CRT. Well it turns out that that little CRT and it's incremental cost, the video camera, the controller, and a monitor totaled about fifty five hundred dollars which is cheaper than most fairly good resolution deflection display and monitors so it came out well in the price of the hardware. Turns out also that the cathode of a camera tube and uh ... just black and white usage like this can back off the scanning current of it so that the sticky capsule, so that it doesn't erase the image on it by each sweep. It can take 3 or 4 scans. So with something like a 15 cycle a second on the CRT's the camera, the one that's generating this as well as the one that we looked at a few minutes ago have short term stories in there. It's quite different from long persistence but gives us the flicker free display here and the flicker free display there. This lets us use that display generation hardware for three to four times as many display stations as otherwise. You'll notice if we get just the text alone that there's a small effect in smearing but it's not that bad. And that comes from the memory in the ... ok so much for that. I'd like now to Jeff Willison from Menlo Park he's sitting at his console working independently. Hi Jeff! Jeff: oh? Doug: We're not hearing you very well. Jeff: Oh you're not hearing me? How about now? Doug: That's fine. Jeff: ok Doug: All right. I'm sorry you can't see everyone here, but I can't very well either because of the lights, so we're about even. [Laughs] Jeff: Ok Doug: um ... I'd like you to talk to them about the learning of special languages that help in making flexible design and study available for us in the user features and functions and repertoire of the commands as well as the control dial out for them. Then also, it would be an interesting example here because programers, you programmers are the ones who most intensely found use for working online as we're building up. Show them how you structured your system type. Ok? Jeff: Ok. I think we can do that. You can get sort of a good feeling for the way the whole system is put together by looking through the system guide. The file is one that programmers put together to help them get around. NLS is a fairly large program. It's not huge by a lot of standards but it's getting pretty big. This picture in our system type file is a picture of the overlay structure. Our overlays are page type so they're not too bigger than 940 but each label in this picture names the code file. And each one is oh ... three to twenty pages long, twenty text pages if you printed them out. Just to sort of show how you use a file like this, move around in this code, and also how the code is put together, each label in the picture is the name of an overlay which is also the name of that file. But it also happens to be the name of a statement in this file. By collecting one of these pictures and moving there, oh I was going to do something for you to let you see better ... um ... what did I do? Go back to the origin and start again. Doug: Go back to all the parameters. Jeff: There! Now let me move up. Uh ... from the picture I can move to a little section in this file which is nothing much interesting here. A little bit about the documentation in the patch page and such. From this spot I can actually move out to 'file.' Suppose that I were going out in that control metal language that Doug was talking about. Just to see for example, the routines in 'delete word' or 'move word.' Let's look at the 'move word' construct. Let's select this link, and here is the file. This file is written in one of these many special languages that we designed. I just move down through it, find the 'move' command. Uh ... move ... let's put here for 'move word' Doug: Do you want to point out how you know it's 'move word?' Jeff: No, I was just gonna look at that Doug. Uh ... as I was sifting down through that I was sort of not only moving through the file but the structure of the code is made in such a way that is a description of a finite state machine. And so I was following the characters a person would type to execute that command. Down here underneath it I see that the routine is QMW over in the overlay text edit. So let's go back to that other file, move back to our picture again and find where overlay text edit is. So right down here, we'll move down through that one. The text edit overlay illustrates a lot of the different kinds of things that we've done. This file has two major kinds of code in it. First one is many of the these special languages that we've built up. See I'm trying to find 'QMW.' That's right. Uh ... down here someplace. There we go! Uh .. let's see. The two kinds of code. Let's just see the type from the other file. The QMW routine, the first ... the second routine it called is 'move word', the word delimiter, I'm sorry. This routine is written in our content analysis language. And uh ... it takes a text string and finds the definition of a word. Its a file for punctuation and it finds any special points around it. It finds pointers that describe that word. Another interesting one is the 'next' routine here, look at it. It's in another special language that we built up. It takes the pointers left over from the delimiter routine and the text in the file and reconstructs the statement after the edit's been done. Let's see ... where was I in this file? Uh ... another portion of the file is written in a language we call MOL. That stands for machine oriented language. The MOL is a, in a sense it's a high level language in that it has structure and control constructs like in this statement and in all statements. It's also very very close to machine language, 940 machine language. People talk about the actual registers of the machine and you talk about doing indirect addressing. This language has helped us write the type of fast type code that we want, that we have to have to operate this time sharing system. At the same time, it's given us a lot of flexibility. Uh ... it's also the very structure of the MOL designed to sort of mesh with the log structure of NOL NLS. We have a 'while' statement to see what's in that 'while' statement I can move down to see it's statement, which is an 'if' statement. The 'if' statement is a single 'if' statement that has an 'if' and an 'else' part. That whole block opens up all of that. So by using the MOL I'm able to move around very quickly in my MOL files. Also able to sort of zoom in and out of things. One of the ... besides the program organizational benefits we get from designing all of the special purpose languages, we've been able to design the syntax of these languages so that they fit with our linking structure and the conventions we've set up and the aid we built to help us and then they move around between them. One of the ways we've managed to implement all of these languages is by designing a compiler compiler which we call TREMETTA. All of our compilers are written in Tremetta. I'd like to add that we're very thankful to some people at the development corporation for helping us get started on a lot of the notions on Tremetta, Erwin Book and Val Shorey [sp?] it's invaluable for helping us get started. By having all of our compilers written in a high level languages themselves, we've been able to change them all the time. We're finally able to quickly modify the syntax of the control language for analysis itself with the meanings of the commands by working in a high level language. We're also able to pull in and just change the compilers as quickly as we have to, to accommodate all sorts of new hardware features and extremiting that we do like that. More notes that programmers leave around about ? things that are wrong with our system right now. I've got my blank line off, how did I? Anyway, one of the interesting things that NLS does, just an advantage of being online is that it keeps track of who you are and what you're doing all the time. So on these statements, uh ... on everything, every statement that you write it keeps track of who you are and when you did it. So not only can people leave notes around for each other but it's sort of automated aid here that tells us who did it and when they did it. I can set up search patterns. I think these will probably be talked about later. So that sort of summarizes what the thing looks like and how it's put together. Doug: How about going back to that place in the control metal language where you start down the dialogue personal protocol in personal views. Jeff: Ok. Right over here in main control? Doug: Yeah. And off to another file, we're looking at real code now. And there's a branch of it down there ... Jeff: Yeah ... these top branches are all sub-routines that are pretty meaningless. This 'WT' means 'what state', and it's what's the person going to ask for. Doug: Open that one level down now. Right. Now all those things in parentheses. The NLS are the names of those statements are actually in the programming language at work here. The way it's identified, that's the character a user hits. If he hits a 'D' for instance ... Jeff: A 'D' for 'delay' Doug: If you hit the 'D' that line tells you what the response is supposed to be that the computer is supposed to display certain material on top of the screen. Then it's supposed to wait until the user does the next thing. Jeff: Ah! Doug:Why don't you trim it to one line? Jeff: I can do that. That's all that branch Doug: The DDT Jeff: well, ok. Doug: [laughs] I don't want to insult you by saying it's easy to get a new view [laughs.] Down there say 'All right, to set up D', and it sets up what it says there. You go up one level below it and that's the next block down in this special language. And you see the fact that the 'D' if he hit something else like a 'W' it goes on from there to say what it is the computer is supposed to do in response. So this language here in it's hierarchical structure resembling the branching tree of choices you the user makes specifying at every point what the computer does in feedback and the optional choices. And down in the end in specifying the actual function like deleting a word, what's a word? And what do you mean by 'delete'? And for what the word is specified in the subroutine he showed you, in a special language to find in there what a word is. And it doesn't take a lot of programing skills to learn how to read these languages because they're at the concept level almost where the user wants to work. And so for us in our experimental environment, our users are beginning to learn this so that we can look at that to find out how the system works and not someone's English text translation on specific ? Well, Jeff, you did a great presentation, especially the last part. User documentation is a straight forward sort of view. If you were a user here and came and sat down early you would want to get familiar with this file. Let's go look. This passage was written in user's guide. So down the hall Dave Kasserser's [sp?] office in his drawer, pulling out the file, we go and there you see it. The top view with the outline. But I'm interested in showing you very quickly, you want to find out the definitions of a bunch of terms. A glossary. Well let's do the thing called 'freeze a statement' and say 'put that at the top', and lo and behold that statement will be frozen and our display scanning windows from the dotted line down. And then we know about names and something to name. So we can say something like, 'What's a bug?' Well, down here it tells you what a bug is. 'I see.' Well, let's see ... Uh ... 'What's a level?' Select level. Tells you what level is. 'What's a mouse?' That's fun to look at. There's a mouse. You can just point. So you can just sit here and point to successive terms and it goes there. The scanning window goes there. The frozen glossary stays and you can see the definitions. Very nice. In some of the definitions you can recognize terms here. That's an odd one. Maybe that's a name? Let's just see. Oh, sure enough, it's a sketch showing the mouse and the mouse button. Very nice to have documentation like this and you as a user could sit down and early find your way in this to find the definitions, descriptions and procedures for commands like that. So let me go back to my guide and say 'you want to study and modify papers.' All right, it happens that we wrote a paper for these proceedings. It's in the files. There it is, top level. See, it's interesting to study something like that. What does that have to say about user systems? Go to there and open up a level. I only want to see that branch. Oh, what about 'file study?' Open that up. Oh, 'specifications of former view', what about that? Let's just open it all, now I can read it. Gee, that's an interesting way to study. [Chuckles.] This material is organized for printing, print it out. It's from this file directly we print it out. Printed it out on the form, sent to the printers. And these things up in here, these three letters and equals are special directory embedded in our text so that the output process puts in things like headers. Like this says 'make the headers in every page be DC Engelbart abstract.' That's the prescribed form. The number between lines double spaced, but all these others have characteristics to get right justification page numbers, all kinds of control on them. All right, so much for paper writing. Joint file usage is something that is very powerful here. I went up to a file that we were working on as we were getting ready in the early part of this presentation. It was a message, something that three of us used a lot between us to coordinate the planning and path, contingency plan, special needs for ball joint [sp?] We developed a message technique, so we could leave messages for each other. Under there, usage conventions, and let me just tell you about that. Underneath here the direct messages to each other we can unfold and see. Many times you didn't want direct messages as much as you just like to go through and leave a message for somebody. So we worked off the conventions. Here's an example [chuckles.] The convention we're going to use is that we would send a message to WK BCE [sp?] message I would put that in the file. WKE and BCE with a pound sign in between. So any statement that's marked like that means there's a message to him from me. If I want to, I can say it's also for Dave Evans, like that. So that's from me to both of them. We have this thing we call a constant panel [sp?] as Jeff mentioned briefly, in which we can write expressions in a language. Let's just come down here and look .... It's a little expression in a special language that means I'm going to look for 'Mr. XXX' a message from him. All right what if I say I want that XXX to be DCE? Someplace in there I want to find a pound sign and DCE. So we have a little compiler and say from there 'compile it.' It comes back and says 'I did it ok', and now I can say 'All Right, only show me the statements that passed the test', that's someplace may have that string. There they are. Everyone of those are from DCE, DCE. Go down there and look for it. This here. Then I can say, 'Well, turn off that filter', how about 'for so and so?' So I can say, 'All Right, this is for WKE', this is a message for Bill. The rest of this pattern here says it has to be followed by any number of commas and the other triplets but eventually by a pound sign, or it doesn't go. Let's compile that and see. Ok, passed the test. There's the WKE and WKE and WKE for him. And a dummy. You'll notice that many times that I'm doing something, I use this ? to point directly. It so happens we have a feature called 'marker' such that any place in a given file I can place a marker on a character and give it up to a three letter name. And at any time in any command where it's appropriate to point and push this right hand button to say 'select' I can hold a button down and enter that name and let the button up. And instead of it taking the character I'm pointing at with this bug, ? it takes the character that I had named. I put that marker on a name. So off someplace I've got markers on patterns already set up for an OTD, open house Tuesday evening, and such. So I can say 'execute compiler from here'and I can type in 'open house Wednesday afternoon', OWA, and say 'execute it.' It says, 'I did.' Well, ok let's see what you've got. Open house Wednesday afternoon, these are the people that are going to be there. Oh, 'what about open house Tuesday evening?' OTE. 'Execute.' Open house Tuesday evening. So, these kinds of pattern matchers and markers and freezing statements and jumping on things give us a great deal of power jumping around and moving something around and studying. [Chuckles.] I think I'll skip the rest of these because time is crowding us and I'd like to go in a little sequence here that is really a very important one. You see, most of the way this serves as a very powerful tool for an individual to work when he's studying, doing his planning, designing, debugging, documenting. But we also saw that a medium of leaving messages for each other and filtering them, that people can collaborate quite well over a period of time by working on joint files. In fact, you can have a joint file, and leave a message and get a response in a matter of minutes because they're all available instantly by anybody from one of these terminals. But there's another degree of collaboration which is very important in which we're just going to be setting up in the next few months the hardware to do computer aid. But here we're going to set it up with a little bit of people aid too. So I'm going to establish a collaborative mode between me and another terminal. Bill Paxton's got a terminal back at SRI. And the first thing I do to do that of course would be to say 'Hey, I'm going to call this command.' We have to go into the executive mode and set specialty to executive level. Woops ... And then continue with NLS [sp?] [Chuckles.] So a free demonstration with versatility ??? All right, special command. I'd like to link with Bill and uh, I don't know what his terminal is right now. So I have to ask someone to connect me to him audibly. So Bill, will you come in through this intercom? Bill: ??? Doug: All right. I need to know what terminal you're on Bill. Bill: Thirteen Doug: I'd like to have him see my text. And so this special thing, if I label thirteen will switch, switch over so that on his display he sees my text. So I'll execute it and sure enough it does. But what's that laying around? Well, if he's looking at my text he'd like to have something to say about it. So we put on a marker, a tracking spot, that he controls. So he's sitting and looking at the specs. And he can point to it. But we carefully reserved for me to write to control and operate on this. So my bug is more powerful than yours. [Audience laughing ] But we can have an argument [chuckles] that's what we call a bug fight. So, all right ... so in case you haven't been listening Bill, we've been going through lots of examples and setting up a collaboration here so that we can go on into information retrieval. And we set up audio coupling and we're both looking at the same display, and that'd be very handy to work. We can talk to each other and point and maybe later I can hand you the chalk on this black board. Like saying, 'Hey you control it.' But let's stay this mode here and add another feature, that hardware wise is available to the kind of display we have. I'd like to see you while I'm working on it. So, before I can do that, I have a set up my display in a certain way. I put it up so that I see it over like that. It leaves a corner up there and I say, 'Now computer, do the automatic switching that'll bring a camera picture from the camera mounted on his console, such as the camera mounted on mine is.' Hi Bill! That's great. Now we're connected. Audio. You can see my work, you can point at it, and I can see your face and we can talk. So let's do some collaborating. Bill: Key words in associative reordering. I'm in use of terms from a specified vocabulary to describe what it is that you're after. Perhaps the best way to show this would be just to draw a little picture. A key word can be selected from a list. We'll put the list over here. You can have any number of key words. I'll just put down CAT to see where it is. oops. I spelled that one wrong. Doug: You need any help? Bill: Yeah, how do you spell 'catalog'? There it is. Is that close enough? There'll be several items in the catalog. What we want to do with them is select things out of this catalog. Doug: What do the 'R's' stand for? Bill: Those are the numbers used just like serial numbers. That's the Dewey decimal system. [Laughs] Doug: Oh. You mean reference 3, reference N? Bill: All right. And then the 'K' I guess needs to be a K word. Doug: That's fine Bill: The key word will point to various items in the catalog. So the first key word, we point to those and the NP word will point to other ones. And there will be cases where they both point to the same one. If I select a key word, I'm specifying that all of the items in the catalogue get referred to will be pulled out, given to me. And in the cases where I've selected several key words that refer to one particular item, that item will be given special preference and will be put at the head of the list. And with that list of items from the catalogue, I'll be able to use the other forms of retrieval and jump off and look at the items. And then I can continue the exploration. So now I'm able to select the key words that I want to use to describe what I'm interested in. I can do that just by pointing at it. And it writes the word up here. And another 'accept' to accept it. I can hit 'file control' and I've already accepted file referencing. I'm able to [background noise: 'hello'] we're still on? Doug: Yes, we hear you. Bill: Somebody hung up on us. Doug: [laughing.] How do you say 'go ahead' with the mouse? Bill: We're on? [Audience laughing] So I selected several key words here. I can go ahead and give particular key words greater weight. The weighting refers to how important that key word is in describing what I'm after. So I can give this one a weight of two, whereas this one previously will just have a weight of one. That means that the item being referred to by this key word, earlier in the selection when we're finished. Let's go ahead now and say 'key word execute' and this'll go off and get the items out of the catalogue and re-order them. And here we have the results. Now I have, I can use these to jump to various places in the file. I'm still in the systems file. The item here is the name of the utility. So I can jump and get the information about that utility in the file. Doug: Well ... [interrupting] Bill: And find out various things about it. Doug: Can you hear me? Bill: Go back to the previous view. And now if I want to go off and get the previous information, I link on this and here I have the documentation on that procedure. After looking at that I can go back again and now I'm set up again to go and continue looking. I can look at the next item and here I've got the results on hand. So I can continue to proceed in this way looking at the various documentation and going back and continue to explore, re-specify the search parameters and look at new key words. Well Doug, I don't know if you survived through that? We had the operator, the telephone company hung up on us I think half way through, you still back on? Doug: I guess we better come back. I'm sorry I can't say goodbye to Bill. Bill: I can hear you now! [Audience laughing] Doug: Oh! Bill: You been talking all this time? [Audience laughing] Doug: I saw when you leaned over and hung up the phone for awhile so I couldn't interrupt you. [Chuckles.] Well I'm sorry we're pushed when we're trying to describe each of the features in this system. This particular one, the key word is very powerful and could very well warrant a whole session, a whole paper on itself because this is the power of key word descriptor organization. But with the added feature of giving weight to the key word so the results of the search as you see right here are ordered so that this one ended up needed the most requirements, and most weight and down here could be one that only was associated with one of the descriptors in the lowest weight one at that. So you have an ordered list that's probably relevant. Then right where it says 'all links' you use that as a link to go off to the file to find it. This is a directory of the set of procedures. So this ... here's a list of procedures for those key words he chose that all describe certain things about file handling and this will take you off into the actual source code. If I go now, he's wrote them all. Bill: [laughs] Doug: Here are his files. The name of the place in his files, and the view that you should open up so that when you follow this on a jump to link you just see a single overall view of that procedure. And then as he pointed out, instead of saying 'jump to link' you jump to a name in this file where these things have descriptive material about that too. So, I think for the software guy it's very powerful and thanks very much Bill. All right. The other few things we're going to talk about very quickly are the range of activities underneath in our program. I will just go very quickly through these then. A service system development and user system development we'll talk about those a bit, only requires me to establish a distinction between those two kinds of system. We've taken to splitting the overall computer system into this dichotomy of these two systems. The service system is what appears at the terminal when I push this button, I get that response, when I do this I get that. That's the repertoire of commands in the services [chuckles] and organization of software and hardware and sometimes people give to me. The user system is what's beyond that. Give that, what can I do with it? What kind of conventions for leaving messages is for using the content analyzer and for organizing our files and how do we use the links and the key word thing? User system. And this is kind of a new element in systems research that we're trying to establish and we can integrate that kind of user system where the people's methods, the concepts they use, the procedures, the skills all are developed in the coordination with the kind of tools that they have. Within our ???? we also have an explicit activity they call management system where we're taking some project money and developing our own set of management tools to help us manage 17 people and all these diverse activities in this complex system. And so we are beginning to develop some of those, and we'd be happy to talk to you about those in our open house. A forthcoming involvement is this ???? computer network. Experimental network that's going to come and end up being in it's first form in about a year and end up in some time later with some 20 experimental computers in a network. And I hope they'll be able to transmit across the country. The bandwidth is something like 20 kilohertz per second. Delay times of less than a tenth of a second. It should be enough so that I could be running a system in Cambridge over the network and getting the same kind of response on a CRT. And it may be that the people there, the next time we have a conference in Boston, I'll try this from there. Within that network we're going to try to develop a special service to provide network information, relevant network information for people, for the kind of information it takes to operate such a network. Who's got what services for protocol? How do I get there? Who's up today? How much do I use the user's guide? Where can I find the paper that describes this system that so and so offers? That's going to be very challenging for us to utilize our tools for organizing and retrieving information. The last thing here is just a little comment. After all of this what's the product that we're providing in this research? Well, we're providing a sample augmentation system, the one we use. Not only that it's an augmentation system, but it's provided to augment computer system development. And beyond that, we also hope that we're developing quite a few design principles for developing augmentation systems and these I hope are transferable things. I'd like to close and give you a description of the support we've gotten from the different people that produced this and acknowledge that. And uh .. back in Menlo Park we've got quite a team of people surrounded by quite a bit of equipment that have been busy listening to us and try to control and switch and these monitors here where all of the displays went, the cameras went, the displays go here. So they can monitor and switch and send us what one we want. All right, and I particularly want to give appreciation to the Bill Ingrich [sp?] who has not only designed all the hardware and been responsible for the hardware and software development that gives us our services over these years. In the last few months put together the considerable intercoms and video switching and controls and sensors. They've borrowed and stolen to provide for this show to make it come on tonight. The supporting staff";

//physics body masks
static const uint32_t rainCategory       =  0x1 << 0;
static const uint32_t heroCategory       =  0x1 << 1;


@implementation TomorrowScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        isGameOver = NO;
        didIRun = NO;
        lengthofsentence = 1;
        sentenceTooTall = NO;
    }
    return self;
}

- (void)didMoveToView: (SKView *) view
{
    if (!self.contentCreated)
    {
        [self createSceneContents];
        self.contentCreated = YES;
        
    }
    self.physicsWorld.gravity = CGVectorMake(0.0,0.0);
    self.physicsWorld.contactDelegate = self;
    UIColor *deep = [UIColor colorWithRed:11.0/255 green:17.0/255 blue:26.0/255 alpha:1];
    self.backgroundColor = deep;
}


-(SKSpriteNode *)hero {
    
    SKSpriteNode *testNode = [[SKSpriteNode alloc] init];//parent
    SKLabelNode *hello = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
    testNode.name= @"hero";
    hello.fontSize = wordFontSize;
    hello.text = @"Tomorrow";
    previousWord = hello.text;
    hello.text = [hello.text.capitalizedString stringByAppendingString:@" "];
    [testNode addChild:hello];
    testNode.zRotation=M_PI/2;
    testNode.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:hello.frame.size];
    testNode.physicsBody.dynamic = NO;
    testNode.physicsBody.categoryBitMask = heroCategory;
    testNode.physicsBody.contactTestBitMask = rainCategory | heroCategory;
    testNode.physicsBody.collisionBitMask = 0;
    testNode.position = CGPointMake(CGRectGetMidX(self.frame),
                                    45);
    _sentenceheight = hello.frame.size.width/2;
    
    sentenceSoFar=hello.text;
    return testNode;
}




static inline CGFloat skRandf() {
    return rand() / (CGFloat) RAND_MAX;
}

static inline CGFloat skRand(CGFloat low, CGFloat high) {
    return skRandf() * (high - low) + low;
}

static inline CGFloat rndValue(CGFloat low, CGFloat high) {
    return skRandf() * (high - low) + low;
}

static inline NSUInteger rndInt(NSUInteger low, NSUInteger high) {
    return skRandf() * (high - low) + low;
}




- (void)addWord
{
    NSArray *sourceText = [theCorpus componentsSeparatedByString:@" "];
    
    if (previousWord == nil){
        NSLog(@"loadedtooearly");
    }
    
    NSLog(@"the previous word is %@", previousWord);
    NSMutableArray *possibleWords = [[NSMutableArray alloc]init];
    
    int i;
    for (i = 0; i < [sourceText count]; i++) {
        
        NSInteger indexOfTheNextWordCandidate = i+1;
        NSString *string = [sourceText objectAtIndex:i];
        if ([string isEqualToString:previousWord])
        {
            NSString *nextWordCandidate = sourceText[indexOfTheNextWordCandidate];
            [possibleWords addObject:nextWordCandidate];
        }
        
        
    }
    NSUInteger randomIndex = arc4random() % [possibleWords count];
    NSString *nextWord = [possibleWords objectAtIndex:randomIndex];
    
    SKSpriteNode *parentNode = [[SKSpriteNode alloc] init];
    SKLabelNode *hello = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
    hello.text = nextWord;
    
    [parentNode addChild: hello];
    
    
    hello.name = hello.text;
    hello.fontSize = wordFontSize;
    
    parentNode.name = @"rain";
    parentNode.position = CGPointMake(skRand(0, self.size.width), self.size.height+100);
    parentNode.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(hello.frame.size.width+10,hello.frame.size.height)];
    parentNode.physicsBody.usesPreciseCollisionDetection = YES;
    parentNode.physicsBody.dynamic = YES;
    parentNode.physicsBody.categoryBitMask = rainCategory;
    parentNode.physicsBody.contactTestBitMask = heroCategory | rainCategory;
    parentNode.physicsBody.collisionBitMask = heroCategory | rainCategory;
    parentNode.zRotation = M_PI/rndValue(1.8,2.2);
    
    SKAction *fall = [SKAction moveTo:CGPointMake(parentNode.position.x,-20) duration:4];
    
    [parentNode runAction: fall];
    [self addChild: parentNode];
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if (isGameOver) {
        //don't respond to touch
    }
    
    else {
        SKNode *hello = [self childNodeWithName:@"hero"];
        UITouch *touch = [touches anyObject];
        CGPoint pointToMove = [touch locationInNode: self];
        CGFloat xlocation = pointToMove.x;
        float speed = 400;
        float distance = ABS(xlocation - hello.position.x)/1.0;
        float time = distance/speed;
        
        [self enumerateChildNodesWithName:@"hero" usingBlock:^(SKNode *node, BOOL *stop) {
            
            SKAction *teleport = [SKAction sequence:@[
                                                      [SKAction waitForDuration:0],
                                                   [SKAction moveToX:xlocation duration:time]]];
            [node runAction: [SKAction repeatAction: teleport count:(1)]];
            
        }];
    }
}

- (void)touchesEnded:(NSSet *) touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    if (isGameOver) {
       //don't respond to touch
    }
    else {

       SKNode *hello = [self childNodeWithName:@"hero"];
    CGPoint pointToMove = [touch locationInNode: self];

       CGFloat xlocation = pointToMove.x;
       float speed = 1000;
       float distance = ABS(xlocation - hello.position.x)/1.0;
       float time = distance/speed;

        [self enumerateChildNodesWithName:@"hero" usingBlock:^(SKNode *node, BOOL *stop) {

           SKAction *teleport = [SKAction sequence:@[
                                                     [SKAction waitForDuration:0],
                                                      [SKAction moveToX:xlocation duration:time]]];
           [node runAction: [SKAction repeatAction: teleport count:(1)]];
            
        }];
    }
}

- (void)touchesBegan:(NSSet *) touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];

    
    NSArray *nodes = [self nodesAtPoint:[touch locationInNode:self]];
    _spriteViewController = self.view.window.rootViewController;
    
    
    //Behavior for our Tweet and Again buttons, that only appear when the game is over
    
    for (SKNode *node in nodes) {
        if ([node.name isEqualToString:@"OpenTweet"]) {
            NSLog(@"button was tapped");
            if (!_spriteViewController){
                NSLog(@"No sprite view controller :(");
            }
            
            [_spriteViewController showTweetButton];
            
            
        }
        else if ([node.name isEqualToString:@"NewGame"]) {
            
            SKScene *spaceshipScene  = [[AgainMenu alloc] initWithSize:self.size];
            SKView * skView = (SKView *)_spriteViewController.view;
            [skView presentScene:spaceshipScene];
            
        }
    }
    
    
}

- (void)didBeginContact:(SKPhysicsContact *)contact {
    
    NSLog(@"contact!");
    SKPhysicsBody *firstBody, *secondBody;
    //update sentence height
    
    //Establishes the firstBody as the falling word.
    
    
    
    if (contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask)
    {
        firstBody = contact.bodyA;
        secondBody = contact.bodyB;
    }
    else
    {
        firstBody = contact.bodyB;
        secondBody = contact.bodyA;
    }
    
    //theNode is the SKLabelNode, firstBody.node is its parent, hero is the root word
    SKNode *parentNode = firstBody.node;
    NSArray *arrayOfChildren = firstBody.node.children;
    SKLabelNode *labelNode = arrayOfChildren[0];
    
    
    if (contact.contactPoint.y > _sentenceheight){
        NSLog(@"high as hell");
        
        _sentenceheight = contact.contactPoint.y;
        
        [parentNode removeAllActions];
        
        //try to do some stuff to make it stay put and not register more contacts
        firstBody.node.physicsBody.categoryBitMask = heroCategory;
        firstBody.node.physicsBody.contactTestBitMask = rainCategory;
        
        
        //append the label to the sentence (tracking for Twitter)
        NSString *wordToAppend = [labelNode.name stringByAppendingString:@" "];
        sentenceSoFar = [sentenceSoFar stringByAppendingString:wordToAppend];
        NSLog(@"%@",sentenceSoFar);
        
        
        previousWord = labelNode.name;
        
        //now look at what kind of item it is. If it's a mirror, then invert the words.
        if ([labelNode.name  isEqual: @"mirror"]){
            
            SKAction *mirror = [SKAction sequence: @[
                                                     [SKAction scaleXTo:-1 y:1 duration:.3],
                                                     [SKAction waitForDuration:3.0 withRange:0.25],
                                                     [SKAction scaleXTo: 1 y:1 duration:.3]
                                                     ]];
            NSArray *nodes = self.children;
            for (SKNode *node in nodes) {
                [node runAction: mirror];
            }
        }
        
        if ([labelNode.name  isEqual: @"love"]){
            UIColor *red = [UIColor redColor];
            UIColor *white = [UIColor whiteColor];
            SKAction *turnRed = [SKAction sequence: @[
                                                      [SKAction scaleBy:.8 duration:.15],
                                                      [SKAction scaleBy:1.75 duration:.3],
                                                      [SKAction scaleBy:.714285714 duration:.5],
                                                      [SKAction waitForDuration:0.15],
                                                      
                                                      
                                                      // [SKAction scaleBy: -1.5 duration: 1],
                                                      ]];
            labelNode.fontColor = red;
            [labelNode runAction: [SKAction repeatAction:turnRed count:3] completion:^{
                labelNode.fontColor = white;
            }];
            
            [self enumerateChildNodesWithName:@"hero" usingBlock:^(SKNode *node, BOOL *stop) {
                SKLabelNode *theLabel = node.children[0];
                theLabel.fontColor = red;
                [theLabel runAction: [SKAction repeatAction:turnRed count:3] completion:^{
                    theLabel.fontColor = white;
                }];
            }];
            
            
            
        }
        
        
        
        //if it has a ".", end the game.
        if ([labelNode.name isEqual:@"."] || [labelNode.name isEqual:@"?"] || [labelNode.name isEqual:@"!"] ) {
            isGameOver = YES;
            
        }
        
        if ([labelNode.name rangeOfString:@"."].location == NSNotFound){
            isGameOver = NO;
        }
        else {
            isGameOver = YES;
        }
        lengthofsentence = lengthofsentence + 1;
        
        
        
        //fade out all other nodes
        parentNode.name = @"hero";
        [self enumerateChildNodesWithName:@"rain" usingBlock:^(SKNode *node, BOOL *stop) {
            node.physicsBody.categoryBitMask = 0;
            node.physicsBody.contactTestBitMask = 0;
            node.physicsBody.collisionBitMask = 0;
            SKAction *disappear = [SKAction fadeOutWithDuration:2];
            [node runAction: disappear];
        }];
        
        
    }
    //this just tracks that contact happened too late
    
    else {
        
        NSLog(@"getlow");
    }
    
    
}


- (void)createSceneContents
{
    [self addChild:[self hero]];
    
    SKAction *makeRoids = [SKAction sequence: @[
                                                [SKAction performSelector:@selector(addRoids) onTarget:self],
                                                [SKAction waitForDuration:0 withRange:0.25]
                                                ]];
    [self runAction: [SKAction repeatActionForever:makeRoids]];
    
    
    SKAction *makeWord = [SKAction sequence: @[
                                               [SKAction performSelector:@selector(addWord) onTarget:self],
                                               [SKAction waitForDuration:1.0 withRange:0.25]
                                               ]];
    [self runAction: [SKAction repeatActionForever:makeWord]];
    
    
}






-(void)didSimulatePhysics
{
    [self enumerateChildNodesWithName:@"rain" usingBlock:^(SKNode *node, BOOL *stop) {
        if (node.position.y < 0){
            [node removeFromParent];
        }
        else if (node.position.y <_sentenceheight){
            node.physicsBody.categoryBitMask = 0;
            node.physicsBody.contactTestBitMask = 0;
            node.physicsBody.collisionBitMask = 0;
            SKAction *disappear = [SKAction fadeOutWithDuration:2];
            [node runAction: disappear];
        }
    }];
    [self enumerateChildNodesWithName:@"roids" usingBlock:^(SKNode *node, BOOL *stop) {
        if (node.position.y < 0){
            [node removeFromParent];
        }
    }];
  SKAction *schoochDown = [SKAction moveByX:0 y:-200 duration:1];

    if (_sentenceheight > self.frame.size.height - 150){
        sentenceTooTall = YES;
    }
    if (sentenceTooTall){
        sentenceTooTall = !sentenceTooTall;
        [self enumerateChildNodesWithName:@"hero" usingBlock:^(SKNode *node, BOOL *stop) {
        [node runAction:schoochDown];
        NSLog(@"schooching");
        _sentenceheight = _sentenceheight - 200;
        }];
    }
    
    
}

-(void)update:(CFTimeInterval)currentTime {
    
    
    if (isGameOver){
        if (!didIRun){
            [self removeAllActions];
            [self movetoplace];
            Sentence *sentence = [Sentence sharedSentence];
            sentence.fullText = sentenceSoFar;
            if (sentence.level < 4){
                sentence.level = 4;
            }
            SKSpriteNode *testNode = [[SKSpriteNode alloc] init];//parent
            SKLabelNode *hello = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
            testNode.name= @"OpenTweet";
            hello.fontSize = wordFontSize;
            hello.text= @"Tweet";
            testNode.zRotation = M_PI/2;
            testNode.position = CGPointMake((self.frame.size.width - 40),
                                            60);
            testNode.size = CGSizeMake(100,100);
            [testNode addChild:hello];
            [self addChild: testNode];
            
            
            SKSpriteNode *otherNode = [[SKSpriteNode alloc] init];//parent
            SKLabelNode *hi = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
            otherNode.name= @"NewGame";
            hi.fontSize = wordFontSize;
            hi.text= @"Again";
            otherNode.zRotation = M_PI/2;
            otherNode.position = CGPointMake((self.frame.size.width - 40),
                                             self.frame.size.height-60);
            otherNode.size = CGSizeMake(100,100);
            [otherNode addChild:hi];
            [self addChild: otherNode];
            didIRun = YES;
            
        }
        
    }
    if (sentenceTooTall){

    }
}



-(void)movetoplace
{
    CGFloat xlocation = 100;
    
    [self enumerateChildNodesWithName:@"abouttogetstuck" usingBlock:^(SKNode *node, BOOL *stop) {
        node.userInteractionEnabled = NO;
    }];
    [self enumerateChildNodesWithName:@"hero" usingBlock:^(SKNode *node, BOOL *stop) {
        node.userInteractionEnabled = NO;
    }];
    
    [self enumerateChildNodesWithName:@"hero" usingBlock:^(SKNode *node, BOOL *stop) {
        
        SKAction *teleport = [SKAction sequence:@[
                                                  [SKAction waitForDuration:0],
                                                  [SKAction moveTo:CGPointMake(xlocation, node.position.y) duration:1]]];
        [node runAction: [SKAction repeatAction: teleport count:(1)]];
    }];
    
    [self enumerateChildNodesWithName:@"abouttogetstuck" usingBlock:^(SKNode *node, BOOL *stop) {
        
        SKAction *teleport = [SKAction sequence:@[
                                                  [SKAction waitForDuration:0],
                                                  [SKAction moveTo:CGPointMake(xlocation, node.position.y) duration:1]]];
        [node runAction: [SKAction repeatAction: teleport count:(1)]];
    }];
    
    
}

- (void)addRoids
{
    NSUInteger rando = rndInt(0,3);
    SKLabelNode *hello = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
    hello.name = @"roids";
    hello.text = @";";
    SKAction *fall = nil;
    
    if (rando == 0){
        hello.fontSize = 8;
        hello.alpha = 0.4;
        hello.position = CGPointMake(skRand(0, self.size.width), self.size.height+100);
        
        fall = [SKAction moveTo:CGPointMake(hello.position.x,-20) duration:3];
    }
    else if(rando == 1){
        hello.fontSize = 10;
        hello.alpha = 0.5;
        hello.position = CGPointMake(skRand(0, self.size.width), self.size.height+100);
        
        fall = [SKAction moveTo:CGPointMake(hello.position.x,-20) duration:2];
    }
    else {
        hello.fontSize = 12;
        hello.alpha = 0.7;
        hello.position = CGPointMake(skRand(0, self.size.width), self.size.height+100);
        
        fall = [SKAction moveTo:CGPointMake(hello.position.x,-20) duration:1];
    }
    hello.physicsBody.dynamic = NO;
    
    
    
    [hello runAction: fall];
    
    [self addChild: hello];
    
    
    
}


@end
