class MainPage
  include PageObject
   
  page_url "https://www.exercise1.com" 
  
  label :value_label, id: /^lbl_val_\d+$/
  span :text_value, id: /^txt_val_\d+$/
  label :total_balance_label, id: 'lbl_ttl_value'
  span :total_balance, id: 'txt_ttl_value'
  
end  