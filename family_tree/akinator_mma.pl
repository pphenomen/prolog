training(boxing, beginner, yes, individual, adult, 1).
training(judo, beginner, yes, group, children, 0.75).
training(kickboxing, intermediate, yes, group, adult, 1).
training(karate, advanced, yes, individual, adult, 1.5).
training(muay_thai, intermediate, yes, group, teenagers, 1).
training(wrestling, beginner, yes, group, children, 0.75).
training(mma, advanced, yes, individual, adult, 1).

question1(X):- 
    write("What type of martial art do you want to practice? (boxing, judo, kickboxing, karate, muay_thai, wrestling, mma)"), nl,
    read(X).

question2(X):- 
    write("What is your training level? (beginner, intermediate, advanced)"), nl,
    read(X).

question3(X):- 
    write("Do you need a trainer? (yes, no)"), nl,
    read(X).

question4(X):- 
    write("Do you prefer individual or group training? (individual, group)"), nl,
    read(X).

question5(X):- 
    write("What age group are the training sessions for? (children, teenagers, adult, all ages)"), nl,
    read(X).

question6(X):- 
    write("What training duration do you prefer? (0.75 for 45 min, 1 for 1 hour, 1.5 for 1.5 hours)"), nl,
    read(X).

find_training:- 
    question1(MartialArt), question2(Level), question3(Trainer),
    question4(TrainingType), question5(AgeGroup), question6(Duration),
    training(MartialArt, Level, Trainer, TrainingType, AgeGroup, Duration),
    write('Your training option is: '), write(MartialArt), nl.
