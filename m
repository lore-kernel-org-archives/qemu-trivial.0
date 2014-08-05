Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XEYrf-00065N-OI
	for mharc-qemu-trivial@gnu.org; Tue, 05 Aug 2014 03:08:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45080)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XEYrZ-0005vI-4T
	for qemu-trivial@nongnu.org; Tue, 05 Aug 2014 03:08:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XEYrT-000871-SD
	for qemu-trivial@nongnu.org; Tue, 05 Aug 2014 03:08:49 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40297)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XEYrJ-00084P-D1; Tue, 05 Aug 2014 03:08:33 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 5634040CDA;
	Tue,  5 Aug 2014 11:08:31 +0400 (MSK)
Message-ID: <53E082EF.9090007@msgid.tls.msk.ru>
Date: Tue, 05 Aug 2014 11:08:31 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.7.0
MIME-Version: 1.0
To: Chen Gang <gang.chen.5i5j@gmail.com>, 
	Markus Armbruster <armbru@redhat.com>
References: <53DE5538.1020701@gmail.com> <53DF3D74.9070503@msgid.tls.msk.ru>
	<87d2cguupa.fsf@blackfin.pond.sub.org> <53E06083.7080909@gmail.com>
In-Reply-To: <53E06083.7080909@gmail.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>
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
X-List-Received-Date: Tue, 05 Aug 2014 07:08:54 -0000

05.08.2014 08:41, Chen Gang wrote:
> 
> Every members have their own tastes, and one working flow may be not
> suitable for all members. I can understand, and hope other members
> understand too.
> 
> At least for me, next, I shall send patch to the members which I can get
> from 'get_maintainers.pl' and only Cc to qemu-devel. And shall skip
> qemu-trivial and Michael Tokarev.

Why skip both?  It's your call, but I'm curious.

What I _think_ wrong is that get_maintainers.pl lists many random
"patchers" for a given file by default.

Besides, we should probably review role of Anthony Ligory, because
he is returned as a sole contact for manu files, but apparently he
does not reply to emails anymore.

[]
>>> I'm not sure how people treat these cases or deal with them.
>>> We are subscribed to, in particular, qemu-devel@, and active
>>> maintainers look there too, so receive more than one copy of
>>> many emails.
>>
>> I believe fighting the established convention to copy is futile.  I
>> embrace it instead, and make it help me prioritize my reading.  Copy me,
>> and I'll at least skim cover letters and other thread-starters to
>> determine whether I need to follow this thread.  Don't copy me, and I'll
>> at best glance at the subject in passing.

We created some separate mailinglists - for example -trivial@ - especially
to get such attention.  This is what I'm talking about, in most part,
because main qemu mailinglist traffic become quite a bit high to follow
it closely, and it is a good idea indeed to Cc someone when sending mail
to qemu-devel@.  But even there, Cc'ing random "patchers" as get_maintainer.pl
often suggests is _not_ a good idea.  I think.

>> Automatic filing into folders and marking copies so I don't have to mark
>> them read twice helps.
>>
>> The additional traffic is a drop in a bucket.

Which traffic you refer to as "additional"?  The personal emails?

At least in my case it is quite significant because of qemu, and qemu
is _far_ from a single project where I actively contributed.  For example,
I contributed many things to postfix, but I don't have to worry about
it in any way, and I don't receive random personal emails - if something
is being Cc'ed to me it really is something important.  Ditto for linux
kernel and other areas.

In case of qemu, see -- for example, Anthony, who apparently stepped
out from qemu.  Almost every email on qemu-devel@ is being Cc'ed to
him nowadays, so he receives _whole_ qemu-devel@ in his personal
mailbox.  Is it also a drop in (his) bucket?

Thanks,

/mjt

