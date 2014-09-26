Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XXQxZ-0005m5-Kf
	for mharc-qemu-trivial@gnu.org; Fri, 26 Sep 2014 04:33:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42756)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XXQxT-0005lO-Q8
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 04:33:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XXQxP-000181-0J
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 04:32:55 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:11383)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XXQxO-00015Y-3R; Fri, 26 Sep 2014 04:32:50 -0400
Received: from 172.24.2.119 (EHLO SZXEMA409-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id BZZ53393; Fri, 26 Sep 2014 16:32:32 +0800 (CST)
Received: from SZXEMA503-MBS.china.huawei.com ([169.254.6.188]) by
	SZXEMA409-HUB.china.huawei.com ([10.82.72.41]) with mapi id
	14.03.0158.001; Fri, 26 Sep 2014 16:32:22 +0800
From: "Gonglei (Arei)" <arei.gonglei@huawei.com>
To: Paolo Bonzini <pbonzini@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>
Thread-Topic: [PATCH 0/3] os-posix: improve the error message printing
Thread-Index: AQHP2WHzdVvoUKNjbEi48v8P7CSln5wSjokAgACHEcA=
Date: Fri, 26 Sep 2014 08:32:21 +0000
Message-ID: <33183CC9F5247A488A2544077AF1902086DDBC41@SZXEMA503-MBS.china.huawei.com>
References: <1411719272-9788-1-git-send-email-arei.gonglei@huawei.com>
	<54252370.3030707@redhat.com>
In-Reply-To: <54252370.3030707@redhat.com>
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"Huangweidong \(C\)" <weidong.huang@huawei.com>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"mjt@tls.msk.ru" <mjt@tls.msk.ru>, "armbru@redhat.com" <armbru@redhat.com>,
	"eblake@redhat.com" <eblake@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH 0/3] os-posix: improve the error message
	printing
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
X-List-Received-Date: Fri, 26 Sep 2014 08:33:00 -0000

> From: Paolo Bonzini [mailto:pbonzini@redhat.com]
> Subject: Re: [PATCH 0/3] os-posix: improve the error message printing
>=20
> Il 26/09/2014 10:14, arei.gonglei@huawei.com ha scritto:
> > From: Gonglei <arei.gonglei@huawei.com>
> >
> > The patches mainly improve the error message printing.
> > And adjust coding style of os-posix.c.
> >
> > Daemonize the QEMU process after initialization, QEMU will not detach f=
rom
> > standard IO until it is ready to receive connections on any of its devi=
ces.
> > So, using fprintf print error.
> >
> > Cc: Eric Blake <eblake@redhat.com>
> >
> > Gonglei (3):
> >   os-posix: change tab to space avoid violating coding style
> >   os-posix: remove confused errno
> >   os-posix: report error message when lock file failed
> >
> >  os-posix.c | 83
> ++++++++++++++++++++++++++++++++++----------------------------
> >  1 file changed, 45 insertions(+), 38 deletions(-)
> >
>=20
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
>=20

Thanks!  :)

Best regards,
-Gonglei

> Michael, are you going to pick these up?
>=20
> Paolo

