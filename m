Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dSmas-0004pO-UN
	for mharc-qemu-trivial@gnu.org; Wed, 05 Jul 2017 11:51:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44767)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dSmaq-0004o2-2b
	for qemu-trivial@nongnu.org; Wed, 05 Jul 2017 11:51:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dSmap-0005eJ-6v
	for qemu-trivial@nongnu.org; Wed, 05 Jul 2017 11:51:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39440)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1dSmak-0005cY-MK; Wed, 05 Jul 2017 11:51:50 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5E6A080474;
	Wed,  5 Jul 2017 15:51:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 5E6A080474
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=armbru@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 5E6A080474
Received: from blackfin.pond.sub.org (ovpn-116-60.ams2.redhat.com
	[10.36.116.60])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 780176F449;
	Wed,  5 Jul 2017 15:51:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id DD1531138619; Wed,  5 Jul 2017 17:51:43 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20170626101159.19676-1-berrange@redhat.com>
	<c4381bd8-a417-0c3b-f3c2-1292ca9f6dfc@redhat.com>
	<20170705134104.GD1280@stefanha-x1.localdomain>
Date: Wed, 05 Jul 2017 17:51:43 +0200
In-Reply-To: <20170705134104.GD1280@stefanha-x1.localdomain> (Stefan
	Hajnoczi's message of "Wed, 5 Jul 2017 14:41:04 +0100")
Message-ID: <87bmoynapc.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 05 Jul 2017 15:51:49 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] sockets: avoid formatting
 buffer that may not be NULL terminated
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Jul 2017 15:51:57 -0000

Stefan Hajnoczi <stefanha@gmail.com> writes:

> On Mon, Jun 26, 2017 at 12:19:40PM +0200, Thomas Huth wrote:
>> On 26.06.2017 12:11, Daniel P. Berrange wrote:
>> > The 'sun_path' field in the sockaddr_un struct is not required
>> > to be NULL termianted, so when reporting an error, we must use
>> 
>> s/NULL/NUL/
>> 
>> NULL is a pointer, NUL is the '\0' character.
>
> I wanted to point out the same thing to someone recently, so I chased up
> a reference to the NUL character in RFC 20 "ASCII format for Network
> Interchange".  After all, no one can argue with an RFC.
>
> What I found shocked me!  There must be a typo in the ASCII RFC:
> https://tools.ietf.org/html/rfc20#section-5.2
>
> I closed my browser tab quickly and headed to Wikipedia instead.  If the
> primary source didn't support my argument, I could always count on good
> old Wikipedia...
>
> But do you know what I found?  Someone had conflated nul and null on the
> Wikipedia entry:
> https://en.wikipedia.org/wiki/Null_character
>
> Amateurs!  The Wikipedia editors probably didn't have the intellectual
> calibre to question the correctness of the RFC text the way I did.
>
> But to cut a long story short, as my search continued the evidence
> became overwhelming.  It is acceptable to refer to the nul character as
> the null character.
>
> Coming back to the patch in question, although we can't complain about
> the "NULL" it's with considerable joy that I'd like to highlight:
>
> s/termianted/terminated/
>
> :)
> Stefan

Despite this shocking, shocking precedence, I formally object to the use
of NULL in the context of C for anything other than "one particular null
pointer".  C's confusing enough without overloading identifiers.

