import Veda from 'vedajs'


// if (typeof window.orientation === 'undefined') {
  const veda = new Veda()

  const canvas = document.querySelector('canvas.background')

  const client = new XMLHttpRequest();

  client.open('GET', '/assets/shaders/curl.frag')
  client.onload = function() {
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;

    veda.setCanvas(canvas)

    const code = client.responseText

    veda.loadFragmentShader(code)
    veda.play()
  }

  client.send()
// }
