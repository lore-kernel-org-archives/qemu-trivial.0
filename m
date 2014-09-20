Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XVAcp-00033b-UN
	for mharc-qemu-trivial@gnu.org; Fri, 19 Sep 2014 22:42:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32768)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XVAcj-0002tJ-2q
	for qemu-trivial@nongnu.org; Fri, 19 Sep 2014 22:42:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XVAce-0004RQ-9N
	for qemu-trivial@nongnu.org; Fri, 19 Sep 2014 22:42:09 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:9550)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XVAcP-00048e-14; Fri, 19 Sep 2014 22:41:50 -0400
Received: from 172.24.2.119 (EHLO SZXEMA403-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id BZR97915; Sat, 20 Sep 2014 10:41:25 +0800 (CST)
Received: from SZXEMA503-MBS.china.huawei.com ([169.254.6.188]) by
	SZXEMA403-HUB.china.huawei.com ([10.82.72.35]) with mapi id
	14.03.0158.001; Sat, 20 Sep 2014 10:41:19 +0800
From: "Gonglei (Arei)" <arei.gonglei@huawei.com>
To: Amos Kong <akong@redhat.com>, "qemu-trivial@nongnu.org"
	<qemu-trivial@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH] qom: suppress conscan warning of
	returning	null point
Thread-Index: AQHP1GeqqJaGuaVYzUWpZCM+k83nWpwJTgJA
Date: Sat, 20 Sep 2014 02:41:18 +0000
Message-ID: <33183CC9F5247A488A2544077AF1902086DD89A4@SZXEMA503-MBS.china.huawei.com>
References: <1411171901-13792-1-git-send-email-akong@redhat.com>
In-Reply-To: <1411171901-13792-1-git-send-email-akong@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.177.19.102]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"afaerber@suse.de" <afaerber@suse.de>, "jen@redhat.com" <jen@redhat.com>,
	"aliguori@amazon.com" <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qom: suppress conscan
	warning of returning	null point
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
X-List-Received-Date: Sat, 20 Sep 2014 02:42:14 -0000

> Subject: [Qemu-devel] [PATCH] qom: suppress conscan warning of returning =
null
> point
>=20
> Conscan complains about g_malloc0() and malloc() return null.
>=20
>   Error: NULL_RETURNS (CWE-476):
>   qemu-kvm/qom/object.c:239: returned_null: Function "g_malloc0(gsize)"
> returns null.
>   qemu-kvm/qom/object.c:239: var_assigned: Assigning: "ti->class" =3D nul=
l
> return value from "g_malloc0(gsize)".
>   qemu-kvm/qom/object.c:249: dereference: Dereferencing a null pointer
> "ti->class".
>=20
> But if the passed size parameter is >=3D 1, then we can always get an
> effective pointer, the warning disappears.
>=20
> Signed-off-by: Amos Kong <akong@redhat.com>
> ---
>  qom/object.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20

Reviewed-by: Gonglei <arei.gonglei@huawei.com>

Best regards,
-Gonglei




