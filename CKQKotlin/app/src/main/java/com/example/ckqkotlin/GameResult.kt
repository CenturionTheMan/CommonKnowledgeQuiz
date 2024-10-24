package com.example.ckqkotlin

import android.content.Intent
import android.os.Build
import android.os.Bundle
import android.view.View
import android.widget.TextView
import androidx.activity.OnBackPressedCallback
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.constraintlayout.widget.ConstraintLayout
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat

class GameResult : AppCompatActivity() {




    override fun onCreate(savedInstanceState: Bundle?) {


        onBackPressedDispatcher.addCallback(this /* lifecycle owner */, object : OnBackPressedCallback(true) {
            override fun handleOnBackPressed() {
                // Back is pressed... Finishing the activity
            }
        })


        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_game_result)
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.game_result)) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }

        val layout = findViewById<ConstraintLayout>(R.id.game_result)
        val resultTextView = findViewById<TextView>(R.id.resultTextView)

        val correct = this.intent.getIntExtra("correctAmount", -1)
        val questionsAmount = this.intent.getIntExtra("questionAmount", -1)

        val resultText = buildString {
            append("Twój wynik to: ")
            append(correct)
            append("/")
            append(questionsAmount)
        }

        resultTextView.text = resultText

        layout.setOnClickListener { v: View ->
            val intent = Intent(applicationContext, MainActivity::class.java)
            startActivity(intent)
        }
    }


}