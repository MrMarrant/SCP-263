/*
* Function used for get every players in sphere and filter.
* @Entity ent The entity center of the sphere.
*/
function SCP_263.GetInSpherePlayers(ent, radius)
    local tableFilter = {}
    local entsFound = ents.FindInSphere( ent:GetPos(), radius )
    for key, value in ipairs(entsFound) do
        if (value:IsPlayer() and value:Alive()) then
            table.insert(tableFilter, value)
        end
    end
    return tableFilter, entsFound
end