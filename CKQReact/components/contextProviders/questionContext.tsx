import React, {createContext, useContext, useState, useEffect} from "react";


export interface QuestionContext {
    numberOfQuestions: number;
    setNumberOfQuestions: React.Dispatch<React.SetStateAction<number>>;
    timePerQuestion: number;
    setTimePerQuestion: React.Dispatch<React.SetStateAction<number>>;
    questionIndexes: number[];
    setQuestionIndexes: React.Dispatch<React.SetStateAction<number[]>>;
    correctAnswers: number;
    setCorrectAnswers: React.Dispatch<React.SetStateAction<number>>;
}

const questionContext = createContext<QuestionContext>({} as QuestionContext);

export default function QuestionContextProvider({children}: {children: React.ReactNode}) {
  const [numberOfQuestions, setNumberOfQuestions] = useState(5);
  const [timePerQuestion, setTimePerQuestion] = useState(10);
  const [questionIndexes, setQuestionIndexes] = useState<number[]>([0, 1, 2, 3, 4]);
  const [correctAnswers, setCorrectAnswers] = useState(0);

  return (
    <questionContext.Provider value={{
        numberOfQuestions,
        setNumberOfQuestions,
        timePerQuestion,
        setTimePerQuestion,
        questionIndexes,
        setQuestionIndexes,
        correctAnswers,
        setCorrectAnswers
    }}>
      {children}
    </questionContext.Provider>
  );
}

export const useQuestionContext = () => {
    return useContext(questionContext);
}