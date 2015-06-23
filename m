Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7Rgo-0002h5-C1
	for mharc-qemu-trivial@gnu.org; Tue, 23 Jun 2015 13:08:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40809)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z7Rgl-0002ds-8C
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 13:08:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z7Rgk-00035A-Ak
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 13:08:47 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53333)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z7Rgf-00031M-98; Tue, 23 Jun 2015 13:08:41 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 5AEDF42051;
	Tue, 23 Jun 2015 20:08:33 +0300 (MSK)
Message-ID: <55899291.306@msgid.tls.msk.ru>
Date: Tue, 23 Jun 2015 20:08:33 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <cover.1434971627.git.mjt@msgid.tls.msk.ru>
	<CAFEAcA9ru4tyzXNUW0USsN13wEP4v5hGOREbPZWVOkrLDS41=Q@mail.gmail.com>
In-Reply-To: <CAFEAcA9ru4tyzXNUW0USsN13wEP4v5hGOREbPZWVOkrLDS41=Q@mail.gmail.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Wolfgang Bumiller <w.bumiller@proxmox.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PULL 00/21] Trivial patches for 2015-06-22
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
X-List-Received-Date: Tue, 23 Jun 2015 17:08:48 -0000

22.06.2015 19:02, Peter Maydell wrote:

> Fails to build on Windows:
>=20
> util/qemu-sockets.c: In function =E2=80=98inet_parse_connect_opts=E2=80=
=99:
> util/qemu-sockets.c:338: error: =E2=80=98AI_V4MAPPED=E2=80=99 undeclare=
d (first use in this function)

Hmm.  Does WIN really have no AI_V4MAPPED?  Does it have getaddrinfo
in the first place?  If yes, it should have AI_V4MAPPED too.

I added a conditional #define AI_V4MAPPED to 0 at the top of this
file, the same way AI_ADDRCONFIG is handled.

> (Also I had to resolve a conflict in configure, so if you rebase
> on current master you'll save me having to do it twice...)

Immediately before sending the pull request, I did a rebase and rebuild.
Apparently you pulled some other change before trying to pull this.
I usually rebase right before sending the request.  Just did the
rebase again, and fixed he conflict with guest-agent-msi change.

Will resend the pull request.

Thanks,

/mjt

