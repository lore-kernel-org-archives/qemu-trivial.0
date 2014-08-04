Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XEDBu-0001rq-5I
	for mharc-qemu-trivial@gnu.org; Mon, 04 Aug 2014 04:00:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35505)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XEDBl-0001el-QH
	for qemu-trivial@nongnu.org; Mon, 04 Aug 2014 04:00:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XEDBg-0007fu-5q
	for qemu-trivial@nongnu.org; Mon, 04 Aug 2014 04:00:13 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47468)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XEDBU-0007Q5-Pm; Mon, 04 Aug 2014 03:59:56 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 48809408C0;
	Mon,  4 Aug 2014 11:59:48 +0400 (MSK)
Message-ID: <53DF3D74.9070503@msgid.tls.msk.ru>
Date: Mon, 04 Aug 2014 11:59:48 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.6.0
MIME-Version: 1.0
To: Chen Gang <gang.chen.5i5j@gmail.com>
References: <53DE5538.1020701@gmail.com>
In-Reply-To: <53DE5538.1020701@gmail.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] Cc'ing emails [was: [PATCH] dump.c: Fix memory leak
 issue in cleanup processing for dump_init()]
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
X-List-Received-Date: Mon, 04 Aug 2014 08:00:19 -0000

Please stop Cc'ing me emails sent to, at least, qemu-trivial@.

I'm about to filter personal emails which are also sent to
some mailinglists I receive.  I'd not do that, because this is
a good practice to Cc someone like that for various really
important or urgent emails, and if I to apply such a filter,
these urgent emails will be filtered too, obviously.

I'm not sure how people treat these cases or deal with them.
We are subscribed to, in particular, qemu-devel@, and active
maintainers look there too, so receive more than one copy of
many emails.

It is becoming worse.  With get_maintainer.pl pulling addresses
of people who made changes or commits to files by default,
contributing to the project becomes a bit dangerous.  Because
as a result, once you fix something, you're essentially being
subscribed to a spam list, because other contributors start
Ccing you for the patches with which you have absolutely nothing
to do, and if a discussion emerges, you can't opt out of it
anymore (especially for patches which raise hot discussions).
So I'd rather think twice before contributing anything...

Thanks,

/mjt

