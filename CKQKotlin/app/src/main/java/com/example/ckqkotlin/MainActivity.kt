package com.example.ckqkotlin

import android.content.Intent
import android.os.Bundle
import android.view.View
import android.widget.Button
import android.widget.EditText
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

        startButton.setOnClickListener({v: View ->
            val intent = Intent(applicationContext, InGameActivity::class.java)
            intent.putExtra("questionsAmount", questionAmountEditText.text.toString())
            startActivity(intent)
        })
    }
}