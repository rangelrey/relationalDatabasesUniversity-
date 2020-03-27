(SELECT pname, SUM(qty)
FROM patient
JOIN dose
ON dose.pno = patient.pno
where pname LIKE '%o%'
GROUP BY pname)

UNION pname

(SELECT pname, SUM(qty)
FROM patient
JOIN dose
ON dose.pno = patient.pno
where pname LIKE '%e%'
GROUP BY pname)



