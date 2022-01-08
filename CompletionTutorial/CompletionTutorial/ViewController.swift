//
//  ViewController.swift
//  CompletionBlock-Tutorial
//
//  Created by Test on 2022/01/08.
//

import UIKit
import KRProgressHUD

class ViewController: UIViewController {

    
    @IBOutlet weak var mainTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("ViewController - viewDidLoad() 호출됨")
        
        KRProgressHUD.show()
        sayHi(completion: { result in
            
            print("Completion 블락으로 넘겨받음 =  \(result)")
            
            KRProgressHUD.showSuccess()
            
            self.mainTitle.text = result
        })
    }

    // sayHi func이 호출되어지고 해당 함수가 종료될 때(escaping 으로) 호출한부분에 다시 전달
    // 보통은 호출한부분에서 종료를 알수가 없는데 completion을 쓸 경우 종료를 알 수 있다.
    fileprivate func sayHi(completion : @escaping(String) -> ()) {
        print("ViewController - sayHi() 호출됨")
        // 2초뒤에 로직이 실행되도록 로직 설정(비동기처리)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // Change `2.0` to the desired number of seconds.
            completion("하이")
        }
    }
}

