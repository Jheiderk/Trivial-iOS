//
//  ViewController.swift
//  Trivial
//
//  Created by Mañanas on 8/5/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var cheese1: UIImageView!
    @IBOutlet weak var cheese2: UIImageView!
    @IBOutlet weak var cheese3: UIImageView!
    @IBOutlet weak var cheese4: UIImageView!
    @IBOutlet weak var heart1: UIImageView!
    @IBOutlet weak var heart2: UIImageView!
    @IBOutlet weak var heart3: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    var categories = ["Geografía", "Arte y Literatura", "Historia", "Entretenimiento"]
    var currentQuestions: [Question] = []
    var currentCategory: String?
    var cheese: Int = 0
    
    var heart: Int = 4
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Configurar la tabla
        tableView.dataSource = self
        tableView.delegate = self
        
        initView()
        
    }
    
    func initView(){
        
        cheese1.isHidden = true
        cheese2.isHidden = true
        cheese3.isHidden = true
        cheese4.isHidden = true
        heart1.isHidden = false
        heart2.isHidden = false
        heart3.isHidden = false
        
        
        
    }
    @IBAction func change(_ sender: Any) {
        // Obtener una nueva categoría aleatoria
        
        
        restartGame()
        getNextCategory()
    }
    
    func restartGame() {
        // Reiniciar todas las variables y propiedades a su estado inicial
        cheese = 0
        heart = 4
        currentQuestions = []
        currentCategory = nil
        
        initView()
        
        button.isHidden = true
        button.isEnabled = false
        // Reiniciar la lista de categorías
        categories = ["Geografía", "Arte y Literatura", "Historia", "Entretenimiento"]
        
        // Reiniciar la tabla y la etiqueta de pregunta
        
        tableView.reloadData()
    }
    
    
    func getRandomQuestion(category: String) -> Question? {
            guard let questions = questionsByCategory[category] else {
                return nil
            }
            return questions.randomElement()
        }
    
    
    func getNextCategory() {
        guard let category = categories.randomElement(),
              let questions = questionsByCategory[category] else {
            // Si no quedan categorías o preguntas, el juego ha terminado
            print("¡Juego completado!")
            return
        }
        
        currentCategory = category
        currentQuestions = questions
        categories.removeAll { $0 == category }
        
        // Obtener una pregunta aleatoria de la categoría seleccionada y mostrarla
        if let randomQuestion = getRandomQuestion(category: category) {
            currentQuestions = [randomQuestion] // Establecer la pregunta aleatoria como la única pregunta actual
            displayQuestion(question: randomQuestion)
        }
    }

    
    func displayQuestion(question: Question) {
        questionLabel.text = question.questionText
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard currentQuestions.indices.contains(section) else {
            return 0
        }
        return currentQuestions[section].answers.count
    }
      
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnswerCell", for: indexPath) as! AnswerCell
        
        // Verificar si indexPath.section está dentro del rango de índices válidos para currentQuestions
        if indexPath.section < currentQuestions.count {
            let question = currentQuestions[indexPath.section]
            
            // Verificar si indexPath.row está dentro del rango de índices válidos para las respuestas de la pregunta
            if indexPath.row < question.answers.count {
                let answer = question.answers[indexPath.row]
                cell.titleLabel.text = answer.text
            } else {
                // Si está fuera del rango, mostrar un texto de placeholder
                cell.titleLabel.text = "Respuesta no disponible"
            }
        } else {
            // Si está fuera del rango, mostrar un texto de placeholder
            cell.titleLabel.text = "Pregunta no disponible"
        }
        
        return cell
    }




      
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Verificar si indexPath.section está dentro del rango de índices válidos para currentQuestions
        guard indexPath.section < currentQuestions.count else {
            return
        }
        
        let selectedQuestion = currentQuestions[indexPath.section]
        let correctAnswer = selectedQuestion.answers[indexPath.row] // Aquí usamos indexPath.row para obtener la respuesta seleccionada
        if correctAnswer.isCorrect {
            // Aquí puedes manejar la lógica cuando el usuario selecciona la respuesta correcta
            currentQuestions.remove(at: indexPath.section)
            
            
            if (heart >= 0){
               
                getCheese()
                getNextCategory()
            } else {
                
                
            }
            
        } else {
            // Aquí puedes manejar la lógica cuando el usuario selecciona una respuesta incorrecta
            heartLoose()
            
        }
    }
    
    func heartLoose(){
        heart -= 1
        
        switch heart {
        case 3:
            heart1.isHidden = true
        case 2:
            heart2.isHidden = true
        case 1:
            heart3.isHidden = true
        case 0:
            
            button.isHidden = false
            button.isEnabled = true
            performSegue(withIdentifier: "WinOrLoose", sender: nil)
        default:
            break
        }
    }
    
    
    func getCheese() {
        cheese += 1
        
        
        switch cheese {
        case 1:
            cheese1.isHidden = false
        case 2:
            cheese2.isHidden = false
        case 3:
            cheese3.isHidden = false
        case 4:
            cheese4.isHidden = false
            
            button.isHidden = false
            button.isEnabled = true
            performSegue(withIdentifier: "WinOrLoose", sender: nil)
        default:
            break
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "WinOrLoose" {
            // Verificar si el jugador ganó o perdió el juego y asignar el valor correspondiente al booleano win en la próxima pantalla
            if cheese == 4 {
                if let destinationVC = segue.destination as? ViewControllerWinOrLoose {
                    destinationVC.win = true
                }
            } else {
                if let destinationVC = segue.destination as? ViewControllerWinOrLoose {
                    destinationVC.win = false
                }
            }
        }
    }



    
}

class AnswerCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    // Agrega más outlets según sea necesario
    
}

