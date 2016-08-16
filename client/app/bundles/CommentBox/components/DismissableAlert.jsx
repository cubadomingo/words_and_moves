import React, { PropTypes } from 'react';
import _ from 'lodash';

// Simple example of a React "dumb" component
export default class DismissableAlert extends React.Component {  
  static propTypes = {
    // If you have lots of data or action properties, you should consider grouping them by
    // passing two properties: "data" and "actions".
    text: PropTypes.string.isRequired,
    type: PropTypes.string.isRequired,
  };

  constructor(props) {
    super(props);
    this.state = {

    };
    this._handleAlertDismiss = this._handleAlertDismiss.bind(this)
    this._parseErrorMessage = this._parseErrorMessage.bind(this)
    this._getAlternateActionText = this._getAlternateActionText.bind(this)
    this._getAlternateActionAddress = this._getAlternateActionAddress.bind(this)
    this._getAlertTitle = this._getAlertTitle.bind(this)
    this._getAlertClass = this._getAlertClass.bind(this)

  }

  _handleAlertDismiss() {
    this.props.handleAlertDismiss();
  }

  _parseErrorMessage(text) {
    if(text === "Unauthorized") {
      return "You must be signed in to the perform this action."
    } else if(text === "success") {
      return "Thank you for posting a comment."
    } else {
      return "Sorry for the inconvenience. Feel free to retry your action, or contact us at admin@wordsandmoves.com."
    }
  }

  _getAlertTitle(text) {
    if(text === "success") {
      return "Thanks!"
    } else {
      return "Oh snap! Something went wrong!"
    }
  }

  _getAlternateActionText(text) { 
    if(text === "Unauthorized") {
      return "Sign in"
    }
  }

  _getAlternateActionAddress(text) {
    if(text === "Unauthorized") {
      return '/users/sign_in'
    }
  }

  _getAlertClass(type) {
    return 'alert alert-' + type;
  }

  render() {
    var text = this._parseErrorMessage(this.props.text);
    var title = this._getAlertTitle(this.props.text);
    var altActionText = this._getAlternateActionText(this.props.text);
    var altActionAddress = this._getAlternateActionAddress(this.props.text);
    var type = this.props.type;
    return (
      <div className={this._getAlertClass(type)} >
        <h4>{title}</h4>
        <p>{text}</p>
        <p>
          {altActionAddress != null ? <a className="btn btn-sm btn-primary" href={altActionAddress}>{altActionText}</a> : null }
          <button className="btn btn-sm btn-danger" onClick={this._handleAlertDismiss}>Close</button>
        </p>
      </div>
    );
  }
}