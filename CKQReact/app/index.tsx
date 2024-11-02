import {ifElse} from "ansi-fragments";
import {Text, useColorScheme, View} from "react-native";
import {Button, TextInput } from "react-native-paper";
import {Colors} from "@/constants/Colors";
import * as NavigationBar from "expo-navigation-bar";
import { StatusBar } from 'expo-status-bar';
import {useState} from "react";

export default function Index() {
  const colorSchemeValue = useColorScheme();
  const colorScheme = colorSchemeValue === "light" ? "light" : "dark";
  NavigationBar.setBackgroundColorAsync(Colors[colorScheme].background);
  const [numberOfQuestions, setNumberOfQuestions] = useState("25");
  const [timePerQuestion, setTimePerQuestion] = useState("10");

  function handleNumberOfQuestionsChange(value: string) {
    const number = parseInt(value);
    if (isNaN(number)) {
        setNumberOfQuestions("");
        return;
    }
    if (number > 50) {
        setNumberOfQuestions("50");
    } else if (number < 1) {
        setNumberOfQuestions("1");
    } else {
        setNumberOfQuestions(number.toString());
    }
  }

    function handleTimePerQuestionChange(value: string) {
        const number = parseInt(value);
        if (isNaN(number)) {
            setTimePerQuestion("");
            return;
        }

        if (number > 60) {
            setTimePerQuestion("60");
        } else if (number < 1) {
            setTimePerQuestion("1");
        } else {
            setTimePerQuestion(number.toString());
        }
    }

  return (
    <>
    <StatusBar backgroundColor={Colors[colorScheme].background}/>
    <View
      style={{
      flex: 1,
      backgroundColor: Colors[colorScheme].background,
    }}>
    <View
      style={{
        flex: 1,
        justifyContent: "center",
        alignItems: "center",
      }}
    >
        <Text style={{ fontSize: 48, textAlign: "center", fontFamily: "sans-serif-medium", color: Colors[colorScheme].text }}>Quiz wiedzy ogólnej</Text>
    </View>
    <View
      style={{
        flex: 2,
        justifyContent: "center",
        alignItems: "stretch",
        paddingHorizontal: 40,
      }}
    >
      <View style={{paddingBottom: 10, flex: 1, flexDirection: "row", justifyContent: "space-between", alignItems: "flex-end"}}>
        <Text style={{color: Colors[colorScheme].text, fontSize: 15}}>Ilość pytań w rozgrywce:</Text>
        <View>
          <TextInput value={numberOfQuestions} onBlur={() => {if (numberOfQuestions === "") {setNumberOfQuestions("25")}}} onChangeText={(value) => handleNumberOfQuestionsChange(value)} inputMode={'numeric'} textColor={Colors[colorScheme].text} underlineColor={Colors[colorScheme].text} activeUnderlineColor={Colors[colorScheme].text} style={{height: 10, width: 120, backgroundColor: Colors[colorScheme].background}} contentStyle={{paddingLeft: 0}}></TextInput>
        </View>

      </View>
      <View style={{paddingTop: 10, flex: 1, flexDirection: "row", justifyContent: "space-between", alignItems: "flex-start"}}>
        <Text style={{color: Colors[colorScheme].text, fontSize: 15}}>Czas na pytanie:</Text>
        <View>
          <TextInput value={timePerQuestion} onBlur={() => {if (timePerQuestion === "") {setTimePerQuestion("10")}}} onChangeText={(value) => handleTimePerQuestionChange(value)} inputMode={'numeric'} textColor={Colors[colorScheme].text} underlineColor={Colors[colorScheme].text} activeUnderlineColor={Colors[colorScheme].text} style={{height: 10, width: 120, backgroundColor: Colors[colorScheme].background}} contentStyle={{paddingLeft: 0}}></TextInput>
        </View>
      </View>
    </View>
    <View
      style={{
        flex: 1,
        justifyContent: "flex-end",
        alignItems: "stretch",
        paddingHorizontal: 20,
        paddingBottom: 20,
      }}
    >
      <Button mode={'contained'} labelStyle={{fontSize: 18}} textColor={Colors[colorScheme].text} buttonColor={Colors[colorScheme].primary}>ROZPOCZNIJ</Button>
    </View>
    </View>
    </>
  );
}
