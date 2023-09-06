import {
  OnGatewayConnection,
  OnGatewayDisconnect,
  SubscribeMessage,
  WebSocketGateway,
  WebSocketServer,
} from '@nestjs/websockets';
import { Server, Socket } from 'socket.io';
import { EventsWebsocket } from '../config/events-websocket.constants';

// '*' = Allow any client to connect, do not do this in production.
@WebSocketGateway({ cors: { origin: '*' } })
export class WebsocketGateway
  implements OnGatewayConnection, OnGatewayDisconnect
{
  @WebSocketServer() server: Server;

  handleConnection(client: Socket) {
    console.log({ status: 'Connected', client: client.id });

    this.server.emit(EventsWebsocket.WELCOME_MESSAGE, {
      message: 'This is a message sent from the backend to the frontend',
    });
  }
  handleDisconnect(client: any) {
    console.log({ status: 'Disconnected', client: client.id });
  }

  // * Indicate when a customer sends a message
  @SubscribeMessage(EventsWebsocket.MESSAGE_FROM_CLIENT)
  handleMessageFromClient(client: Socket, payload: any) {
    console.log({ status: 'Customer submitted content', payload });

    // TODO: Broadcast or send to all clients listening to this event EventsWebsocket.MESSAGE_FROM_SERVER
    this.server.emit(EventsWebsocket.MESSAGE_FROM_SERVER, {
      from: 'Server',
      to: `Client - ${client.id}`,
      message:
        'I have received your message, thank you for contacting the server.',
    });
  }
}
