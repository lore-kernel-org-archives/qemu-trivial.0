Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ancxl-0002CH-VB
	for mharc-qemu-trivial@gnu.org; Tue, 05 Apr 2016 22:12:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40192)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1ancxj-0002B8-JU
	for qemu-trivial@nongnu.org; Tue, 05 Apr 2016 22:12:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1ancxg-0005Wx-EE
	for qemu-trivial@nongnu.org; Tue, 05 Apr 2016 22:12:55 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:44975)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1ancxf-0005Q9-SN; Tue, 05 Apr 2016 22:12:52 -0400
Received: from 172.24.1.36 (EHLO SZXEMA412-HUB.china.huawei.com)
	([172.24.1.36])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DES08064; Wed, 06 Apr 2016 10:12:34 +0800 (CST)
Received: from SZXEMA503-MBS.china.huawei.com ([169.254.6.166]) by
	SZXEMA412-HUB.china.huawei.com ([10.82.72.71]) with mapi id
	14.03.0235.001; Wed, 6 Apr 2016 10:12:25 +0800
From: "Gonglei (Arei)" <arei.gonglei@huawei.com>
To: "Gonglei (Arei)" <arei.gonglei@huawei.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
Thread-Topic: [PATCH 0/6] fix some coverity complains
Thread-Index: AQHRdTE2PK8RjDJAY0qcumfCVZttSJ98Z95A
Date: Wed, 6 Apr 2016 02:12:25 +0000
Message-ID: <33183CC9F5247A488A2544077AF19020B030F344@SZXEMA503-MBS.china.huawei.com>
References: <1456998223-12356-1-git-send-email-arei.gonglei@huawei.com>
In-Reply-To: <1456998223-12356-1-git-send-email-arei.gonglei@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.177.18.62]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A090202.57047098.0026, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=169.254.6.166,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 2a575c63b1d7de50dcd541c5abf14a8c
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH 0/6] fix some coverity complains
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
X-List-Received-Date: Wed, 06 Apr 2016 02:12:56 -0000

Hi Paolo,

Would you pls pick patch 1,3,4,5 to qemu-2.6 ?=20

It seems the trivial-branch maintainer didn't notice them. :(

Regards,
-Gonglei


> -----Original Message-----
> From: Gonglei (Arei)
> Sent: Thursday, March 03, 2016 5:44 PM
> To: qemu-devel@nongnu.org
> Cc: pbonzini@redhat.com; qemu-trivial@nongnu.org; Gonglei (Arei)
> Subject: [PATCH 0/6] fix some coverity complains
>=20
>=20
> Gonglei (6):
>   egl-helpers: fix possible resource leak
>   sheepdog: fix possible resouce leak and out-of-bounds access
>   spice: fix coverity complains
>   hostmem-file: fix memory leak
>   spapr: fix possible Negative array index read
>   smbus: fix memory leak
>=20
>  backends/hostmem-file.c | 5 ++++-
>  block/sheepdog.c        | 9 ++++++---
>  hw/i2c/smbus_eeprom.c   | 2 ++
>  hw/ppc/spapr.c          | 4 ++++
>  ui/egl-helpers.c        | 9 +++------
>  ui/spice-display.c      | 4 +---
>  6 files changed, 20 insertions(+), 13 deletions(-)
>=20
> --
> 1.8.5.2
>=20


