// import React from 'react';
// import '../App.css';

class Game extends React.Component {
  constructor(props, context) {
     super(props, context);
     this.state = {
        gameHolder: props.gameHolder,
        game:       props.gameHolder.game,
        playerName: props.gameHolder.player_name
     };
  }
  componentDidMount(){}
  render() {
     return (
        <div>
           <h1>{this.state.gameHolder}</h1>
           <h1>{this.state.game}</h1>
           <h1>{this.state.playerName}</h1>
        </div>
     )
  }
}

// export default Game;
