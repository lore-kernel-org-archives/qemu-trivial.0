Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gZHDQ-00057D-6L
	for mharc-qemu-trivial@gnu.org; Tue, 18 Dec 2018 10:23:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36239)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gZHDO-000561-1I
	for qemu-trivial@nongnu.org; Tue, 18 Dec 2018 10:23:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gZHDK-0003b7-Ou
	for qemu-trivial@nongnu.org; Tue, 18 Dec 2018 10:23:21 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40090)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gZHCt-0003HK-1C; Tue, 18 Dec 2018 10:22:51 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ED14D99D38;
	Tue, 18 Dec 2018 15:22:49 +0000 (UTC)
Received: from localhost (ovpn-116-63.gru2.redhat.com [10.97.116.63])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6890B612A7;
	Tue, 18 Dec 2018 15:22:41 +0000 (UTC)
Date: Tue, 18 Dec 2018 13:22:39 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Markus Armbruster <armbru@redhat.com>, Helge Deller <deller@gmx.de>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Luc Michel <luc.michel@greensocs.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Message-ID: <20181218152239.GB19442@habkost.net>
References: <20181218115615.1499-1-philmd@redhat.com>
	<20181218115615.1499-11-philmd@redhat.com>
	<20f62f62-f677-6d0f-09dc-3759cc813d8f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20f62f62-f677-6d0f-09dc-3759cc813d8f@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 18 Dec 2018 15:22:50 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v2 10/12] MAINTAINERS: Orphanize the 'CPU
 (QOM)' subsystem
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
X-List-Received-Date: Tue, 18 Dec 2018 15:23:23 -0000

On Tue, Dec 18, 2018 at 01:34:52PM +0100, Paolo Bonzini wrote:
> On 18/12/18 12:56, Philippe Mathieu-Daud=E9 wrote:
> > Nobody is looking at those files, downgrade this subsystem as orphan.
> >=20
> > Remove the qemu-devel@nongnu.org entry because the list is always
> > selected by the 'All patches CC here' section.
> >=20
> > Suggested-by: Markus Armbruster <armbru@redhat.com>
> > Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> > ---
> >  MAINTAINERS | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index e50f8c6b97..e6a73820f1 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1745,8 +1745,7 @@ S: Supported
> >  F: scripts/coverity-model.c
> > =20
> >  CPU
> > -L: qemu-devel@nongnu.org
> > -S: Supported
> > +S: Orphan
> >  F: qom/cpu.c
> >  F: include/qom/cpu.h
> > =20
> >=20
>=20
> I don't think that's accurate.  Simply there's not much going on.  If
> patches are sent, get-maintainers's git fallback will do something
> (probably sending the patch to Eduardo, Igor or me).

Should we add our names to that section, or is it OK to leave it
as "S: Supported" even if it doesn't have any official
maintainers?

--=20
Eduardo

