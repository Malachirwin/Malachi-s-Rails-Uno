// import React from 'react';
// import '../App.css';

class Game extends React.Component {
  constructor(props, context) {
     super(props, context);
     this.state = {
       scoreX: 0,
       scoreO: 0,
       winner: "",
       winnerBoolean: false,
       value: "O",
       alternate: "X",
       startingValue: "O",
       nextStartingValue: "X",
       one: "",
       two: "",
       three: "",
       four: "",
       five: "",
       six: "",
       seven: "",
       eight: "",
       nine: ""
     };
  }

  value(name){
    return this.state[name]
  }

  winner(first, second, third) {
    if(first === second && second === third && first !== "" && this.state.winnerBoolean === false) {
      let hash = {winner: first, winnerBoolean: true}
      hash[`score${first}`] = (this.state[`score${first}`] + 1)
      this.setState(hash)
    }
  }

  submitValue(name) {
    if(this.value(name) === "" && this.state.winnerBoolean === false) {
      let hash = {value: this.state.alternate, alternate: this.state.value}
      hash[name] = this.state.value
      this.setState(hash)
      document.querySelector(`#${name}`).classList.add('less-margin-bottom')
    }
  }

  // onSubmit() {
  //   fetch("/sessions/user", {
  //     type: "GET",
  //     dataType: "json",
  //
  //   }).then(data => data.json())
  //   .then(data => {
  //     console.log(data)
  //     alert(data.name)
  //   })
  // }
  componentDidUpdate() {
    this.winner(this.value("one"), this.value("two"), this.value("three"))
    this.winner(this.value("one"), this.value("four"), this.value("seven"))
    this.winner(this.value("one"), this.value("five"), this.value("nine"))
    this.winner(this.value("four"), this.value("five"), this.value("six"))
    this.winner(this.value("seven"), this.value("eight"), this.value("nine"))
    this.winner(this.value("two"), this.value("five"), this.value("eight"))
    this.winner(this.value("three"), this.value("six"), this.value("nine"))
    this.winner(this.value("three"), this.value("five"), this.value("seven"))
  }

  reset() {
    this.setState({
      winner: "",
      winnerBoolean: false,
      value: this.state.nextStartingValue,
      alternate: this.state.startingValue,
      startingValue: this.state.nextStartingValue,
      nextStartingValue: this.state.startingValue,
      one: "",
      two: "",
      three: "",
      four: "",
      five: "",
      six: "",
      seven: "",
      eight: "",
      nine: ""
    })
  }

  renderWinner(){
    if(this.state.winnerBoolean === true) {
      return (
        <div>
          <h1>{`${this.state.winner} is the winner`}</h1>
          <h1 onClick={() => this.reset()}>Reset</h1>
        </div>
      )
    }else{
      return (
        <div>
          <h1>{`${this.state.value}'s turn`}</h1>
          <h1 className="blank"></h1>
        </div>
      )
    }
  }
  render() {
     return (
        <div className="holder">
        <h1>{`Score O: ${this.state.scoreO}, X: ${this.state.scoreX}`}</h1>
        {this.renderWinner()}
        <table className="game" id="board">
          <tbody>
            <tr className="game-row">
              <td id="one" className="game-column" onClick={() => this.submitValue("one")}><p>{this.value("one")}</p></td>
              <td id="two" className="game-column" onClick={() => this.submitValue("two")}><p>{this.value("two")}</p></td>
              <td id="three" className="game-column" onClick={() => this.submitValue("three")}><p>{this.value("three")}</p></td>
            </tr>
            <tr className="game-row">
              <td id="four" className="game-column" onClick={() => this.submitValue("four")}><p>{this.value("four")}</p></td>
              <td id="five" className="game-column" onClick={() => this.submitValue("five")}><p>{this.value("five")}</p></td>
              <td id="six" className="game-column" onClick={() => this.submitValue("six")}><p>{this.value("six")}</p></td>
            </tr>
            <tr className="game-row">
              <td id="seven" className="game-column" onClick={() => this.submitValue("seven")}><p>{this.value("seven")}</p></td>
              <td id="eight" className="game-column" onClick={() => this.submitValue("eight")}><p>{this.value("eight")}</p></td>
              <td id="nine" className="game-column" onClick={() => this.submitValue("nine")}><p>{this.value("nine")}</p></td>
            </tr>
          </tbody>
        </table>
        </div>
     )
  }
}
  // <h1>{this.state.gameHolder}</h1>
  // <h1>{this.state.game}</h1>
  // <h1>{this.state.playerName}</h1>
// export default Game;
