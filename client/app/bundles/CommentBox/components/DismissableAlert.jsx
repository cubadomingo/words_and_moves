import React, { PropTypes } from 'react';
import _ from 'lodash';

export default class DismissableAlert extends React.Component {  
  static propTypes = {
    text: PropTypes.string.isRequired,
    type: PropTypes.string.isRequired,
  };

  constructor(props) {
    super(props);
    this.state = {

    };
    this._handleAlertDismiss = this._handleAlertDismiss.bind(this)
    this.parseErrorMessage = this.parseErrorMessage.bind(this)
    this.getAlternateActionText = this.getAlternateActionText.bind(this)
    this.getAlternateActionAddress = this.getAlternateActionAddress.bind(this)
    this.getAlertTitle = this.getAlertTitle.bind(this)
    this.getAlertClass = this.getAlertClass.bind(this)

  }

  // Handle dismissing alerts
  _handleAlertDismiss() {
    this.props.handleAlertDismiss();
  }

  // Parses the error message text into the proper message
  parseErrorMessage(text) {
    if(text === "Unauthorized") {
      return "You must be signed in to the perform this action."
    } else if(text === "success") {
      return "Thank you for posting a comment."
    } else {
      return "Sorry for the inconvenience. Feel free to retry your action, or contact us at admin@wordsandmoves.com."
    }
  }

  // Returns proper alert title based upon request text
  getAlertTitle(text) {
    if(text === "success") {
      return "Thanks!"
    } else {
      return "Oh snap! Something went wrong!"
    }
  }

  // Get's alternate action button text for requests
  getAlternateActionText(text) { 
    if(text === "Unauthorized") {
      return "Sign in"
    }
  }

  // Get's alternate action button url for requests
  getAlternateActionAddress(text) {
    if(text === "Unauthorized") {
      return '/users/sign_in'
    }
  }

  // Get's alert class by type of request text
  getAlertClass(type) {
    return 'alert alert-' + type;
  }

  render() {
    var text = this.parseErrorMessage(this.props.text);
    var title = this.getAlertTitle(this.props.text);
    var altActionText = this.getAlternateActionText(this.props.text);
    var altActionAddress = this.getAlternateActionAddress(this.props.text);
    var type = this.props.type;
    return (
      <div className={this.getAlertClass(type)} >
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