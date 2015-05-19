#!/usr/bin/env python2.4
# vim: set tw=60 :

I18N_DOMAIN = 'my.i18n.domain'

from zope.i18nmessageid import MessageFactory as _MessageFactory

_ = MessageFactory = _MessageFactory(I18N_DOMAIN)

# single-line phrases

print _("Phrase 1")

print _(u"Phrase 2")

print _(u'Phrase 3')

print _(u'''Phrase 4''')

print _('''Phrase 5''')

# phrases with multi-line msgid

print _("""This is a \
multiline phrase xxxx""")

print _("""This is a
multiline phrase yyyy""")

print _('multiline-phrase-msgid',default=u"""This phrase
is a multiline phrase
and it has a separate message ID""")

print _(u"""This is a unicode \
multiline phrase""")

print _(u'''This is another
multiline phrase''')

# phrases with msgid, default, and mapping

print _('fruit1', default=u'''My favorite fruit is ${fruit}
multiline phrase''', mapping={'fruit': 'banana'})




