//
//  Questions&Answer.swift
//  Trivial
//
//  Created by Mañanas on 8/5/24.
//

import Foundation

// Definición de la estructura de la pregunta
struct Question {
    let questionText: String
    let answers: [Answer]
}

struct Answer {
    let isCorrect: Bool
    let text: String
}





// Almacenamiento de las preguntas por categoría en un diccionario

var questionsByCategory: [String: [Question]] = [
    "Geografía": [
        Question(
            questionText: "¿Cuál es el país más grande del mundo?",
            answers: [
                Answer(isCorrect: true, text: "Rusia"),
                Answer(isCorrect: false, text: "Estados Unidos"),
                Answer(isCorrect: false, text: "China"),
                Answer(isCorrect: false, text: "Canadá")
            ]
        ),
        Question(
            questionText: "¿Cuál es el lugar más frío de la tierra?",
            answers: [
                Answer(isCorrect: false, text: "Siberia"),
                Answer(isCorrect: true, text: "La Antártida"),
                Answer(isCorrect: false, text: "Groenlandia"),
                Answer(isCorrect: false, text: "Alaska")
            ]
        ),
        Question(
            questionText: "¿Dónde se encuentra el museo de Louvre?",
            answers: [
                Answer(isCorrect: true, text: "En París"),
                Answer(isCorrect: false, text: "Londres"),
                Answer(isCorrect: false, text: "Roma"),
                Answer(isCorrect: false, text: "Nueva York")
            ]
        ),
        Question(
            questionText: "¿Cuál es la capital de Nigeria?",
            answers: [
                Answer(isCorrect: false, text: "Lagos"),
                Answer(isCorrect: false, text: "Kano"),
                Answer(isCorrect: false, text: "Ibadan"),
                Answer(isCorrect: true, text: "Abuya")
            ]
        ),
        Question(
            questionText: "¿Cómo se llama el árbol del que sale la canela?",
            answers: [
                Answer(isCorrect: false, text: "Pino"),
                Answer(isCorrect: false, text: "Roble"),
                Answer(isCorrect: true, text: "Canelo"),
                Answer(isCorrect: false, text: "Olivo")
            ]
        ),
        // Puedes agregar más preguntas de geografía aquí...
    ],
    "Arte y Literatura": [
        Question(
            questionText: "¿Quién es el autor del libro 'Poeta en Nueva York'?",
            answers: [
                Answer(isCorrect: true, text: "Federico García Lorca"),
                Answer(isCorrect: false, text: "Pablo Neruda"),
                Answer(isCorrect: false, text: "Gabriel García Márquez"),
                Answer(isCorrect: false, text: "Octavio Paz")
            ]
        ),
        Question(
            questionText: "¿Quién es al autor de la obra 'Guernica'?",
            answers: [
                Answer(isCorrect: true, text: "Pablo Picasso"),
                Answer(isCorrect: false, text: "Vincent van Gogh"),
                Answer(isCorrect: false, text: "Leonardo da Vinci"),
                Answer(isCorrect: false, text: "Rembrandt")
            ]
        ),
        Question(
            questionText: "¿Cuál era el nombre artístico con el que firmaba Vincent Van Gogh sus obras?",
            answers: [
                Answer(isCorrect: false, text: "Pablo"),
                Answer(isCorrect: false, text: "Diego"),
                Answer(isCorrect: false, text: "Leonardo"),
                Answer(isCorrect: true, text: "Vincent")
            ]
        ),
        // Puedes agregar más preguntas de arte y literatura aquí...
    ],
    "Historia": [
        Question(
            questionText: "¿Quién mató a John F. Kennedy?",
            answers: [
                Answer(isCorrect: true, text: "Lee Harvey Oswald"),
                Answer(isCorrect: false, text: "Jack Ruby"),
                Answer(isCorrect: false, text: "Richard Nixon"),
                Answer(isCorrect: false, text: "Ted Cruz")
            ]
        ),
        Question(
            questionText: "¿En qué año se produjo la caída del Muro de Berlín?",
            answers: [
                Answer(isCorrect: true, text: "1989"),
                Answer(isCorrect: false, text: "1991"),
                Answer(isCorrect: false, text: "1985"),
                Answer(isCorrect: false, text: "1995")
            ]
        ),
        Question(
            questionText: "¿Dónde se firmó la Constitución española de 1812?",
            answers: [
                Answer(isCorrect: false, text: "Madrid"),
                Answer(isCorrect: false, text: "Barcelona"),
                Answer(isCorrect: false, text: "Valencia"),
                Answer(isCorrect: true, text: "Cádiz")
            ]
        ),
        // Puedes agregar más preguntas de historia aquí...
    ],
    "Entretenimiento": [
        Question(
            questionText: "¿En qué año se estrenó ‘Stranger Things’?",
            answers: [
                Answer(isCorrect: true, text: "2016"),
                Answer(isCorrect: false, text: "2014"),
                Answer(isCorrect: false, text: "2018"),
                Answer(isCorrect: false, text: "2020")
            ]
        ),
        Question(
            questionText: "¿Cuántos capítulos tiene ‘Breaking Bad’?",
            answers: [
                Answer(isCorrect: false, text: "50"),
                Answer(isCorrect: true, text: "62"),
                Answer(isCorrect: false, text: "75"),
                Answer(isCorrect: false, text: "100")
            ]
        ),
        Question(
            questionText: "¿Quién dirigió ‘Memorias de África’?",
            answers: [
                Answer(isCorrect: false, text: "Steven Spielberg"),
                Answer(isCorrect: false, text: "Quentin Tarantino"),
                Answer(isCorrect: false, text: "Martin Scorsese"),
                Answer(isCorrect: true, text: "Sydney Pollack")
            ]
        ),
        // Puedes agregar más preguntas de entretenimiento aquí...
    ]
]
	
