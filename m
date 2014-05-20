Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WmfjD-00049L-Pr
	for mharc-qemu-trivial@gnu.org; Tue, 20 May 2014 04:48:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39426)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1Wmfj7-00041i-FI
	for qemu-trivial@nongnu.org; Tue, 20 May 2014 04:48:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1Wmfj2-0001ln-HQ
	for qemu-trivial@nongnu.org; Tue, 20 May 2014 04:48:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56253)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1Wmfis-0001jy-8U; Tue, 20 May 2014 04:48:34 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s4K8mRIO027504
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 20 May 2014 04:48:27 -0400
Received: from noname.redhat.com (ovpn-116-74.ams2.redhat.com [10.36.116.74])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id s4K8mO7D024747; Tue, 20 May 2014 04:48:25 -0400
Date: Tue, 20 May 2014 10:48:24 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20140520084824.GA4440@noname.redhat.com>
References: <1400562514-22903-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1400562514-22903-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	s4K8mRIO027504
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Ronnie Sahlberg <ronniesahlberg@gmail.com>, qemu-trivial@nongnu.org,
	Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] block: Fix compiler warning (unused
	local function)
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
X-List-Received-Date: Tue, 20 May 2014 08:48:54 -0000

Am 20.05.2014 um 07:08 hat Stefan Weil geschrieben:
> Warning from gcc:
>=20
> block/iscsi.c:384:13: error:
>  =E2=80=98iscsi_allocationmap_is_allocated=E2=80=99 defined but not use=
d [-Werror=3Dunused-function]
>=20
> The function is only used if LIBISCSI_FEATURE_IOVECTOR is defined.
>=20
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Looks like a duplicate of Jeff's "block: iscsi build fix if
LIBISCSI_FEATURE_IOVECTOR is not defined", which Paolo already applied
to his queue.

Kevin

