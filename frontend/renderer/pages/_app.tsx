import React from 'react';
import App from 'next/app';
import Head from 'next/head';
import reset from 'styled-reset';
import { createGlobalStyle } from 'styled-components';

class MyApp extends App {
  render(): JSX.Element {
    const { Component, pageProps } = this.props;
    return (
      <>
        <Head>
          <title>emoard</title>
        </Head>
        <Global />
        <Component {...pageProps} />
      </>
    );
  }
}

export default MyApp;

const Global = createGlobalStyle`
${reset}
`;
