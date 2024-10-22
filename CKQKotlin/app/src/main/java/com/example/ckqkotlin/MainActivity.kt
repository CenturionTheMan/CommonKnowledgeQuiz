package com.example.ckqkotlin

import android.annotation.SuppressLint
import android.content.Intent
import android.os.Bundle
import android.text.Editable
import android.text.TextWatcher
import android.view.View
import android.widget.Button
import android.widget.EditText
import android.widget.Toast
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat


class MainActivity : AppCompatActivity() {

    private lateinit var startButton : Button
    private lateinit var timePerQuestionEditText : EditText
    private lateinit var questionAmountEditText : EditText

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_main)
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main)) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }

        startButton = findViewById<Button>(R.id.startButton)
        timePerQuestionEditText = findViewById(R.id.timePerQuestionEditText)
        questionAmountEditText = findViewById(R.id.questionAmountEditText)

        questionAmountEditText.addTextChangedListener(object: TextWatcher {
            @SuppressLint("SetTextI18n")
            override fun afterTextChanged(p0: Editable?) {
                if(questionAmountEditText.text.toString().toInt() < 1)
                {
                    questionAmountEditText.setText("1")
                }
                else if(questionAmountEditText.text.toString().toInt() > QuestionsPool.questions.count())
                {
                    questionAmountEditText.setText(QuestionsPool.questions.count().toString())
                }
            }
            override fun beforeTextChanged(p0: CharSequence?, p1: Int, p2: Int, p3: Int) {}
            override fun onTextChanged(p0: CharSequence?, p1: Int, p2: Int, p3: Int) {}
        })

        timePerQuestionEditText.addTextChangedListener(object: TextWatcher {
            override fun afterTextChanged(p0: Editable?) {
                if(timePerQuestionEditText.text.toString().toInt() < 1)
                {
                    timePerQuestionEditText.setText("1")
                }
            }
            override fun beforeTextChanged(p0: CharSequence?, p1: Int, p2: Int, p3: Int) {}
            override fun onTextChanged(p0: CharSequence?, p1: Int, p2: Int, p3: Int) {}
        })

        startButton.setOnClickListener({v: View ->
            val intent = Intent(applicationContext, InGameActivity::class.java)
            intent.putExtra("questionsAmount", questionAmountEditText.text.toString())
            startActivity(intent)
        })
    }


}