//
//  ViewController.swift
//  SportCountPoint
//
//  Created by Adrien PEREA on 22/05/2021.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: VARIABLES
    @IBOutlet weak var player1TextField: UITextField!
    @IBOutlet weak var player2TextField: UITextField!
    @IBOutlet var player1ScoreLabel: [UILabel]!
    @IBOutlet var player2ScoreLabel: [UILabel]!
    @IBOutlet var anyButton: [UIButton]!
    @IBOutlet var victoryLabel: [UILabel]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.isIdleTimerDisabled = true
        for button in anyButton {
            rounderButton(button: button)
        }
        refreshScore()
        setupTextFieldManager()
    }

    // MARK: PROPRIETES
    var match = Match()

    // MARK: FONCTIONS
    @IBAction func pushPointButton(_ sender: UIButton) {
        switch sender.tag {
            case 1 :
                if (match.sets[1].winner != nil) {
                    match.sets[2].incrementScore(forPlayer: .one)
                } else if (match.sets[0].winner != nil) {
                    match.sets[1].incrementScore(forPlayer: .one)
                } else {
                    match.sets[0].incrementScore(forPlayer: .one)
                }
            case 2 :
                if (match.sets[1].winner != nil) {
                    match.sets[2].incrementScore(forPlayer: .two)
                } else if (match.sets[0].winner != nil) {
                    match.sets[1].incrementScore(forPlayer: .two)
                } else {
                match.sets[0].incrementScore(forPlayer: .two)
                }
            default : return
        }
        refreshScore()
        checkWinner()
    }

    @IBAction func pushNewGame(_ sender: Any) {
        victoryLabel[0].isHidden = true
        victoryLabel[1].isHidden = true
        anyButton[0].isEnabled = true
        anyButton[2].isEnabled = true
        player1TextField.text = ""
        player2TextField.text = ""
        match = Match()
        refreshScore()
    }

    // MARK: PRIVATE FONCTIONS
    
    private func checkWinner() {
        var winPlayer1 = 0
        var winPlayer2 = 0
        for index in match.sets {
            if index.winner == .one {
                winPlayer1 += 1
            } else if index.winner == .two {
                winPlayer2 += 1
            }
        }
        if winPlayer1 == 2 {
            victoryLabel[0].isHidden = false
            anyButton[0].isEnabled = false
            anyButton[2].isEnabled = false
        } else if winPlayer2 == 2 {
                victoryLabel[1].isHidden = false
                anyButton[0].isEnabled = false
                anyButton[2].isEnabled = false
        }
    }

    private func setupTextFieldManager() {
        player2TextField.delegate = self
        player1TextField.delegate = self
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tap)
    }

    @objc private func hideKeyboard() {
        player2TextField.resignFirstResponder()
        player1TextField.resignFirstResponder()
    }

    private func rounderButton(button: UIButton) {
        button.layer.cornerRadius = button.frame.height/2
        button.layer.borderWidth = 3
        button.layer.borderColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
    }

    private func refreshScore() {
        player1ScoreLabel[0].text = String(match.sets[0].scores[.one]!)
        player2ScoreLabel[0].text = String(match.sets[0].scores[.two]!)
        player1ScoreLabel[1].text = String(match.sets[1].scores[.one] ?? 0)
        player2ScoreLabel[1].text = String(match.sets[1].scores[.two] ?? 0)
        player1ScoreLabel[2].text = String(match.sets[2].scores[.one] ?? 0)
        player2ScoreLabel[2].text = String(match.sets[2].scores[.two] ?? 0)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
