/*
The purpose of this file is to define the Keys of the websocket events, 
it would be a bad practice to handle them in plain text because it has a 
lot of margin of error due to the fact that we can make a mistake writing it.

DEFINE HERE AS MANY AS YOU NEED
*/
export enum EventsWebsocket {
  MESSAGE_FROM_SERVER = 'MESSAGE_FROM_SERVER',
  MESSAGE_FROM_CLIENT = 'MESSAGE_FROM_CLIENT',
  WELCOME_MESSAGE = 'WELCOME_MESSAGE',
}
