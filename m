Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UgCo1-00019l-NG
	for mharc-qemu-trivial@gnu.org; Sat, 25 May 2013 07:38:37 -0400
Received: from eggs.gnu.org ([208.118.235.92]:36630)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UgCnt-0000yB-DV
	for qemu-trivial@nongnu.org; Sat, 25 May 2013 07:38:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UgCns-0003tH-7E
	for qemu-trivial@nongnu.org; Sat, 25 May 2013 07:38:29 -0400
Received: from cantor2.suse.de ([195.135.220.15]:55393 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1UgCno-0003sd-Kr; Sat, 25 May 2013 07:38:24 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 9900EA50DD;
	Sat, 25 May 2013 13:38:23 +0200 (CEST)
Message-ID: <51A0A2AC.6050506@suse.de>
Date: Sat, 25 May 2013 13:38:20 +0200
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1369426020-39060-1-git-send-email-emaste@freebsd.org>
	<51A03D24.5010306@msgid.tls.msk.ru>
In-Reply-To: <51A03D24.5010306@msgid.tls.msk.ru>
X-Enigmail-Version: 1.6a1pre
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: try pkg-config
 ncurses first
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
X-List-Received-Date: Sat, 25 May 2013 11:38:37 -0000

Am 25.05.2013 06:25, schrieb Michael Tokarev:
> 25.05.2013 00:07, Ed Maste wrote:
>> When probing for ncurses, try pkg-config first rather than after
>> explicit -lncurses and -lcurses.  This fixes static linking in the cas=
e
>> that ncurses has additional dependencies, such as -ltinfo (as on FreeB=
SD).
>=20
> This is not a FreeBSD-specific thing, this is the way how current
> ncurses works -- they separated a bunch of functions into a new
> library, libtinfo.
>=20
> But this is interesting.
>=20
> I'm not sure I agree with this approach.  When we're building using
> shared library, libncurses.so already links with libtinfo.so, so we
> don't need to link executable itself with libtinfo.so, since executable
> itself uses none of its functions.
>=20
> On the other hand, the current logic appears to be fine, -- we first
> link with just -lncurses, and if that fails, we also try pkg-config --l=
ibs --
> because, maybe, we're linking statically and in that case, additional
> libs from pkg-config may help.

I think the submitter wanted to assure that pkg-config --libs ncurses is
tried *before* falling back to -lcurses? (Rather than caring about the
order of -lncurses vs. pkg-config --libs ncurses.)

> From yet another point of view, we may use --as-needed linker flag
> and just ignore all the above.
>=20
> Here, it is interesting to note that pkg-config does not actually do
> the right thing in this case.  Because practically, it should have
> one extra flag, something like --static-libs (or --libs --static),
> and it should actually be different from plain --libs.

$pkg_config should already contain --static for static builds, so I see
nothing wrong with this patch,

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

but maybe I'm missing something?

One thing to note is that in an unfortunate layering violation unicore32
uses curses, so static libs and their potential need to link in
additional dependencies may be more than just a theoretical concern.

Regards,
Andreas

> Anyway, I don't see a reason to apply this as it is.
>=20
> Thanks,
>=20
> /mjt
>=20
>>
>> Signed-off-by: Ed Maste <emaste@freebsd.org>
>> ---
>>  configure | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/configure b/configure
>> index cfdb564..7c99ef9 100755
>> --- a/configure
>> +++ b/configure
>> @@ -2157,7 +2157,7 @@ fi
>>  if test "$mingw32" =3D "yes" ; then
>>      curses_list=3D"-lpdcurses"
>>  else
>> -    curses_list=3D"-lncurses:-lcurses:$($pkg_config --libs ncurses 2>=
/dev/null)"
>> +    curses_list=3D"$($pkg_config --libs ncurses 2>/dev/null):-lncurse=
s:-lcurses"
>>  fi
>> =20
>>  if test "$curses" !=3D "no" ; then
>>

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

