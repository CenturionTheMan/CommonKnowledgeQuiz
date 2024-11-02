import * as NavigationBar from "expo-navigation-bar";
import {StatusBar} from "expo-status-bar";
import {
  View,
  Text,
  Platform,
  useColorScheme,
  StatusBar as NativeBar,
  TouchableWithoutFeedback
} from 'react-native'
import {Colors} from "@/constants/Colors";
import { router } from 'expo-router';
import {useQuestionContext} from "@/components/contextProviders/questionContext";


export default function Result(){
  const colorSchemeValue = useColorScheme();
  const colorScheme = colorSchemeValue === "light" ? "light" : "dark";
  const {correctAnswers, numberOfQuestions} = useQuestionContext();
  NavigationBar.setBackgroundColorAsync(Colors[colorScheme].background);
  const statusBarHeight = NativeBar.currentHeight;
    return (
      <>
        <StatusBar backgroundColor={Colors[colorScheme].background}/>
        <TouchableWithoutFeedback style={{flex: 1}} onPress={() => router.navigate('/')}>
        <View style={{flex: 1,
          backgroundColor: Colors[colorScheme].background,
          paddingTop: Platform.OS === "android" ? statusBarHeight : 0}}>
              <View style={{flex: 1}}></View>
              <View style={{flex: 1, justifyContent:'center'}}>
                <Text style={{color: Colors[colorScheme].text, fontSize: 40, textAlign: 'center', textAlignVertical: 'center'}}>{`Twój wynik to: ${correctAnswers}/${numberOfQuestions}`}</Text>
              </View>
              <View style={{flex: 1}}>
                <Text style={{color: Colors[colorScheme].text, paddingTop: 50, textAlign: 'center'}}>Naciśnij żeby kontynuować...</Text>
              </View>
        </View>
        </TouchableWithoutFeedback>
      </>
    )
}