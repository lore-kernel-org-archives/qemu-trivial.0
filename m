Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmNOy-0002f1-EJ
	for mharc-qemu-trivial@gnu.org; Tue, 11 Jun 2013 08:10:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34517)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UmNOv-0002aL-9i
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 08:10:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UmNOt-0004lT-VB
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 08:10:13 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56972)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UmNBJ-0008RX-BX; Tue, 11 Jun 2013 07:56:09 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 1C8C44123A;
	Tue, 11 Jun 2013 15:56:07 +0400 (MSK)
Message-ID: <51B71056.6050909@msgid.tls.msk.ru>
Date: Tue, 11 Jun 2013 15:56:06 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
References: <1370949238-2770-1-git-send-email-afaerber@suse.de>
In-Reply-To: <1370949238-2770-1-git-send-email-afaerber@suse.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, brogers@suse.com, qemu-devel@nongnu.org,
	qemu-stable@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Makefile: Install qemu-img and qemu-nbd
 man pages only if built
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
X-List-Received-Date: Tue, 11 Jun 2013 12:10:14 -0000

11.06.2013 15:13, Andreas F=C3=A4rber wrote:
> When splitting openSUSE's qemu and qemu-linux-user packages we noticed
> that for linux-user-only builds unrelated man pages got installed.
> It's surely possible to delete them before packaging, but not installin=
g
> them in the first place seems more logical.

Thanks, applied to the trivial patches queue.

It is somethigh I wanted to do for a long time -- exactly due to the
same reason, when we build qemu-user[-static] target on debian it
installs the irrelevant manpages... ;)

/mjt


