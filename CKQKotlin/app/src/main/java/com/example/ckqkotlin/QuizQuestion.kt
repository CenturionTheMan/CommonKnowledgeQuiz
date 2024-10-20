package com.example.ckqkotlin

data class QuizQuestion(
    public val text: String,
    public val correctIndex: Int,
    public val answers: Array<String>
)