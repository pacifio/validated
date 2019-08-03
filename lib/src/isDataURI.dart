RegExp _validMediaType = RegExp(r"/^[a-z]+\/[a-z0-9\-\+]+$/i");
RegExp _validAttribute = RegExp(r"/^[a-z\-]+=[a-z0-9\-]+$/i");
RegExp _validData = RegExp(r"/^[a-z0-9!\$&'\(\)\*\+,;=\-\._~:@\/\?%\s]*$/i");

/// check if string [input] is a data uri
bool isDataURI(String input) {
  var data = input.split(',');
  if (data.length < 2) {
    return false;
  }
  var attributes = data.removeAt(0).trim().split(';');
  var schemeAndMediaType = attributes.removeAt(0);
  if (schemeAndMediaType.substring(0, 5) != 'data:') {
    return false;
  }

  var mediaType = schemeAndMediaType.substring(5);
  if (mediaType != '' && !_validMediaType.hasMatch(mediaType)) {
    return false;
  }

  for (var i = 0; i < attributes.length; i++) {
    if (i == attributes.length - 1 && attributes[i].toLowerCase() == 'base64') {
    } else if (!_validAttribute.hasMatch(attributes[i])) {
      return false;
    }
  }

  for (var i = 0; i < data.length; i++) {
    if (!_validData.hasMatch(data[i])) {
      return false;
    }
  }

  return true;
}
