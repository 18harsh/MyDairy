import UIKit

class MDCardViewController: UIViewController, UITextViewDelegate {
    
    // Create the placeholder label
    private let placeholderLabel: UILabel = {
        let label = UILabel()
        label.text = "Tell us about your day..." // Placeholder text
        label.font = UIFont.systemFont(ofSize: 16) // Same font as the text view
        label.textColor = UIColor.lightGray // Placeholder color
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let textView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 16) // Font size for the text
        textView.layer.borderWidth = 0 // Set border width for visibility
        textView.layer.cornerRadius = 8 // Rounded corners
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // Set up today's date as the title
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        let today = dateFormatter.string(from: Date())
        title = today

        // Add a back button to the navigation bar
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backButtonTapped))
        
        // Set the text view delegate
        textView.delegate = self

        // Add the text view to the view hierarchy
        setupTextView()
        
        // Add the placeholder label to the view hierarchy
        setupPlaceholderLabel()

        // Initially hide the placeholder label if the text view is not empty
        updatePlaceholderVisibility()
    }

    private func setupTextView() {
        view.addSubview(textView)

        // Set up constraints for the text view
        NSLayoutConstraint.activate([
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16), // Padding from the left
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16), // Padding from the right
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8), // Below the navigation bar
            textView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height - 200 - (view.safeAreaInsets.top + view.safeAreaInsets.bottom)) // Adjust height
        ])
    }

    private func setupPlaceholderLabel() {
        view.addSubview(placeholderLabel)

        // Set up constraints for the placeholder label
        NSLayoutConstraint.activate([
            placeholderLabel.leadingAnchor.constraint(equalTo: textView.leadingAnchor, constant: 5), // Padding from the left
            placeholderLabel.topAnchor.constraint(equalTo: textView.topAnchor, constant: 8), // Padding from the top
        ])
    }

    @objc func backButtonTapped() {
        // Dismiss the view controller when back button is tapped
        dismiss(animated: true, completion: nil)
    }

    // UITextViewDelegate methods
    func textViewDidBeginEditing(_ textView: UITextView) {
        updatePlaceholderVisibility() // Update placeholder visibility when editing begins
    }

    func textViewDidChange(_ textView: UITextView) {
        updatePlaceholderVisibility() // Update placeholder visibility when text changes
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        updatePlaceholderVisibility() // Update placeholder visibility when editing ends
    }

    // Method to update the visibility of the placeholder
    private func updatePlaceholderVisibility() {
        placeholderLabel.isHidden = !textView.text.isEmpty
    }
}
