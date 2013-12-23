Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vv4TG-0005r1-5q
	for mharc-qemu-trivial@gnu.org; Mon, 23 Dec 2013 07:18:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57251)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vv4TB-0005qt-5e
	for qemu-trivial@nongnu.org; Mon, 23 Dec 2013 07:18:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vv4T6-0002m6-2n
	for qemu-trivial@nongnu.org; Mon, 23 Dec 2013 07:18:49 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:44572)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vv4T5-0002m0-RH
	for qemu-trivial@nongnu.org; Mon, 23 Dec 2013 07:18:43 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 54BF1431B5;
	Mon, 23 Dec 2013 16:18:42 +0400 (MSK)
Message-ID: <52B82A22.60502@msgid.tls.msk.ru>
Date: Mon, 23 Dec 2013 16:18:42 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: =?UTF-8?B?QW5kcsOpIEhlbnRzY2hlbA==?= <nerv@dawncrow.de>
References: <52B779F1.5080901@dawncrow.de>
In-Reply-To: <52B779F1.5080901@dawncrow.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
	Alexander Graf <agraf@suse.de>
Subject: Re: [Qemu-trivial] [PATCH] linux-user: Support the accept4
	socketcall
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
X-List-Received-Date: Mon, 23 Dec 2013 12:18:53 -0000

23.12.2013 03:46, Andr=C3=A9 Hentschel wrote:
> From: Andr=C3=A9 Hentschel <nerv@dawncrow.de>
> Cc: Riku Voipio <riku.voipio@iki.fi>
> Cc: Alexander Graf <agraf@suse.de>
> Signed-off-by: Andr=C3=A9 Hentschel <nerv@dawncrow.de>
> ---
> See https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tre=
e/include/uapi/linux/net.h for the values.
> Not entirely sure how to implement recvmmsg and sendmmsg...
> PS: I hit send to early on the last attempt, sry.

The patch appears to be okay, but I'm not sure why you're sending it to -=
trivial,
linux-user has an active maintainer (Riku, who has been Cc'ed too).  If h=
e agrees
I can apply this to -trivial.

Reviewed-by: Michael Tokarev <mjt@tls.msk.ru>

/mjt

