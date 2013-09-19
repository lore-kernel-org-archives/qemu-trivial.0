Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VMfTV-0000MK-N0
	for mharc-qemu-trivial@gnu.org; Thu, 19 Sep 2013 10:44:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50311)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1VMfTP-0000CP-HO
	for qemu-trivial@nongnu.org; Thu, 19 Sep 2013 10:44:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1VMfTL-0003rv-6j
	for qemu-trivial@nongnu.org; Thu, 19 Sep 2013 10:44:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34472)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1VMfTB-0003qo-85; Thu, 19 Sep 2013 10:44:37 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r8JEiasI031697
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 19 Sep 2013 10:44:36 -0400
Received: from localhost (ovpn-112-43.ams2.redhat.com [10.36.112.43])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r8JEiYsa001396; Thu, 19 Sep 2013 10:44:35 -0400
Date: Thu, 19 Sep 2013 16:44:34 +0200
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20130919144434.GQ22814@stefanha-thinkpad.redhat.com>
References: <1379436196-27506-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1379436196-27506-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	r8JEiasI031697
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] block: Fix compiler warning
	(-Werror=uninitialized)
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
X-List-Received-Date: Thu, 19 Sep 2013 14:44:56 -0000

On Tue, Sep 17, 2013 at 06:43:16PM +0200, Stefan Weil wrote:
> The patch fixes a warning from gcc (Debian 4.6.3-14+rpi1) 4.6.3:
>=20
> block/stream.c:141:22: error:
> =E2=80=98copy=E2=80=99 may be used uninitialized in this function [-Wer=
ror=3Duninitialized]
>=20
> This is not a real bug - a better compiler would not complain.
>=20
> Now 'copy' has always a defined value, so the check for ret >=3D 0
> can be removed.
>=20
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  block/stream.c |    5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Thanks, applied to my block tree:
https://github.com/stefanha/qemu/commits/block

Stefan

