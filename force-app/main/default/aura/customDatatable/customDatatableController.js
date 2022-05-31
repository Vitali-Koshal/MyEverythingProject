({
    doInit : function(component, event, helper) {
        component.set('v.columns', [
            {label: 'First Name', fieldName: 'FirstName', type: 'text'},
            {label: 'Last Name', fieldName: 'LastName', type: 'text'},
            {label: 'Email', fieldName: 'Email', type: 'email'},
            {
                label: 'Account Name', 
                fieldName: 'AccountURL', 
                type: 'url', 
                typeAttributes: {label: {fieldName: 'Name'}}
            },
            {label: 'Mobile Phone', fieldName: 'MobilePhone', type: 'phone'},
            {
                label: 'Created Date', 
                fieldName: 'CreatedDate', 
                type: 'date', 
                typeAttributes: { 
                    day: "numeric", 
                    month: "numeric", 
                    year: "numeric", 
                    hour: "2-digit", 
                    minute: "numeric" 
                }
            }
        ]);
        helper.fetchData(component, event);
    },
    handleFilterClick: function(component, event, helper) {
        helper.fetchData(component, event);
    }
})
