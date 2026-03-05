# Al-Khatt Logistics Platform API (v1)

Base URL (local):
`http://127.0.0.1:8000/api/v1`

Auth:
- All protected endpoints require JWT:
  - Header: `Authorization: Bearer <access_token>`

## Auth & Profile
1. `POST /auth/otp/request`
   - Body: `{ "phone": "+2189xxxxxxx" }`
   - Response: `{ "status": "sent" }`

2. `POST /auth/otp/verify`
   - Body: `{ "phone": "+2189xxxxxxx", "code": "12345" }`
   - Response:
     - `{ "user": { ... }, "access": "<token>", "refresh": "<token>" }`

3. `GET /auth/me`
   - Response: user profile + role + wallet + document status.

4. `POST /auth/device-token`
   - Body: `{ "token": "<fcm_token>", "platform": "android|ios" }`
   - Response: `{ "status": "ok" }`

## Profile Uploads (Firebase Storage)
- `POST /profile/contractor/license`
- `POST /profile/agent/license`
- `POST /profile/driver/license`
- `POST /profile/driver/photo`

Upload format:
- `multipart/form-data`
- field name: `file`
Response: `{ "url": "<public_url>" }`

## Wallet
1. `GET /wallet/summary`
   - Returns wallet balance + last 20 transactions.

2. `POST /wallet/withdrawals`
   - Body: `{ "amount": 250.0, "note": "optional" }`
   - Rules:
     - Rejects if balance < amount (including pending withdrawals).
   - Response: `{ "id": "<entry_id>", "status": "pending" }`

## Orders
1. `GET /orders`
   - Driver: available orders filtered by truck capacity.
   - Contractor: own published orders.
   - Agent: all orders.

2. `POST /orders`
   - Contractor only.
   - Body:
     ```
     {
       "material_type": "sand|gravel|crushed|marble|steel",
       "quantity_m3": 12.5,
       "pickup_location": { "lat": 32.0, "lng": 13.1 },
       "delivery_location": { "lat": 32.1, "lng": 13.2 }
     }
     ```

## Messages
1. `GET /messages/threads`
   - Returns conversation list.

2. `GET /messages?conversation=<id>`
   - Returns messages in a thread.

3. `POST /messages`
   - Body: `{ "conversation": "<id>", "body": "..." }`

## Notes
- If `DEBUG=True` and GDAL is unavailable, GIS is disabled and locations fallback to float fields.
- Orders + tracking still accept `pickup_location` / `delivery_location` in the same API shape.
