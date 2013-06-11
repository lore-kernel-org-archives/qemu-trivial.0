Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmNu2-00028h-Ht
	for mharc-qemu-trivial@gnu.org; Tue, 11 Jun 2013 08:42:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41800)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UmNtv-0001xj-B3
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 08:42:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UmNtu-0006QE-0W
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 08:42:15 -0400
Received: from cantor2.suse.de ([195.135.220.15]:46417 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1UmNtq-0006Pk-H6; Tue, 11 Jun 2013 08:42:10 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 064ECA5077;
	Tue, 11 Jun 2013 14:42:10 +0200 (CEST)
Message-ID: <51B71B21.9060407@suse.de>
Date: Tue, 11 Jun 2013 14:42:09 +0200
From: =?windows-1252?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1370780536-28150-1-git-send-email-sw@weilnetz.de>
	<51B71A5B.7040001@msgid.tls.msk.ru>
In-Reply-To: <51B71A5B.7040001@msgid.tls.msk.ru>
X-Enigmail-Version: 1.6a1pre
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] audio: Replace macro
 GCC_ATTR by GCC_FMT_ATTR and use inline functions
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
X-List-Received-Date: Tue, 11 Jun 2013 12:42:20 -0000

Am 11.06.2013 14:38, schrieb Michael Tokarev:
> [Removing malc's email since it bounces]
> 09.06.2013 16:22, Stefan Weil wrote:
>> GCC_ATTR was only used in audio_int.h, so it is now unused and
>> the definition can be removed from compiler.h.
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>>  audio/audio_int.h       |    8 +++-----
>>  include/qemu/compiler.h |    3 ---
>>  2 files changed, 3 insertions(+), 8 deletions(-)
>>
>> diff --git a/audio/audio_int.h b/audio/audio_int.h
>> index b9b0676..5a6284b 100644
>> --- a/audio/audio_int.h
>> +++ b/audio/audio_int.h
>> @@ -243,7 +243,7 @@ static inline int audio_ring_dist (int dst, int sr=
c, int len)
>>      return (dst >=3D src) ? (dst - src) : (len - src + dst);
>>  }
>> =20
>> -static void GCC_ATTR dolog (const char *fmt, ...)
>> +static inline void GCC_FMT_ATTR(1, 2) dolog (const char *fmt, ...)
>=20
> This change (adding `inline') causes build failure with at least with g=
cc-4.7:
>=20
> audio/wavaudio.c: In function =91dolog=92:
> audio/audio_int.h:246:100: error: function =91dolog=92 can never be inl=
ined because it uses variable argument lists
>=20
> $ gcc --version
> gcc (Debian 4.7.2-5) 4.7.2
>=20
> I think the addition of inline should be dropped here and in other
> similar places (the rest is ok).
>=20
> I can do that myself if you want.

But having a static function in the header still needs the __unused__
attribute, which this patch tries to remove, doesn't it?

Andreas

>=20
> Alternatively these functions can be turned into varargs #defines.
>=20
> Thanks,
>=20
> /mjt
>=20


--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

