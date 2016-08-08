import React from 'react';
import ReactOnRails from 'react-on-rails';

import CommentBox from '../containers/CommentBox';

const CommentBoxApp = (props) => (
  <CommentBox {...props} />
);

// This is how react_on_rails can see the HelloWorldApp in the browser.
ReactOnRails.register({ CommentBoxApp });
