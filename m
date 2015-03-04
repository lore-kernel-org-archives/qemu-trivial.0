Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTARS-0006Ui-6k
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 09:38:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59225)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTARL-0006Gu-Pu
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 09:38:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTARK-0008Eq-Sq
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 09:38:23 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:50329)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YTARA-00084k-U5; Wed, 04 Mar 2015 09:38:13 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 32B5C4085B;
	Wed,  4 Mar 2015 17:38:12 +0300 (MSK)
Message-ID: <54F718D4.2050804@msgid.tls.msk.ru>
Date: Wed, 04 Mar 2015 17:38:12 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, 
	qemu-devel@nongnu.org
References: <1424448376-15599-1-git-send-email-rkrcmar@redhat.com>
In-Reply-To: <1424448376-15599-1-git-send-email-rkrcmar@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Walle <michael@walle.cc>, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-trivial] [PATCH 0/2] Fix GCC 5.0.0 build errors
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
X-List-Received-Date: Wed, 04 Mar 2015 14:38:29 -0000

20.02.2015 19:06, Radim Kr=C4=8Dm=C3=A1=C5=99 wrote:
> Future patches should address the out-of-bounds access that is left by
> using proposed solution for [2/2].
>=20
> Radim Kr=C4=8Dm=C3=A1=C5=99 (2):
>   fix GCC 5.0.0 logical-not-parentheses warnings
>   milkymist-pfpu: fix GCC 5.0.0 aggressive-loop-optimizations warning
>=20
>  hw/misc/milkymist-pfpu.c | 2 +-
>  hw/net/virtio-net.c      | 4 ++--
>  kvm-all.c                | 2 +-
>  qemu-img.c               | 3 ++-
>  4 files changed, 6 insertions(+), 5 deletions(-)

Applied both to -trivial finally.  Thank you!

/mjt




