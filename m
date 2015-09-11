Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZaLKr-00064Z-EE
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2015 06:13:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43567)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaLKo-00060F-Ok
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 06:13:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaLKk-0004iq-RJ
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 06:13:34 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45494)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZaLKg-0004hp-Fw; Fri, 11 Sep 2015 06:13:26 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 83E7C41207;
	Fri, 11 Sep 2015 13:13:22 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 6675DA52;
	Fri, 11 Sep 2015 13:13:22 +0300 (MSK)
Message-ID: <55F2A942.4040500@msgid.tls.msk.ru>
Date: Fri, 11 Sep 2015 13:13:22 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, 
	marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <1441400485-29167-1-git-send-email-marcandre.lureau@redhat.com>
	<55EDB16B.6080205@suse.de>
In-Reply-To: <55EDB16B.6080205@suse.de>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] qom/object.h: remove some child/parent
	doc
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
X-List-Received-Date: Fri, 11 Sep 2015 10:13:36 -0000

07.09.2015 18:46, Andreas F=C3=A4rber wrote:
> Am 04.09.2015 um 23:01 schrieb marcandre.lureau@redhat.com:
>> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>
>> It looks like this documentation is obsolete: a child object may looku=
p
>> its parent stored in the Object struct.
>>
>> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> ---
>>  include/qom/object.h | 3 ---
>>  1 file changed, 3 deletions(-)
>=20
> Either once again you are trying to do stuff behind my back, or your
> setup is really broken: I double-checked that include/qom/ is listed in
> MAINTAINERS, so I should've been CC'ed rather than just -trivial.
>=20
> It's been a valid rule not to mess with these internal fields, therefor=
e
> this is not trivial at all, and that's one reason why my x86 CPU series
> using it was an RFC. We should either come up with a proper wrapper
> function object_get_parent(), or with a wrapper function adding a link<=
>
> property (where we would need to be careful with ref counts) - long tim=
e
> only the composition tree needed to mess with an object's parent.
>=20
> If you have a concrete use case of parent access, please point to it.

So, should the current documentation remain, or should the patch be
applied?  If the latter, Andreas, please take care of it.

Thanks,

/mjt

