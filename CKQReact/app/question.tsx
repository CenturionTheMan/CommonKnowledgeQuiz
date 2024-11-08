import {Colors} from "@/constants/Colors";
import * as NavigationBar from "expo-navigation-bar";
import {StatusBar} from "expo-status-bar";
import {Text, useColorScheme, View, SafeAreaView, StatusBar as NativeBar, Platform} from "react-native";
import {Button, ProgressBar} from "react-native-paper";
import {useEffect, useRef, useState} from "react";
import {useQuestionContext} from "@/components/contextProviders/questionContext";
import {router} from "expo-router";

import {questions} from "@/questions/questions";




export default function Question() {
  const colorSchemeValue = useColorScheme();
  const colorScheme = colorSchemeValue === "light" ? "light" : "dark";
  NavigationBar.setBackgroundColorAsync(Colors[colorScheme].background);
  const statusBarHeight = NativeBar.currentHeight;
  const {numberOfQuestions, timePerQuestion, questionIndexes, setCorrectAnswers} = useQuestionContext();

  const currentQuestion = useRef(0);
  const [currentQuestionIndex, setCurrentQuestionIndex] = useState(questionIndexes[currentQuestion.current]);

  const [progress, setProgress] = useState(1);
  const totalTime = timePerQuestion; // total time in seconds
  const intervalTime = 100; // interval time in milliseconds

  const handleAnswer = (answerIndex: number) => {
    if (questions[currentQuestionIndex].correctIndex === answerIndex) {
        setCorrectAnswers((prev) => prev + 1);
    }

    if (currentQuestion.current + 1 < numberOfQuestions) {
        currentQuestion.current += 1;
        setCurrentQuestionIndex(questionIndexes[currentQuestion.current]);
    } else {
        router.navigate("/result");
    }


    setProgress(1);
  }

  useEffect(() => {
    const interval = setInterval(() => {
      setProgress((prev) => {
        if (prev <= 0) {
            if (currentQuestion.current + 1 < numberOfQuestions) {
                currentQuestion.current += 1;
                setCurrentQuestionIndex(questionIndexes[currentQuestion.current]);
                return 1;
            } else {
                router.navigate("/result");
            }
        }
        return prev - (intervalTime / 1000) / totalTime;
      });
    }, intervalTime);

    return () => clearInterval(interval);
  }, []);

  return (
    <>
    <StatusBar backgroundColor={Colors[colorScheme].background}/>
    <SafeAreaView style={{flex: 1}}>
    <View style={{flex: 1,
      backgroundColor: Colors[colorScheme].background,
      paddingTop: Platform.OS === "android" ? statusBarHeight : 0}}>
      <View style={{alignItems: 'center'}}>
        <Text style={{fontSize: 30, textAlign: 'right', color: Colors[colorScheme].text}}>{`Pytanie ${currentQuestion.current + 1}/${numberOfQuestions}`}</Text>
      </View>
      <View style={{flex: 2,
        justifyContent: "center",
        }}>
        <Text style={{fontSize: 25, textAlign: 'center', color: Colors[colorScheme].text}}>{questions[currentQuestionIndex].text}</Text>
      </View>
      <View style={{flex: 1,
        justifyContent: "space-evenly",
        alignItems: "stretch",
        paddingHorizontal: 20,}}>
          <ProgressBar style={{marginBottom: 5, backgroundColor: Colors[colorScheme].progressBackground}} animatedValue={progress} color={"#FFFFFF"}></ProgressBar>
        {questions[currentQuestionIndex].answers.map((answer, index) => (
          <Button key={index} mode={'contained'} labelStyle={{fontSize: 18}} textColor={Colors[colorScheme].text} buttonColor={Colors[colorScheme].primary} onPress={() => handleAnswer(index)}>{answer}</Button>
        ))}

      </View>
    </View>
    </SafeAreaView>
    </>
    );
}