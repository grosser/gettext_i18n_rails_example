module FastGettext::Translation
  TRANSLATIONS_USED = []

  def __with_log(x)
    TRANSLATIONS_USED << x
    __without_log(x)
  end
  alias_method_chain :_, :log

  def s__with_log(x)
    TRANSLATIONS_USED << x
    s__without_log(x)
  end
  alias_method_chain :s_, :log
end