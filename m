Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YgXgB-00022a-Eg
	for mharc-qemu-trivial@gnu.org; Fri, 10 Apr 2015 08:04:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43679)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1YgXg4-0001sj-5A
	for qemu-trivial@nongnu.org; Fri, 10 Apr 2015 08:04:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1YgXg3-0007gr-4B
	for qemu-trivial@nongnu.org; Fri, 10 Apr 2015 08:04:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42960)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1YgXg0-0007gI-Ro; Fri, 10 Apr 2015 08:04:48 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 7AF493C223;
	Fri, 10 Apr 2015 12:04:48 +0000 (UTC)
Received: from localhost (ovpn-112-29.ams2.redhat.com [10.36.112.29])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t3AC4kAA013619; Fri, 10 Apr 2015 08:04:47 -0400
Date: Fri, 10 Apr 2015 13:00:04 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20150410120004.GL23555@stefanha-thinkpad.redhat.com>
References: <1428604359-17067-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AQNmCumFClRcGgHG"
Content-Disposition: inline
In-Reply-To: <1428604359-17067-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Kevin Wolf <kwolf@redhat.com>, Alexander Graf <agraf@suse.de>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developer <qemu-devel@nongnu.org>,
	Jiri Slaby <jslaby@suse.cz>, Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [PATCH] misc: Fix new collection of typos
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
X-List-Received-Date: Fri, 10 Apr 2015 12:04:58 -0000


--AQNmCumFClRcGgHG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 09, 2015 at 08:32:39PM +0200, Stefan Weil wrote:
> All of them were reported by codespell.
> Most typos are in comments, one is in an error message.
>=20
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/block/virtio-blk.c     |    2 +-
>  hw/misc/edu.c             |    2 +-
>  hw/net/virtio-net.c       |    2 +-
>  hw/ppc/spapr.c            |    2 +-
>  qga/qapi-schema.json      |    2 +-
>  target-s390x/mmu_helper.c |    8 ++++----
>  target-s390x/translate.c  |    2 +-
>  tests/libqos/ahci.c       |    4 ++--
>  8 files changed, 12 insertions(+), 12 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--AQNmCumFClRcGgHG
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJVJ7tEAAoJEJykq7OBq3PIV7UIAKhxfwKlZPX8EGsSWHu8kkhO
mJFfXKfCHb1VhyG5JDk7EbqoSbH6ckt0CQyF1mgRQVcLrKY78awPvab19XC/XqaJ
kQ4s1jbG3iK3EBM5adU0VxqTp3autI4sbgSTqywVxvcFbkImbwqYZtlvZoEjVWF9
2UqhWqqPDp5vjiGSgkc+ho6qqhRmIF4dwLOfmnhGRf8UdbYN5+0pH+XFUg6pK0hj
0hEDYodmBxtYrlkt7wqF7rD+TrfbnKVrXmpJj1lH+Fb/luF0xkFXLfcSSBeEspt+
q55qlCtyIQzQZ17SBatJ+HIXVin2A6GjcLYQp1FZ6gyiJFiL+engJuSTAyopuIc=
=JMp6
-----END PGP SIGNATURE-----

--AQNmCumFClRcGgHG--

