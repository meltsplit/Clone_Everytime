import Foundation
import UIKit
final class LoginViewController: UIViewController{
    
    private let stackView: UIStackView = {  //타이틀 이미지, 라벨, 버튼 넣을 vertical한 stackview
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.spacing = 4
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()
    
    private var centerYConstaits: NSLayoutConstraint?
    
    private let titleImageView: UIImageView = { //에브리타임 로고
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "login_title_icon")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let TitleLabel: UILabel = { //에브리타임 라벨
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textColor = UIColor(r: 198, g: 41, b: 23)
        label.textAlignment = .center
        label.text = "에브리타임"
        label.numberOfLines = 1
        return label
    }()
    
    private let descriptionLabel: UILabel = { // 대학생활을 더 편하고 즐겁게 부제목
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = UIColor.gray
        label.textAlignment = .center
        label.text = "대학생활을 더 편하고 즐겁게"
        label.numberOfLines = 1 //최대 줄 수: 1
        return label
    }()
    
    private let idTextField : UITextField = { //id 입력 textfield
        let textField = InsetTextField()
        textField.insetX = 16
        textField.translatesAutoresizingMaskIntoConstraints = false //xcode가 자동적으로 레이아웃 형성하지 않게 false
        textField.placeholder = "아이디"
        textField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        textField.backgroundColor = UIColor(w: 242)
        textField.layer.cornerRadius = 20
        textField.isSecureTextEntry = false
        textField.clipsToBounds = true
        return textField
    }()
    
    private let passwordTextField : UITextField = {
        let textField = InsetTextField()
        textField.insetX = 16
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "비밀번호"
        textField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        textField.backgroundColor = UIColor(w: 242)
        textField.layer.cornerRadius = 20
        textField.isSecureTextEntry = true
        textField.clipsToBounds = true
        return textField
    }()
    
    private let loginButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("로그인", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor(r: 198, g: 41, b: 23)
        button.layer.cornerRadius = 20
        return button
    }()
    
    private let signupButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("회원가입", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        button.setTitleColor(UIColor.black, for: .normal)
        button.clipsToBounds = true
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(self.stackView)
        
        //stackview에 서브 뷰 추가. stackview 이기에 add"Arranged"Subview 함수 호출
        self.stackView.addArrangedSubview(self.titleImageView)
        self.stackView.addArrangedSubview(self.TitleLabel)
        self.stackView.addArrangedSubview(self.descriptionLabel)
        
        self.stackView.addArrangedSubview(self.idTextField)
        self.stackView.addArrangedSubview(self.passwordTextField)
        
        self.stackView.addArrangedSubview(self.loginButton)
        self.stackView.addArrangedSubview(self.signupButton)
        
        //stackview 사이의 여백 사이즈 설정
        self.stackView.setCustomSpacing(10, after: self.titleImageView)
        self.stackView.setCustomSpacing(46, after: self.descriptionLabel)
        self.stackView.setCustomSpacing(60, after: self.loginButton)
        
        let constrait =  self.stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        //키보드 처리시 가변적인 contraints 주기위해 상수로 처리. 초기화 값은 중앙으로 설정
        
        NSLayoutConstraint.activate([ // NSLayout 활성화.
            //stackview는 leading,trailing, vertical 값 설정
            self.stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
            self.stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50),
            constrait, //미리 선언해둔 constaints로 설정. 추후 변동 가능
            
            //이미지 크기 설정
            self.titleImageView.widthAnchor.constraint(equalToConstant: 60),
            self.titleImageView.heightAnchor.constraint(equalToConstant: 60),
            
            // leading, trailing, 높이 설정.
            self.idTextField.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor),
            self.idTextField.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor),
            self.idTextField.heightAnchor.constraint(equalToConstant: 40),
            
            //id textfield와 동일
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor),
            self.passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            //leading 만 설정했는데 이유있나?
            self.loginButton.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor),
            self.loginButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        //
        self.centerYConstaits = constrait
        
        //tapgesture에 대한 공부 필요.
        //viewDidTap 함수 호출 될시 editing 종료됨.
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewDidTap))
        self.view.addGestureRecognizer(tapGesture)
        
        //addTarget 함수에 대한 공부 필요.
        self.loginButton.addTarget(self, action: #selector(loginBtnPressed), for: .touchUpInside)
        
        
        
    } ///viewDidLoad
    
    //언제 호출되는지 공부필요.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification,object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification,object: nil)
    }
    
    
    @objc func viewDidTap(gesture: UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: Notification){
        guard let userInfo = notification.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
              let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else {
            return
        }
        
        let keyboardHeight = keyboardFrame.height
        
        UIView.animate(withDuration: duration) {
            [self.titleImageView, self.descriptionLabel, self.TitleLabel,self.signupButton].forEach{view in view.alpha = 0}
            self.centerYConstaits?.constant = -keyboardHeight
            self.view.layoutIfNeeded()
        }
    }
    @objc func keyboardWillHide(notification: Notification){
        guard let userInfo = notification.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
              let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else {
            return
        }
        
        UIView.animate(withDuration: duration) {
            [self.titleImageView, self.descriptionLabel, self.TitleLabel,self.signupButton].forEach{view in view.alpha = 1}
            
            self.centerYConstaits?.constant = 0
            UIView.animate(withDuration: duration) {
            self.centerYConstaits?.constant = 0
            self.view.layoutIfNeeded()
            }
        }

        print(keyboardFrame)
        print(duration)
    }
    
    @objc func loginBtnPressed(sender: Any){
        let nav = UINavigationController()
        nav.modalPresentationStyle = .fullScreen
        nav.navigationBar.backgroundColor = UIColor.white
        nav.navigationBar.tintColor = UIColor(w: 242)
        let controller = MainViewController()
        nav.viewControllers = [controller]
        self.present(nav, animated: true, completion: nil)
    }

    
}
