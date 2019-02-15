Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1guhSj-0003yo-NB
	for mharc-qemu-trivial@gnu.org; Fri, 15 Feb 2019 12:39:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42815)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1guhSh-0003x2-Kb
	for qemu-trivial@nongnu.org; Fri, 15 Feb 2019 12:39:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1guhSg-0002Dj-Ra
	for qemu-trivial@nongnu.org; Fri, 15 Feb 2019 12:39:43 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45726)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
	id 1guhSc-00028C-KF; Fri, 15 Feb 2019 12:39:38 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D4DDCF3FA9;
	Fri, 15 Feb 2019 17:39:33 +0000 (UTC)
Received: from x1.home (ovpn-116-24.phx2.redhat.com [10.3.116.24])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 734EB5BBC0;
	Fri, 15 Feb 2019 17:39:27 +0000 (UTC)
Date: Fri, 15 Feb 2019 10:39:25 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
	qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>, Eduardo Habkost
	<ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
	qemu-trivial@nongnu.org, Helge Deller <deller@gmx.de>, Mark Cave-Ayland
	<mark.cave-ayland@ilande.co.uk>, Markus Armbruster <armbru@redhat.com>, Luc
	Michel <luc.michel@greensocs.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Message-ID: <20190215103925.2cbd1c8c@x1.home>
In-Reply-To: <e692c549-ae11-bd08-d494-96dff03dab6e@redhat.com>
References: <20181218115615.1499-1-philmd@redhat.com>
	<20181218115615.1499-5-philmd@redhat.com>
	<e692c549-ae11-bd08-d494-96dff03dab6e@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 15 Feb 2019 17:39:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 04/12] MAINTAINERS: Add
 missing entries to VFIO and NVMe
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
X-List-Received-Date: Fri, 15 Feb 2019 17:39:44 -0000

On Fri, 15 Feb 2019 18:29:19 +0100
Thomas Huth <thuth@redhat.com> wrote:

> On 18/12/2018 12.56, Philippe Mathieu-Daud=C3=A9 wrote:
> > The VFIO helpers are used by the NVMe block driver, add the
> > entries to both sections.
> >=20
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > ---
> > v2: add util/vfio-helpers.c, add entries to NVMe section
> > ---
> >  MAINTAINERS | 5 +++++
> >  1 file changed, 5 insertions(+)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index f3305a65b6..7a94b0dab3 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1365,7 +1365,10 @@ VFIO
> >  M: Alex Williamson <alex.williamson@redhat.com>
> >  S: Supported
> >  F: hw/vfio/*
> > +F: util/vfio-helpers.c
> >  F: include/hw/vfio/
> > +F: include/qemu/vfio-helpers.h
> > +F: docs/igd-assign.txt
> > =20
> >  vfio-ccw
> >  M: Cornelia Huck <cohuck@redhat.com>
> > @@ -2290,6 +2293,8 @@ M: Fam Zheng <fam@euphon.net>
> >  L: qemu-block@nongnu.org
> >  S: Supported
> >  F: block/nvme*
> > +F: util/vfio-helpers.c
> > +F: include/qemu/vfio-helpers.h
> > =20
> >  Bootdevice
> >  M: Gonglei <arei.gonglei@huawei.com>
> >  =20
>=20
> Cornelia? Alex? ... Ack? NAck?

vfio-helpers consumes vfio but that's really the only tie to me having
any remote authority over it.  I think it makes more sense to tie it
with the direct consumer, which is nvme, and developer, Fam.  Thanks,

Alex

