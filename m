Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNeNR-0006qR-4O
	for mharc-qemu-trivial@gnu.org; Tue, 29 May 2018 09:09:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45925)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1fNeNN-0006ot-AF
	for qemu-trivial@nongnu.org; Tue, 29 May 2018 09:09:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1fNeNM-0004WM-97
	for qemu-trivial@nongnu.org; Tue, 29 May 2018 09:09:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49924)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
	id 1fNeN8-0004Oh-9K; Tue, 29 May 2018 09:09:06 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4FC4130BBE8F;
	Tue, 29 May 2018 13:09:05 +0000 (UTC)
Received: from w520.home (ovpn-116-135.phx2.redhat.com [10.3.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4B08B5D6A5;
	Tue, 29 May 2018 13:09:01 +0000 (UTC)
Date: Tue, 29 May 2018 07:09:00 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVk?=
	=?UTF-8?B?w6k=?= <f4bug@amsat.org>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, "open list:S390" <qemu-s390x@nongnu.org>
Message-ID: <20180529070900.29a95fb7@w520.home>
In-Reply-To: <3602923c-42ad-750f-aced-ed758441d501@redhat.com>
References: <20180528232719.4721-1-f4bug@amsat.org>
	<20180528232719.4721-2-f4bug@amsat.org>
	<20180528174805.7a56a4b8@w520.home>
	<20180529030540-mutt-send-email-mst@kernel.org>
	<ba9292ae-5bf3-54af-fefc-66336f83afd6@amsat.org>
	<20180529115312.5fb8ad16.cohuck@redhat.com>
	<3602923c-42ad-750f-aced-ed758441d501@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Tue, 29 May 2018 13:09:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Tue, 29 May 2018 13:09:24 -0000

On Tue, 29 May 2018 12:45:28 +0200
Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 29/05/2018 11:53, Cornelia Huck wrote:
> > On Mon, 28 May 2018 21:36:31 -0300
> > Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
> >  =20
> >> On 05/28/2018 09:06 PM, Michael S. Tsirkin wrote: =20
> >>> On Mon, May 28, 2018 at 05:48:05PM -0600, Alex Williamson wrote:   =20
> >>>> On Mon, 28 May 2018 20:26:59 -0300
> >>>> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
> >>>>
> >>>> -ENOCOMMITLOG   =20
> >>
> >> Oops sorry Alex, I meant to add some, but missed this while rebasing.
> >> =20
> >>>> Why?  Tangible benefit.  Looks like noise.  Thanks,
> >>>>   =20
> >>> I agree it should have a commit log, but .c files
> >>> should be self-sufficient not rely on .h files
> >>> pulling in headers for symbols the .h does not use
> >>> itself.   =20
> >>
> >> I meant:
> >>
> >>   No declaration of "hw/vfio/vfio-common.h" directly requires to inclu=
de
> >>   the "exec/address-spaces.h" header.  To simplify dependencies and
> >>   ease following cleanup of "exec/address-spaces.h", directly include
> >>   it in the source file where the declaration are used.
> >> =20
> >>> This is better because it makes refactoring easier.
> >>>    =20
> >>>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >>>>> ---
> >>>>>  include/hw/vfio/vfio-common.h | 1 -
> >>>>>  hw/vfio/ccw.c                 | 1 +
> >>>>>  hw/vfio/platform.c            | 1 +
> >>>>>  3 files changed, 2 insertions(+), 1 deletion(-) =20
> >=20
> > With the description added:
> >=20
> > Acked-by: Cornelia Huck <cohuck@redhat.com>
> >  =20
>=20
> Alex, is the description okay with you too?

Yes, if someone wants to roll this on on commit,

Acked-by: Alex Williamson <alex.williamson@redhat.com>

