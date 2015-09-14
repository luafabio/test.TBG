package preguntados

class DisplayQuestionController {
	
	public static CurrentGame currentGame1 = new CurrentGame()
	public static CurrentQuestion currentQuestion1 = new CurrentQuestion()
	public static List<Question> allQuestion
	
	def index() { 
		setDB()
		renderQuestion(getQuestion())
	}
	
	def setDB(){
		
		currentGame1.numQuestion = 0
		currentGame1.score = 0
		allQuestion = Question.findAll()
		Collections.shuffle(allQuestion)
	}
	
	
	def nextQuestion(){
		renderQuestion(getQuestion())
	}
	
	def getQuestion(){
		currentGame1.numQuestion++
		if (currentGame1.numQuestion == 6){
			finalScore()
			render("Termino el juego    "+currentGame1.score)
			if (currentGame1.score > 5) render ("    has ganado")
		}
		else
			return randomizeQuestion(allQuestion.get(currentGame1.numQuestion))	
	}
	
	def renderQuestion(questionAux){
		render( view: "nextQuestion", model: [questionInstance: questionAux, gameInstance: currentGame1]) 		//renderiza una pregunta
		
	}
	
	def isCorrectAnswer(currentAnswer){ 
		if (currentAnswer == currentQuestion1.correctAns){
			addScore(true)
			currentQuestion1.statusQues = "Pregunta Correcta"
		} 
		else {
			addScore(false)
			currentQuestion1.statusQues = "Pregunta Incorrecta"
		}
			
		render( view: "resultQuestion", model: [currentInstance: currentQuestion1])	//renderiza el resultado de la pregunta
		
	}
	
	def isCorrectAnswerA(){
		isCorrectAnswer(currentQuestion1.answer1)
		
	}
	
	def isCorrectAnswerB(){
		isCorrectAnswer(currentQuestion1.answer2)
		
	}
	
	def isCorrectAnswerC(){
		isCorrectAnswer(currentQuestion1.answer3)
	
	}
	
	def randomizeQuestion(question){
		
		currentQuestion1.question = question.question				//Set current question
		currentQuestion1.correctAns = question.answer1				//Set correct answer
		
		List<Integer> listQuestion = new LinkedList()
		listQuestion.add(question.answer1)
		listQuestion.add(question.answer2)
		listQuestion.add(question.answer3)
		
		Collections.shuffle(listQuestion)
		
		currentQuestion1.answer1 = listQuestion.get(0)
		currentQuestion1.answer2 = listQuestion.get(1)
		currentQuestion1.answer3 = listQuestion.get(2)
		
		return currentQuestion1
		
	}
	
	def addScore(result){
		if (result) currentGame1.score++	
	}
	
	def finalScore(){
		if (currentGame1.score >= 3){
			currentGame1.score = currentGame1.score +5
			currentGame1.result = true
		}
		currentGame1.save()
	}
}