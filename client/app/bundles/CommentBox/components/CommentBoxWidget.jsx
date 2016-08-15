// HelloWorldWidget is an arbitrary name for any "dumb" component. We do not recommend suffixing
// all your dump component names with Widget.
import CommentList from '../components/CommentList';
import CommentForm from '../components/CommentForm';


import React, { PropTypes } from 'react';
import _ from 'lodash';

// Simple example of a React "dumb" component
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
      _showComments: false,
      _showCommentForm: false,
      comments: []
    };
    this._showComments = this._showComments.bind(this)
    this._hideComments = this._hideComments.bind(this)
    this._showCommentForm = this._showCommentForm.bind(this)
    this._hideCommentForm = this._hideCommentForm.bind(this)
    this._onCommentSubmit = this._onCommentSubmit.bind(this)
    this.addComment = this.addComment.bind(this)
    this.updateComments = this.updateComments.bind(this)
  }

  componentDidMount() {
    this.serverRequest = $.get(this.props.url + ".json", function (result) {
      var comments = result;
      console.log(comments);
      this.setState({
        comments: comments
      });
    }.bind(this));
  }

  componentWillUnmount() {
    this.serverRequest.abort();
  }

  _deleteComment(r, c) {
    this.props.deleteComment(r, c);
  }

  _showComments() {
    console.log("showing comments");
    this.setState({ _showComments: true });
  }

  _hideComments() {
    console.log("hiding comments");
    this.setState({ _showComments: false });
  }

  _showCommentForm() {
    console.log("showing comments form");
    this.setState({ _showCommentForm: true });
  }

  _hideCommentForm() {
    console.log("hiding comments form");
    this.setState({ _showCommentForm: false });
  }

  _onCommentSubmit(newComment) {
    var index = this.state.itemId;
    var type = this.state.itemType;
    console.log('add comment %s: to %s number %d', newComment["text"], type, index);
    this.addComment(newComment["text"], index, type);
  }

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
          comments: commentsArr
        });
      }.bind(this),
      error: function(xhr, status, err) {
        //this.setState({data: comments});
        console.error("/comments", status, err.toString());
      }.bind(this)
    });
    console.log(this.state.comments);
  }

  updateComments() {
    console.log(this.state.comments.length);
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      type: 'GET',
      success: function(data) {

      }.bind(this),
      error: function(xhr, status, err) {
        //this.setState({data: comments});
        console.error("/comments", status, err.toString());
      }.bind(this)
    });
  }


  render() {
    return (
        <div className="">
          { this.state._showComments ? <button className="btn inverse-primary-button" onClick={this._hideComments}>Hide <span className="glyphicon glyphicon-comment" /></button> : <button className="btn inverse-primary-button" onClick={this._showComments}>Show All <span className="glyphicon glyphicon-comment" /></button> }
          { this.state._showCommentForm ? <button className="btn inverse-primary-button" onClick={this._hideCommentForm}>Hide <span className="glyphicon glyphicon-pencil" /></button> : <button className="btn inverse-primary-button" onClick={this._showCommentForm}>Add Comment <span className="glyphicon glyphicon-pencil" /></button> }

          { this.state._showComments ? <CommentList comments={this.state.comments} data={this.state} deleteComment={this._deleteComment} /> : null }
          { this.state._showCommentForm ? <CommentForm onCommentSubmit={this._onCommentSubmit} itemNum={this.props.itemId} /> : null }
        </div>
    );
  }
}
