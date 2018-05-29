Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNbJq-0003yC-PY
	for mharc-qemu-trivial@gnu.org; Tue, 29 May 2018 05:53:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54415)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1fNbJn-0003w5-VL
	for qemu-trivial@nongnu.org; Tue, 29 May 2018 05:53:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1fNbJn-0000Ja-9M
	for qemu-trivial@nongnu.org; Tue, 29 May 2018 05:53:28 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:59070 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1fNbJg-0000FD-Ss; Tue, 29 May 2018 05:53:20 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 24032401EF08;
	Tue, 29 May 2018 09:53:20 +0000 (UTC)
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 49C4A11166E7;
	Tue, 29 May 2018 09:53:14 +0000 (UTC)
Date: Tue, 29 May 2018 11:53:12 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Alex Williamson
	<alex.williamson@redhat.com>, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, Paolo Bonzini
	<pbonzini@redhat.com>, "open list:S390" <qemu-s390x@nongnu.org>
Message-ID: <20180529115312.5fb8ad16.cohuck@redhat.com>
In-Reply-To: <ba9292ae-5bf3-54af-fefc-66336f83afd6@amsat.org>
References: <20180528232719.4721-1-f4bug@amsat.org>
	<20180528232719.4721-2-f4bug@amsat.org>
	<20180528174805.7a56a4b8@w520.home>
	<20180529030540-mutt-send-email-mst@kernel.org>
	<ba9292ae-5bf3-54af-fefc-66336f83afd6@amsat.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Tue, 29 May 2018 09:53:20 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Tue, 29 May 2018 09:53:20 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'cohuck@redhat.com' RCPT:''
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
X-List-Received-Date: Tue, 29 May 2018 09:53:29 -0000

On Mon, 28 May 2018 21:36:31 -0300
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> On 05/28/2018 09:06 PM, Michael S. Tsirkin wrote:
> > On Mon, May 28, 2018 at 05:48:05PM -0600, Alex Williamson wrote: =20
> >> On Mon, 28 May 2018 20:26:59 -0300
> >> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
> >>
> >> -ENOCOMMITLOG =20
>=20
> Oops sorry Alex, I meant to add some, but missed this while rebasing.
>=20
> >> Why?  Tangible benefit.  Looks like noise.  Thanks,
> >> =20
> > I agree it should have a commit log, but .c files
> > should be self-sufficient not rely on .h files
> > pulling in headers for symbols the .h does not use
> > itself. =20
>=20
> I meant:
>=20
>   No declaration of "hw/vfio/vfio-common.h" directly requires to include
>   the "exec/address-spaces.h" header.  To simplify dependencies and
>   ease following cleanup of "exec/address-spaces.h", directly include
>   it in the source file where the declaration are used.
>=20
> > This is better because it makes refactoring easier.
> >  =20
> >>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >>> ---
> >>>  include/hw/vfio/vfio-common.h | 1 -
> >>>  hw/vfio/ccw.c                 | 1 +
> >>>  hw/vfio/platform.c            | 1 +
> >>>  3 files changed, 2 insertions(+), 1 deletion(-)

With the description added:

Acked-by: Cornelia Huck <cohuck@redhat.com>

