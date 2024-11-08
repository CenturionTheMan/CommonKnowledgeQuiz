import {Slot} from 'expo-router';
import QuestionContextProvider from "@/components/contextProviders/questionContext";
import Result from "@/app/result";

export default function Layout() {

  return (
    <QuestionContextProvider>
      <Slot />
    </QuestionContextProvider>
  );
}