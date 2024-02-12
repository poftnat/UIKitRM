// AddBirthdayViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер добавления новой записи в дни рождения
class AddBirthdayViewController: UIViewController {
    // MARK: - Private Properties

    private let maxAge = 130
    private let genders = ["Male", "Female"]
    weak var delegate: TransferDataDelegate?

    // MARK: - Visual Components

    /// Кнопка выхода с экрана
    private lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 20, y: 15, width: 50, height: 20)
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(.skyBlue, for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 14)
        button.addTarget(self, action: #selector(dismissScreen), for: .touchUpInside)
        return button
    }()

    /// Кнопка добавления заполненной записи
    private lazy var addNoteButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 325, y: 15, width: 30, height: 20)
        button.setTitle("Add", for: .normal)
        button.setTitleColor(.skyBlue, for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 14)
        button.addTarget(self, action: #selector(addBirthdayNote), for: .touchUpInside)
        return button
    }()

    /// Аватар для созданной записи
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 125, y: 66, width: 125, height: 125)
        imageView.layer.cornerRadius = 24
        imageView.image = UIImage(named: "avatar_template")
        return imageView
    }()

    /// Кнопка для смены аватара
    private lazy var changePhotoButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 125, y: 199, width: 125, height: 20)
        button.setTitle("Change photo", for: .normal)
        button.setTitleColor(.skyBlue, for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 16)
        return button
    }()

    /// Заголовок для текстфилда ввода имени
    private lazy var nameTitleLabel = UILabel(
        frame: CGRect(x: 20, y: 239, width: 175, height: 19),
        text: "Name Surname",
        font: "Verdana-Bold",
        fontSize: 16,
        textColor: nil,
        alignment: nil
    )
    /// Текстфилд для ввода имени
    private lazy var nameTextField: UITextField = {
        let textfield = UITextField()
        textfield.frame = CGRect(x: 20, y: 268, width: 250, height: 17)
        textfield.placeholder = "Typing Name Surname"
        birthdayTextField.inputView = datePicker
        return textfield
    }()

    /// Заголовок для текстфилда даты рождения
    private lazy var birthdayTitleLabel = UILabel(
        frame: CGRect(x: 20, y: 314, width: 175, height: 19),
        text: "Birthday",
        font: nil,
        fontSize: 16,
        textColor: nil,
        alignment: nil
    )

    /// Текстфилд для ввода даты рождения
    private lazy var birthdayTextField: UITextField = {
        let textfield = UITextField()
        textfield.frame = CGRect(x: 20, y: 343, width: 250, height: 17)
        textfield.placeholder = "Typing Date of Birth"
        return textfield
    }()

    /// Пикер дня рождения
    private lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        datePicker.backgroundColor = .white
        datePicker.maximumDate = Date()
        return datePicker
    }()

    /// Тулбар для пикера дня рождения
    private lazy var datePickerToolbar: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(chooseBirthdayDate)
        )
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([flexSpace, doneButton], animated: true)
        return toolbar
    }()

    /// Заголовок для текстфилда возраста
    private lazy var ageTitleLabel = UILabel(
        frame: CGRect(x: 20, y: 389, width: 175, height: 19),
        text: "Age",
        font: nil,
        fontSize: 16,
        textColor: nil,
        alignment: nil
    )

    /// Текстфилд для ввода возраста
    private lazy var ageTextField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: 20, y: 418, width: 250, height: 17)
        textField.placeholder = "Typing age"
        textField.inputView = valuePicker
        return textField
    }()

    /// Пикер возраста и пола
    private lazy var valuePicker: UIPickerView = {
        let picker = UIPickerView()
        picker.tag = 0
        picker.backgroundColor = .white
        return picker
    }()

    /// Тулбар пикера возраста и пола
    private lazy var valuePickerToolbar: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let okButton = UIBarButtonItem(
            title: "Ок",
            style: .plain,
            target: self,
            action: #selector(closePicker)
        )
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([flexSpace, okButton], animated: true)
        return toolbar
    }()

    /// Заголовок для текстфилда пола
    private lazy var genderTitleLabel = UILabel(
        frame: CGRect(x: 20, y: 462, width: 175, height: 19),
        text: "Gender",
        font: nil,
        fontSize: 16,
        textColor: nil,
        alignment: nil
    )

    /// Текстфилд для ввода пола
    private lazy var genderTextField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: 20, y: 491, width: 250, height: 17)
        textField.placeholder = "Indicate Gender"
        textField.inputView = genderPicker
        return textField
    }()

    /// Пикер для выбора пола
    private lazy var genderPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.tag = 1
        picker.backgroundColor = .white
        return picker
    }()

    /// Заголовок для текстфилда ввода телеграма
    private lazy var telegramTitleLabel = UILabel(
        frame: CGRect(x: 20, y: 537, width: 175, height: 19),
        text: "Telegram",
        font: nil,
        fontSize: 16,
        textColor: nil,
        alignment: nil
    )

    /// Текстфилд для ввода телеграма
    private lazy var telegramTextField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: 20, y: 566, width: 250, height: 17)
        textField.placeholder = "Typing Telegram"
        return textField
    }()

    /// Алерт для ввода телеграм аккаунта
    private lazy var telegramInputAlert: UIAlertController = {
        let alertController = UIAlertController(title: "Please enter Telegram", message: nil, preferredStyle: .alert)
        let add = UIAlertAction(title: "Ok", style: .default) { _ in
            guard let accountName = alertController.textFields?[0].text else { return }
            self.telegramTextField.text = accountName
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(add)
        alertController.addAction(cancel)
        alertController.addTextField()
        alertController.textFields?[0].placeholder = "Typing Telegram"
        alertController.preferredAction = add
        return alertController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        valuePicker.dataSource = self
        valuePicker.delegate = self
        genderPicker.dataSource = self
        genderPicker.delegate = self
    }

    // MARK: - Private Methods

    /// метод установки вью на супервью
    private func setupUI() {
        view.backgroundColor = .white
        [
            cancelButton, addNoteButton, avatarImageView,
            changePhotoButton,
            nameTitleLabel,
            birthdayTitleLabel,
            genderTitleLabel,
            ageTitleLabel,
            telegramTitleLabel, nameTextField,
            birthdayTextField,
            ageTextField,
            genderTextField,
            telegramTextField
        ]
        .forEach { view.addSubview($0) }

        birthdayTextField.inputAccessoryView = datePickerToolbar

        ageTextField.inputAccessoryView = valuePickerToolbar

        genderTextField.inputAccessoryView = valuePickerToolbar

        telegramTextField.delegate = self

        setupBorders()
    }

    /// метод установки вью, отображающих серые границы между полями
    private func setupBorders() {
        var yPoint = 293
        for _ in 1 ... 5 {
            let borderView = UIView()
            borderView.frame = CGRect(x: 20, y: yPoint, width: 335, height: 1)
            borderView.backgroundColor = .lightGrayBorder
            view.addSubview(borderView)
            yPoint += 74
        }
    }

    /// Метод для кнопки закрытия экрана
    @objc private func dismissScreen() {
        dismiss(animated: true)
    }

    /// Метод для кнопки добавления записи о дате рождения в массив
    @objc private func addBirthdayNote() {
        let birthdayNote = BirthdayNoteModel(
            name: nameTextField.text ?? "No name",
            dateOfBirth: birthdayTextField.text ?? "No birthday date",
            currentAge: Int(ageTextField.text ?? "0") ?? 0,
            image: "photo_1",
            daysLeft: 144
        )

        delegate?.transfer(note: birthdayNote)
        dismiss(animated: true)
    }

    ///  Метод для передачи выбранной в датапикере даты в текстфилд
    @objc func chooseBirthdayDate() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        birthdayTextField.text = formatter.string(from: datePicker.date)
        view.endEditing(true)
    }

    /// Метод закрытия простого пикера
    @objc func closePicker() {
        view.endEditing(true)
    }
}

/// Расширения UIPickerView
extension AddBirthdayViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var result = ""
        switch pickerView.tag {
        case 0:
            result = "\(row)"
        case 1:
            result = "\(genders[row])"
        default:
            break
        }
        return result
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 0:
            ageTextField.text = String(row)
        case 1:
            genderTextField.text = genders[row]
        default:
            break
        }
    }
}

extension AddBirthdayViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var result = 0
        switch pickerView.tag {
        case 0:
            result = maxAge
        case 1:
            result = genders.count
        default:
            break
        }
        return result
    }
}

extension AddBirthdayViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        present(telegramInputAlert, animated: true)
    }
}
