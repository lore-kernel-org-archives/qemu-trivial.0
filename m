Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UgD7p-00062S-33
	for mharc-qemu-trivial@gnu.org; Sat, 25 May 2013 07:59:05 -0400
Received: from eggs.gnu.org ([208.118.235.92]:41416)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UgD7i-0005rN-3Z
	for qemu-trivial@nongnu.org; Sat, 25 May 2013 07:59:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UgD7d-0001kC-4D
	for qemu-trivial@nongnu.org; Sat, 25 May 2013 07:58:58 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55307)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UgD7L-0001bt-Ng; Sat, 25 May 2013 07:58:35 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 9530241997;
	Sat, 25 May 2013 15:58:32 +0400 (MSK)
Message-ID: <51A0A768.5000500@msgid.tls.msk.ru>
Date: Sat, 25 May 2013 15:58:32 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
References: <1369426020-39060-1-git-send-email-emaste@freebsd.org>
	<51A03D24.5010306@msgid.tls.msk.ru> <51A0A2AC.6050506@suse.de>
In-Reply-To: <51A0A2AC.6050506@suse.de>
X-Enigmail-Version: 1.6a1pre
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
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
X-List-Received-Date: Sat, 25 May 2013 11:59:03 -0000

25.05.2013 15:38, Andreas F=E4rber wrote:
> Am 25.05.2013 06:25, schrieb Michael Tokarev:
[]
>> Here, it is interesting to note that pkg-config does not actually do
>> the right thing in this case.  Because practically, it should have
>> one extra flag, something like --static-libs (or --libs --static),
>> and it should actually be different from plain --libs.
>=20
> $pkg_config should already contain --static for static builds, so I see
> nothing wrong with this patch,

Hmm. I didn't know.  Okay.

On my system pkg-config does the same thing for ncurses, be it
with --static or without -- in both cases it prints `-lncurses -ltinfo',
so after this patch, qemu executable itself will be linked with a library
it does not use directly.  Definitely not a big deal, because it is used
by -lncurses anyway (indirectly) and so both libs are actually required.

When qemu is built on debian, we include --as-needed flag for the linker
as well, in order to get rid of all those extra but unused libs, so it
does not matter for us anyway.

And since apparenlty this is how ncurses is supposed to work/used, I
guess nothing is wrong with that at all ;)

> Reviewed-by: Andreas F=E4rber <afaerber@suse.de>
>=20
> but maybe I'm missing something?

I don't think so.  The only by concern was that the new (which is
apparently correct, and if not, we should complain to ncurses not
qemu) is the extra unnecessary library which is being linked to
qemu directly when doing non-static build.

> One thing to note is that in an unfortunate layering violation unicore3=
2
> uses curses, so static libs and their potential need to link in
> additional dependencies may be more than just a theoretical concern.

How unicore32 is different from everything else?

It definitely is not a theorerical concern, -- for example, debian
build static binaries for all user targets, to simplify usage of
"foreign chroots", -- you install a foreign system in a chroot,
drop the right qemu-$arch-static binary into its usr/bin, and
just chroot to it.  So static building is needed and used, but with
that, configure finds right libs anyway, because it tries -lncurses
which fails without -ltinfo, and next it tries stuff from pkg-config
which works.

With this --static flag to pkg-config, things become instantly
correct too.

I'll apply it on top of my configure changes.

Thanks!

/mjt

