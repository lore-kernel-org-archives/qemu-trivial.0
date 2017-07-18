Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXSUQ-0006j5-ON
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 09:24:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34403)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1dXPLk-0003j6-RH
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 06:03:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1dXPLk-0002Kq-3G
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 06:03:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34334)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1dXPLf-0002F2-Qa; Tue, 18 Jul 2017 06:03:23 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BA630C04B92C;
	Tue, 18 Jul 2017 10:03:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com BA630C04B92C
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=cohuck@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com BA630C04B92C
Received: from gondolin (dhcp-192-215.str.redhat.com [10.33.192.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 593D15C88F;
	Tue, 18 Jul 2017 10:03:21 +0000 (UTC)
Date: Tue, 18 Jul 2017 12:03:19 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Cc: qemu-trivial@nongnu.org, Christian Borntraeger <borntraeger@de.ibm.com>,
	Alexander Graf <agraf@suse.de>, Richard Henderson <rth@twiddle.net>,
	qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>
Message-ID: <20170718120319.2f54ffa5@gondolin>
In-Reply-To: <20170718115840.3017dd18@gondolin>
References: <20170718061005.29518-1-f4bug@amsat.org>
	<20170718061005.29518-12-f4bug@amsat.org>
	<20170718115840.3017dd18@gondolin>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 18 Jul 2017 10:03:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Tue, 18 Jul 2017 09:24:37 -0400
Subject: Re: [Qemu-trivial] [PATCH 11/29] s390x/sclp: use QEMU_IS_ALIGNED
 macro
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
X-List-Received-Date: Tue, 18 Jul 2017 10:03:29 -0000

On Tue, 18 Jul 2017 11:58:40 +0200
Cornelia Huck <cohuck@redhat.com> wrote:

> On Tue, 18 Jul 2017 03:09:47 -0300
> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
>=20
> > Applied using the Coccinelle semantic patch scripts/coccinelle/use_osde=
p.cocci
> >=20
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > ---
> >  hw/s390x/sclp.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/hw/s390x/sclp.c b/hw/s390x/sclp.c
> > index 9253dbbc64..0a207c7345 100644
> > --- a/hw/s390x/sclp.c
> > +++ b/hw/s390x/sclp.c
> > @@ -237,7 +237,7 @@ static void assign_storage(SCLPDevice *sclp, SCCB *=
sccb)
> >      }
> >      assign_addr =3D (assign_info->rn - 1) * mhd->rzm;
> > =20
> > -    if ((assign_addr % MEM_SECTION_SIZE =3D=3D 0) &&
> > +    if (QEMU_IS_ALIGNED(assign_addr, MEM_SECTION_SIZE) &&
> >          (assign_addr >=3D mhd->padded_ram_size)) {
> >          /* Re-use existing memory region if found */
> >          mr =3D memory_region_find(sysmem, assign_addr, 1).mr;
> > @@ -297,7 +297,7 @@ static void unassign_storage(SCLPDevice *sclp, SCCB=
 *sccb)
> >      unassign_addr =3D (assign_info->rn - 1) * mhd->rzm;
> > =20
> >      /* if the addr is a multiple of 256 MB */
> > -    if ((unassign_addr % MEM_SECTION_SIZE =3D=3D 0) &&
> > +    if (QEMU_IS_ALIGNED(unassign_addr, MEM_SECTION_SIZE) &&
> >          (unassign_addr >=3D mhd->padded_ram_size)) {
> >          mhd->standby_state_map[(unassign_addr -
> >                             mhd->padded_ram_size) / MEM_SECTION_SIZE] =
=3D 0; =20
>=20
> Acked-by: Cornelia Huck <cohuck@redhat.com>

Oh, and I assume this will go through trivial, right?

