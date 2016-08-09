import React, { PropTypes } from 'react';
import CommentBoxWidget from '../components/CommentBoxWidget';
import CommentList from '../components/CommentList';

// Simple example of a React "smart" component
export default class CommentBox extends React.Component {
  static propTypes = {
    comments: PropTypes.array, // this is passed from the Rails view
    item_id: PropTypes.number,
    item_type: PropTypes.string,
  };

  constructor(props, context) {
    super(props, context);

    // How to set initial state in ES6 class syntax
    // https://facebook.github.io/react/docs/reusable-components.html#es6-classes
    this.state = { comments: this.props.comments, itemId: this.props.item_id, itemType: this.props.item_type };
  }

  render() {
    return (
      <div>
        <CommentBoxWidget comments={this.state.comments} itemId={this.state.itemId} itemType={this.state.itemType}  />
      </div>
    );
  }
}
