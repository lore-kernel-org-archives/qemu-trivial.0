Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1abS9n-0003rJ-0C
	for mharc-qemu-trivial@gnu.org; Thu, 03 Mar 2016 07:15:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34102)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1abS9l-0003qy-7V
	for qemu-trivial@nongnu.org; Thu, 03 Mar 2016 07:15:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1abS9i-0006rC-21
	for qemu-trivial@nongnu.org; Thu, 03 Mar 2016 07:15:01 -0500
Received: from szxga01-in.huawei.com ([58.251.152.64]:48188)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1abS9h-0006r1-BI; Thu, 03 Mar 2016 07:14:57 -0500
Received: from 172.24.1.47 (EHLO SZXEMA414-HUB.china.huawei.com)
	([172.24.1.47])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DFV11066; Thu, 03 Mar 2016 20:14:41 +0800 (CST)
Received: from SZXEMA503-MBS.china.huawei.com ([169.254.6.26]) by
	SZXEMA414-HUB.china.huawei.com ([10.82.72.73]) with mapi id
	14.03.0235.001; Thu, 3 Mar 2016 20:05:14 +0800
From: "Gonglei (Arei)" <arei.gonglei@huawei.com>
To: Paolo Bonzini <pbonzini@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
Thread-Topic: [PATCH 6/6] smbus: fix memory leak
Thread-Index: AQHRdTE4BlJp17qJ1EunE9xgvN0JOJ9HDIAAgACSuhA=
Date: Thu, 3 Mar 2016 12:05:13 +0000
Message-ID: <33183CC9F5247A488A2544077AF19020B02EC3C3@SZXEMA503-MBS.china.huawei.com>
References: <1456998223-12356-1-git-send-email-arei.gonglei@huawei.com>
	<1456998223-12356-7-git-send-email-arei.gonglei@huawei.com>
	<56D81DAA.3040201@redhat.com>
In-Reply-To: <56D81DAA.3040201@redhat.com>
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
	refid=str=0001.0A020203.56D82AB3.00A7, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=169.254.6.26,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 94557e0d87c026a1ad55cdef083fea3c
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH 6/6] smbus: fix memory leak
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
X-List-Received-Date: Thu, 03 Mar 2016 12:15:02 -0000

> Subject: Re: [PATCH 6/6] smbus: fix memory leak
>=20
>=20
>=20
> On 03/03/2016 10:43, Gonglei wrote:
> > Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> > ---
> >  hw/i2c/smbus_eeprom.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/hw/i2c/smbus_eeprom.c b/hw/i2c/smbus_eeprom.c
> > index 5b7bd89..83c6b27 100644
> > --- a/hw/i2c/smbus_eeprom.c
> > +++ b/hw/i2c/smbus_eeprom.c
> > @@ -156,4 +156,6 @@ void smbus_eeprom_init(I2CBus *smbus, int
> nb_eeprom,
> >          qdev_prop_set_ptr(eeprom, "data", eeprom_buf + (i * 256));
> >          qdev_init_nofail(eeprom);
> >      }
> > +
> > +    g_free(eeprom_buf);
> >  }
> >
>=20
> This is wrong, eeprom_buf is passed to the device through qdev_prop_set_p=
tr.
>=20
Oops, right, NACK. Thanks!


Regards,
-Gonglei

