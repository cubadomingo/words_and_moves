import React, { PropTypes } from 'react';
import Comment from '../components/Comment';

export default class CommentList extends React.Component {
  static propTypes = {
    comments: PropTypes.array,
    data: PropTypes.object,
  };

  constructor(props) {
    super(props);
    this.state = {};
  }

  render() {
    var actions = this.props.actions;
    var data = this.props.data;
    var comments = this.props.comments;
    console.log(data.comments);
    return (
      <div className="row">
        <div className="col-md-1"></div>
        <div className="col-md-5">
          {comments.length > 0 ? <h3>Comments</h3> : <div><h4>No Comments Yet!</h4></div>}
          {comments.map((comment, i) =>
            <Comment data={comment} index={i} key={i} />
          )}
        </div>
      </div>
    );
  }
}
