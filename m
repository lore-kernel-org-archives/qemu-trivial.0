Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNSAK-00018v-EJ
	for mharc-qemu-trivial@gnu.org; Mon, 28 May 2018 20:07:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40775)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1fNSAH-00016v-Dj
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 20:07:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1fNSAG-0001Ol-Hw
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 20:07:01 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:36152 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1fNSA9-0001K7-LI; Mon, 28 May 2018 20:06:53 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F3B8840BC04F;
	Tue, 29 May 2018 00:06:51 +0000 (UTC)
Received: from redhat.com (ovpn-121-106.rdu2.redhat.com [10.10.121.106])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 643302024CA1;
	Tue, 29 May 2018 00:06:50 +0000 (UTC)
Date: Tue, 29 May 2018 03:06:50 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, "open list:S390" <qemu-s390x@nongnu.org>
Message-ID: <20180529030540-mutt-send-email-mst@kernel.org>
References: <20180528232719.4721-1-f4bug@amsat.org>
	<20180528232719.4721-2-f4bug@amsat.org>
	<20180528174805.7a56a4b8@w520.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20180528174805.7a56a4b8@w520.home>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Tue, 29 May 2018 00:06:52 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Tue, 29 May 2018 00:06:52 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'mst@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH v4 01/21] vfio: Include
 "exec/address-spaces.h" directly in the source file
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
X-List-Received-Date: Tue, 29 May 2018 00:07:02 -0000

On Mon, May 28, 2018 at 05:48:05PM -0600, Alex Williamson wrote:
> On Mon, 28 May 2018 20:26:59 -0300
> Philippe Mathieu-Daud=E9 <f4bug@amsat.org> wrote:
>=20
> -ENOCOMMITLOG
>=20
> Why?  Tangible benefit.  Looks like noise.  Thanks,
>=20
> Alex

I agree it should have a commit log, but .c files
should be self-sufficient not rely on .h files
pulling in headers for symbols the .h does not use
itself.


This is better because it makes refactoring easier.

> > Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> > ---
> >  include/hw/vfio/vfio-common.h | 1 -
> >  hw/vfio/ccw.c                 | 1 +
> >  hw/vfio/platform.c            | 1 +
> >  3 files changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-com=
mon.h
> > index d9360148e6..8264a65fa5 100644
> > --- a/include/hw/vfio/vfio-common.h
> > +++ b/include/hw/vfio/vfio-common.h
> > @@ -22,7 +22,6 @@
> >  #define HW_VFIO_VFIO_COMMON_H
> > =20
> >  #include "qemu-common.h"
> > -#include "exec/address-spaces.h"
> >  #include "exec/memory.h"
> >  #include "qemu/queue.h"
> >  #include "qemu/notify.h"
> > diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
> > index e67392c5f9..76e4e8c652 100644
> > --- a/hw/vfio/ccw.c
> > +++ b/hw/vfio/ccw.c
> > @@ -22,6 +22,7 @@
> >  #include "hw/vfio/vfio-common.h"
> >  #include "hw/s390x/s390-ccw.h"
> >  #include "hw/s390x/ccw-device.h"
> > +#include "exec/address-spaces.h"
> >  #include "qemu/error-report.h"
> > =20
> >  #define TYPE_VFIO_CCW "vfio-ccw"
> > diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c
> > index 5c921c27ba..57c4a0ee2b 100644
> > --- a/hw/vfio/platform.c
> > +++ b/hw/vfio/platform.c
> > @@ -24,6 +24,7 @@
> >  #include "qemu/range.h"
> >  #include "sysemu/sysemu.h"
> >  #include "exec/memory.h"
> > +#include "exec/address-spaces.h"
> >  #include "qemu/queue.h"
> >  #include "hw/sysbus.h"
> >  #include "trace.h"

