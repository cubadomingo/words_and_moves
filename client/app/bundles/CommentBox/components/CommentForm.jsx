import React, { PropTypes } from 'react';

// Simple example of a React "dumb" component
export default class CommentForm extends React.Component {
  static propTypes = {
    // If you have lots of data or action properties, you should consider grouping them by
    // passing two properties: "data" and "actions".
    message: PropTypes.string,
  };

  constructor(props,context) {
    super(props,context);
    this.state = {
      text: ""
    };
    this._handleTextChange = this._handleTextChange.bind(this)
    this._handleSubmit = this._handleSubmit.bind(this)
  }

  _handleTextChange(e) {
    this.setState({text: e.target.value});
  }

  _handleSubmit(e) {
    e.preventDefault();
    var text = this.state.text.trim();
    if (!text) {
      return;
    }
    // Need to update this method
    this.props.onReactionSubmit({text: text}, this.props.itemNum)
    this.setState({text: ''});
  }

  render() {
    return (
      <div className="row">
        <div className="col-md-1"></div>
        <div className="col-md-5">
          <h3>Post Comment</h3>
          <form onSubmit={this._handleSubmit}>
            <input
              className="form-control"
              type="text"
              placeholder="Say something..."
              value={this.state.text}
              onChange={this._handleTextChange}
            />
            <input className="btn btn-md btn-primary" type="submit" value="Post" />
          </form>
        </div>
      </div>
    );
  }
}
