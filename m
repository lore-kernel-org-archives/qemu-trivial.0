Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bzgSU-0004qB-BT
	for mharc-qemu-trivial@gnu.org; Thu, 27 Oct 2016 04:54:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41524)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1bzgSS-0004pI-DX
	for qemu-trivial@nongnu.org; Thu, 27 Oct 2016 04:54:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1bzgSR-0003Gk-KC
	for qemu-trivial@nongnu.org; Thu, 27 Oct 2016 04:54:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55718)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>)
	id 1bzgSM-0003Er-FS; Thu, 27 Oct 2016 04:54:38 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4278969CA4;
	Thu, 27 Oct 2016 08:54:37 +0000 (UTC)
Received: from work-vm ([10.33.36.3])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9R8sXMq018637
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 27 Oct 2016 04:54:35 -0400
Date: Thu, 27 Oct 2016 09:54:33 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>, qemu-trivial@nongnu.org
Cc: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20161027085432.GA2033@work-vm>
References: <20161011174121.815-1-marcandre.lureau@redhat.com>
	<87a8ea693q.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <87a8ea693q.fsf@dusky.pond.sub.org>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 27 Oct 2016 08:54:37 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCHv2] monitor: deprecate
 'default' option
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
X-List-Received-Date: Thu, 27 Oct 2016 08:54:45 -0000

* Markus Armbruster (armbru@redhat.com) wrote:
> Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com> writes:
>=20
> > This option does nothing since commit 06ac27f.  Deprecate it.
> >
> > Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  vl.c                      | 11 +++--------
> >  include/monitor/monitor.h |  2 +-
> >  qemu-options.hx           |  8 ++++----
> >  3 files changed, 8 insertions(+), 13 deletions(-)
> >
> > v2:
> >  - update after Markus review
> >  - fix error on default monitor
> >  - drop from qemu-trivial
>=20
> Suggest to squash in the appended patch.
>=20
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>=20
> Could go via David, Paolo or myself.  David, do you have anything
> pending right now?

I said I'd take this via the HMP tree, but I've not got anything else
to go in after 2 weeks, and it's pointless doing a pull on it's own
for this.

It seems best to go via trivial - (copied in).

Dave

>=20
> diff --git a/monitor.c b/monitor.c
> index b07f254..ab9e911 100644
> --- a/monitor.c
> +++ b/monitor.c
> @@ -4093,7 +4093,7 @@ QemuOptsList qemu_mon_opts =3D {
>              .name =3D "chardev",
>              .type =3D QEMU_OPT_STRING,
>          },{
> -            .name =3D "default",
> +            .name =3D "default",  /* deprecated */
>              .type =3D QEMU_OPT_BOOL,
>          },{
>              .name =3D "pretty",
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

