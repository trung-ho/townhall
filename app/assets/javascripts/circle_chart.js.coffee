$ ->
  $('.circle-chart').each ->
    chart = $(this)
    container = chart.parents('.circle-chart-container').first()
    guilder = container.find('.guilder').first()
    
    options = 
      percent: chart.data('percent') or 50
      size: chart.data('size') or 130
      lineWidth: chart.data('line') or 12
      rotate: chart.data('rotate') or 45
    chart.width(options.size)
    chart.height(options.size)

    canvas = $("<canvas/>")
    span = $("<span>" + chart.attr('title') + "</span>")
    span.css({ width: options.size, "line-height": options.size + 'px' })
    if typeof G_vmlCanvasManager != 'undefined'
      G_vmlCanvasManager.initElement canvas
    ctx = canvas[0].getContext('2d')
    canvas.attr({width: options.size, height: options.size}) 
    chart.append(span)
    chart.append(canvas)
    ctx.translate options.size / 2, options.size / 2
    # change center
    ctx.rotate (-1 / 2 + options.rotate / 180) * Math.PI
    # rotate -90 deg
    radius = (options.size - (options.lineWidth)) / 2

    drawCircle = (color, lineWidth, start, end) ->
      ctx.beginPath()
      ctx.arc 0, 0, radius, Math.PI * 2 * start, Math.PI * 2 * end, false
      ctx.strokeStyle = color
      ctx.lineCap = 'square'
      # butt, round or square
      ctx.lineWidth = lineWidth
      ctx.stroke()
      return

    data = []
    colors = ['#c5dd37','#3acccb','#fc6f4c','#e7e7e2', '#616161']
    x = 0
    amount = 0
    $(this).find('li').each (i, elem) ->
      percent = parseInt($(elem).attr('amount'))
      amount = amount + percent
    
    drawCircle '#616161', options.lineWidth, 0, 1

    $(this).find('li').each (i, elem) -> 
      percent = (parseInt($(elem).attr('amount')) / amount) || 0
      if percent > 0
        drawCircle colors[i], options.lineWidth, x, x + percent 
      guilder.append('<p><span style="background-color: '+colors[i]+'"></span>'+$(elem).text()+': '+parseInt(percent*100)+'% </p>')
      x = x + percent
      
