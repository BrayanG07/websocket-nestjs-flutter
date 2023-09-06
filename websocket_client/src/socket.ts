import { Manager, Socket } from "socket.io-client";

export const connectToServer = () => {
  const manager = new Manager("http://localhost:3000");
  const socket = manager.socket("/");

  addListeners(socket);
}

const addListeners = (socket: Socket) => {
  const messageForm = document.querySelector<HTMLFormElement>('#message-form')!;
  const messageInput = document.querySelector<HTMLInputElement>('#message-input')!;

  socket.on('connect', () => {
    console.log('connected');
  })

  socket.on('disconnect', () => {
    console.log('disconnected');
  })

  messageForm.addEventListener('submit', (event) => {
    event.preventDefault();

    if (messageInput.value.trim().length <= 0) return;

    // Emitir evento
    socket.emit('MESSAGE_FROM_CLIENT', { id: 'CLIENT', message: messageInput.value });

    messageInput.value = '';
  })

  socket.on('MESSAGE_FROM_SERVER', (payload: any) => {
    console.log({ message: 'Message from server', payload });
  });
  
  socket.on('WELCOME_MESSAGE', (payload: any) => {
    console.log({ message: 'Message from server(WELCOME)', payload });
  });
}