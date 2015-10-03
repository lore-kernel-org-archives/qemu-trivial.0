Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zk67v-00080U-2l
	for mharc-qemu-trivial@gnu.org; Thu, 08 Oct 2015 04:00:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53687)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZiQ5i-0007TR-Uo
	for qemu-trivial@nongnu.org; Sat, 03 Oct 2015 12:55:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZiQ5i-0005AU-74
	for qemu-trivial@nongnu.org; Sat, 03 Oct 2015 12:55:22 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56426)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZiQ5d-00059P-SI; Sat, 03 Oct 2015 12:55:18 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 4116F40360;
	Sat,  3 Oct 2015 19:55:17 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 2479DA66;
	Sat,  3 Oct 2015 19:55:17 +0300 (MSK)
Message-ID: <56100875.3060408@msgid.tls.msk.ru>
Date: Sat, 03 Oct 2015 19:55:17 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Eric Blake <eblake@redhat.com>, marcandre.lureau@redhat.com, 
	qemu-devel@nongnu.org
References: <1443189844-20341-1-git-send-email-marcandre.lureau@redhat.com>	<1443189844-20341-22-git-send-email-marcandre.lureau@redhat.com>
	<56057193.5060508@redhat.com>
In-Reply-To: <56057193.5060508@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, armbru@redhat.com
Subject: Re: [Qemu-trivial] [PATCH 21/36] misc: spelling
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
X-List-Received-Date: Sat, 03 Oct 2015 16:55:23 -0000

25.09.2015 19:08, Eric Blake wrote:
> On 09/25/2015 08:03 AM, marcandre.lureau@redhat.com wrote:
>> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>
>> ---
>>  monitor.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> Trivial, can be applied now without waiting for pending qapi patches.
>=20
> Reviewed-by: Eric Blake <eblake@redhat.com>

Note there's no S-o-b line in the original patch (whole series,
looks like).  Hopefully it is okay for such a really trivial
patch :)

Applied, thanks!

/mjt

