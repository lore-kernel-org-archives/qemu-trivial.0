Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1db3sY-00020z-GZ
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 07:56:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42396)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1db3sW-0001zT-Et
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 07:56:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1db3sV-0008Va-Pn
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 07:56:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40980)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1db3sR-0008RX-4c; Fri, 28 Jul 2017 07:56:19 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 13F778C42;
	Fri, 28 Jul 2017 11:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 13F778C42
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=cohuck@redhat.com
Received: from gondolin (dhcp-192-215.str.redhat.com [10.33.192.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 256A06C203;
	Fri, 28 Jul 2017 11:56:16 +0000 (UTC)
Date: Fri, 28 Jul 2017 13:56:14 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVk?=
	=?UTF-8?B?w6k=?= <f4bug@amsat.org>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Message-ID: <20170728135614.3f14e3ad@gondolin>
In-Reply-To: <c44770f5-df9d-2340-5dba-2f5db7acd046@redhat.com>
References: <20170728053610.15770-1-f4bug@amsat.org>
	<20170728053610.15770-6-f4bug@amsat.org>
	<a7fdc125-9a1b-bec3-915f-e8f764816b0d@redhat.com>
	<c44770f5-df9d-2340-5dba-2f5db7acd046@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 28 Jul 2017 11:56:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 05/47] MAINTAINERS: add
 missing KVM entry
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
X-List-Received-Date: Fri, 28 Jul 2017 11:56:25 -0000

On Fri, 28 Jul 2017 13:51:14 +0200
Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 28/07/2017 09:00, Thomas Huth wrote:
> > On 28.07.2017 07:35, Philippe Mathieu-Daud=C3=A9 wrote: =20
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >> ---
> >>  MAINTAINERS | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index 3b472d7a09..ece02522be 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -278,6 +278,7 @@ S: Supported
> >>  F: */kvm.*
> >>  F: accel/kvm/
> >>  F: include/sysemu/kvm*.h
> >> +F: linux-headers/asm-*/kvm*.h =20
> >=20
> > The linux-headers are not really maintained by the QEMU project - so I
> > guess we do not need an entry for these? =20
>=20
> Actually I agree with the patch.  I'd like to be CCed on
> update-linux-headers patches, and this achieves it. :)

But would it not a better idea to add an entry for all headers touched
by update-linux-headers, then?

