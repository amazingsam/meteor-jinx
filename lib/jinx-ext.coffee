module.exports =
  createBlazeTemplate: (options) ->
    console.log("generating Blaze Template...")
    myString = """
    <template name="#{options['name']}">
 {{#{options['data']}}}</p>
    </template>
    """
    return myString

  createStructure: (structureId, name) ->
    console.log("created #{structureId} #{name}")
