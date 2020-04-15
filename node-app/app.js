const express = require('express')
const colors= require('colors')
const app = express()
const { exec } = require('child_process');
const port = process.env.APP_PORT
const email = process.env.EMAIL
const cmd = `./test.sh ${email}` 
app.get('/', (req, res) => {
  exec(cmd, (err, stdout, stderr) => {

    if (err) {
      // node couldn't execute the command
      msg = 'casi lo tienes!!!'
      console.log(msg.yellow)
      console.log(stderr.red)
    }else {
      msg = `Well little papaya!!!`
      console.log(msg.green)
      console.log(stdout.rainbow)
    }
    if (!email) {
      msg = 'email is not set'
      console.log(msg.yellow)
    }
    res.send(msg)

    // the *entire* stdout and stderr (buffered)
  });
})

app.listen(port, () => console.log(`Example app listening at http://localhost:${port}`))
