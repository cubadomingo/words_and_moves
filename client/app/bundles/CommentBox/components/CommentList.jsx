import React, { PropTypes } from 'react';

// Simple example of a React "dumb" component
export default class CommentList extends React.Component {
  static propTypes = {
    // If you have lots of data or action properties, you should consider grouping them by
    // passing two properties: "data" and "actions".
    data: PropTypes.object,
  };

  constructor(props) {
    super(props);
    this.state = {};
  }

  render() {
    const { actions, data } = this.props;
    console.log(data.comments);
    return (
      <div className="row">
        <div className="col-md-1"></div>
        <div className="col-md-5">
          {data.comments.length > 0 ? <h4>Comments</h4> : <div className="panel panel-default"><h4>No Comments Yet!</h4></div>}
          {data.comments.map((comment, i) =>
            <div className="row" key={i}>
              <p key={i}><strong>Test Name: </strong>{comment.body}</p>
            </div>
          )};
        </div>
      </div>
    );
  }
}
