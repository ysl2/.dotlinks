# Ref: https://github.com/burgr033/GlazeWM-autotiling-python
import asyncio
import websockets
import json


async def main():
    uri = 'ws://localhost:6123'

    async with websockets.connect(uri) as websocket:
        await websocket.send('sub -e all')

        while True:
            response = await websocket.recv()
            json_response = json.loads(response)
            if json_response['messageType'] != 'event_subscription':
                continue
            width, height = None, None
            eventType = json_response['data']['eventType']
            if eventType in ['focus_changed', 'focused_container_moved']:
                width, height = json_response['data']['focusedContainer']['width'], json_response['data']['focusedContainer']['height']
            if width is None or height is None:
                continue
            if width >= height:
                await websocket.send('command set-tiling-direction horizontal')
            else:
                await websocket.send('command set-tiling-direction vertical')


if __name__ == "__main__":
    asyncio.run(main())
