Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRgLI-0001DG-7l
	for mharc-qemu-trivial@gnu.org; Tue, 27 Nov 2018 11:36:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44327)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1gRgLF-0001BL-Cm
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 11:36:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1gRgLC-0003sl-QI
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 11:36:04 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53810)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
	id 1gRgL7-0003nz-IG; Tue, 27 Nov 2018 11:35:57 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0F4A4356F5;
	Tue, 27 Nov 2018 16:35:56 +0000 (UTC)
Received: from x1.home (ovpn-116-133.phx2.redhat.com [10.3.116.133])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 61E1C5C21C;
	Tue, 27 Nov 2018 16:35:52 +0000 (UTC)
Date: Tue, 27 Nov 2018 09:35:52 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Message-ID: <20181127093552.4f53790d@x1.home>
In-Reply-To: <20181125205000.10324-14-philmd@redhat.com>
References: <20181125205000.10324-1-philmd@redhat.com>
	<20181125205000.10324-14-philmd@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 27 Nov 2018 16:35:56 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH for-3.1 13/25] MAINTAINERS: Add missing
 entries to VFIO
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
X-List-Received-Date: Tue, 27 Nov 2018 16:36:07 -0000

On Sun, 25 Nov 2018 21:49:48 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bfe71f2555..e124792557 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1326,6 +1326,8 @@ M: Alex Williamson <alex.williamson@redhat.com>
>  S: Supported
>  F: hw/vfio/*
>  F: include/hw/vfio/
> +F: include/qemu/vfio-helpers.h

This misses util/vfio-helpers.c, both of which are contributed by Fam
and currently only used by nvme.  I really haven't done anything with
them, so they should probably be under the NVMe block driver, but if it
makes more sense for me to look after them, I can start paying more
attention to them.  I'm not sure signing someone up for new files
they've never touched counts as trivial ;)  Thanks,

Alex

> +F: docs/igd-assign.txt
> =20
>  vfio-ccw
>  M: Cornelia Huck <cohuck@redhat.com>


