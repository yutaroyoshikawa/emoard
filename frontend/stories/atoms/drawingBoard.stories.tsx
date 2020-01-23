import React from 'react';
import { storiesOf } from '@storybook/react';
import { withKnobs } from '@storybook/addon-knobs';
import DrawingBoard from '../../renderer/components/atoms/DrawingBoard';

const components = storiesOf('Etcs', module).addDecorator(withKnobs);
components.addDecorator(withKnobs).add('DrawingBoard', () => <DrawingBoard />);
