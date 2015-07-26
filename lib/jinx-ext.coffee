module.exports =
  createBlazeTemplate: (options) ->
    console.log("generating Blaze Template...")
    myString = """
    <template name="#{options['name']}">
      <button>Click Me</button>
      <p>Sam pressed the button {{#{options['data']}}} times.</p>
    </template>
    """
    return myString

  createStructure: (structureId, name) ->
    console.log("created #{structureId} #{name}")
