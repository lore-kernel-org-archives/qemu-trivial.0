Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TEyG0-0001ov-Jh
	for mharc-qemu-trivial@gnu.org; Fri, 21 Sep 2012 04:06:40 -0400
Received: from eggs.gnu.org ([208.118.235.92]:37201)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1TEyFt-0001UE-Tr
	for qemu-trivial@nongnu.org; Fri, 21 Sep 2012 04:06:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1TEyFp-0006xX-Rd
	for qemu-trivial@nongnu.org; Fri, 21 Sep 2012 04:06:33 -0400
Received: from cantor2.suse.de ([195.135.220.15]:35618 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1TEyFc-0006j7-KV; Fri, 21 Sep 2012 04:06:16 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 916569A78E;
	Fri, 21 Sep 2012 10:06:14 +0200 (CEST)
Message-ID: <505C1FF2.5050902@suse.de>
Date: Fri, 21 Sep 2012 10:06:10 +0200
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120825 Thunderbird/15.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1346703803-22003-1-git-send-email-sw@weilnetz.de>	<504774FF.6000501@suse.de>	<CAJSP0QXtri4UNmdriCFiTg4_m+-a0CBpG36FYFdXQ1XcJywNww@mail.gmail.com>
	<504788BB.7030609@weilnetz.de> <50478F9E.80403@weilnetz.de>
	<505B4C7B.4000501@weilnetz.de>
In-Reply-To: <505B4C7B.4000501@weilnetz.de>
X-Enigmail-Version: 1.4.4
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] sparc-dis: Remove redundant
	NULL check
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
X-List-Received-Date: Fri, 21 Sep 2012 08:06:38 -0000

Am 20.09.2012 19:03, schrieb Stefan Weil:
> Am 05.09.2012 19:45, schrieb Stefan Weil:
>> Am 05.09.2012 19:15, schrieb Stefan Weil:
>>>
>>> AFAIK, binutils moved to GPL 3. Therefore I don't expect that
>>> QEMU will update to upstream in the next years.
>>>
>>> We'll have to maintain the code which we have.
>>>
>>> Try "git log *-dis.c" or "gitk *-dis.c": there are already lots
>>> of more trivial changes which got applied to the disassembler files.
>>>
>>> =3D> The patch should be applied.
>>>
>>> Regards,
>>> Stefan
>>
>> Here is some additional information:
>>
>> binutils switched from GPL 2 to GPL 3 with version 2.18:
>>
>> Changes in 2.18:
>>
>> * The binutils sources are now released under version 3 of the GNU
>> General
>>   Public License.
>>
>>
>> sparc-dis.c is already based on 2.17, so we won't get anything newer.
>> Even the latest version still uses the redundant NULL check, so I
>> can send my patch to the binutils maintainers, too.

So did you? And did they accept it?

Regards,
Andreas

> Ping? If nobody objects, I suggest to apply the patch via qemu-trivial.
>=20
> Regards
>=20
> Stefan W.

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

