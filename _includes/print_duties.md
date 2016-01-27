{% for category in duties %}
### {{ category.name }}
<ul>
    {% for duty in category.values %}
    <li>{{ duty.period }} - {{ duty.name }}<br/>
    {{ duty.at }}
    </li>
    {% endfor %}
</ul>
{% endfor %}
