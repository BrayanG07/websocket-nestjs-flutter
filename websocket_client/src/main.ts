import { connectToServer } from './socket'
import './style.css'

document.querySelector<HTMLDivElement>('#app')!.innerHTML = `
  <div>
    <h2>Websocket Client Example</h2>

    <form id="message-form">
      <input placeholder="message" id="message-input" />
    </form>
    <p>Press enter to send the message</p>
  </div>
`
connectToServer();
