package com.example.ckqkotlin

import android.annotation.SuppressLint
import android.content.Intent
import android.os.Bundle
import android.os.CountDownTimer
import android.view.View
import android.widget.Button
import android.widget.ProgressBar
import android.widget.TextView
import androidx.activity.OnBackPressedCallback
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat
import kotlin.time.times

class InGameActivity : AppCompatActivity() {

    private lateinit var questions : List<QuizQuestion>

    private lateinit var questionTextView : TextView
    lateinit var progressBar : ProgressBar
    private lateinit var answerAButton : Button
    private lateinit var answerBButton : Button
    private lateinit var answerCButton : Button
    private lateinit var answerDButton : Button

    private lateinit var questionNumberTextView : TextView

    private var correctAnswers: Int = 0
    var currentQuestionNumber: Int = 0

    var timePerQuestionMax: Int = -1

    private var timer: CountDownTimer? = null

    override fun onCreate(savedInstanceState: Bundle?) {

        onBackPressedDispatcher.addCallback(this /* lifecycle owner */, object : OnBackPressedCallback(true) {
            override fun handleOnBackPressed() {
                // Back is pressed... Finishing the activity
            }
        })


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

        this.timePerQuestionMax = this.intent.getIntExtra("timePerQuestion", -1)
        this.progressBar.max = timePerQuestionMax * 10

        val questionsAmount = this.intent.getIntExtra("questionsAmount", -1)
        this.questions = QuestionsPool.questions.asSequence().shuffled().take(questionsAmount).toList()

        answerAButton.setOnClickListener { answerOnClick(0) }
        answerBButton.setOnClickListener { answerOnClick(1) }
        answerCButton.setOnClickListener { answerOnClick(2) }
        answerDButton.setOnClickListener { answerOnClick(3) }

        setViewsWithCurrentQuestion()
    }

    private fun answerOnClick(selectedIndex: Int)
    {
        if(checkIfGameEnd())
            return

        if(this.questions[this.currentQuestionNumber].correctIndex == selectedIndex)
            this.correctAnswers++
        this.currentQuestionNumber++

        setViewsWithCurrentQuestion()
    }

    private fun checkIfGameEnd(): Boolean {
        if(this.currentQuestionNumber == questions.count() - 1)
        {
            timer?.cancel()
            val intent = Intent(applicationContext, GameResult::class.java)
            intent.putExtra("questionAmount", questions.count())
            intent.putExtra("correctAmount", correctAnswers)
            startActivity(intent)
            return true
        }
        return false
    }

    private fun setViewsWithCurrentQuestion()
    {
        this.questionNumberTextView.text = buildString {
            append("Pytanie ")
            append(currentQuestionNumber + 1)
            append("/")
            append(questions.count())
        }
        this.questionTextView.text = questions[currentQuestionNumber].text
        this.answerAButton.text = questions[currentQuestionNumber].answers[0]
        this.answerBButton.text = questions[currentQuestionNumber].answers[1]
        this.answerCButton.text = questions[currentQuestionNumber].answers[2]
        this.answerDButton.text = questions[currentQuestionNumber].answers[3]
        this.progressBar.progress = this.progressBar.max

        timer?.cancel()
        timer = object: CountDownTimer(1000 * timePerQuestionMax.toLong() , 100) {
            override fun onTick(millisUntilFinished: Long) {
                runOnUiThread {
                    progressBar.progress -= 1
                }
            }

            override fun onFinish() {
                runOnUiThread{
                    progressBar.progress = 0
                }

                if(checkIfGameEnd())
                    return

                currentQuestionNumber++
                setViewsWithCurrentQuestion()
            }
        }
        this.timer!!.start()
    }
}