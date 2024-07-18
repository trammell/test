import os
from openai import OpenAI

client = OpenAI()


### SYSTEM_MESSAGE = '''
### You are a helpful assistant that creates Retrieval Augmented Generation (RAG)
### prompts. RAG is an architecture that augments the capabilities of a Large
### Language Model (LLM) like ChatGPT by adding an information retrieval system
### that provides grounding data.
### 
### Behave as though you personally know everything there is to know about
### Washington & Jefferson university.
### 
### Use the information in the statements included in the prompt to build your
### reply. Do not use the phrase "provided documents" or mention that any documents
### have been provided.
### '''

SYSTEM_MESSAGE = '''
You are a helpful AI assistant answering user questions about Washington &
Jefferson university. Behave as though you personally know everything there is
to know about the university.

Do not use the phrase "provided documents" or mention that any documents or
information have been provided to you.
'''

USER_MESSAGE = '''
# Current Conversation
This is the transcript of a conversation. Use this transcript to determine the
question being asked.

USER: who is the sheriff of nottingham


# Context
The following key/value pairs are relevant to the current conversation. These
key/value pairs may be used to answer the question:

- name: school_name, value: Washington & Jefferson, type: text


- name: school_shortname, value: W&J, type: text


- name: school_fullname, value: Washington & Jefferson College, type: text


- name: enrollment_phone, value: 724-531-6860, type: text


- name: event_categories, value: ['On-Campus'], type: list


- name: student_type_freshman, value: freshman, type: text


- name: model_version, value: 0.7.8, type: text


- name: model_date, value: 29 Apr 2024, type: text


- name: prompt_user_to_make_appt, value: True, type: bool


- name: search_counter, value: 0.0, type: float


- name: search_counter_threshold, value: 2.5, type: float



- name: event_names, value: ['Titusville Senior High School', 'Healthcare Careers Expo', 'Plan Your W&J Personal Visit', '75th Regional College Fair - Northern Westchester & Putnam Counties', 'Uncommon Tour - A Virtual Experience'], type: list


- name: button_instructions_provided, value: False, type: bool




# What you know
Here is the information that you know:

*. {'source': 'docs/txt/ff27b67b.txt'}
Sarris Candies
Specialty chocolate and candies company. Stop by to check out their 1,500 pound chocolate castle, or enjoy an ice-cream treat in their old-fashioned ice cream parlor.
The Spring House
This family-owned and operated dairy farm and restaurant features country comfort food at it's best, as well as a from-scratch bakery, and seasonal events.
The Washington Wild Things
Washington County's local Frontier League baseball and beautiful ballpark is an entertaining evening for a lot of our students!

*. {'source': 'docs/txt/b39bff85.txt'}
Members of the staff, include certified police officers as well as security officers who are focused on security, general safety and fire safety, and who are devoted to the safety of W&J's campus. The officers are empowered by the Commonwealth of Pennsylvania to enforce laws, make arrests, and prosecute violators on property owned or controlled by the College and on adjacent streets and properties.
Learn more about Campus & Public Safety
Building Access
Residence halls on campus are locked 24 hours a day. Students have access to their building via their student ID card. The Swanson Wellness Center and James David Ross Family Recreation Center/Henry Gym are accessible via card swipe during open hours. Classroom buildings are open during the business hours, but several facilities allow ID card swipe access after-hours.
Emergency Notifications

*. {'source': 'docs/txt/a4954053.txt'}
Members of the 17-person staff, include certified police officers as well as security officers who are focused on security, general safety and fire safety, and who are devoted to the safety of W&J's campus. The officers are empowered by the Commonwealth of Pennsylvania to enforce laws, make arrests, and prosecute violators on property owned or controlled by the College and on adjacent streets and properties.
Learn more about Campus & Public Safety




Building Access




Residence Halls on campus are locked 24 hours a day. Students have access to their building via their student ID cards. The Swanson Wellness Center and James David Ross Family Recreation Center/Henry Gym are accessible via card swipe during open hours. Classroom buildings are open during business hours, but several facilities allow ID card swipe access after-hours.




Emergency Notifications

*. {'source': 'docs/txt/8c5f4411.txt'}
Accounting, Economics, Computing & Information Studies



READ THEIR FULL STORY















“I want to serve both the United States and Morocco as a student-diplomat through the Fulbright program…and be a source for strengthening US-Moroccan relations through education,” Sherwood said of the opportunity. “I’ll be in the city of Tangier teaching at the Ecole Supérieure Roi Fahd de Traduction (King Fahd Translation School), Abdelmalek Essaâdi University. I’m quite excited to…make use of my Spanish skills, as well as Arabic.”

Clara Sherwood '22

Conflict & Resolution Studies, International Studies, Spanish, Music



READ THEIR FULL STORY















“Without this experience I don’t think I would have been able to carve the current path for my future that I have,” Donahue said. “I loved this opportunity, and I would encourage every student to participate in some sort of internship in their college career.”

Alex Donahue '22

Business Administration


# Answer the Question
Based on the instructions shown above, answer the question in the user's last
message.
* Avoid speculating or making assumptions beyond what you know.
* Limit the length of your answer to at most three sentences.
* If an answer cannot be determined from the above information and context,
  state that you do not know the answer.
* Do not use the phrase "based on the information provided"

## An Example

Given this knowledge:
    - At the Moon’s center is a dense, metallic core. This core is largely
      composed of iron and some nickel. The Moon’s core is relatively small
      (about 20% of its diameter) compared to other terrestrial worlds (like
      Earth) with cores measuring closer to 50% of their diameters.
    - Nearly the entire Moon is covered by a rubble pile of charcoal-gray,
      powdery dust and rocky debris called the lunar regolith. Beneath is a
      region of fractured bedrock referred to as the megaregolith.
    - Fairytales tell us that the moon is made of cheese, but like all bodies
      in the solar system, rock is the more realistic ingredient. The moon's
      surface is covered with dead volcanoes, impact craters, and lava flows,
      some visible to the unaided stargazer.

And this question:

    What is the moon made of?

An acceptable answer is:

    The Moon is primarily composed of a dense, metallic core made of iron and
    some nickel at its center. The Moon's surface consists of a rubble pile of
    charcoal-gray, powdery dust and rocky debris known as lunar regolith, which
    sits above fractured bedrock called the megaregolith. The popular notion of
    the Moon being made of cheese is just a fairytale.

---
Your answer:

'''

chat_completion = client.chat.completions.create(
    messages=[
        {
            "role": "system",
            "content": SYSTEM_MESSAGE,
        },
        {
            "role": "user",
            "content": USER_MESSAGE,
        },
    ],
    model="gpt-4",
    temperature=0.7,
)

for c in chat_completion.choices:
    print(c.message.content)

