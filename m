Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TFU1d-0007UH-Gg
	for mharc-qemu-trivial@gnu.org; Sat, 22 Sep 2012 14:01:57 -0400
Received: from eggs.gnu.org ([208.118.235.92]:50280)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1TFU1R-0007J9-5q
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 14:01:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1TFU1Q-0008LH-A2
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 14:01:45 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53405)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1TFU1O-0008Ke-6C; Sat, 22 Sep 2012 14:01:42 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id A25A8A1761;
	Sat, 22 Sep 2012 22:01:33 +0400 (MSK)
Message-ID: <505DFCFD.6010202@msgid.tls.msk.ru>
Date: Sat, 22 Sep 2012 22:01:33 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:10.0.6esrpre) Gecko/20120817 Icedove/10.0.6
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <1348169539-24797-1-git-send-email-sw@weilnetz.de>
	<20120922163216.GC14154@stefanha-thinkpad.localdomain>
In-Reply-To: <20120922163216.GC14154@stefanha-thinkpad.localdomain>
X-Enigmail-Version: 1.4.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] net/socket: Fix compiler
 warning (regression for MinGW)
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
X-List-Received-Date: Sat, 22 Sep 2012 18:01:46 -0000

On 22.09.2012 20:32, Stefan Hajnoczi wrote:
> On Thu, Sep 20, 2012 at 09:32:19PM +0200, Stefan Weil wrote:
>> Add a type cast which was removed by commit
>> 213fd5087e2e4e2da10ad266df0ba950cf7618bf again.
>>
>> Without it, MinGW compilers complain:
>>
>> net/socket.c:136: warning:
>>  pointer targets in passing argument 2 of =E2=80=98sendto=E2=80=99 dif=
fer in signedness
>> /usr/lib/gcc/amd64-mingw32msvc/4.4.4/../../../../amd64-mingw32msvc/inc=
lude/winsock2.h:1313: note:
>>  expected =E2=80=98const char *=E2=80=99 but argument is of type =E2=80=
=98const uint8_t *=E2=80=99
>=20
> Wow, that's messed up.  sendto() is POSIX and the prototype shouldn't b=
e
> const char *.
>=20
> It's easy for someone to remove this cast in the future.  Please add a
> comment explaining that it's needed because MinGW headers don't have th=
e
> POSIX version of sendto().

There's qemu_recv() in qemu-common.h, for exactly the same purpose.
But qemu_recv() is much more evil, IMHO.

Thanks,

/mjt

