Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1emGTA-0004hg-V8
	for mharc-qemu-trivial@gnu.org; Thu, 15 Feb 2018 05:08:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48406)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1emGT5-0004dT-N3
	for qemu-trivial@nongnu.org; Thu, 15 Feb 2018 05:08:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1emGSz-0001MJ-KD
	for qemu-trivial@nongnu.org; Thu, 15 Feb 2018 05:08:43 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48830 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1emGSt-0001J5-Tu; Thu, 15 Feb 2018 05:08:32 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9187C7D67E;
	Thu, 15 Feb 2018 10:08:21 +0000 (UTC)
Received: from redhat.com (unknown [10.42.22.189])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8DF22AFD7C;
	Thu, 15 Feb 2018 10:08:14 +0000 (UTC)
Date: Thu, 15 Feb 2018 10:08:12 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180215100812.GC3322@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <1518629505-22480-1-git-send-email-thuth@redhat.com>
	<9a9ac3ae-5974-f462-7321-9ae2ad5b78ae@redhat.com>
	<933068e0-7928-389b-f927-15df79506bc6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <933068e0-7928-389b-f927-15df79506bc6@redhat.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Thu, 15 Feb 2018 10:08:21 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Thu, 15 Feb 2018 10:08:21 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'berrange@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Add missing
 space when using --with-pkgversion
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Feb 2018 10:08:47 -0000

On Thu, Feb 15, 2018 at 07:02:40AM +0100, Thomas Huth wrote:
> On 14.02.2018 21:23, Eric Blake wrote:
> > On 02/14/2018 11:31 AM, Thomas Huth wrote:
> >> When running configure with --with-pkgversion=3Dfoo there is no
> >> space anymore between the version number and the parentheses:
> >>
> >> $ m68k-softmmu/qemu-system-m68k -version
> >> QEMU emulator version 2.11.50(foo)
> >>
> >> Fix it by moving the space from the configure script to the Makefile=
.
> >>
> >> Fixes: 67a1de0d195a6185c39b436159c9ffc7720bf979
> >> Buglink: https://bugs.launchpad.net/qemu/+bug/1673373
> >> Signed-off-by: Thomas Huth <thuth@redhat.com>
> >> ---
> >> =C2=A0 Makefile=C2=A0 | 2 +-
> >> =C2=A0 configure | 2 +-
> >> =C2=A0 2 files changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/Makefile b/Makefile
> >> index 4ec7a3c..41adbc9 100644
> >> --- a/Makefile
> >> +++ b/Makefile
> >> @@ -369,7 +369,7 @@ qemu-version.h: FORCE
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (cd $(SRC_PAT=
H); \
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf '#defi=
ne QEMU_PKGVERSION '; \
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if test -n "$=
(PKGVERSION)"; then \
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
printf '"$(PKGVERSION)"\n'; \
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
printf '" ($(PKGVERSION))"\n'; \
> >=20
> > I would argue that putting a space here is awkward; wouldn't it inste=
ad
> > be easier to have all CLIENTS of QEMU_PKGVERSION in the source code
> > assume that the macro does NOT have a leading space, and to supply a
> > space themselves?
> >=20
> > That is, change THESE locations:
> >=20
> > bsd-user/main.c:=C2=A0=C2=A0=C2=A0 printf("qemu-" TARGET_NAME " versi=
on " QEMU_VERSION
> > QEMU_PKGVERSION
> > linux-user/main.c:=C2=A0=C2=A0=C2=A0 printf("qemu-" TARGET_NAME " ver=
sion "
> > QEMU_VERSION QEMU_PKGVERSION
> > qemu-img.c:#define QEMU_IMG_VERSION "qemu-img version " QEMU_VERSION
> > QEMU_PKGVERSION \
> > qemu-io.c:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 printf("%s version " QEMU_VERSION QEMU_PKGVERSION
> > "\n"
> > qemu-nbd.c:"%s " QEMU_VERSION QEMU_PKGVERSION "\n"
> > qga/main.c:"QEMU Guest Agent " QEMU_VERSION QEMU_PKGVERSION "\n"
> > scsi/qemu-pr-helper.c:"%s " QEMU_VERSION QEMU_PKGVERSION "\n"
> > ui/cocoa.m:=C2=A0=C2=A0=C2=A0 @"QEMU emulator version %s%s", QEMU_VER=
SION,
> > QEMU_PKGVERSION];
> > vl.c:=C2=A0=C2=A0=C2=A0 printf("QEMU emulator version " QEMU_VERSION =
QEMU_PKGVERSION "\n"
> >=20
> > to instead supply the missing space, and have configure/Makefile alwa=
ys
> > generate without a leading space.
> >=20
> >> +++ b/configure
> >> @@ -1162,7 +1162,7 @@ for opt do
> >> =C2=A0=C2=A0=C2=A0 ;;
> >> =C2=A0=C2=A0=C2=A0 --disable-blobs) blobs=3D"no"
> >> =C2=A0=C2=A0=C2=A0 ;;
> >> -=C2=A0 --with-pkgversion=3D*) pkgversion=3D" ($optarg)"
> >> +=C2=A0 --with-pkgversion=3D*) pkgversion=3D"$optarg"
> >=20
> > Hmm - here you're changing who supplies the ().=C2=A0 But that argues=
 that
> > maybe the callsites should supply " (" and ")" themselves.
>=20
> Yeah, that's likely the saner way to do this. The question is: What
> about the query-version QMP command? Should it report parentheses or
> not? I think I'd look nicer if it reports "package": "foo" instead of
> "package": "(foo)" - but we maybe could break some users who expect
> parentheses there (no matter whether there is a preceding space or not)=
?

The pkgversion is an opaque string - users/apps should never try to
interpret its contents, because its format can vary arbitrarily between
distros.  It is merely intended as an informative string to help the
package maintainer identify which version of QEMU was used when someone
submits a bug reoprt.

IOW it is totally valid to change the command to omit '()', and if anythi=
ng
breaks that is their own fault for trying to interpret an opaque blob of
data.

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

