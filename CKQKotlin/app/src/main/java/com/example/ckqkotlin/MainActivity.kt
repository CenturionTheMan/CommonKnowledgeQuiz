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
import kotlin.math.max
import kotlin.math.min


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

        questionAmountEditText.setText((QuestionsPool.questions.count() / 2).toString())

        questionAmountEditText.addTextChangedListener(object: TextWatcher {
            override fun afterTextChanged(p0: Editable?) {
                val tmp = ValidateInputStringAsNumber(p0.toString(), 1, 1, QuestionsPool.questions.count())
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
                val tmp = ValidateInputStringAsNumber(p0.toString(), 1,1, null)
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
            intent.putExtra("questionsAmount", questionAmountEditText.text.toString().toInt())
            intent.putExtra("timePerQuestion", timePerQuestionEditText.text.toString().toInt())
            startActivity(intent)
        }
    }

    private fun ValidateInputStringAsNumber(text: String, def: Int, minRange: Int?, maxRange: Int?) : String?{
        if(text.isEmpty())
        {
            return def.toString()
        }

        try {
            var num : Int= text.toInt()
            if(minRange != null && num < minRange)
            {
                return minRange.toString()
            }
            else if(maxRange != null && maxRange < num)
            {
                 return maxRange.toString()
            }
            else
            {
                return null
            }
        }
        catch (e : Error)
        {
            return def.toString()
        }
    }

}



