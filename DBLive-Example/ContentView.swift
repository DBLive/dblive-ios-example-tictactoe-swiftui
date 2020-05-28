//
//  ContentView.swift
//  DBLive-Example
//
//  Created by Mike Richards on 5/26/20.
//  Copyright © 2020 DBLive. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	
	private let squareSize = (UIScreen.main.bounds.width / 3) - 30

	@ObservedObject private var model = TicTacToe()
		
    var body: some View {
		List {
			Text("DBLive Example")
				.frame(width: UIScreen.main.bounds.width)
				.font(.largeTitle)
				.listRowInsets(EdgeInsets(top: 20, leading: 0, bottom: 30, trailing: 0))
			HStack {
				Text(model.board[0][0].text)
					.frame(width: squareSize)
					.foregroundColor(model.board[0][0].color)
					.font(.system(size: 120))
					.onTapGesture {
						self.model.toggleSquare(row: 0, column: 0)
					}
				Divider()
					.frame(width: 5, height: squareSize)
					.background(Color.black)
				Text(model.board[0][1].text)
					.frame(width: squareSize)
					.foregroundColor(model.board[0][1].color)
					.font(.system(size: 120))
					.onTapGesture {
						self.model.toggleSquare(row: 0, column: 1)
					}
				Divider()
					.frame(width: 5, height: squareSize)
					.background(Color.black)
				Text(model.board[0][2].text)
					.frame(width: squareSize)
					.foregroundColor(model.board[0][2].color)
					.font(.system(size: 120))
					.onTapGesture {
						self.model.toggleSquare(row: 0, column: 2)
					}
			}
				.frame(width: UIScreen.main.bounds.width, height: squareSize)
				.listRowInsets(EdgeInsets())
			Divider()
				.frame(width: UIScreen.main.bounds.width - 30, height: 5)
				.listRowInsets(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
				.background(Color.black)
			HStack {
				Text(model.board[1][0].text)
					.frame(width: squareSize)
					.foregroundColor(model.board[1][0].color)
					.font(.system(size: 120))
					.onTapGesture {
						self.model.toggleSquare(row: 1, column: 0)
					}
				Divider()
					.frame(width: 5, height: squareSize)
					.background(Color.black)
				Text(model.board[1][1].text)
					.frame(width: squareSize)
					.foregroundColor(model.board[1][1].color)
					.font(.system(size: 120))
					.onTapGesture {
						self.model.toggleSquare(row: 1, column: 1)
					}
				Divider()
					.frame(width: 5, height: squareSize)
					.background(Color.black)
				Text(model.board[1][2].text)
					.frame(width: squareSize)
					.foregroundColor(model.board[1][2].color)
					.font(.system(size: 120))
					.onTapGesture {
						self.model.toggleSquare(row: 1, column: 2)
					}
			}
				.frame(width: UIScreen.main.bounds.width, height: squareSize)
				.listRowInsets(EdgeInsets())
			Divider()
				.frame(width: UIScreen.main.bounds.width - 30, height: 5)
				.listRowInsets(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
				.background(Color.black)
			HStack {
				Text(model.board[2][0].text)
					.frame(width: squareSize)
					.foregroundColor(model.board[2][0].color)
					.font(.system(size: 120))
					.onTapGesture {
						self.model.toggleSquare(row: 2, column: 0)
					}
				Divider()
					.frame(width: 5, height: squareSize)
					.background(Color.black)
				Text(model.board[2][1].text)
					.frame(width: squareSize)
					.foregroundColor(model.board[2][1].color)
					.font(.system(size: 120))
					.onTapGesture {
						self.model.toggleSquare(row: 2, column: 1)
					}
				Divider()
					.frame(width: 5, height: squareSize)
					.background(Color.black)
				Text(model.board[2][2].text)
					.frame(width: squareSize)
					.foregroundColor(model.board[2][2].color)
					.font(.system(size: 120))
					.onTapGesture {
						self.model.toggleSquare(row: 2, column: 2)
					}
			}
				.frame(width: UIScreen.main.bounds.width, height: squareSize)
				.listRowInsets(EdgeInsets())
			HStack {
				Spacer()
				Button(action: {
					self.model.clear()
				}) {
					Text("New Game")
						.padding()
				}
					.border(Color.black, width: 2)
				Spacer()
			}
				.listRowInsets(EdgeInsets(top: 30, leading: 0, bottom: 30, trailing: 0))
		}
			.environment(\.defaultMinListRowHeight, 5)
			.onAppear(perform: {
				UITableView.appearance().separatorStyle = .none
			})
		
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		ContentView()
    }
}
