//
//  ViewController.swift
//  GuntingBatuKertas
//
//  Created by Gilang Ramdhani Putra on 26/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    var player1Get : String = ""
    var player2Get : String = ""
    @IBOutlet weak var player2LabelScore: UILabel!
    @IBOutlet weak var player1LabelScore: UILabel!
    @IBOutlet weak var player1Image: UIImageView!
    @IBOutlet weak var player2Image: UIImageView!
    var player1Score : Int = 0
    var player2Score : Int = 0
    @IBOutlet weak var player1Name: UILabel!
    @IBOutlet weak var player2Name: UILabel!
    var player1NameAlert : UITextField?
    var player2NameAlert : UITextField?
    let listPilihan = ["Gunting", "Batu", "Kertas"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        player1Image.image = UIImage(named: "batu")
        player2Image.image = UIImage(named: "batu")
    }
    
    @IBAction func buttonResetPressed(_ sender: Any) {
        player1Name.text = ""
        player2Name.text = ""
        player1LabelScore.text = "0"
        player2LabelScore.text = "0"
        player1Image.image = UIImage(named: "batu")
        player2Image.image = UIImage(named: "batu")
    }
    
    @IBAction func buttonPlayPressed(_ sender: Any) {
        
        if player1Name?.text == ""  && player2Name?.text == "" {
            openAlert()
        }else{
            playTheGame()
        }
    }
    
    func openAlert(){
        let alert = UIAlertController(title: "Your Name and Your Enemy", message: "Remember your name!", preferredStyle: .alert)
        
        alert.addTextField{ (textField) in
            textField.text = "Your Name"
        }
        
        alert.addTextField{ (textField) in
            textField.text = "Your Enemy"
        }
        
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: {
            (alertAction) in
            
            self.player1NameAlert = alert.textFields![0]
            self.player2NameAlert = alert.textFields![1]
            
            self.player1Name.text = self.player1NameAlert?.text
            self.player2Name.text = self.player2NameAlert?.text
        }))
        
        self.present(alert, animated: true)
    }
    
    
    func playTheGame(){
        
        player1Get = listPilihan.randomElement()!
        player2Get = listPilihan.randomElement()!
        
        getImagePlayer1(image: player1Get)
        getImagePlayer2(image: player2Get)
        
        if player1Get == "Batu" && player2Get == "Gunting" || player1Get == "Kertas" && player2Get == "Batu" || player1Get == "Gunting" && player2Get == "Kertas" {
            player1Score = player1Score + 1
        }else if player2Get == "Batu" && player1Get == "Gunting" || player2Get == "Kertas" && player1Get == "Batu" || player2Get == "Gunting" && player1Get == "Kertas" {
            player2Score = player2Score + 1
        }else {
            print("seri")
        }
        
        player1LabelScore.text = "\(player1Score)"
        player2LabelScore.text = "\(player2Score)"
    }
    
    
    func getImagePlayer1(image : String){
        if image == "Batu" {
            player1Image.image = UIImage(named: "batu")
        }else if image == "Kertas" {
            player1Image.image = UIImage(named: "kertas")
        }else if image == "Gunting" {
            player1Image.image = UIImage(named: "gunting")
        }
    }
    
    
    func getImagePlayer2(image : String){
        if image == "Batu" {
            player2Image.image = UIImage(named: "batu")
        }else if image == "Kertas" {
            player2Image.image = UIImage(named: "kertas")
        }else if image == "Gunting" {
            player2Image.image = UIImage(named: "gunting")
        }
    }


}

