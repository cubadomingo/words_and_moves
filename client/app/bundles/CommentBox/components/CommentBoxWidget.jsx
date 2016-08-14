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
    comments: PropTypes.array,
    itemId: PropTypes.number,
    itemType: PropTypes.string
  };
  constructor(props,context) {
    super(props,context);
    this.state = {
      itemId: this.props.itemId,
      itemType: this.props.itemType,
      _showComments: false,
      _showCommentForm: false,
      comments: this.props.comments
    };
    this._showComments = this._showComments.bind(this)
    this._hideComments = this._hideComments.bind(this)
    this._showCommentForm = this._showCommentForm.bind(this)
    this._hideCommentForm = this._hideCommentForm.bind(this)
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

  _onCommentSubmit(newComment, commentIndex) {
    //console.log('add reaction %s by %s: to comment %d', newComment["text"], commentIndex);
    debugger;
    var index = this.props.itemId;
    var type = this.props.itemType;
    //comment["reactions"].push(reaction);

    this.props.addComment(comment, commentIndex);
  }

  addComment(comment, ci) {
    var comments = this.state.comments;
    this.setState(state => { 
      state.comments[ci] = comment;
      return {comments: state.comments, itemId: state.itemId, itemType: state.itemType}
    });
    $.ajax({
      url: "/comments",
      dataType: 'json',
      type: 'POST',
      data: this.state.data[ci] = comment,
      error: function(xhr, status, err) {
        this.setState({data: comments});
        console.error("/comments", status, err.toString());
      }.bind(this)
    });
  }

  render() {
    return (
        <div className="">
          { this.state._showComments ? <button className="btn inverse-primary-button" onClick={this._hideComments}>Hide <span className="glyphicon glyphicon-comment" /></button> : <button className="btn inverse-primary-button" onClick={this._showComments}>Show All <span className="glyphicon glyphicon-comment" /></button> }
          { this.state._showCommentForm ? <button className="btn inverse-primary-button" onClick={this._hideCommentForm}>Hide <span className="glyphicon glyphicon-comment" /></button> : <button className="btn inverse-primary-button" onClick={this._showCommentForm}>Add Comment <span className="glyphicon glyphicon-pencil" /></button> }

          { this.state._showComments ? <CommentList data={this.props} deleteComment={this._deleteComment} /> : null }
          { this.state._showCommentForm ? <CommentForm onCommentSubmit={this._onCommentSubmit} itemNum={this.props.itemId} /> : null }
        </div>
    );
  }
}
