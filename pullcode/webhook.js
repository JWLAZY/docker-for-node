const http = require('http')
const createHandler = require('coding-webhook-handler')

const  handler = createHandler({
    path:'/coding/push',
    token:'fe'
})

http.createServer((req,res)=>{
    handler(req,res,function(error){
        res.statusCode = 404
        res.end('no such location')
    })
}).listen(9999)

handler.on('error',err =>{
    console.error('error:',err.message)
})

handler.on('push',event => {
    console.log(event)
    runCommand('sh',['./auto_build.sh'],txt=>{
        console.log(txt)
    })
})

const runCommand = (cmd,args,callback) => {
    const child = spawn(cmd,args)
    let response = ''
    child.stdout.on('data',buffer => response += buffer.toString())
    child.stdout.on('end',()=> callback(response))
}