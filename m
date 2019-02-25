Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gyGx1-0006aa-OL
	for mharc-qemu-trivial@gnu.org; Mon, 25 Feb 2019 09:09:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50353)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1gyGx0-0006ZV-6o
	for qemu-trivial@nongnu.org; Mon, 25 Feb 2019 09:09:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1gyGwy-0002JF-3R
	for qemu-trivial@nongnu.org; Mon, 25 Feb 2019 09:09:46 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50262)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1gyGwu-0002Gk-40; Mon, 25 Feb 2019 09:09:40 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 441483091755;
	Mon, 25 Feb 2019 14:09:39 +0000 (UTC)
Received: from linux.fritz.box (ovpn-117-243.ams2.redhat.com [10.36.117.243])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC38A60BF4;
	Mon, 25 Feb 2019 14:09:36 +0000 (UTC)
Date: Mon, 25 Feb 2019 15:09:35 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
	qemu-block@nongnu.org, qemu-trivial@nongnu.org,
	Max Reitz <mreitz@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
Message-ID: <20190225140935.GE6320@linux.fritz.box>
References: <1551095970-14645-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1551095970-14645-1-git-send-email-thuth@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Mon, 25 Feb 2019 14:09:39 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] block/nvme: Remove QEMU_PACKED from
 naturally aligned NVMeRegs struct
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
X-List-Received-Date: Mon, 25 Feb 2019 14:09:47 -0000

Am 25.02.2019 um 12:59 hat Thomas Huth geschrieben:
> The QEMU_PACKED is causing a compiler warning/error with GCC 9:
>=20
>   CC      block/nvme.o
> block/nvme.c: In function =E2=80=98nvme_create_queue_pair=E2=80=99:
> block/nvme.c:209:22: error: taking address of packed member of
>  =E2=80=98struct <anonymous>=E2=80=99 may result in an unaligned pointe=
r value
>  [-Werror=3Daddress-of-packed-member]
>   209 |     q->sq.doorbell =3D &s->regs->doorbells[idx * 2 * s->doorbel=
l_scale];
>=20
> All members of the struct are naturally aligned, so there should
> not be the need for QEMU_PACKED here, and the following QEMU_BUILD_BUG_=
ON
> also ensures that there is no padding. Thus simply remove the QEMU_PACK=
ED
> here.
>=20
> Buglink: https://bugs.launchpad.net/qemu/+bug/1817525
> Reported-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Thanks, applied to the block branch.

Though I'm not sure why a compiler should warn if packed and non-packed
result in the exact same layout anyway...

Kevin

