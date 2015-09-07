Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZYztS-0008Hj-FN
	for mharc-qemu-trivial@gnu.org; Mon, 07 Sep 2015 13:07:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39445)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1ZYztQ-0008DL-6m
	for qemu-trivial@nongnu.org; Mon, 07 Sep 2015 13:07:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1ZYztP-0006Lv-5D
	for qemu-trivial@nongnu.org; Mon, 07 Sep 2015 13:07:44 -0400
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:39249)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1ZYztJ-0006JP-Oh; Mon, 07 Sep 2015 13:07:37 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	563BE11810A8; Mon,  7 Sep 2015 19:07:35 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id wHmaKnljlPaD; Mon,  7 Sep 2015 19:07:33 +0200 (CEST)
Received: from edv32.bib.uni-mannheim.de (unknown [82.113.106.83])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	5DFDE11810A3; Mon,  7 Sep 2015 19:07:30 +0200 (CEST)
Message-ID: <55EDC44C.5080200@weilnetz.de>
Date: Mon, 07 Sep 2015 19:07:24 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>, 
 Michael Tokarev <mjt@tls.msk.ru>
References: <1438235203-31311-1-git-send-email-sw@weilnetz.de>	<55EC14A1.4030600@msgid.tls.msk.ru>	<87y4givitu.fsf@blackfin.pond.sub.org>	<55ED5DA7.2050506@msgid.tls.msk.ru>
	<87lhciigg0.fsf@blackfin.pond.sub.org>
In-Reply-To: <87lhciigg0.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?ISO-8859-15?Q?=C1kos_Ko?= =?ISO-8859-15?Q?v=E1cs?= <akoskovacs@gmx.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developer <qemu-devel@nongnu.org>, qemu-stable@nongnu.org,
	=?ISO-8859-15?Q?Ozan_=C7ag=28l?= =?ISO-8859-15?Q?ayan?=
	<ozancag@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.4] Update language
	files for QEMU 2.4.0
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
X-List-Received-Date: Mon, 07 Sep 2015 17:07:45 -0000

Am 07.09.2015 um 14:04 schrieb Markus Armbruster:
> Michael Tokarev <mjt@tls.msk.ru> writes:
>=20
>> 07.09.2015 09:34, Markus Armbruster wrote:
>>> Michael Tokarev <mjt@tls.msk.ru> writes:
>>>
>>>> Applied to -trivial-patches, unfortunately not for 2.4 but at least
>>>> for 2.5 :)
>>>
>>> Should we add "Cc: qemu-stable@nongnu.org" to the commit message?
>>
>> I don't think it is worth applying to stable.  YMMV ofcourse :)
>=20
> Perhaps the stable maintainer (cc'ed) has an opinion.
>=20

Adding qemu-stable@nongnu.org to the cc list does not harm -
it still can be discussed whether a patch is needed or not.

In this case I think it is not needed because it is only
a patch which makes work of developers a little bit easier:

You won't get modified *.po files after a "make install".

I assume that there are much more developers compiling
and testing git master than there are for any stable release.
People building a stable version from sources without git
usually won't notice that *.po files changed.

The situation would be different if we had *.po files
with more complete translations. Then adding those files
to a stable version might be more useful.

Stefan


