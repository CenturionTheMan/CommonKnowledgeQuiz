package com.example.ckqkotlin

import android.annotation.SuppressLint
import android.content.Intent
import android.os.Bundle
import android.view.View
import android.widget.ProgressBar
import android.widget.TextView
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat

class InGameActivity : AppCompatActivity() {

    lateinit var questions : List<QuizQuestion>

    lateinit var questionTextView : TextView
    lateinit var progressBar : ProgressBar
    lateinit var answerATextView : TextView
    lateinit var answerBTextView : TextView
    lateinit var answerCTextView : TextView
    lateinit var answerDTextView : TextView

    lateinit var questionNumberTextView : TextView

    var correctAnswers = 0
    var currentQuestionNumber = 0

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_in_game)
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.in_game)) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }

        val questionsAmount = this.intent.getStringExtra("questionsAmount")!!.toInt()
        this.questions = QuestionsPool.questions.asSequence().shuffled().take(questionsAmount).toList()

        answerATextView.setOnClickListener { answerOnClick(0) }
        answerBTextView.setOnClickListener { answerOnClick(1) }
        answerCTextView.setOnClickListener { answerOnClick(2) }
        answerDTextView.setOnClickListener { answerOnClick(3) }

    }

    private fun answerOnClick(selectedIndex: Int)
    {
        if(this.questions[this.currentQuestionNumber].correctIndex == selectedIndex)
            this.correctAnswers++
        this.currentQuestionNumber++

        this.questionNumberTextView.text = "Pytanie " + this.currentQuestionNumber + "/" + questions.count()
    }


}