Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ffpse-00030j-Mq
	for mharc-qemu-trivial@gnu.org; Wed, 18 Jul 2018 13:04:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42188)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1ffpsb-0002yv-Mw
	for qemu-trivial@nongnu.org; Wed, 18 Jul 2018 13:04:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1ffpsY-0007ui-J4
	for qemu-trivial@nongnu.org; Wed, 18 Jul 2018 13:04:45 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:39702 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1ffpsO-0007qp-P6; Wed, 18 Jul 2018 13:04:32 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2742F401EF07;
	Wed, 18 Jul 2018 17:04:32 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.35])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 22B2A1C55C;
	Wed, 18 Jul 2018 17:04:30 +0000 (UTC)
Date: Wed, 18 Jul 2018 18:04:28 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Cc: QEMU Developer <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Message-ID: <20180718170428.GT9812@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20180712192603.11599-1-sw@weilnetz.de>
	<20180718162111.GR9812@redhat.com>
	<255cc07f-8eb7-0839-2001-e6ead4f3d969@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <255cc07f-8eb7-0839-2001-e6ead4f3d969@weilnetz.de>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Wed, 18 Jul 2018 17:04:32 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Wed, 18 Jul 2018 17:04:32 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'berrange@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Support
 pkg-config for zlib
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
X-List-Received-Date: Wed, 18 Jul 2018 17:04:47 -0000

On Wed, Jul 18, 2018 at 06:59:25PM +0200, Stefan Weil wrote:
> Am 18.07.2018 um 18:21 schrieb Daniel P. Berrang=C3=A9:
> > On Thu, Jul 12, 2018 at 09:26:03PM +0200, Stefan Weil wrote:
> >> This is needed for builds with the mingw64-* packages from Cygwin,
> >> but also works for Linux.
> >>
> >> Move the zlib test also more to the end because users should
> >> get information on the really important missing packages
> >> (which also require zlib) first.
> >=20
> > According to the zlib Changelog file pkgconfig support was added
> > in 2006 !
> >=20
> > [quote]
> > Changes in 1.2.3.1 (16 August 2006)
> >=20
> >   - Add pkgconfig support [Weigelt]
> > [/quote]
> >=20
> > Given our target build platforms support guidelines
> >=20
> >   https://qemu.weilnetz.de/doc/qemu-doc.html#Supported-build-platform=
s
> >=20
> > we can safely say that all supported platforms will have a zlib
> > that contains pkgconfig support, so......
> >=20
> >>
> >> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> >> ---
> >>  configure | 40 +++++++++++++++++++++++-----------------
> >>  1 file changed, 23 insertions(+), 17 deletions(-)
> >>
> >> diff --git a/configure b/configure
> >> index 2a7796ea80..dcaab01729 100755
> >> --- a/configure
> >> +++ b/configure
> >> @@ -2140,23 +2140,6 @@ EOF
> >>    fi
> >>  fi
> >> =20
> >> -#########################################
> >> -# zlib check
> >> -
> >> -if test "$zlib" !=3D "no" ; then
> >> -    cat > $TMPC << EOF
> >> -#include <zlib.h>
> >> -int main(void) { zlibVersion(); return 0; }
> >> -EOF
> >> -    if compile_prog "" "-lz" ; then
> >> -        :
> >> -    else
> >> -        error_exit "zlib check failed" \
> >> -            "Make sure to have the zlib libs and headers installed.=
"
> >> -    fi
> >> -fi
> >> -LIBS=3D"$LIBS -lz"
> >> -
> >>  ##########################################
> >>  # lzo check
> >> =20
> >> @@ -3525,6 +3508,29 @@ if ! compile_prog "$glib_cflags -Werror" "$gl=
ib_libs" ; then
> >>      fi
> >>  fi
> >> =20
> >> +#########################################
> >> +# zlib check
> >> +
> >> +if test "$zlib" !=3D "no" ; then
> >> +    if $pkg_config --exists zlib; then
> >> +        zlib_cflags=3D$($pkg_config --cflags zlib)
> >> +        zlib_libs=3D$($pkg_config --libs zlib)
> >> +        QEMU_CFLAGS=3D"$zlib_cflags $QEMU_CFLAGS"
> >> +        LIBS=3D"$zlib_libs $LIBS"
> >> +    else
> >> +        cat > $TMPC << EOF
> >> +#include <zlib.h>
> >> +int main(void) { zlibVersion(); return 0; }
> >> +EOF
> >> +        if compile_prog "" "-lz" ; then
> >> +            LIBS=3D"$LIBS -lz"
> >> +        else
> >> +            error_exit "zlib check failed" \
> >> +                "Make sure to have the zlib libs and headers instal=
led."
> >> +        fi
> >> +    fi
> >=20
> > .... this fallback support for non-pkgconfig scenarios can be entirel=
y
> > deleted, just leaving the error_exit message.=20
>=20
> I have no objection. Thank you for the investigation of the zlib
> history. Removing old unneeded code is always good, but maybe that's
> something which could be done after release 3.0.
>=20
> Or would you suggest to do it now? Then I can either send an updated
> patch (v2), or whoever pulls that patch can make that trivial modificat=
ion.

If we're ok with adding support for pkg-config in 3.0, I think it is
reasonable to drop the fallback check at the same time.  I think it
this stills qualify as a bug fix patch in terms of our freeze rules,
since we're specificially aiming to fix build problems on one of our
supported platforms.

So personally I'd suggest sending a v2 with the fallback dropped.
for 3.0

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

