package com.example.ckqkotlin

import android.os.Bundle
import android.view.View
import android.widget.TextView
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.constraintlayout.widget.ConstraintLayout
import androidx.constraintlayout.widget.ConstraintSet.Layout
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat

class GameResult : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_game_result)
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.game_result)) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }

        var layout = findViewById<ConstraintLayout>(R.id.game_result)
        var resultTextView = findViewById<TextView>(R.id.resultTextView)

        val correct = this.intent.getIntExtra("correctAmount", -1)

        resultTextView.setText(
            "Twój wynik to: " + correct + "/" + QuestionsPool.questions.count()
        )

        layout.setOnClickListener({v: View ->
            setContentView(R.layout.activity_main)
        })
    }
}