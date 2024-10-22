package com.example.ckqkotlin

import android.annotation.SuppressLint
import android.content.Intent
import android.os.Bundle
import android.view.View
import android.widget.Button
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
    lateinit var answerAButton : Button
    lateinit var answerBButton : Button
    lateinit var answerCButton : Button
    lateinit var answerDButton : Button

    lateinit var questionNumberTextView : TextView

    var correctAnswers: Int = 0
    var currentQuestionNumber: Int = 0

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_in_game)
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.in_game)) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }

        this.questionTextView = findViewById(R.id.questionTextView)
        this.progressBar = findViewById(R.id.progressBar)
        this.answerAButton = findViewById(R.id.answerAButton)
        this.answerBButton = findViewById(R.id.answerBButton)
        this.answerCButton = findViewById(R.id.answerCButton)
        this.answerDButton = findViewById(R.id.answerDButton)
        this.questionNumberTextView = findViewById(R.id.questionNumberTextView)

        correctAnswers = 0
        currentQuestionNumber = 0

        val questionsAmount = this.intent.getStringExtra("questionsAmount")!!.toInt()
        this.questions = QuestionsPool.questions.asSequence().shuffled().take(questionsAmount).toList()

        answerAButton.setOnClickListener { answerOnClick(0) }
        answerBButton.setOnClickListener { answerOnClick(1) }
        answerCButton.setOnClickListener { answerOnClick(2) }
        answerDButton.setOnClickListener { answerOnClick(3) }

        setViewsWithCurrentQuestion()
    }

    private fun answerOnClick(selectedIndex: Int)
    {
        if(this.currentQuestionNumber == questions.count() - 1)
        {
            val intent = Intent(applicationContext, GameResult::class.java)
            intent.putExtra("correctAmount", correctAnswers)
            startActivity(intent)
            return
        }

        if(this.questions[this.currentQuestionNumber].correctIndex == selectedIndex)
            this.correctAnswers++
        this.currentQuestionNumber++

        setViewsWithCurrentQuestion()
    }

    private fun setViewsWithCurrentQuestion()
    {
        this.questionNumberTextView.text = "Pytanie " + (this.currentQuestionNumber+1) + "/" + questions.count()
        this.questionTextView.text = questions[currentQuestionNumber].text
        this.answerAButton.text = questions[currentQuestionNumber].answers[0]
        this.answerBButton.text = questions[currentQuestionNumber].answers[1]
        this.answerCButton.text = questions[currentQuestionNumber].answers[2]
        this.answerDButton.text = questions[currentQuestionNumber].answers[3]
        this.progressBar.setProgress(0, false)
    }

}