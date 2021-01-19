//
//  EntryDetailViewController.swift
//  JournalCoreData
//
//  Created by Daniel Villedrouin on 1/18/21.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var entryTitleTextField: UITextField!
    @IBOutlet weak var entryBodyTextView: UITextView!
    
    //MARK: - Properties
    
    var entry: Entry?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }

    
    //MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = entryTitleTextField.text, !title.isEmpty,
              let bodyText = entryBodyTextView.text else { return }
        
        if let entry = entry {
            EntryController.shared.updateEntry(entry: entry, title: title, bodyText: bodyText)
        }else {
            EntryController.shared.createEntryWith(title: title, bodyText: bodyText)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clearTextButtonTapped(_ sender: Any) {
        entryTitleTextField.text = ""
        entryBodyTextView.text = ""
    }

    func updateViews() {
        guard let entry = entry else { return }
        entryTitleTextField.text = entry.title
        entryBodyTextView.text = entry.bodyText
    }
    
}// end of class
