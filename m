Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a9uxL-0003vQ-CE
	for mharc-qemu-trivial@gnu.org; Fri, 18 Dec 2015 08:20:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35766)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1a9uxJ-0003rt-Ag
	for qemu-trivial@nongnu.org; Fri, 18 Dec 2015 08:20:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1a9uxI-0004kQ-Hk
	for qemu-trivial@nongnu.org; Fri, 18 Dec 2015 08:20:21 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34330)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1a9uxE-0004id-2j; Fri, 18 Dec 2015 08:20:16 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 5AD7D32D3BC;
	Fri, 18 Dec 2015 13:20:15 +0000 (UTC)
Received: from localhost (ovpn-113-21.phx2.redhat.com [10.3.113.21])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBIDKE2X009782; Fri, 18 Dec 2015 08:20:14 -0500
Date: Fri, 18 Dec 2015 08:20:14 -0500
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20151218082014.57dd2b30@redhat.com>
In-Reply-To: <87mvt7ewvu.fsf@blackfin.pond.sub.org>
References: <1450433172-1175-1-git-send-email-marcandre.lureau@redhat.com>
	<87mvt7ewvu.fsf@blackfin.pond.sub.org>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] misc: spelling
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
X-List-Received-Date: Fri, 18 Dec 2015 13:20:22 -0000

On Fri, 18 Dec 2015 13:58:45 +0100
Markus Armbruster <armbru@redhat.com> wrote:

> Copying maintainer just for completeness.  I'm sure Luiz won't at all
> mind this going through trivial ;)
>=20
> Let's clarify the commit message:
>=20
>     monitor: Spelling fix
>=20
> With that:
>=20
> Reviewed-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Luiz Capitulino <lcapitulino@redhat.com>

>=20
> marcandre.lureau@redhat.com writes:
>=20
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > ---
> >  monitor.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/monitor.c b/monitor.c
> > index e7e7ae2..51ec4c3 100644
> > --- a/monitor.c
> > +++ b/monitor.c
> > @@ -311,7 +311,7 @@ static void monitor_flush_locked(Monitor *mon)
> >              return;
> >          }
> >          if (rc > 0) {
> > -            /* partinal write */
> > +            /* partial write */
> >              QString *tmp =3D qstring_from_str(buf + rc);
> >              QDECREF(mon->outbuf);
> >              mon->outbuf =3D tmp;
>=20


