Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WDAbl-0001lm-3E
	for mharc-qemu-trivial@gnu.org; Tue, 11 Feb 2014 05:30:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34458)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WDAbe-0001Zz-0F
	for qemu-trivial@nongnu.org; Tue, 11 Feb 2014 05:30:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WDAbZ-0000mf-5p
	for qemu-trivial@nongnu.org; Tue, 11 Feb 2014 05:30:21 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:35439)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WDAbP-0000gB-40; Tue, 11 Feb 2014 05:30:07 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 4E6924147E;
	Tue, 11 Feb 2014 14:30:06 +0400 (MSK)
Message-ID: <52F9FBAE.50503@msgid.tls.msk.ru>
Date: Tue, 11 Feb 2014 14:30:06 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <1391700611-32893-1-git-send-email-agraf@suse.de>
	<52F485C5.1020107@msgid.tls.msk.ru>
	<0C8B4C82-8DB7-4B5E-81F0-0C321856BB70@suse.de>
	<20140210102034.GA15227@stefanha-thinkpad.brq.redhat.com>
In-Reply-To: <20140210102034.GA15227@stefanha-thinkpad.brq.redhat.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Dmitry Fleytman <dmitry@daynix.com>, qemu-trivial <qemu-trivial@nongnu.org>,
	Alexander Graf <agraf@suse.de>, Anthony Liguori <aliguori@amazon.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] net: Include iov.h in
	checksum.h
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
X-List-Received-Date: Tue, 11 Feb 2014 10:30:27 -0000

10.02.2014 14:20, Stefan Hajnoczi =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On Fri, Feb 07, 2014 at 08:54:00AM +0100, Alexander Graf wrote:
>>
>>
>>> Am 07.02.2014 um 08:05 schrieb Michael Tokarev <mjt@tls.msk.ru>:
>>>
>>> 06.02.2014 19:30, Alexander Graf wrote:
>>>> The checksum calculation header exports a function that refers to st=
ruct
>>>> iov which is defined in iov.h. Include the header so that the compil=
er
>>>> knows what this struct is about.
>>>
>>> Alternatively (and I sometimes prefer it this way), one can just
>>> declare `struct iovec;' instead of including whole header, because
>>> we don't actually use any definitions from there, and users of
>>> checksum.h wont be including extra dependencies which they don't
>>> use...  Like this:
>>
>> Either way works for me :)
>=20
> Yes, please take one of them via -trivial.

I've applied my version to -trivial.

Thanks,

/mjt

