Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VOogx-0004vn-Hw
	for mharc-qemu-trivial@gnu.org; Wed, 25 Sep 2013 08:59:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53573)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1VOnGs-0008Qc-D9
	for qemu-trivial@nongnu.org; Wed, 25 Sep 2013 07:28:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1VOnGn-0004Bo-9m
	for qemu-trivial@nongnu.org; Wed, 25 Sep 2013 07:28:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:62771)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1VOnGd-0004AE-An; Wed, 25 Sep 2013 07:28:27 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r8PBSQ9D014678
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 25 Sep 2013 07:28:26 -0400
Received: from dhcp-200-207.str.redhat.com (ovpn-116-67.ams2.redhat.com
	[10.36.116.67])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r8PBSNhM008054; Wed, 25 Sep 2013 07:28:24 -0400
Date: Wed, 25 Sep 2013 13:28:21 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20130925112821.GE2898@dhcp-200-207.str.redhat.com>
References: <1379830750-23801-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1379830750-23801-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	r8PBSQ9D014678
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Wed, 25 Sep 2013 08:59:39 -0400
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <andreas.faerber@web.de>,
	qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH v2] block: Fix compiler warning
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
X-List-Received-Date: Wed, 25 Sep 2013 11:28:47 -0000

Am 22.09.2013 um 08:19 hat Stefan Weil geschrieben:
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

Thanks, applied to the block branch.

Kevin

