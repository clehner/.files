import fileinput

commands = []
append_next = False
for line in fileinput.input():
    if append_next:
        commands[-1] += line
    else:
        commands.append(line)
    append_next = line[-2] == '\\'

seen = set()
uniqs = []
for command in reversed(commands):
    if not command in seen:
        seen.add(command)
        uniqs.append(command)

print ''.join(reversed(uniqs))
