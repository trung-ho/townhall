class @FileUpload
  constructor: (@options) ->
    _self = @

    @input_file = @options.input.first()
    @group      = @input_file.parents('.photo-group') 
    @photo      = @group.find('.photo').first()
    @btnBrowse  = @group.find('.btn-browse').first()
    @inputFile  = @group.find('.inputfile').first()

    @max_size   = @options.max_size ? 1048576
    @photo_type = @options.photo_type ? /(?:gif|jpg|png|bmp|jpeg)$/

    @photo.click ->
      _self.input_file.trigger('click')

    @btnBrowse.click ->
      _self.input_file.trigger('click')
      return false

    @input_file.change ->
      _self.readURL()

  readURL: ->
    return false unless @validate_photo()

    _self = @
    reader = new FileReader()
    reader.onload = (e) ->
      _self.photo.attr "src", e.target.result
      _self.inputFile.val(_self.input_file.val().split('\\').pop())
      return

    reader.readAsDataURL @input_file[0].files[0]

  validate_photo: ->
    @validate_photo_type() && @validate_photo_size()

  validate_photo_type: ->
    unless @input_file.val().toLowerCase().match(@photo_type)
      alert("inputted file path is not an image!")
      return false
    return true

  validate_photo_size: ->
    if @input_file[0].size > @max_size 
      alert 'Photo size too large. Please limit to 1 mb.'
      return false
    return true
