Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cRdSU-0007aP-Mh
	for mharc-qemu-trivial@gnu.org; Thu, 12 Jan 2017 06:22:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56109)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cRdSO-0007VE-Iu
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2017 06:22:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cRdSJ-0004dn-MH
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2017 06:22:12 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:36247)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cRdSD-0004cF-Ic; Thu, 12 Jan 2017 06:22:01 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 8CAD740A39;
	Thu, 12 Jan 2017 14:22:01 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id BFC82560;
	Thu, 12 Jan 2017 14:22:00 +0300 (MSK)
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
References: <20170103191933.19416-1-marcandre.lureau@redhat.com>
Cc: sw@weilnetz.de, QEMU Trivial <qemu-trivial@nongnu.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <3699459d-f069-252f-4295-a13af1f01dac@msgid.tls.msk.ru>
Date: Thu, 12 Jan 2017 14:22:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.5.1
MIME-Version: 1.0
In-Reply-To: <20170103191933.19416-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] win32: use glib gpoll if glib >= 2.50
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
X-List-Received-Date: Thu, 12 Jan 2017 11:22:17 -0000

03.01.2017 22:19, Marc-Andr=C3=A9 Lureau wrote:
> A fix has been committed in upstream glib commit
> 210a9796f78eb90f76f1bd6a304e9fea05e97617.
> (See also related bug https://bugzilla.gnome.org/show_bug.cgi?id=3D7644=
15)
>=20
> It is desirable to use the glib version instead of qemu copy, since it
> provides more debugging facilities (G_MAIN_POLL_DEBUG etc), and
> hopefully has a better maintainance. Hopefully, we can drop the qemu
> copy in a few years.

Applied to -trivial, thank you!

/mjt

