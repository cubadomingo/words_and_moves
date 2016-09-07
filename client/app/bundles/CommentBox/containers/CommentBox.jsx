import React, { PropTypes } from 'react';
import CommentBoxWidget from '../components/CommentBoxWidget';
import CommentList from '../components/CommentList';


// Simple example of a React "smart" component
export default class CommentBox extends React.Component {
  static propTypes = {
    comments: PropTypes.array, // this is passed from the Rails view
    item_id: PropTypes.number.isRequired,
    item_type: PropTypes.string.isRequired,
  };

  constructor(props, context) {
    super(props, context);

    // How to set initial state in ES6 class syntax
    // https://facebook.github.io/react/docs/reusable-components.html#es6-classes
    this.state = { 
                  itemId: this.props.item_id, 
                  itemType: this.props.item_type, 
                  url: "/" + this.props.item_type.toLowerCase() + "s/" + this.props.item_id + "/comments" 
                };
  }

  render() {
    return (
      <div>
        <CommentBoxWidget url={this.state.url} itemId={this.state.itemId} itemType={this.state.itemType}  />
      </div>
    );
  }
}
