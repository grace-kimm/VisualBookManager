//
//  ViewController.swift
//  VisualBookManager
//
//  Created by kakao on 04/07/2020.
//  Copyright © 2020 ddaeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var myBookManager = BookManager()
    
    // 변수 정의
    @IBOutlet weak var outputTextView: UITextView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var genreTextField: UITextField!
    @IBOutlet weak var countLabel: UILabel!

    // 열자마자 실행 되는 코드
    override func viewDidLoad() {
        super.viewDidLoad()
        let book1 = Book(name: "햄릿", genre: "비극", author: "셰익스피어")
        let book2 = Book(name: "누구를 위하여 종을 울리나", genre: "소설", author: "헤밍웨이")
        let book3 = Book(name: "죄와벌", genre: "사실주의", author: "톨스토이")

        myBookManager.registerBook(bookObject: book1)
        myBookManager.registerBook(bookObject: book2)
        myBookManager.registerBook(bookObject: book3)
        
        countLabel.text = "\(myBookManager.countBooks())"
        
        // Do any additional setup after loading the view.
    }
    
    // 책 추가 메소드
    @IBAction func registerAction(_ sender:Any) {
        var bookTemp = Book()
        bookTemp.name = nameTextField.text!
        bookTemp.author = authorTextField.text!
        bookTemp.genre = genreTextField.text!
        
        myBookManager.registerBook(bookObject: bookTemp)
        outputTextView.text = "\(nameTextField.text!) has been registered!"
        // count 다시 불러오기
        countLabel.text = "\(myBookManager.countBooks())"
    }
    
    @IBAction func searchAction(_ sender:Any) {
        let resultBook = myBookManager.searchBook(name: nameTextField.text!)
        if resultBook != nil {
            outputTextView.text = resultBook
        } else {
            outputTextView.text = "We don't have the book that you searched for."
        }
    }
    
    @IBAction func removeAction(_ sender:Any) {
        myBookManager.removeBook(name: nameTextField.text!)
        outputTextView.text = "\(nameTextField.text!) is removed!"
        countLabel.text = "\(myBookManager.countBooks())"
    }
    
    // 메소드 만들기 (메소드-버튼 연결해야 함)
    @IBAction func showAllBooksAction(_ sender: Any) {
//        print("showAllBookAction")
        outputTextView.text = myBookManager.showAllBooks()
    }


}

