
stringify = require '../src'

describe 'Option `delimiter`', ->
  
  it 'with default value', (next) ->
    stringify [
      [ '20322051544','','8.8017226E7','45','']
      [ '','1974','8.8392926E7','','']
    ], eof: false, (err, data) ->
      return next err if err
      data.should.eql """
      20322051544,,8.8017226E7,45,
      ,1974,8.8392926E7,,
      """
      next()
  
  it 'with on character', (next) ->
    stringify [
      [ '20322051544','','8.8017226E7','45','']
      [ '','1974','8.8392926E7','','']
    ], delimiter: '\t', eof: false, (err, data) ->
      return next err if err
      data.should.eql """
      20322051544\t\t8.8017226E7\t45\t
      \t1974\t8.8392926E7\t\t
      """
      next()
  
  it 'with multiple character', (next) ->
    stringify [
      [ 'a','b']
      [ 'c','d']
    ], delimiter: ':)(:', eof: false, (err, data) ->
      return next err if err
      data.should.eql """
      a:)(:b
      c:)(:d
      """
      next()
