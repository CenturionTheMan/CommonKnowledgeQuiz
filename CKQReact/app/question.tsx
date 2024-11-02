import {Colors} from "@/constants/Colors";
import * as NavigationBar from "expo-navigation-bar";
import {StatusBar} from "expo-status-bar";
import {Text, useColorScheme, View, SafeAreaView, StatusBar as NativeBar, Platform} from "react-native";
import {Button, ProgressBar, MD3Colors} from "react-native-paper";


export default function Question() {
  const colorSchemeValue = useColorScheme();
  const colorScheme = colorSchemeValue === "light" ? "light" : "dark";
  NavigationBar.setBackgroundColorAsync(Colors[colorScheme].background);
  const statusBarHeight = NativeBar.currentHeight;
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
          <ProgressBar style={{marginBottom: 5, backgroundColor: Colors[colorScheme].progressBackground}} progress={0.5} color={"#FFFFFF"}></ProgressBar>
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