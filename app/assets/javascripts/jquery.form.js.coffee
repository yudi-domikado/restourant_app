#!
# * jQuery Form Plugin
# * version: 2.93 (30-NOV-2011)
# * @requires jQuery v1.3.2 or later
# *
# * Examples and documentation at: http://malsup.com/jquery/form/
# * Dual licensed under the MIT and GPL licenses:
# *    http://www.opensource.org/licenses/mit-license.php
# *	http://www.gnu.org/licenses/gpl.html
# 
(($) ->
  
  #
  #	Usage Note:
  #	-----------
  #	Do not use both ajaxSubmit and ajaxForm on the same form.  These
  #	functions are intended to be exclusive.  Use ajaxSubmit if you want
  #	to bind your own submit handler to the form.  For example,
  #
  #	$(document).ready(function() {
  #		$('#myForm').bind('submit', function(e) {
  #			e.preventDefault(); // <-- important
  #			$(this).ajaxSubmit({
  #				target: '#output'
  #			});
  #		});
  #	});
  #
  #	Use ajaxForm when you want the plugin to manage all the event binding
  #	for you.  For example,
  #
  #	$(document).ready(function() {
  #		$('#myForm').ajaxForm({
  #			target: '#output'
  #		});
  #	});
  #
  #	When using ajaxForm, the ajaxSubmit function will be invoked for you
  #	at the appropriate time.
  #
  
  ###
  ajaxSubmit() provides a mechanism for immediately submitting
  an HTML form using AJAX.
  ###
  
  # fast fail if nothing selected (http://dev.jquery.com/ticket/2752)
  
  # clean url (don't include hash vaue)
  
  # hook for manipulating the form data before it is extracted;
  # convenient for use with rich editors like tinyMCE or FCKEditor
  
  # provide opportunity to alter form data before it is serialized
  
  # give pre-submit callback an opportunity to abort the submit
  
  # fire vetoable 'validate' event
  # data is null for 'get'
  # data is the query string for 'post'
  
  # perform a load on the target only if dataType is not provided
  # jQuery 1.4+ passes xhr as 3rd arg
  # jQuery 1.4+ supports scope context 
  
  # are there files to upload?
  # [value] (issue #113)
  
  # options.iframe allows user to force iframe mode
  # 06-NOV-09: now defaulting to iframe mode if file input is detected
  
  # hack to fix Safari hang (thanks to Tim Molendijk for this)
  # see:  http://groups.google.com/group/jquery-dev/browse_thread/thread/36395b7ab510dd5d
  
  # fire 'notify' event
  
  # XMLHttpRequest Level 2 file uploads (big hat tip to francois2metz)
  # unfortunately, jQuery doesn't expose this prop (http://bugs.jquery.com/ticket/10190)
  
  # private function for handling file uploads (hat tip to YAHOO!)
  
  # ensure that every serialized input is still enabled
  
  # if there is an input with a name or id of 'submit' then we won't be
  # able to invoke the submit fn on the form (at least not x-browser)
  # mock object
  # abort op in progress
  
  # trigger ajax global events so that activity/block indicators work like normal
  
  # add submitting element to data if we know it
  
  # Rails CSRF hack (thanks to Yvan BARTH-LEMY)
  
  # take a breath so that pending repaints get some cpu time before the upload starts
  
  # make sure form attrs are set
  
  # update form attrs in IE friendly way
  
  # ie borks in some cases when setting encoding
  
  # support timout
  
  # look for server aborts
  
  # add "extra" data to form if provided in options
  
  # add iframe to doc and submit the form
  
  # reset attrs and remove "extra" input elements
  # this lets dom updates render
  
  # response not received yet
  
  # in some browsers (Opera) the iframe DOM is not always traversable when
  # the onload callback fires, so we loop a bit to accommodate
  
  # let this fall through because server response could be an empty document
  #log('Could not access iframe DOM after mutiple tries.');
  #throw 'DOMException: not available';
  
  #log('response detected');
  
  # support for XHR 'status' & 'statusText' emulation :
  
  # see if user embedded response in textarea
  
  # support for XHR 'status' & 'statusText' emulation :
  
  # account for browsers injecting pre around json response
  # we've set xhr.status
  
  # ordering of these callbacks/triggers is odd, but that's how $.ajax does it
  
  # clean up
  # use parseXML if available (jQuery 1.5+)
  # mostly lifted from jq1.4.4
  
  ###
  ajaxForm() provides a mechanism for fully automating form submission.
  
  The advantages of using this method instead of ajaxSubmit() are:
  
  1: This method will include coordinates for <input type="image" /> elements (if the element
  is used to submit the form).
  2. This method will include the submit element's name/value data (for the element that was
  used to submit the form).
  3. This method binds the submit() method to the form for you.
  
  The options argument for ajaxForm works exactly as it does for ajaxSubmit.  ajaxForm merely
  passes the options argument along after properly binding events for submit elements and
  the form itself.
  ###
  
  # in jQuery 1.3+ we can fix mistakes with the ready state
  
  # is your DOM ready?  http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  # if event has been canceled, don't proceed
  
  # is this a child element of the submit el?  (ex: a span within a button)
  # try to use dimensions plugin
  
  # clear form vars
  
  # ajaxFormUnbind unbinds the event handlers that were bound by ajaxForm
  
  ###
  formToArray() gathers form element data into an array of objects that can
  be passed to any of the following ajax functions: $.get, $.post, or load.
  Each object in the array has both a 'name' and 'value' property.  An example of
  an array for a simple login form might be:
  
  [ { name: 'username', value: 'jresig' }, { name: 'password', value: 'secret' } ]
  
  It is this array that is passed to pre-submit callback functions provided to the
  ajaxSubmit() and ajaxForm() methods.
  ###
  
  # handle image inputs on the fly when semantic == true
  
  # input type=='image' are not found in elements array! handle it here
  
  ###
  Serializes form data into a 'submittable' string. This method will return a string
  in the format: name1=value1&amp;name2=value2
  ###
  
  #hand off to jQuery.param for proper encoding
  
  ###
  Serializes all field elements in the jQuery object into a query string.
  This method will return a string in the format: name1=value1&amp;name2=value2
  ###
  
  #hand off to jQuery.param for proper encoding
  
  ###
  Returns the value(s) of the element in the matched set.  For example, consider the following form:
  
  <form><fieldset>
  <input name="A" type="text" />
  <input name="A" type="text" />
  <input name="B" type="checkbox" value="B1" />
  <input name="B" type="checkbox" value="B2"/>
  <input name="C" type="radio" value="C1" />
  <input name="C" type="radio" value="C2" />
  </fieldset></form>
  
  var v = $(':text').fieldValue();
  // if no values are entered into the text inputs
  v == ['','']
  // if values entered into the text inputs are 'foo' and 'bar'
  v == ['foo','bar']
  
  var v = $(':checkbox').fieldValue();
  // if neither checkbox is checked
  v === undefined
  // if both checkboxes are checked
  v == ['B1', 'B2']
  
  var v = $(':radio').fieldValue();
  // if neither radio is checked
  v === undefined
  // if first radio is checked
  v == ['C1']
  
  The successful argument controls whether or not the field element must be 'successful'
  (per http://www.w3.org/TR/html4/interact/forms.html#successful-controls).
  The default value of the successful argument is true.  If this value is false the value(s)
  for each element is returned.
  
  Note: This method *always* returns an array.  If no valid value can be determined the
  array will be empty, otherwise it will contain one or more values.
  ###
  
  ###
  Returns the value of the field element.
  ###
  # extra pain for IE...
  
  ###
  Clears the form data.  Takes the following actions on the form's input fields:
  - input text fields will have their 'value' property set to the empty string
  - select elements will have their 'selectedIndex' property set to -1
  - checkbox and radio inputs will have their 'checked' property set to false
  - inputs of type submit, button, reset, and hidden will *not* be effected
  - button elements will *not* be effected
  ###
  
  ###
  Clears the selected form elements.
  ###
  # 'hidden' is not in this list
  
  ###
  Resets the form data.  Causes all form elements to be reset to their original value.
  ###
  
  # guard against an input with the name of 'reset'
  # note that IE reports the reset function as an 'object'
  
  ###
  Enables or disables any matching elements.
  ###
  
  ###
  Checks/unchecks any matching checkboxes or radio buttons and
  selects/deselects and matching option elements.
  ###
  
  # deselect all other options
  
  # expose debug var
  
  # helper fn for console logging
  log = ->
    return  unless $.fn.ajaxSubmit.debug
    msg = "[jquery.form] " + Array::join.call(arguments_, "")
    if window.console and window.console.log
      window.console.log msg
    else window.opera.postError msg  if window.opera and window.opera.postError
  $.fn.ajaxSubmit = (options) ->
    fileUploadXhr = (a) ->
      formdata = new FormData()
      i = 0

      while i < a.length
        continue  if a[i].type is "file"
        formdata.append a[i].name, a[i].value
        i++
      $form.find("input:file:enabled").each ->
        name = $(this).attr("name")
        files = @files
        if name
          i = 0

          while i < files.length
            formdata.append name, files[i]
            i++

      if options.extraData
        for k of options.extraData
          formdata.append k, options.extraData[k]
      options.data = null
      _beforeSend = options.beforeSend
      options.beforeSend = (xhr, options) ->
        options.data = formdata
        if xhr.upload
          xhr.upload.onprogress = (event) ->
            options.progress event.position, event.total
        _beforeSend.call options, xhr, options  if _beforeSend

      $.ajax options
    fileUploadIframe = (a) ->
      getDoc = (frame) ->
        doc = (if frame.contentWindow then frame.contentWindow.document else (if frame.contentDocument then frame.contentDocument else frame.document))
        doc
      doSubmit = ->
        checkState = ->
          try
            state = getDoc(io).readyState
            log "state = " + state
            setTimeout checkState, 50  if state.toLowerCase() is "uninitialized"
          catch e
            log "Server abort: ", e, " (", e.name, ")"
            cb SERVER_ABORT
            timeoutHandle and clearTimeout(timeoutHandle)
            timeoutHandle = `undefined`
        t = $form.attr("target")
        a = $form.attr("action")
        form.setAttribute "target", id
        form.setAttribute "method", "POST"  unless method
        form.setAttribute "action", s.url  unless a is s.url
        if not s.skipEncodingOverride and (not method or /post/i.test(method))
          $form.attr
            encoding: "multipart/form-data"
            enctype: "multipart/form-data"

        if s.timeout
          timeoutHandle = setTimeout(->
            timedOut = true
            cb CLIENT_TIMEOUT_ABORT
          , s.timeout)
        extraInputs = []
        try
          if s.extraData
            for n of s.extraData
              extraInputs.push $("<input type=\"hidden\" name=\"" + n + "\">").attr("value", s.extraData[n]).appendTo(form)[0]
          unless s.iframeTarget
            $io.appendTo "body"
            (if io.attachEvent then io.attachEvent("onload", cb) else io.addEventListener("load", cb, false))
          setTimeout checkState, 15
          form.submit()
        finally
          form.setAttribute "action", a
          if t
            form.setAttribute "target", t
          else
            $form.removeAttr "target"
          $(extraInputs).remove()
      cb = (e) ->
        return  if xhr.aborted or callbackProcessed
        try
          doc = getDoc(io)
        catch ex
          log "cannot access response document: ", ex
          e = SERVER_ABORT
        if e is CLIENT_TIMEOUT_ABORT and xhr
          xhr.abort "timeout"
          return
        else if e is SERVER_ABORT and xhr
          xhr.abort "server abort"
          return
        return  unless timedOut  if not doc or doc.location.href is s.iframeSrc
        (if io.detachEvent then io.detachEvent("onload", cb) else io.removeEventListener("load", cb, false))
        status = "success"
        errMsg = undefined
        try
          throw "timeout"  if timedOut
          isXml = s.dataType is "xml" or doc.XMLDocument or $.isXMLDoc(doc)
          log "isXml=" + isXml
          if not isXml and window.opera and (not doc.body? or doc.body.innerHTML is "")
            if --domCheckCount
              log "requeing onLoad callback, DOM not available"
              setTimeout cb, 250
              return
          docRoot = (if doc.body then doc.body else doc.documentElement)
          xhr.responseText = (if docRoot then docRoot.innerHTML else null)
          xhr.responseXML = (if doc.XMLDocument then doc.XMLDocument else doc)
          s.dataType = "xml"  if isXml
          xhr.getResponseHeader = (header) ->
            headers = "content-type": s.dataType
            headers[header]

          if docRoot
            xhr.status = Number(docRoot.getAttribute("status")) or xhr.status
            xhr.statusText = docRoot.getAttribute("statusText") or xhr.statusText
          dt = (s.dataType or "").toLowerCase()
          scr = /(json|script|text)/.test(dt)
          if scr or s.textarea
            ta = doc.getElementsByTagName("textarea")[0]
            if ta
              xhr.responseText = ta.value
              xhr.status = Number(ta.getAttribute("status")) or xhr.status
              xhr.statusText = ta.getAttribute("statusText") or xhr.statusText
            else if scr
              pre = doc.getElementsByTagName("pre")[0]
              b = doc.getElementsByTagName("body")[0]
              if pre
                xhr.responseText = (if pre.textContent then pre.textContent else pre.innerText)
              else xhr.responseText = (if b.textContent then b.textContent else b.innerText)  if b
          else xhr.responseXML = toXml(xhr.responseText)  if dt is "xml" and not xhr.responseXML and xhr.responseText?
          try
            data = httpData(xhr, dt, s)
          catch e
            status = "parsererror"
            xhr.error = errMsg = (e or status)
        catch e
          log "error caught: ", e
          status = "error"
          xhr.error = errMsg = (e or status)
        if xhr.aborted
          log "upload aborted"
          status = null
        status = (if (xhr.status >= 200 and xhr.status < 300 or xhr.status is 304) then "success" else "error")  if xhr.status
        if status is "success"
          s.success and s.success.call(s.context, data, "success", xhr)
          g and $.event.trigger("ajaxSuccess", [xhr, s])
        else if status
          errMsg = xhr.statusText  if errMsg is `undefined`
          s.error and s.error.call(s.context, xhr, status, errMsg)
          g and $.event.trigger("ajaxError", [xhr, s, errMsg])
        g and $.event.trigger("ajaxComplete", [xhr, s])
        $.event.trigger "ajaxStop"  if g and not --$.active
        s.complete and s.complete.call(s.context, xhr, status)
        callbackProcessed = true
        clearTimeout timeoutHandle  if s.timeout
        setTimeout (->
          $io.remove()  unless s.iframeTarget
          xhr.responseXML = null
        ), 100
      form = $form[0]
      el = undefined
      i = undefined
      s = undefined
      g = undefined
      id = undefined
      $io = undefined
      io = undefined
      xhr = undefined
      sub = undefined
      n = undefined
      timedOut = undefined
      timeoutHandle = undefined
      useProp = !!$.fn.prop
      if a
        if useProp
          i = 0
          while i < a.length
            el = $(form[a[i].name])
            el.prop "disabled", false
            i++
        else
          i = 0
          while i < a.length
            el = $(form[a[i].name])
            el.removeAttr "disabled"
            i++
      if $(":input[name=submit],:input[id=submit]", form).length
        alert "Error: Form elements must not have name or id of \"submit\"."
        return
      s = $.extend(true, {}, $.ajaxSettings, options)
      s.context = s.context or s
      id = "jqFormIO" + (new Date().getTime())
      if s.iframeTarget
        $io = $(s.iframeTarget)
        n = $io.attr("name")
        unless n?
          $io.attr "name", id
        else
          id = n
      else
        $io = $("<iframe name=\"" + id + "\" src=\"" + s.iframeSrc + "\" />")
        $io.css
          position: "absolute"
          top: "-1000px"
          left: "-1000px"

      io = $io[0]
      xhr =
        aborted: 0
        responseText: null
        responseXML: null
        status: 0
        statusText: "n/a"
        getAllResponseHeaders: ->

        getResponseHeader: ->

        setRequestHeader: ->

        abort: (status) ->
          e = ((if status is "timeout" then "timeout" else "aborted"))
          log "aborting upload... " + e
          @aborted = 1
          $io.attr "src", s.iframeSrc
          xhr.error = e
          s.error and s.error.call(s.context, xhr, e, status)
          g and $.event.trigger("ajaxError", [xhr, s, e])
          s.complete and s.complete.call(s.context, xhr, e)

      g = s.global
      $.event.trigger "ajaxStart"  if g and not $.active++
      $.event.trigger "ajaxSend", [xhr, s]  if g
      if s.beforeSend and s.beforeSend.call(s.context, xhr, s) is false
        $.active--  if s.global
        return
      return  if xhr.aborted
      sub = form.clk
      if sub
        n = sub.name
        if n and not sub.disabled
          s.extraData = s.extraData or {}
          s.extraData[n] = sub.value
          if sub.type is "image"
            s.extraData[n + ".x"] = form.clk_x
            s.extraData[n + ".y"] = form.clk_y
      CLIENT_TIMEOUT_ABORT = 1
      SERVER_ABORT = 2
      csrf_token = $("meta[name=csrf-token]").attr("content")
      csrf_param = $("meta[name=csrf-param]").attr("content")
      if csrf_param and csrf_token
        s.extraData = s.extraData or {}
        s.extraData[csrf_param] = csrf_token
      if s.forceSync
        doSubmit()
      else
        setTimeout doSubmit, 10
      data = undefined
      doc = undefined
      domCheckCount = 50
      callbackProcessed = undefined
      toXml = $.parseXML or (s, doc) ->
        if window.ActiveXObject
          doc = new ActiveXObject("Microsoft.XMLDOM")
          doc.async = "false"
          doc.loadXML s
        else
          doc = (new DOMParser()).parseFromString(s, "text/xml")
        (if (doc and doc.documentElement and doc.documentElement.nodeName isnt "parsererror") then doc else null)

      parseJSON = $.parseJSON or (s) ->
        window["eval"] "(" + s + ")"

      httpData = (xhr, type, s) ->
        ct = xhr.getResponseHeader("content-type") or ""
        xml = type is "xml" or not type and ct.indexOf("xml") >= 0
        data = (if xml then xhr.responseXML else xhr.responseText)
        $.error and $.error("parsererror")  if xml and data.documentElement.nodeName is "parsererror"
        data = s.dataFilter(data, type)  if s and s.dataFilter
        if typeof data is "string"
          if type is "json" or not type and ct.indexOf("json") >= 0
            data = parseJSON(data)
          else $.globalEval data  if type is "script" or not type and ct.indexOf("javascript") >= 0
        data
    unless @length
      log "ajaxSubmit: skipping submit process - no element selected"
      return this
    method = undefined
    action = undefined
    url = undefined
    $form = this
    options = success: options  if typeof options is "function"
    method = @attr("method")
    action = @attr("action")
    url = (if (typeof action is "string") then $.trim(action) else "")
    url = url or window.location.href or ""
    url = (url.match(/^([^#]+)/) or [])[1]  if url
    options = $.extend(true,
      url: url
      success: $.ajaxSettings.success
      type: method or "GET"
      iframeSrc: (if /^https/i.test(window.location.href or "") then "javascript:false" else "about:blank")
    , options)
    veto = {}
    @trigger "form-pre-serialize", [this, options, veto]
    if veto.veto
      log "ajaxSubmit: submit vetoed via form-pre-serialize trigger"
      return this
    if options.beforeSerialize and options.beforeSerialize(this, options) is false
      log "ajaxSubmit: submit aborted via beforeSerialize callback"
      return this
    traditional = options.traditional
    traditional = $.ajaxSettings.traditional  if traditional is `undefined`
    qx = undefined
    n = undefined
    v = undefined
    a = @formToArray(options.semantic)
    if options.data
      options.extraData = options.data
      qx = $.param(options.data, traditional)
    if options.beforeSubmit and options.beforeSubmit(a, this, options) is false
      log "ajaxSubmit: submit aborted via beforeSubmit callback"
      return this
    @trigger "form-submit-validate", [a, this, options, veto]
    if veto.veto
      log "ajaxSubmit: submit vetoed via form-submit-validate trigger"
      return this
    q = $.param(a, traditional)
    q = ((if q then (q + "&" + qx) else qx))  if qx
    if options.type.toUpperCase() is "GET"
      options.url += ((if options.url.indexOf("?") >= 0 then "&" else "?")) + q
      options.data = null
    else
      options.data = q
    callbacks = []
    if options.resetForm
      callbacks.push ->
        $form.resetForm()

    if options.clearForm
      callbacks.push ->
        $form.clearForm options.includeHidden

    if not options.dataType and options.target
      oldSuccess = options.success or ->

      callbacks.push (data) ->
        fn = (if options.replaceTarget then "replaceWith" else "html")
        $(options.target)[fn](data).each oldSuccess, arguments_

    else callbacks.push options.success  if options.success
    options.success = (data, status, xhr) ->
      context = options.context or options
      i = 0
      max = callbacks.length

      while i < max
        callbacks[i].apply context, [data, status, xhr or $form, $form]
        i++

    fileInputs = $("input:file:enabled[value]", this)
    hasFileInputs = fileInputs.length > 0
    mp = "multipart/form-data"
    multipart = ($form.attr("enctype") is mp or $form.attr("encoding") is mp)
    fileAPI = !!(hasFileInputs and fileInputs.get(0).files and window.FormData)
    log "fileAPI :" + fileAPI
    shouldUseFrame = (hasFileInputs or multipart) and not fileAPI
    if options.iframe isnt false and (options.iframe or shouldUseFrame)
      if options.closeKeepAlive
        $.get options.closeKeepAlive, ->
          fileUploadIframe a

      else
        fileUploadIframe a
    else if (hasFileInputs or multipart) and fileAPI
      options.progress = options.progress or $.noop
      fileUploadXhr a
    else
      $.ajax options
    @trigger "form-submit-notify", [this, options]
    return this

  $.fn.ajaxForm = (options) ->
    if @length is 0
      o =
        s: @selector
        c: @context

      if not $.isReady and o.s
        log "DOM not ready, queuing ajaxForm"
        $ ->
          $(o.s, o.c).ajaxForm options

        return this
      log "terminating; zero elements found by selector" + ((if $.isReady then "" else " (DOM not ready)"))
      return this
    @ajaxFormUnbind().bind("submit.form-plugin", (e) ->
      unless e.isDefaultPrevented()
        e.preventDefault()
        $(this).ajaxSubmit options
    ).bind "click.form-plugin", (e) ->
      target = e.target
      $el = $(target)
      unless $el.is(":submit,input:image")
        t = $el.closest(":submit")
        return  if t.length is 0
        target = t[0]
      form = this
      form.clk = target
      if target.type is "image"
        unless e.offsetX is `undefined`
          form.clk_x = e.offsetX
          form.clk_y = e.offsetY
        else if typeof $.fn.offset is "function"
          offset = $el.offset()
          form.clk_x = e.pageX - offset.left
          form.clk_y = e.pageY - offset.top
        else
          form.clk_x = e.pageX - target.offsetLeft
          form.clk_y = e.pageY - target.offsetTop
      setTimeout (->
        form.clk = form.clk_x = form.clk_y = null
      ), 100


  $.fn.ajaxFormUnbind = ->
    @unbind "submit.form-plugin click.form-plugin"

  $.fn.formToArray = (semantic) ->
    a = []
    return a  if @length is 0
    form = this[0]
    els = (if semantic then form.getElementsByTagName("*") else form.elements)
    return a  unless els
    i = undefined
    j = undefined
    n = undefined
    v = undefined
    el = undefined
    max = undefined
    jmax = undefined
    i = 0
    max = els.length

    while i < max
      el = els[i]
      n = el.name
      continue  unless n
      if semantic and form.clk and el.type is "image"
        if not el.disabled and form.clk is el
          a.push
            name: n
            value: $(el).val()
            type: el.type

          a.push
            name: n + ".x"
            value: form.clk_x
          ,
            name: n + ".y"
            value: form.clk_y

        continue
      v = $.fieldValue(el, true)
      if v and v.constructor is Array
        j = 0
        jmax = v.length

        while j < jmax
          a.push
            name: n
            value: v[j]

          j++
      else if v isnt null and typeof v isnt "undefined"
        a.push
          name: n
          value: v
          type: el.type

      i++
    if not semantic and form.clk
      $input = $(form.clk)
      input = $input[0]
      n = input.name
      if n and not input.disabled and input.type is "image"
        a.push
          name: n
          value: $input.val()

        a.push
          name: n + ".x"
          value: form.clk_x
        ,
          name: n + ".y"
          value: form.clk_y

    a

  $.fn.formSerialize = (semantic) ->
    $.param @formToArray(semantic)

  $.fn.fieldSerialize = (successful) ->
    a = []
    @each ->
      n = @name
      return  unless n
      v = $.fieldValue(this, successful)
      if v and v.constructor is Array
        i = 0
        max = v.length

        while i < max
          a.push
            name: n
            value: v[i]

          i++
      else if v isnt null and typeof v isnt "undefined"
        a.push
          name: @name
          value: v


    $.param a

  $.fn.fieldValue = (successful) ->
    val = []
    i = 0
    max = @length

    while i < max
      el = this[i]
      v = $.fieldValue(el, successful)
      continue  if v is null or typeof v is "undefined" or (v.constructor is Array and not v.length)
      (if v.constructor is Array then $.merge(val, v) else val.push(v))
      i++
    val

  $.fieldValue = (el, successful) ->
    n = el.name
    t = el.type
    tag = el.tagName.toLowerCase()
    successful = true  if successful is `undefined`
    return null  if successful and (not n or el.disabled or t is "reset" or t is "button" or (t is "checkbox" or t is "radio") and not el.checked or (t is "submit" or t is "image") and el.form and el.form.clk isnt el or tag is "select" and el.selectedIndex is -1)
    if tag is "select"
      index = el.selectedIndex
      return null  if index < 0
      a = []
      ops = el.options
      one = (t is "select-one")
      max = ((if one then index + 1 else ops.length))
      i = ((if one then index else 0))

      while i < max
        op = ops[i]
        if op.selected
          v = op.value
          v = (if (op.attributes and op.attributes["value"] and not (op.attributes["value"].specified)) then op.text else op.value)  unless v
          return v  if one
          a.push v
        i++
      return a
    $(el).val()

  $.fn.clearForm = (includeHidden) ->
    @each ->
      $("input,select,textarea", this).clearFields includeHidden


  $.fn.clearFields = $.fn.clearInputs = (includeHidden) ->
    re = /^(?:color|date|datetime|email|month|number|password|range|search|tel|text|time|url|week)$/i
    @each ->
      t = @type
      tag = @tagName.toLowerCase()
      if re.test(t) or tag is "textarea" or (includeHidden and /hidden/.test(t))
        @value = ""
      else if t is "checkbox" or t is "radio"
        @checked = false
      else @selectedIndex = -1  if tag is "select"


  $.fn.resetForm = ->
    @each ->
      @reset()  if typeof @reset is "function" or (typeof @reset is "object" and not @reset.nodeType)


  $.fn.enable = (b) ->
    b = true  if b is `undefined`
    @each ->
      @disabled = not b


  $.fn.selected = (select) ->
    select = true  if select is `undefined`
    @each ->
      t = @type
      if t is "checkbox" or t is "radio"
        @checked = select
      else if @tagName.toLowerCase() is "option"
        $sel = $(this).parent("select")
        $sel.find("option").selected false  if select and $sel[0] and $sel[0].type is "select-one"
        @selected = select


  $.fn.ajaxSubmit.debug = false
) jQuery