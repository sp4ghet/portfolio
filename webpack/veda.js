import Veda from 'vedajs'


// if (typeof window.orientation === 'undefined') {
  const veda = new Veda()

  const canvas = document.querySelector('canvas.background')

  const client = new XMLHttpRequest()

  client.open('GET', '/assets/shaders/curl.frag')
  client.onload = vedaInit

  client.send()

function vedaInit(){
  canvas.width = window.innerWidth
  canvas.height = window.innerHeight

  veda.setCanvas(canvas)

  const code = client.responseText

  veda.loadFragmentShader(code)
  veda.play()
}

function vedaResize(){
  veda.resize(window.innerWidth, window.innerHeight)
}

window.addEventListener('resize', vedaResize, true)

// }
