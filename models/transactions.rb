
class Transaction

  attr_reader(:id, :value, :date)

  def initialize(options)
    @id = options ['id'] 
    @value = options['value']
    @date = options ['date']


  end

  



end