import CommentList from '../components/CommentList';
import CommentForm from '../components/CommentForm';

import React, { PropTypes } from 'react';
import _ from 'lodash';
import ReactDOM from 'react-dom';
import NotificationSystem from 'react-notification-system';

export default class CommentBoxWidget extends React.Component {

  static propTypes = {
    // If you have lots of data or action properties, you should consider grouping them by
    // passing two properties: "data" and "actions".
    itemId: PropTypes.number,
    itemType: PropTypes.string,
    url: PropTypes.string
  };
  constructor(props,context) {
    super(props,context);
    this.state = {
      itemId: this.props.itemId,
      itemType: this.props.itemType,
      showComments: false,
      showCommentForm: false,
      comments: [],
      _notificationSystem: null,
      allowHTML: true,
      notSignedIn: {
        title: 'Sorry!',
        message: "It doesn't look like you have permissions to perform that.",
        level: 'error',
        position: 'bl',
        children: (
          <a className="btn btn-sm btn-danger" href="/users/sign_in">Sign In</a>
        )
      },
      postSuccessful: {
        title: 'Thanks!',
        message: "Your comment has been successfully posted. Thanks!",
        level: 'success',
        position: 'bl',
      },
      postFailed: {
        title: "Oh Snap!",
        message: "Sorry for the inconvenience. Feel free to retry your action, or contact us at <b>admin@wordsandmoves.com</b>.",
        level: 'error',
        position: 'bl'
      }
    };
    this.loadCommentsFromServer = this.loadCommentsFromServer.bind(this) // Needed so these methods can change component's state
    this.showComments = this.showComments.bind(this)
    this.hideComments = this.hideComments.bind(this)
    this.showCommentForm = this.showCommentForm.bind(this)
    this.hideCommentForm = this.hideCommentForm.bind(this)
    this.onCommentSubmit = this.onCommentSubmit.bind(this)
    this.addComment = this.addComment.bind(this)
    this._addNotification = this._addNotification.bind(this)
    this._notificationSystemInstance = this._notificationSystemInstance.bind(this)
  }

  // Pull down all comments and adds them to the state
  componentDidMount() {
    this.loadCommentsFromServer();
    this.intervalId = setInterval(this.loadCommentsFromServer, 2000);
    this._notificationSystem = this.refs.notificationSystem;
  }

  componentWillUnmount() {
    this.serverRequest.abort();
    clearInterval(this.intervalId);
  }

  // Makes ajax call to server to retrieve comments for post/event
  loadCommentsFromServer() {
    this.serverRequest = $.get(this.props.url + ".json", function (result) {
      var comments = result;
      console.log(comments);
      this.setState({
        comments: comments
      });
    }.bind(this));
  }

  // TODO: This is currently not implemented yet
  deleteComment(r, c) {
    this.props.deleteComment(r, c);
  }

  // This is used to enable the displaying of the comments
  showComments() {
    console.log("showing comments");
    this.setState({ showComments: true });
  }
  // This is used to disable the displaying of the comments
  hideComments() {
    console.log("hiding comments");
    this.setState({ showComments: false });
  }

  // This is used to enable the displaying of the new comment form
  showCommentForm() {
    console.log("showing comments form");
    this.setState({ showCommentForm: true });
  }

  // This is used to disable the displaying of the new comment form
  hideCommentForm() {
    console.log("hiding comments form");
    this.setState({ showCommentForm: false });
  }

  _notificationSystemInstance() {
    return this._notificationSystem;
  }

  _addNotification(postType) {
    this._notificationSystem.addNotification(postType);
  }

  // Handler method for when submit button is clicked. Calls addComment()
  onCommentSubmit(newComment) {
    var index = this.state.itemId;
    var type = this.state.itemType;
    console.log('add comment %s: to %s number %d', newComment["text"], type, index);
    this.addComment(newComment["text"], index, type);
  }

  // Makes ajax call to create comment and update state
  addComment(text, id, type) {
    var newComment = {text: text, item_id: id, item_type: type}
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      type: 'POST',
      data: newComment,
      success: function(data) {
        var commentsArr = this.state.comments.slice();
        commentsArr.push(data);
        console.log(commentsArr);
        this.setState({
          comments: commentsArr,
          alertType: "success",
        });
        this._addNotification(this.state.postSuccessful);
      }.bind(this),
      error: function(xhr, status, err) {
        this.setState({
          alertType: "danger",
        });
        if(err.toString() === "Unauthorized") {
          this._addNotification(this.state.notSignedIn);
        }
        else {
          this._addNotification(this.state.postFailed);
        }
        console.error("/comments", status, err.toString());
      }.bind(this)
    });
    console.log(this.state.comments);
  }


  render() {
    return (
        <div className="">
          { <NotificationSystem notifications={ this._notificationSystemInstance } ref="notificationSystem" allowHTML={ this.state.allowHTML } /> }
          { this.state.showAlert ? <DismissableAlert handleAlertDismiss={this.hideAlerts} text={this.state.alertText} type={this.state.alertType} /> : null }


          { this.state.showComments ? <button className="btn btn-primary" onClick={this.hideComments}>Hide <span className="glyphicon glyphicon-comment" /></button> : <button className="btn btn-warning" onClick={this.showComments}>Show All <span className="glyphicon glyphicon-comment" /></button> }
          { this.state.showCommentForm ? <button className="btn btn-primary" onClick={this.hideCommentForm}>Hide <span className="glyphicon glyphicon-pencil" /></button> : <button className="btn btn-warning" onClick={this.showCommentForm}>Add Comment <span className="glyphicon glyphicon-pencil" /></button> }

          { this.state.showComments ? <CommentList comments={this.state.comments} data={this.state} deleteComment={this.deleteComment} /> : null }
          { this.state.showCommentForm ? <CommentForm onCommentSubmit={this.onCommentSubmit} itemNum={this.props.itemId} /> : null }
        </div>
    );
  }
}
