import {Colors} from "@/constants/Colors";
import * as NavigationBar from "expo-navigation-bar";
import {StatusBar} from "expo-status-bar";
import {Text, useColorScheme, View, SafeAreaView, StatusBar as NativeBar, Platform} from "react-native";
import {Button, ProgressBar} from "react-native-paper";
import {useEffect, useState} from "react";


export default function Question() {
  const colorSchemeValue = useColorScheme();
  const colorScheme = colorSchemeValue === "light" ? "light" : "dark";
  NavigationBar.setBackgroundColorAsync(Colors[colorScheme].background);
  const statusBarHeight = NativeBar.currentHeight;

  const [progress, setProgress] = useState(1);
  const totalTime = 10; // total time in seconds
  const intervalTime = 100; // interval time in milliseconds

  useEffect(() => {
    const interval = setInterval(() => {
      setProgress((prev) => {
        if (prev <= 0) {
          clearInterval(interval);
          return 0;
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
        <Text style={{fontSize: 30, color: Colors[colorScheme].text}}>Question</Text>
      </View>
      <View style={{flex: 2,
        justifyContent: "center",
        alignItems: "center",}}>
        <Text style={{fontSize: 25, color: Colors[colorScheme].text}}>Jaka jest Stolica Polski</Text>
      </View>
      <View style={{flex: 1,
        justifyContent: "space-evenly",
        alignItems: "stretch",
        paddingHorizontal: 20,}}>
          <ProgressBar style={{marginBottom: 5, backgroundColor: Colors[colorScheme].progressBackground}} animatedValue={progress} color={"#FFFFFF"}></ProgressBar>
          <Button mode={'contained'} labelStyle={{fontSize: 18}} textColor={Colors[colorScheme].text} buttonColor={Colors[colorScheme].primary}>1</Button>
          <Button mode={'contained'}>1</Button>
          <Button mode={'contained'}>1</Button>
          <Button mode={'contained'}>1</Button>
      </View>
    </View>
    </SafeAreaView>
    </>
    );
}