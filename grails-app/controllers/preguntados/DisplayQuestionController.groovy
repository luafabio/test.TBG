package preguntados

class DisplayQuestionController {

    def index() { 
		
		int[] auxArr = ranNumbers()
		renderQuestion(getQuestion(auxArr[0]))
	}
	
	def getQuestion(idQuestion){
		
		def questionAux = Question.get(idQuestion)
		return randomizeQuestion(questionAux)	
	}
	
	def renderQuestion(questionAux){
		
		[questionInstance: questionAux]
	}
	
	def isCorrectAnswer(Question questionInstance){
		def correctAnswer = Question.get(questionInstance.id).answer1
		System.out.println(correctAnswer)
	}
	
	def isCorrectAnswerA(Question questionInstance){
		System.out.println(questionIntance)
	}
	def randomizeQuestion(question){
		
		List<Integer> listQuestion = new LinkedList();
		listQuestion.add(question.answer1)
		listQuestion.add(question.answer2)
		listQuestion.add(question.answer3)
		
		Collections.shuffle(listQuestion);
		
		question.answer1 = listQuestion.get(0)
		question.answer2 = listQuestion.get(1)
		question.answer3 = listQuestion.get(2)
		
		return question
	}
	
	def ranNumbers(){
		
		int cap = Question.count()
		int rng = (int)(Math.random()*cap + 1)
		int[] rngArr = new int[cap]
		
		
		
		rngArr[0] = rng
		for (int i = 0; i <= (cap-1); i++){
			rng = (int)(Math.random()* cap + 1)
			
			for (int j = 0; j <= i; j++){
				if (rngArr[j] == rng){
					--i
					break
				}
				if (j == i) rngArr[i] = rng
			}
		}
		return rngArr
	}	
}