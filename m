Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XEbFw-0004GN-LM
	for mharc-qemu-trivial@gnu.org; Tue, 05 Aug 2014 05:42:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45156)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XEbFo-00045g-2A
	for qemu-trivial@nongnu.org; Tue, 05 Aug 2014 05:42:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XEbFj-00042X-IJ
	for qemu-trivial@nongnu.org; Tue, 05 Aug 2014 05:41:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:63007)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1XEbFY-000414-Se; Tue, 05 Aug 2014 05:41:45 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s759feJw000810
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 5 Aug 2014 05:41:41 -0400
Received: from blackfin.pond.sub.org (ovpn-116-42.ams2.redhat.com
	[10.36.116.42])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s759fcFm015659
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 5 Aug 2014 05:41:40 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id EF82B3009E37; Tue,  5 Aug 2014 11:41:37 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
References: <53DE5538.1020701@gmail.com> <53DF3D74.9070503@msgid.tls.msk.ru>
	<87d2cguupa.fsf@blackfin.pond.sub.org> <53E06083.7080909@gmail.com>
	<53E082EF.9090007@msgid.tls.msk.ru>
Date: Tue, 05 Aug 2014 11:41:37 +0200
In-Reply-To: <53E082EF.9090007@msgid.tls.msk.ru> (Michael Tokarev's message of
	"Tue, 05 Aug 2014 11:08:31 +0400")
Message-ID: <87y4v3mfxq.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Chen Gang <gang.chen.5i5j@gmail.com>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] Cc'ing emails [
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Aug 2014 09:42:04 -0000

Michael Tokarev <mjt@tls.msk.ru> writes:

> 05.08.2014 08:41, Chen Gang wrote:
>> 
>> Every members have their own tastes, and one working flow may be not
>> suitable for all members. I can understand, and hope other members
>> understand too.
>> 
>> At least for me, next, I shall send patch to the members which I can get
>> from 'get_maintainers.pl' and only Cc to qemu-devel. And shall skip
>> qemu-trivial and Michael Tokarev.
>
> Why skip both?  It's your call, but I'm curious.
>
> What I _think_ wrong is that get_maintainers.pl lists many random
> "patchers" for a given file by default.
>
> Besides, we should probably review role of Anthony Ligory, because
> he is returned as a sole contact for manu files, but apparently he
> does not reply to emails anymore.
>
> []
>>>> I'm not sure how people treat these cases or deal with them.
>>>> We are subscribed to, in particular, qemu-devel@, and active
>>>> maintainers look there too, so receive more than one copy of
>>>> many emails.
>>>
>>> I believe fighting the established convention to copy is futile.  I
>>> embrace it instead, and make it help me prioritize my reading.  Copy me,
>>> and I'll at least skim cover letters and other thread-starters to
>>> determine whether I need to follow this thread.  Don't copy me, and I'll
>>> at best glance at the subject in passing.
>
> We created some separate mailinglists - for example -trivial@ - especially
> to get such attention.  This is what I'm talking about, in most part,
> because main qemu mailinglist traffic become quite a bit high to follow
> it closely, and it is a good idea indeed to Cc someone when sending mail
> to qemu-devel@.  But even there, Cc'ing random "patchers" as get_maintainer.pl
> often suggests is _not_ a good idea.  I think.

I don't disagree with you there.  I take get_maintainer.pl as advice,
not gospel.

Note that because --git is *off* by default, you get "random patchers"
only when MAINTAINERS comes up empty.  Which it does far too often,
because its coverage is lousy: some 1300 out of >3600 files.

We could default --git-fallback to off to suppress "random patchers"
unless you ask for them.

>>> Automatic filing into folders and marking copies so I don't have to mark
>>> them read twice helps.
>>>
>>> The additional traffic is a drop in a bucket.
>
> Which traffic you refer to as "additional"?  The personal emails?

The personal copies compared to the full list traffic.

I count some 1200 messages to qemu-devel for the past week.  32 contain
the string "mjt@tls", which I take as a crude upper bound for you
getting a copy.  I don't mean to say that's not annoying or a drain on
your time (who am I to judge?), just that the additional network traffic
over full qemu-devel delivery is negligible.

> At least in my case it is quite significant because of qemu, and qemu
> is _far_ from a single project where I actively contributed.  For example,
> I contributed many things to postfix, but I don't have to worry about
> it in any way, and I don't receive random personal emails - if something
> is being Cc'ed to me it really is something important.  Ditto for linux
> kernel and other areas.

I recommend to set up filters to file away list traffic and copies of
list traffic separately from your private e-mail.

> In case of qemu, see -- for example, Anthony, who apparently stepped
> out from qemu.  Almost every email on qemu-devel@ is being Cc'ed to
> him nowadays, so he receives _whole_ qemu-devel@ in his personal
> mailbox.

I'd be surprised if he received copies in his personal inbox.  I expect
him to file them smartly.

>           Is it also a drop in (his) bucket?

I guess it is: 125 of last week's messages contain "aliguori@".

