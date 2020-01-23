import React from 'react';
import { NextPage } from 'next';
import styled from 'styled-components';

const Index: NextPage = () => (
  <Wrap>
    <PostButton type="button">投稿する</PostButton>
  </Wrap>
);

export default Index;

const Wrap = styled.main`
  width: 100%;
  height: 100%;
  background-color: #f8f8f8;
`;

const PostButton = styled.button`
  position: fixed;
  top: calc(50vh - 5vh);
  width: 100%;
  height: 10vh;
  display: flex;
  justify-content: center;
  align-items: center;
  border: none;
  box-shadow: 0 0 10px 1px rgba(0, 0, 0, 0.1);
  cursor: pointer;
  outline: none;
`;
