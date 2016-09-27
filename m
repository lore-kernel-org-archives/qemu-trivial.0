Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1botGy-0004tx-Dl
	for mharc-qemu-trivial@gnu.org; Tue, 27 Sep 2016 10:22:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45134)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mlureau@redhat.com>) id 1botGt-0004oj-8h
	for qemu-trivial@nongnu.org; Tue, 27 Sep 2016 10:22:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mlureau@redhat.com>) id 1botGn-0001Vd-3d
	for qemu-trivial@nongnu.org; Tue, 27 Sep 2016 10:22:10 -0400
Received: from mx4-phx2.redhat.com ([209.132.183.25]:42698)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mlureau@redhat.com>)
	id 1botGm-0001VU-Qf; Tue, 27 Sep 2016 10:22:05 -0400
Received: from zmail17.collab.prod.int.phx2.redhat.com
	(zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
	by mx4-phx2.redhat.com (8.13.8/8.13.8) with ESMTP id u8REM3Kf019542;
	Tue, 27 Sep 2016 10:22:03 -0400
Date: Tue, 27 Sep 2016 10:22:03 -0400 (EDT)
From: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <mlureau@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <227638539.339534.1474986123574.JavaMail.zimbra@redhat.com>
In-Reply-To: <87wphxh1gf.fsf@dusky.pond.sub.org>
References: <20160923123508.27000-1-marcandre.lureau@redhat.com>
	<87wphxh1gf.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.3.116.77]
X-Mailer: Zimbra 8.0.6_GA_5922 (ZimbraWebClient - FF49 (Linux)/8.0.6_GA_5922)
Thread-Topic: build-sys: fix find-in-path
Thread-Index: 3yXLoZ1XbSsAJxh6PrvE3NnqzIM8+g==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 209.132.183.25
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] build-sys: fix find-in-path
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
X-List-Received-Date: Tue, 27 Sep 2016 14:22:15 -0000

Hi

----- Original Message -----
> Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> writes:
>=20
> > Fix spelling, the GNU make text functions is not called "find-string"
> > but "findstring".
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  rules.mak | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/rules.mak b/rules.mak
> > index 5c82c19..f721988 100644
> > --- a/rules.mak
> > +++ b/rules.mak
> > @@ -132,7 +132,7 @@ endef
> >  # Looks in the PATH if the argument contains no slash, else only consi=
ders
> >  one
> >  # specific directory.  Returns an # empty string if the program doesn'=
t
> >  exist
> >  # there.
> > -find-in-path =3D $(if $(find-string /, $1), \
> > +find-in-path =3D $(if $(findstring /, $1), \
> >          $(wildcard $1), \
> >          $(wildcard $(patsubst %, %/$1, $(subst :, ,$(PATH)))))
>=20
> Impact?

Not much in current code base, it's only used by:
tests/tcg/Makefile:ifneq ($(call find-in-path, $(CC_I386)),)

So if you set CC_I386 to an absolute PATH, it's not going to run the I386_T=
ESTS.

This is not very important yet, but better for correctness.

In the future, I hope qemu can have a better tcg-test framework (I am doing=
 some experiment in https://github.com/elmarco/qemu/tree/tcg-tests/tests/tc=
g), and as part of this work, I found this bug.

