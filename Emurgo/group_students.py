students = [
    ("Vidy", 'C'),
    ("Sergiu", 'B'),
    ("Matthew", 'A'),
    ("Fiaz", 'C'),
    ("Jess", 'B'),
    ("Martin", 'B'),
    ("Marcia", 'B'),
    ("Pawel", 'C'),
    ("Hinson", 'B'),
    ("Telmo", 'B'),
    ("Thinh", 'B'),
    ("Jiaranai", 'B'),
    ("John", 'B'),
    ("Setiaman", 'C'),
    ("Victor", 'A'),
    ("Andrew", 'C'),
    ("Bert-Jan", 'C'),
    ("Ian", 'T')
    ]

def group_students(students):
    group_a, group_b, group_c = ([], [], [])

    for (name, group) in students:
        match group:
            case 'A':
                group_a.append(name)
            case 'B':
                group_b.append(name)
            case 'C':
                group_c.append(name)

    return (group_a, group_b, group_c)

print (group_students(students))