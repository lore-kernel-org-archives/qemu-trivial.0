Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V0Y5x-00085U-Jh
	for mharc-qemu-trivial@gnu.org; Sat, 20 Jul 2013 10:25:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53557)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1V0Y5u-00081t-VQ
	for qemu-trivial@nongnu.org; Sat, 20 Jul 2013 10:25:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1V0Y5t-00034a-Sx
	for qemu-trivial@nongnu.org; Sat, 20 Jul 2013 10:25:10 -0400
Received: from cantor2.suse.de ([195.135.220.15]:50083 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1V0Y5q-0002pL-IY; Sat, 20 Jul 2013 10:25:06 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id EEA60A3B99;
	Sat, 20 Jul 2013 16:25:03 +0200 (CEST)
Message-ID: <51EA9DBA.4080400@suse.de>
Date: Sat, 20 Jul 2013 16:24:58 +0200
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, Alexander Graf <agraf@suse.de>
References: <1373647719-32757-1-git-send-email-sw@weilnetz.de>
	<51E4E011.70407@weilnetz.de> <51E846AC.5070309@weilnetz.de>
	<F63092DE-7795-4009-AB16-68BE6EC53F94@suse.de>
	<51E98C93.8010508@weilnetz.de>
In-Reply-To: <51E98C93.8010508@weilnetz.de>
X-Enigmail-Version: 1.6a1pre
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Anthony Liguori <aliguori@us.ibm.com>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] PPC: dbdma: macio: Fix
 format specifiers (build regression)
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
X-List-Received-Date: Sat, 20 Jul 2013 14:25:12 -0000

Am 19.07.2013 20:59, schrieb Stefan Weil:
> Am 19.07.2013 00:40, schrieb Alexander Graf:
>> On 18.07.2013, at 21:49, Stefan Weil wrote:
>>> Am 16.07.2013 07:54, schrieb Stefan Weil:
>>>> Am 12.07.2013 18:48, schrieb Stefan Weil:
>>>>> Hi Anthony,
>>>>>
>>>>> the patch fixes a build regression which was introduced today.
>>>>> Could you please apply it without waiting for the next pull request=
s?
>>>>>
>>>>> Thanks,
>>>>> Stefan
> [...]
>> Acked-by: Alexander Graf <agraf@suse.de> I assume this can go through
>> the trivial tree? Or directly get applied by Anthony? Alex=20
>=20
>=20
> I still think that build regressions should be fixed by a direct
> maintainer commit instead of waiting for a pull request,
> but obviously this does not happen here (why?).

Anthony recently stated very clearly that in order for him to pick up a
patch it needs to have a Reviewed-by. This one only got an Acked-by.

> So hopefully the fix will be committed via qemu-trivial at least.

It's not obvious from the diff context whether those specifiers are in
fact correct, and there is an active maintainer, so in theory it
wouldn't qualify for -trivial.

Alex, don't be lazy and just send a one-patch PULL like Cornelia did for
her recent mingw breakage. :)

Andreas

> See http://patchwork.ozlabs.org/patch/258774/ for the full patch.
>=20
> Stefan

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

