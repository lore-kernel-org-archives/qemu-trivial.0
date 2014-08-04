Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XEKQJ-0006Nj-FB
	for mharc-qemu-trivial@gnu.org; Mon, 04 Aug 2014 11:43:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47081)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XEKQC-0006F5-9K
	for qemu-trivial@nongnu.org; Mon, 04 Aug 2014 11:43:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XEKQ7-0000x7-CB
	for qemu-trivial@nongnu.org; Mon, 04 Aug 2014 11:43:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37727)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1XEKPw-0000pz-0v; Mon, 04 Aug 2014 11:43:20 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s74FhGgA023066
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 4 Aug 2014 11:43:17 -0400
Received: from blackfin.pond.sub.org (ovpn-116-40.ams2.redhat.com
	[10.36.116.40])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s74FhDPI008601
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 4 Aug 2014 11:43:15 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 46D843043FD2; Mon,  4 Aug 2014 17:43:13 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
References: <53DE5538.1020701@gmail.com> <53DF3D74.9070503@msgid.tls.msk.ru>
Date: Mon, 04 Aug 2014 17:43:13 +0200
In-Reply-To: <53DF3D74.9070503@msgid.tls.msk.ru> (Michael Tokarev's message of
	"Mon, 04 Aug 2014 11:59:48 +0400")
Message-ID: <87d2cguupa.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
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
X-List-Received-Date: Mon, 04 Aug 2014 15:43:42 -0000

Michael Tokarev <mjt@tls.msk.ru> writes:

> Please stop Cc'ing me emails sent to, at least, qemu-trivial@.

I'll try to remember, but in general you can't expect everyone to keep
tabs on who wants and who doesn't want to be copied.

> I'm about to filter personal emails which are also sent to
> some mailinglists I receive.  I'd not do that, because this is
> a good practice to Cc someone like that for various really
> important or urgent emails, and if I to apply such a filter,
> these urgent emails will be filtered too, obviously.
>
> I'm not sure how people treat these cases or deal with them.
> We are subscribed to, in particular, qemu-devel@, and active
> maintainers look there too, so receive more than one copy of
> many emails.

I believe fighting the established convention to copy is futile.  I
embrace it instead, and make it help me prioritize my reading.  Copy me,
and I'll at least skim cover letters and other thread-starters to
determine whether I need to follow this thread.  Don't copy me, and I'll
at best glance at the subject in passing.

Automatic filing into folders and marking copies so I don't have to mark
them read twice helps.

The additional traffic is a drop in a bucket.

> It is becoming worse.  With get_maintainer.pl pulling addresses
> of people who made changes or commits to files by default,
> contributing to the project becomes a bit dangerous.  Because
> as a result, once you fix something, you're essentially being
> subscribed to a spam list, because other contributors start
> Ccing you for the patches with which you have absolutely nothing
> to do, and if a discussion emerges, you can't opt out of it
> anymore (especially for patches which raise hot discussions).
> So I'd rather think twice before contributing anything...

That's sad.

