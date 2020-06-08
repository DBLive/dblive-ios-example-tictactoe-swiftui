//
//  TicTacToe.swift
//  DBLive-Example
//
//  Created by Mike Richards on 5/26/20.
//  Copyright © 2020 DBLive. All rights reserved.
//

import SwiftUI
import DBLive

class TicTacToe: ObservableObject {
	
	static let defaultBoard: [[TicTacToeSquare]] = [
		[TicTacToeSquare.emptySquare, TicTacToeSquare.emptySquare, TicTacToeSquare.emptySquare],
		[TicTacToeSquare.emptySquare, TicTacToeSquare.emptySquare, TicTacToeSquare.emptySquare],
		[TicTacToeSquare.emptySquare, TicTacToeSquare.emptySquare, TicTacToeSquare.emptySquare],
	]
	
	@Published var board: [[TicTacToeSquare]] = TicTacToe.defaultBoard
	
	private let dbLive = AppDelegate.instance.dbLive
	private let dbLiveKey = "tic-tac-toe-example"
	
	private var dbLiveKeyListener: DBLiveKeyEventListener!
	
	private var allSquares: [TicTacToeSquare] {
		get {
			var squares: [TicTacToeSquare] = []

			for i in 0 ..< 3 {
				squares.append(contentsOf: board[i])
			}

			return squares
		}
	}
	
	init() {
		dbLiveKeyListener = dbLive.getJsonAndListen(dbLiveKey) { [weak self] data in
			guard let this = self else { return }

			this.loadBoard(data ?? [:])
		}
	}
	
	func clear() {
		dbLive.set(dbLiveKey, value: [
			"board": [
				[" ", " ", " "],
				[" ", " ", " "],
				[" ", " ", " "]
			]
		])
	}
	
	func toggleSquare(row: Int, column: Int) {
		assert(row >= 0, "Invalid Tic-Tac-Toe Square")
		assert(row <= 2, "Invalid Tic-Tac-Toe Square")
		assert(column >= 0, "Invalid Tic-Tac-Toe Square")
		assert(column <= 2, "Invalid Tic-Tac-Toe Square")
		
		guard board[row][column].isEmpty else { return }
		
		let allSquares = self.allSquares
		let isXTurn = allSquares.filter { $0.isX }.count <= allSquares.filter { $0.isO }.count
		
		var boardJson = convertBoardToJson()
		boardJson[row][column] = isXTurn ? "X" : "O"
		
		dbLive.set(dbLiveKey, value: ["board": boardJson])
	}
	
	private func convertBoardToJson() -> [[String]] {
		var board: [[String]] = [[], [], []]
		
		for row in 0 ..< 3 {
			for column in 0 ..< 3 {
				board[row].append(self.board[row][column].text)
			}
		}
		
		return board
	}
	
	private func loadBoard(_ data: [String: Any]) {
		for row in 0 ..< 3 {
			for column in 0 ..< 3 {
				board[row][column] = TicTacToeSquare.from(json: data, row: row, column: column)
			}
		}
	}
	
	deinit {
		dbLiveKeyListener.isListening = false
	}
	
}

struct TicTacToeSquare {
	let text: String
	let color: Color
	
	var isEmpty: Bool {
		get { return !isX && !isO }
	}
	
	var isX: Bool {
		get { return text == "X" || text == "x" }
	}
	
	var isO: Bool {
		get { return text == "O" || text == "o" }
	}
	
	static var emptySquare: TicTacToeSquare {
		get { return TicTacToeSquare(text: " ", color: .black) }
	}
	
	static func from(json: [String: Any]?, row: Int, column: Int) -> TicTacToeSquare {
		guard let json = json, let board = json["board"] as? [[String?]] else { return emptySquare }
		
		guard row < board.count, column < board[row].count, let item = board[row][column] else { return emptySquare }
		
		return TicTacToeSquare(text: item, color: item == "X" || item == "x" ? .red : .black)
	}
}
