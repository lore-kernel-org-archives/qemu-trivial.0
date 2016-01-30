Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aPS9H-0008Rl-7y
	for mharc-qemu-trivial@gnu.org; Sat, 30 Jan 2016 04:48:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42212)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aPS9E-0008Ml-Kt
	for qemu-trivial@nongnu.org; Sat, 30 Jan 2016 04:48:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aPS9D-0003x0-TI
	for qemu-trivial@nongnu.org; Sat, 30 Jan 2016 04:48:52 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:56650)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aPS99-0003wL-Pn; Sat, 30 Jan 2016 04:48:47 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 3CBAE41CA2;
	Sat, 30 Jan 2016 12:48:47 +0300 (MSK)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org
References: <1453991009-32736-1-git-send-email-alex.bennee@linaro.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <56AC86FF.2050806@msgid.tls.msk.ru>
Date: Sat, 30 Jan 2016 12:48:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <1453991009-32736-1-git-send-email-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: kwolf@redhat.com, qemu-trivial@nongnu.org, david@gibson.dropbear.id.au,
	stefanha@redhat.com, pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [PATCH v3 0/3] Travis updates
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
X-List-Received-Date: Sat, 30 Jan 2016 09:48:53 -0000

28.01.2016 17:23, Alex Benn=C3=A9e wrote:
> Hi,
>=20
> The first patch has been reviewed and signed off. Long term I think
> it is worth applying but it look like the performance increase it
> negligible compared to the old style VM builds at the moment. I
> suspect this may be because the new infrastructure is under more load
> as more projects have migrated.

I'm applying all this to -trivial, but without trying to understand
what it is all about, as I don't know travis.

Thanks,

/mjt

