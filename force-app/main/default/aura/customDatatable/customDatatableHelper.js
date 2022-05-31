({
    fetchData : function(component) {
        let action = component.get('c.getContacts');
        action.setParams({searchValue: component.get('v.search')})
        action.setCallback(this, function(response) {
            let state = response.getState();
            if( state === 'SUCCESS') {
                let contacts = response.getReturnValue();
                contacts = contacts.map( row => {
                    return { 
                        FirstName: row.FirstName,
                        LastName: row.LastName,
                        Email: row.Email,
                        MobilePhone: row.MobilePhone,
                        Name: row.AccountId === undefined ? '' : row.Account.Name,
                        AccountURL: row.AccountId === undefined ? '' : '/lightning/r/Account/' + row.AccountId + '/view',
                        CreatedDate: row.CreatedDate
                     };
                })
                component.set('v.contacts', contacts);
            } else if(state === 'ERROR') {
                component.set('v.error', state);
            }
        });
        $A.enqueueAction(action);
    }
})
