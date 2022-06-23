// var headers = {
//   'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyNzc2ZDYxMzI4YTI3NGRlZWIzODU0OSIsImlhdCI6MTY1NTkwMTQ4OSwiZXhwIjoxNjYzNjc3NDg5fQ.UScGKSFmvuz789P_aQOa0IVFHy3QqnTJbxmjLMxGknY',
//   'Content-Type': 'application/json'
// };
// var request = http.Request('PATCH', Uri.parse('https://zena-api-dev.herokuapp.com/api/v1/customers/updateMyPassword'));
// request.body = json.encode({
//   "passwordCurrent": "123123123",
//   "password": "123123123",
//   "passwordConfirm": "123123123"
// });
// request.headers.addAll(headers);

// http.StreamedResponse response = await request.send();

// if (response.statusCode == 200) {
//   print(await response.stream.bytesToString());
// }
// else {
//   print(response.reasonPhrase);
// }