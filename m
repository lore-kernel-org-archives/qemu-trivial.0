Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dazUB-0003HE-CM
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 03:14:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43018)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1dazU9-0003G3-Lx
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 03:14:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1dazU8-0000BR-S9
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 03:14:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33872)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1dazU4-00006U-Gq; Fri, 28 Jul 2017 03:14:52 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6397B734FD;
	Fri, 28 Jul 2017 07:14:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 6397B734FD
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=cohuck@redhat.com
Received: from gondolin (dhcp-192-215.str.redhat.com [10.33.192.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9549170134;
	Fri, 28 Jul 2017 07:14:50 +0000 (UTC)
Date: Fri, 28 Jul 2017 09:14:48 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Message-ID: <20170728091448.6b1ec0c6@gondolin>
In-Reply-To: <36f410cd-ef86-aa08-9922-5cbd1e565a54@redhat.com>
References: <20170728053610.15770-1-f4bug@amsat.org>
	<20170728053610.15770-8-f4bug@amsat.org>
	<36f410cd-ef86-aa08-9922-5cbd1e565a54@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 28 Jul 2017 07:14:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 07/47] MAINTAINERS: add
 missing entry for vfio/ccw
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
X-List-Received-Date: Fri, 28 Jul 2017 07:14:58 -0000

On Fri, 28 Jul 2017 09:02:27 +0200
Thomas Huth <thuth@redhat.com> wrote:

> On 28.07.2017 07:35, Philippe Mathieu-Daud=C3=A9 wrote:
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > ---
> >  MAINTAINERS | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index ddf6f3f6d8..69987b5e5b 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1029,6 +1029,7 @@ S: Supported
> >  F: hw/vfio/ccw.c
> >  F: hw/s390x/s390-ccw.c
> >  F: include/hw/s390x/s390-ccw.h
> > +F: linux-headers/linux/vfio_ccw.h =20
>=20
> Again a linux-header ... I don't think we need an entry for this in
> MAINTAINERS since the file is maintained in the Linux kernel instead.

Agreed, even if it's the same maintainer in this case.

What about a catchall pattern for the linux-headers instead that points
to the update-headers script? If you're updating these without running
the script, you're doing something wrong (as soon as the patchset is
ready for inclusion, at least.)

