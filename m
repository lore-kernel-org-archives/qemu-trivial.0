Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XHs6M-0007gI-2u
	for mharc-qemu-trivial@gnu.org; Thu, 14 Aug 2014 06:17:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42926)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1XHs6E-0007Vm-MT
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 06:17:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1XHs68-0003vc-HU
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 06:17:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54564)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1XHs5s-0003ot-6v; Thu, 14 Aug 2014 06:17:16 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s7EAGb8V016111
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 14 Aug 2014 06:16:37 -0400
Received: from redhat.com (ovpn-116-117.ams2.redhat.com [10.36.116.117])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s7EAGX5k002009; Thu, 14 Aug 2014 06:16:33 -0400
Date: Thu, 14 Aug 2014 12:17:10 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: zhanghailiang <zhang.zhanghailiang@huawei.com>
Message-ID: <20140814101710.GC31346@redhat.com>
References: <1408001361-13580-1-git-send-email-zhang.zhanghailiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1408001361-13580-1-git-send-email-zhang.zhanghailiang@huawei.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	s7EAGb8V016111
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: kwolf@redhat.com, lkurusa@redhat.com, qemu-trivial@nongnu.org,
	jan.kiszka@siemens.com, riku.voipio@iki.fi, mjt@tls.msk.ru,
	qemu-devel@nongnu.org, lcapitulino@redhat.com,
	stefanha@redhat.com, luonengjun@huawei.com, pbonzini@redhat.com,
	peter.huangpeng@huawei.com, alex.bennee@linaro.org, rth@twiddle.net
Subject: Re: [Qemu-trivial] [PATCH v6 00/10] fix three bugs about
 use-after-free and several api abuse
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
X-List-Received-Date: Thu, 14 Aug 2014 10:17:45 -0000

On Thu, Aug 14, 2014 at 03:29:11PM +0800, zhanghailiang wrote:
> Hi,
>=20
> Ping...
>=20
> Nine patches of this patch series has been reviewd, and the last patch =
is not reviewed.
>=20
> Are these patches accepted?=20
> Though this series contains ten patches, but most of them only touch a =
few lines of code,
> and it involves several modules.=20
>=20
> So, should these patched be applied to qemu trivial branch?
> Any help will be greatly appreciated.

Why post them as a series? Make each one a separate patch,
will be easier to merge, each in the correct tree.

>=20
> Thanks,
> zhanghailiang
>=20
> This patch set fix three bugs about accessing freed memory and several =
api abuse.
>=20
> In qemu, there are serveral places that do not check=20
> the return value of fstat()/fopen()/malloc(),etc.
>=20
> Though it is a small probability for the these functions to fail,
> but it is better to fix them, Or there may be a serious segmentfault.=20
>=20
> v5 -> v6:
>  * Add reviewd-by info
>=20
> v4 -> v5:
> util/path:
>  * Use the GLib memory APIs g_malloc/g_strdup/g_realloc=20
> which would abort on failure (Thanks for the suggestion of Alex Benn=E9=
e)
>=20
> slirp:
>  * Again use of g_malloc to replace malloc(based on the review of Alex =
Benn=E9e)
>=20
> bios-tables-test:
>  * Correct the wrong use of g_assert
>=20
> v3 -> v4:
> slirp:=20
>  * Check return value of '*ex_ptr', not 'ex_ptr',also add error message
> (basedon the review of GongLei)
>=20
> linux-user:
>  * It should call unlock_user_struct() before return
> (based on the review of Richard Henderson)
>  =20
> tests/bios-tables-test:=20
>  * Remove unnecessary check then return value of fopen() in qtest_init(=
)
>=20
> v2 -> v3:
> ivshmem:=20
>  * Change the error message which advised by Levente Kurusa=20
>=20
> others:=20
>  * Add six new patches which check the return value of malloc() and fop=
en(),
>   which may be failed.
>=20
> v1 -> v2:
> ivshmem:=20
>  * Modified the log message according to reviewing suggestion of Michae=
l
>=20
> Li Liu (3):
>   tcg: check return value of fopen()
>   block/vvfat: fix setbuf stream parameter may be NULL
>   qtest: check the value returned by fopen()
>=20
> zhanghailiang (7):
>   l2cap: fix access freed memory
>   monitor: fix access freed memory
>   virtio-blk: fix reference a pointer which might be freed
>   ivshmem: check the value returned by fstat()
>   util/path: check return value of malloc()
>   slirp: check return value of malloc()
>   linux-user: check return value of malloc()
>=20
>  block/vvfat.c            | 5 ++++-
>  hw/block/virtio-blk.c    | 5 +++--
>  hw/bt/l2cap.c            | 2 +-
>  hw/misc/ivshmem.c        | 6 +++++-
>  linux-user/syscall.c     | 4 ++++
>  monitor.c                | 4 +++-
>  slirp/misc.c             | 4 ++--
>  tcg/tcg.c                | 4 ++++
>  tests/bios-tables-test.c | 5 +++++
>  util/path.c              | 6 +++---
>  10 files changed, 34 insertions(+), 11 deletions(-)
>=20
> --=20
> 1.7.12.4
>=20

