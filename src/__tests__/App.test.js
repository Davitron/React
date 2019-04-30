import React from 'react';
import createMockStore from 'redux-mock-store';
import {Provider} from 'react-redux';
import thunk from 'redux-thunk';
import renderer from 'react-test-renderer';  
import {MemoryRouter } from 'react-router-dom';
import App from '../App';

const mockStore = createMockStore([thunk])({
  beer: {
    beers:[],
    selected: {
      beer: {},
      similar: []
    },
    page:1,
    isLoading:true
  }
});

it('renders without crashing', () => {

const tree = renderer.create(
   <Provider store={mockStore}>
   <MemoryRouter> 
     <App />
    </MemoryRouter>
   </Provider>
)
  .toJSON();  
    expect(tree).toMatchSnapshot();  
    
});
