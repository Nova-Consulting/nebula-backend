GetAvailablePositions = async () => {
    return [
        { value: 'Admin' },
        { value: 'Consultant' },
        { value: 'Head' },
        { value: 'Manager' },
        { value: 'Leader' },
        { value: 'Analyst' },
        { value: 'Support' },
        { value: 'Trainee' },
    ];
}

GetAvailableEntities = async () => {
    return [
        { value: 'User' },
        { value: 'Group' },
        { value: 'Group Roles' },
        { value: 'Products' },
        { value: 'Tenants' },
        { value: 'User Groups' },
        { value: 'User Tenants' },
    ];
}

GetAvailableRoles = async () => {
    return [
        { value: 'Edit' },
        { value: 'Read' },
        { value: 'Write' }
    ];
}

module.exports = { GetAvailablePositions, GetAvailableEntities, GetAvailableRoles  }