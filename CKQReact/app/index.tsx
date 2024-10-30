import { Text, View } from "react-native";
import {Button, TextInput } from "react-native-paper";

export default function Index() {
  return (
    <View
      style={{
      flex: 1,
      backgroundColor: "white",
    }}>
    <View
      style={{
        flex: 1,
        justifyContent: "center",
        alignItems: "center",
        backgroundColor: "red"
      }}
    >
        <Text style={{ fontSize: 48, textAlign: "center", fontFamily: "sans-serif-medium" }}>Quiz wiedzy ogólnej</Text>
    </View>
    <View
      style={{
        flex: 2,
        justifyContent: "center",
        alignItems: "stretch",
        backgroundColor: "blue",
        paddingHorizontal: 50,
      }}
    >
      <View style={{paddingBottom: 10, backgroundColor: "green", flex: 1, flexDirection: "row", justifyContent: "space-between", alignItems: "flex-end"}}>
        <Text >Ilość pytań w rozgrywce:</Text>
        <TextInput mode={'flat'}></TextInput>

      </View>
      <View style={{paddingTop: 10, backgroundColor: "orange", flex: 1, flexDirection: "row", justifyContent: "space-between", alignItems: "flex-start"}}>
        <Text >Czas na pytanie:</Text>
        <TextInput style={{height: 1}} mode={'flat'}></TextInput>
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
      <Button mode={'contained'} labelStyle={{fontSize: 18}}>ROZPOCZNIJ</Button>
    </View>
    </View>
  );
}
