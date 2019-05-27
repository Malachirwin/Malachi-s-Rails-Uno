class Requests extends React.Component {
  constructor(props, context) {
     super(props, context);
     this.state = {
     };
  }

  onSubmit() {
    fetch("/sessions/user", {
      type: "GET",
      dataType: "json",

    }).then(data => data.json())
    .then(data => {
      console.log(data)
      alert(data.name)
    })
  }
  render() {
     return (
        <div>
          <h1 onClick={this.onSubmit.bind(this)}>Click</h1>
        </div>
     )
  }
}
