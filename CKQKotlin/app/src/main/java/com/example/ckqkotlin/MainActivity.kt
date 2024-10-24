package com.example.ckqkotlin

import android.content.Intent
import android.os.Bundle
import android.text.Editable
import android.text.TextWatcher
import android.view.View
import android.widget.Button
import android.widget.EditText
import androidx.activity.OnBackPressedCallback
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat


class MainActivity : AppCompatActivity() {

    private lateinit var startButton : Button
    private lateinit var timePerQuestionEditText : EditText
    private lateinit var questionAmountEditText : EditText

    override fun onCreate(savedInstanceState: Bundle?) {


        onBackPressedDispatcher.addCallback(this, object : OnBackPressedCallback(true) {
            override fun handleOnBackPressed() {
                finishAffinity()
            }
        })

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

        val questionAmount = (QuestionsPool.questions.count() / 2).toString()

        questionAmountEditText.setText(questionAmount)

        questionAmountEditText.addTextChangedListener(object: TextWatcher {
            override fun afterTextChanged(p0: Editable?) {
                val tmp = validateInputStringAsNumber(p0.toString(), 1, 1, QuestionsPool.questions.count())
                if(tmp != null)
                {
                    questionAmountEditText.setText(tmp)
                }
            }
            override fun beforeTextChanged(p0: CharSequence?, p1: Int, p2: Int, p3: Int) {}
            override fun onTextChanged(p0: CharSequence?, p1: Int, p2: Int, p3: Int) {}
        })

        timePerQuestionEditText.addTextChangedListener(object: TextWatcher {
            override fun afterTextChanged(p0: Editable?) {
                val tmp = validateInputStringAsNumber(p0.toString(), 1,1, null)
                if(tmp != null)
                {
                    timePerQuestionEditText.setText(tmp)
                }
            }
            override fun beforeTextChanged(p0: CharSequence?, p1: Int, p2: Int, p3: Int) {}
            override fun onTextChanged(p0: CharSequence?, p1: Int, p2: Int, p3: Int) {}
        })

        startButton.setOnClickListener { v: View ->
            val intent = Intent(applicationContext, InGameActivity::class.java)

            if(questionAmountEditText.text.toString().isEmpty())
            {
                intent.putExtra("questionsAmount", 1)
            }
            else
            {
                intent.putExtra("questionsAmount", questionAmountEditText.text.toString().toInt())
            }

            if(timePerQuestionEditText.text.toString().isEmpty())
            {
                intent.putExtra("timePerQuestion", 1)
            }
            else
            {
                intent.putExtra("timePerQuestion", timePerQuestionEditText.text.toString().toInt())
            }
            startActivity(intent)
        }
    }

    private fun validateInputStringAsNumber(text: String, def: Int, minRange: Int?, maxRange: Int?) : String?{
        if(text.isEmpty())
        {
            return null
        }

        try {
            val num : Int= text.toInt()
            return if(minRange != null && num < minRange) {
                minRange.toString()
            } else if(maxRange != null && maxRange < num) {
                maxRange.toString()
            } else {
                null
            }
        }
        catch (e : Error)
        {
            return def.toString()
        }
    }

}



