import React from 'react';

interface Prop {
  onclick: () => void;
}

const Button: React.FC<Prop> = props => (
  <button type="button" onClick={props.onclick}>
    {props.children}
  </button>
);

export default Button;
