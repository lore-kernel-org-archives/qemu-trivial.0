Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zwwgl-0005kV-1H
	for mharc-qemu-trivial@gnu.org; Thu, 12 Nov 2015 13:33:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50704)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Zwwgf-0005dk-Qv
	for qemu-trivial@nongnu.org; Thu, 12 Nov 2015 13:33:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Zwwge-0005G0-TZ
	for qemu-trivial@nongnu.org; Thu, 12 Nov 2015 13:33:33 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:33847)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZwwgX-0005Ch-IM; Thu, 12 Nov 2015 13:33:25 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 22F3341335;
	Thu, 12 Nov 2015 21:33:17 +0300 (MSK)
Message-ID: <5644DB6D.4030308@msgid.tls.msk.ru>
Date: Thu, 12 Nov 2015 21:33:17 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>, 
	qemu-devel@nongnu.org
References: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
	<b30d80546421c6ea919096b596887f496c80af0a.1446813769.git.mjt@msgid.tls.msk.ru>
	<5644D222.3070408@suse.de>
In-Reply-To: <5644D222.3070408@suse.de>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Cao jin <caoj.fnst@cn.fujitsu.com>
Subject: Re: [Qemu-trivial] [PULL 17/24] qom/object: fix 2 comment typos
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
X-List-Received-Date: Thu, 12 Nov 2015 18:33:37 -0000

12.11.2015 20:53, Andreas F=E4rber wrote:
> Am 06.11.2015 um 13:43 schrieb Michael Tokarev:
>> From: Cao jin <caoj.fnst@cn.fujitsu.com>
>>
>> Also change the misleading definition of macro OBJECT_CLASS_CHECK
>>
>> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
>> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
>=20
> Michael, please *STOP* queuing QOM patches! You merged the unfixed

I think I do more harm to the project than good, these days.

> version now - it's supposed to have just "qom:", and the parenthesis an=
d
> full stop are missing, too, that I had on qom-next before it disappeare=
d
> with today's rebase...
>=20
> And why was I not CC'ed on this submission as include/qom/object.h
> maintainer? You did not reply to the patch either, where I did.

I didn't reply there because I wanted to remove the patch, exactly
because you replied to the thread.  It looks like I forgot to remove
it from the -trivial tree.

Now, in the original thread, you said you only tweaked the commit
(subject) message.  Is it really that bad in the original submission?

Thanks,

/mjt

