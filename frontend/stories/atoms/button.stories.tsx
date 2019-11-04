import React from 'react';
import Button from '../../renderer/components/atoms/Button';
import { storiesOf } from "@storybook/react";
import { withKnobs } from "@storybook/addon-knobs";

const components = storiesOf("Components", module);
components
  .addDecorator(withKnobs)
  .add("Example", () => (
    <Button onclick={() => console.log('hoge')} >ほげ</Button>
  ));