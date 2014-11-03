Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XlHxL-0006xk-8K
	for mharc-qemu-trivial@gnu.org; Mon, 03 Nov 2014 08:46:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38988)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1XlHxE-0006ls-6a
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 08:46:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1XlHx7-0004BN-C4
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 08:45:56 -0500
Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e]:64183)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1XlHx6-0004Ag-Th; Mon, 03 Nov 2014 08:45:49 -0500
Received: by mail-pa0-f46.google.com with SMTP id lf10so12112068pab.19
	for <multiple recipients>; Mon, 03 Nov 2014 05:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=r6E2d7u4S13txha9SOEPg7bKOr/49b5TIY0sCd/M1ws=;
	b=QqemfoBCEDcPRFbvI4ubGZReR2YXHZ+pzEjILvvUKDqjhJNhAp4atz4Y4jbdZRZW20
	OIjCEHl8J6BSRcqZMwn88wHo0bl2SWv22JGo3a4DF0WT2sRoRiJ+A3EdmOdijv2K4h0s
	yIwNLL3pClLyGPuC8NAmJqRQQwU1iMENLxGwiHqhC2Myw6ks8acQBLE8Thb89yH8CLTa
	CR8YLPFv4GycWK7b0W4TcbprGvLyCX/+WVlbfHazjTUKkKpSpnWCX71XMoU650wsqQbw
	9WimpVV9illxouF9ayf7JiMXZnxL8QfzoMrEs88W5btoA4eW7L5h1210tZjjIGNur5Ms
	xaXw==
X-Received: by 10.68.203.41 with SMTP id kn9mr42831709pbc.47.1415022347550;
	Mon, 03 Nov 2014 05:45:47 -0800 (PST)
Received: from [192.168.1.101] ([223.72.65.78])
	by mx.google.com with ESMTPSA id
	ap5sm17376568pad.22.2014.11.03.05.45.45 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 03 Nov 2014 05:45:45 -0800 (PST)
Content-Type: text/plain;
	charset=gb2312
Mime-Version: 1.0 (1.0)
From: Chen Gang <gang.chen.5i5j@gmail.com>
X-Mailer: iPad Mail (11D257)
In-Reply-To: <54577274.9070604@msgid.tls.msk.ru>
Date: Mon, 3 Nov 2014 21:45:43 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <E90D5895-E207-40BA-B5E9-DF82588F59EC@gmail.com>
References: <54574A46.3060709@gmail.com> <54577274.9070604@msgid.tls.msk.ru>
To: Michael Tokarev <mjt@tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::22e
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel <qemu-devel@nongnu.org>, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [Qemu-trivial] [PATCH] pc-bios: petalogix-s3adsp1800.dtb: Use
	'xlnx, xps-ethernetlite-2.00.a' instead of 'xlnx,
	xps-ethernetlite-2.00.b'
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
X-List-Received-Date: Mon, 03 Nov 2014 13:46:02 -0000


As far as I know, It is a hardware description file. Can convert it to dts
format which is a text file, then can read and edit it, after finish, can
convert it to dtb format again.

dts and dtb can convert with each other without any information lost.
One tool for converting is "scripts/dts/dts" in upstream kernel (after
finish building kernel).

So for me, we can also treat dtb file as open source file. It is integrated
into qemu in 2009 (please "git log -p" to this file for more details).

Thanks.

=B7=A2=D7=D4=CE=D2=B5=C4 iPad

> =D4=DA 2014=C4=EA11=D4=C23=C8=D5=A3=AC=CF=C2=CE=E78:17=A3=ACMichael Tokare=
v <mjt@tls.msk.ru> =D0=B4=B5=C0=A3=BA
>=20
> 03.11.2014 12:26, Chen Gang wrote:
>> For Linux upstream kernel (e.g. 3.17-rc7), the related compatible string
>> 'xlnx,xps-ethernetlite-2.00.a' is supported, but 'b' is not supported,
>> so change qemu dtb file to match kernel driver.
>=20
> /me does not know anything about this stuff at all.  But anyway...
>=20
>> diff --git a/pc-bios/petalogix-s3adsp1800.dtb b/pc-bios/petalogix-s3adsp1=
800.dtb
>> index 93c5973fd81244268aace6e5e6006ad6fb4d6199..8ac80f2f2d191a8491b71182b=
e50b3df2989551d 100644
>> GIT binary patch
>> delta 14
>> VcmX@?aM)pkI6GtFW(js}NdPEw1Wf<{
>>=20
>> delta 14
>> VcmX@?aM)pkI6Gs~W(js}NdPE$1Wo_|
>=20
> Is it a binary-only file without source?  Where it come from?
>=20
> (it is not a simple question, eg, on Debian, binary files are
> disallowed (at least in main section)).
>=20
> Thanks,
>=20
> /mjt
>=20

