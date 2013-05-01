Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UXaOr-0002PO-Ol
	for mharc-qemu-trivial@gnu.org; Wed, 01 May 2013 13:01:01 -0400
Received: from eggs.gnu.org ([208.118.235.92]:55401)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UXaOo-0002NW-Bg
	for qemu-trivial@nongnu.org; Wed, 01 May 2013 13:01:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UXaOn-0008QB-1Z
	for qemu-trivial@nongnu.org; Wed, 01 May 2013 13:00:58 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39282)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UXaOj-0008PK-Rs; Wed, 01 May 2013 13:00:54 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id AEEA140073;
	Wed,  1 May 2013 21:00:52 +0400 (MSK)
Message-ID: <51814A44.5030809@msgid.tls.msk.ru>
Date: Wed, 01 May 2013 21:00:52 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: =?UTF-8?B?SGVydsOpIFBvdXNzaW5lYXU=?= <hpoussin@reactos.org>
References: <1367386886-6839-1-git-send-email-hpoussin@reactos.org>
In-Reply-To: <1367386886-6839-1-git-send-email-hpoussin@reactos.org>
X-Enigmail-Version: 1.6a1pre
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH for 1.5] pvscsi: fix compilation on 32
 bit hosts
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
X-List-Received-Date: Wed, 01 May 2013 17:01:00 -0000

01.05.2013 09:41, Herv=C3=A9 Poussineau wrote:
> This fixes the following error:
> In file included from qemu/include/trace.h:4:0,
>                  from trace/generated-events.c:3:
> ./trace/generated-tracers.h: In function =E2=80=98trace_pvscsi_get_sg_l=
ist=E2=80=99:
> ./trace/generated-tracers.h:4271:9: error: format =E2=80=98%lu=E2=80=99=
 expects argument of
> type =E2=80=98long unsigned int=E2=80=99, but argument 4 has type =E2=80=
=98size_t=E2=80=99 [-Werror=3Dformat]
>=20
> Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>

Thanks, applied to qemu-trivial tree (6e860b5db4c76c66d7e02f93c9e22e0384b=
d3c6c).

/mjt

