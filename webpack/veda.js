import Veda from 'vedajs'


if (typeof window.orientation === 'undefined') {
  const veda = new Veda()

  const canvas = document.querySelector('canvas.background')

  const client = new XMLHttpRequest();

  client.open('GET', '/assets/shaders/curl.frag')
  client.onload = function() {
    const code = client.responseText

    veda.loadFragmentShader(code)
    veda.play()
  }

  client.send()

  veda.setCanvas(canvas)
}
