Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XNbEC-0008Ao-9x
	for mharc-qemu-trivial@gnu.org; Sat, 30 Aug 2014 01:29:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45120)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XNbE6-00080p-Cl
	for qemu-trivial@nongnu.org; Sat, 30 Aug 2014 01:29:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XNbE1-0002rh-W4
	for qemu-trivial@nongnu.org; Sat, 30 Aug 2014 01:29:26 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:50505)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XNbDs-0002om-3H; Sat, 30 Aug 2014 01:29:12 -0400
Received: from 172.24.2.119 (EHLO SZXEMA408-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id ATS05151; Sat, 30 Aug 2014 13:29:04 +0800 (CST)
Received: from SZXEMA503-MBS.china.huawei.com ([169.254.6.21]) by
	SZXEMA408-HUB.china.huawei.com ([10.82.72.40]) with mapi id
	14.03.0158.001; Sat, 30 Aug 2014 13:28:57 +0800
From: "Gonglei (Arei)" <arei.gonglei@huawei.com>
To: Michael Tokarev <mjt@tls.msk.ru>, "Liuli (I)" <john.liuli@huawei.com>
Thread-Topic: [Qemu-devel] [PATCH] numa: fix qerror_report_err not free issue
Thread-Index: AQHPxAbpvtz3T0bWiECqwnwhbcWX2ZvoF5uAgACGrzA=
Date: Sat, 30 Aug 2014 05:28:56 +0000
Message-ID: <33183CC9F5247A488A2544077AF1902086DBC6F1@SZXEMA503-MBS.china.huawei.com>
References: <1409369799-9028-1-git-send-email-john.liuli@huawei.com>
	<54016069.4070209@msgid.tls.msk.ru>
In-Reply-To: <54016069.4070209@msgid.tls.msk.ru>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.177.19.102]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020202.54016121.001E,ss=1,re=0.000,fgs=0,
	ip=169.254.6.21, so=2013-05-26 15:14:31,
	dmn=2011-05-27 18:58:46
X-Mirapoint-Loop-Id: 70a1896893df6ea6ab1a4d5aef240a1c
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] numa: fix qerror_report_err
	not free issue
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
X-List-Received-Date: Sat, 30 Aug 2014 05:29:31 -0000

> -----Original Message-----
> From: qemu-devel-bounces+arei.gonglei=3Dhuawei.com@nongnu.org
> [mailto:qemu-devel-bounces+arei.gonglei=3Dhuawei.com@nongnu.org] On
> Behalf Of Michael Tokarev
> Sent: Saturday, August 30, 2014 1:26 PM
> To: Liuli (I)
> Cc: qemu-trivial@nongnu.org; qemu-devel@nongnu.org
> Subject: Re: [Qemu-devel] [PATCH] numa: fix qerror_report_err not free is=
sue
>=20
> 30.08.2014 07:36, john.liuli wrote:
> > From: Li Liu <john.liuli@huawei.com>
> >
> > All qerror_report_err returned none NULL pointers need to
> > be freed, otherwise will cause memory leaking.
> >
> > Although this place did not cause real memory leaking by exit,
> > obviously it's not correct to use qerror_report_err
> > without error_free it.
>=20
> I don't thing there's any good reason to free resources like
> this (freeing memory, closing files, etc) right before exit()
> (esp. in error path).  The OS will do that for us in one go
> much faster.
>=20
Yes. Agreed.

Best regards,
-Gonglei




