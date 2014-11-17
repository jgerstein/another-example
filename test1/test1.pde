int leftX, leftY, rightX, rightY,paddleW,paddleH;
int x, y, radius;
int margin = 15;
int speedX = 1;
int speedY = 1;
int score1, score2;

void setup(){
	size(600,400);
	paddleW = 15;
	paddleH = 80;
	leftX = margin;
	rightX = width - paddleW - margin;
	leftY = height/2 - paddleH/2;
	rightY = height/2 - paddleH/2;
	x = width/2;
	y = height/2;
	radius = 15;
	textSize(50);
}

void draw(){
	background(0);																//redraw background
	text(score1, 100, 50);														//display player 1's score
	text(score2, width-100, 50);												//display player 2's score
	leftY = mouseY - paddleH/2;													//assign leftY a new value based on mouseY
	ellipse(x, y, radius*2, radius*2);											//draw an ellipse to represent the ball
	rect(leftX, leftY, paddleW, paddleH);										//draw left paddle
	rect(rightX, rightY, paddleW, paddleH);										//draw right paddle
	x+=speedX;																	//update x coordinate of ball
	y+=speedY;																	//update y coordinate of ball

	if(x + radius > width){														//if right side of ball touches right wall...
		x = width/2;															//...move ball to middle of screen
		score1++;																//...and increase player 1's score
	}

	if(x - radius < 0){															//if left side of ball touches left wall...
		x = width/2;															//...move ball to middle of screen
		score2++;																//...and increase player 2's score
	}

	if(y + radius > height || y - radius < 0){									//if edge of ball touches top or bottom...
		speedY *= -1;															//...reverse sign of speedY so ball moves the other way
	}

	if(keyPressed){																//if a key is pressed...
		if(key == 'w' || (key == CODED && keyCode == UP)){						//...and that key is either w or the up arrow...
			rightY--;															//...decrease value of rightY so right paddle moves up
		}
		if(key == 'a' || (key == CODED && keyCode == DOWN)){					//...and that key is either a or the down arrow...
			rightY++;															//...increase value of right Y so right paddle moves down
		}
	}

	if(x - radius < leftX + paddleW && y > leftY && y < leftY + paddleH){		//if the ball is touching the left paddle...
		speedX = abs(speedX);													//...assign speedX a positive value
	}
	if(x + radius > rightX && y > rightY && y < rightY + paddleH){				//if the ball is touching the right paddle...
		speedX = -abs(speedX);													//...assign speedX a negative value
	}
}