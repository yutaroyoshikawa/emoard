import React from 'react';
import { storiesOf } from '@storybook/react';
import { withKnobs } from '@storybook/addon-knobs';
import Button from '../../renderer/components/atoms/Button';

const components = storiesOf('Components', module);
components.addDecorator(withKnobs).add('Example', () => <Button onclick={() => console.log('hoge')}>ほげ</Button>);
