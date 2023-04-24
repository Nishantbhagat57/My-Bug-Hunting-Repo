import re
import math
from collections import Counter

def entropy(s):
    p, lns = Counter(s), float(len(s))
    return -sum(count / lns * math.log(count / lns, 2) for count in p.values())

def is_random_string(s):
    if re.fullmatch(r'[bcdfghjklmnpqrstvwxyz]+', s) or re.fullmatch(r'[aeiou]+', s):
        return True
    return False

def is_potential_false_positive(domain):
    subdomains = domain.split('.')

    # Filter domain with a high entropy or containing digits in TLD
    tld = subdomains[-1]
    if entropy(tld) > 2 or re.search(r'\d+', tld):
        return True

    # Filter domain with overly long subdomains
    if any([len(sub) > 15 for sub in subdomains]):
        return True

    # Filter domain with high entropy subdomains that contain both letters and numbers
    alphanumeric_subdomains = [sub for sub in subdomains[:-1] if re.search(r'\d+', sub) and re.search(r'[a-zA-Z]+', sub)]
    if any([entropy(sub) > 3.5 for sub in alphanumeric_subdomains]):
        return True

    # Filter domain with subdomains containing only digits
    if any([re.fullmatch(r'\d+', sub) for sub in subdomains[:-1]]):
        return True

    # Filter domain with subdomains composed of random strings containing only consonants or only vowels
    if any([is_random_string(sub) for sub in subdomains[:-1]]):
        return True

    return False

with open('domains.txt', 'r') as f:
    domains = f.read().splitlines()

num_domains = len(domains)

filtered_domains = [d for d in domains if not is_potential_false_positive(d)]

num_eliminated_domains = num_domains - len(filtered_domains)
elimination_percentage = (num_eliminated_domains / num_domains) * 100

print(f"Initial domain count: {num_domains}")
print(f"Filtered domain count: {len(filtered_domains)}")
print(f"Eliminated domains: {num_eliminated_domains} ({elimination_percentage:.2f}% reduction)")

with open('filtered_domains.txt', 'w') as f:
    for domain in filtered_domains:
        f.write(f"{domain}\n")
