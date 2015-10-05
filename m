Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zk82o-0000A9-5R
	for mharc-qemu-trivial@gnu.org; Thu, 08 Oct 2015 06:03:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44102)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Zj0Gg-0001fs-TM
	for qemu-trivial@nongnu.org; Mon, 05 Oct 2015 03:33:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Zj0Gf-00045G-TS
	for qemu-trivial@nongnu.org; Mon, 05 Oct 2015 03:33:06 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46512)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Zj0Gb-0003yD-Ki; Mon, 05 Oct 2015 03:33:01 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 444A84045D;
	Mon,  5 Oct 2015 10:32:58 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 32A3CA69;
	Mon,  5 Oct 2015 10:32:58 +0300 (MSK)
Message-ID: <561227AA.9030705@msgid.tls.msk.ru>
Date: Mon, 05 Oct 2015 10:32:58 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1443189844-20341-1-git-send-email-marcandre.lureau@redhat.com>	<1443189844-20341-22-git-send-email-marcandre.lureau@redhat.com>	<56057193.5060508@redhat.com>
	<56100875.3060408@msgid.tls.msk.ru>
	<87h9m5aokh.fsf@blackfin.pond.sub.org>
In-Reply-To: <87h9m5aokh.fsf@blackfin.pond.sub.org>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, marcandre.lureau@redhat.com,
	Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
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
X-List-Received-Date: Mon, 05 Oct 2015 07:33:08 -0000

05.10.2015 08:09, Markus Armbruster =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Michael Tokarev <mjt@tls.msk.ru> writes:
>=20
>> 25.09.2015 19:08, Eric Blake wrote:
>>> On 09/25/2015 08:03 AM, marcandre.lureau@redhat.com wrote:
>>>> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
[]
>>> Reviewed-by: Eric Blake <eblake@redhat.com>
>>
>> Note there's no S-o-b line in the original patch (whole series,
>> looks like).  Hopefully it is okay for such a really trivial
>> patch :)
>>
>> Applied, thanks!
>=20
> It may be legally safe, but do we really want to engage in judging
> whether patches are copyrightable or not?  Besides, it sets a bad
> example.

Sometimes I question our own sanity.  Even for a trivial spelling fix
we require significantly more beaurocracy(sp) than the fix is worth,
and want formal rules instead of using common sense. This is a common
trend in the world, to formalize everything instead of thinking, the
world is becoming "candy".  This reminded me an old movie, "Demolition
Man", -- the cops in the future reads instructions about what to do
in each situation they happened to come.  But oh well, no one want to
take responsibility, that's okay ;)

Sorry for somewhat non-technical answer, I'll revert this patch,
waiting for more beaurocracy.

> Marc-Andr=C3=A9, please repost your patches ready for -trivial with you=
r
> S-o-B, cc: qemu-trivial.

Mind you, it was a large series, with wasn't intended for -trivial
at all.  That's more rules and more beaurocracy.  And many other
patches in that series didn't have s-o-b line too.

Thanks,

/mjt


