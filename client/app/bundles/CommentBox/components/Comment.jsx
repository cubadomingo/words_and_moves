import React, { PropTypes } from 'react';

// Simple example of a React "dumb" component
export default class Comment extends React.Component {
  static propTypes = {
    // If you have lots of data or action properties, you should consider grouping them by
    // passing two properties: "data" and "actions".
    data: PropTypes.object,
    index: PropTypes.number,
  };

  constructor(props) {
    super(props);
    this.state = {
      author: '', 
      text: ''
    };
  }

  componentDidMount() {
    this.serverRequest = $.get("/user/" + this.props.data.user_id + ".json", function (result) {
      var lastGist = result;
      console.log(lastGist);
      this.setState({
        author: lastGist.username,
        text: this.props.data.body
      });
    }.bind(this));
  }

  componentWillUnmount() {
    this.serverRequest.abort();
  }


  render() {
    const { index, data } = this.props;
    console.log(data.comments);
    return (
      <div className="row">
        <strong>{this.state.author}: </strong>{this.state.text}
      </div>
    );
  }
}
