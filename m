Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vgep9-0005NR-5t
	for mharc-qemu-trivial@gnu.org; Wed, 13 Nov 2013 13:05:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48813)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Vgeoz-0005C4-JK
	for qemu-trivial@nongnu.org; Wed, 13 Nov 2013 13:05:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Vgeor-0004l7-4l
	for qemu-trivial@nongnu.org; Wed, 13 Nov 2013 13:05:45 -0500
Received: from [2a03:4000:1::4e2f:c7ac:d] (port=44861
	helo=v220110690675601.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1VgeoX-0004h1-Mk; Wed, 13 Nov 2013 13:05:17 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	A1EFF728019E; Wed, 13 Nov 2013 19:05:14 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id j5eS4rnyI2h4; Wed, 13 Nov 2013 19:05:03 +0100 (CET)
Received: from [192.168.178.35] (p54AD829C.dip0.t-ipconnect.de
	[84.173.130.156])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	33BEB7280100; Wed, 13 Nov 2013 19:05:03 +0100 (CET)
Message-ID: <5283BF4E.1020009@weilnetz.de>
Date: Wed, 13 Nov 2013 19:05:02 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, 
 Anthony Liguori <aliguori@amazon.com>
References: <1384347680-15976-1-git-send-email-mjt@msgid.tls.msk.ru>
In-Reply-To: <1384347680-15976-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:1::4e2f:c7ac:d
Cc: qemu-trivial@nongnu.org, Jan Krupa <JKrupa@suse.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PULL 00/16] [for-1.7] Trivial patches for
	2013-11-13
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
X-List-Received-Date: Wed, 13 Nov 2013 18:05:54 -0000

Am 13.11.2013 14:01, schrieb Michael Tokarev:
> Here's a next trivial-patches pull request, for patches collected
> in almost 3 weeks.
>
> There's nothing extra-ordinary here, except of one thing: this is
> keyboard maps handling series by Jan Krupa.  While I don't expect
> any breakage in this area, but the series introduces a new keymap
> (cz), fixes other keymaps by adding symbol definitions used in there
> to qemu, and adds some functionality which may be helpful when
> working with keymaps (like recognizing (only basic) unicode chars
> in form of Uxxxx).  I haven't heard anything about this series
> from anyone else, except of the comments from Anthony that the
> whole kbd handling needs some major restructuring/changing, so
> I still don't understand whenever applying this is a good idea
> or not.  If you think it is not a good idea, I can easily prepare
> another pull request without these changes.
>
> There are a few other changes which potentially might be a bit
> dangerous, like the trace.h include changes by Stefan Weil --
> while these changes look fine, there's still a remote chance
> that one of them will break build in some configuration or platform.
> Maybe it is not a good idea to apply this at such late point in
> the release cycle.  I verified these, but I haven't tested all
> platforms, especially win*.
>
> Please consider applying.

The two trace.h related patches moved include statements from .h files
to .c files.
I compiled the resulting code on 64 bit Linux, also with cross
compilation for
MinGW, so win* won't be a problem.

Nevertheless there remains a risk because my builds don't include all QEMU
options (especially not spice, rbd, nss, libusb, seccomp).

Both patches were not marked for 1.7, so please skip them when pulling
for 1.7.

You will also have to skip "Console: Replace conditional debug messages
by trace methods"
because it depends on one of the other patches.

Cheers,
Stefan


