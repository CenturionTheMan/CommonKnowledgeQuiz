import {Slot} from 'expo-router';
import Index from './index'
import QuestionContextProvider from "@/components/contextProviders/questionContext";

export default function Layout() {

  return (
    <QuestionContextProvider>
      <Slot/>
    </QuestionContextProvider>
  );
}