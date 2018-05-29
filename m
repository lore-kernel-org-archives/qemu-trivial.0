Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNcQZ-0004Yi-1H
	for mharc-qemu-trivial@gnu.org; Tue, 29 May 2018 07:04:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40061)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1fNcQT-0004Nc-N8
	for qemu-trivial@nongnu.org; Tue, 29 May 2018 07:04:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1fNcQP-0005MM-SR
	for qemu-trivial@nongnu.org; Tue, 29 May 2018 07:04:25 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:60766 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1fNcQ9-00053N-DX; Tue, 29 May 2018 07:04:05 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C36E4818BAED;
	Tue, 29 May 2018 11:04:04 +0000 (UTC)
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4A0342166BC7;
	Tue, 29 May 2018 11:03:59 +0000 (UTC)
Date: Tue, 29 May 2018 13:03:57 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Cc: Thomas Huth <thuth@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, Paolo Bonzini
	<pbonzini@redhat.com>, Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>, 
	Anthony Perard <anthony.perard@citrix.com>, Marcel Apfelbaum
	<marcel.apfelbaum@gmail.com>, Richard Henderson <rth@twiddle.net>, Eduardo
	Habkost <ehabkost@redhat.com>, Christian Borntraeger
	<borntraeger@de.ibm.com>, Alexander Graf <agraf@suse.de>, David Hildenbrand
	<david@redhat.com>, Fam Zheng <famz@redhat.com>, Gerd Hoffmann
	<kraxel@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Markus
	Armbruster <armbru@redhat.com>, qemu-block@nongnu.org (open list:Block
	layer core), xen-devel@lists.xenproject.org (open list:X86),
	qemu-s390x@nongnu.org (open list:virtio-ccw)
Message-ID: <20180529130357.405f501b.cohuck@redhat.com>
In-Reply-To: <20180528232719.4721-15-f4bug@amsat.org>
References: <20180528232719.4721-1-f4bug@amsat.org>
	<20180528232719.4721-15-f4bug@amsat.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Tue, 29 May 2018 11:04:04 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Tue, 29 May 2018 11:04:04 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'cohuck@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH v4 14/21] hw: Do not include
 "sysemu/blockdev.h" if it is not necessary
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
X-List-Received-Date: Tue, 29 May 2018 11:04:29 -0000

On Mon, 28 May 2018 20:27:12 -0300
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> Remove those unneeded includes to speed up the compilation
> process a little bit.
>=20
> Code change produced with:
>=20
>     $ git grep '#include "sysemu/blockdev.h"' | \
>       cut -d: -f-1 | \
>       xargs egrep -L "(BlockInterfaceType|DriveInfo|drive_get|blk_legacy_=
dinfo|blockdev_mark_auto_del)" | \
>       xargs sed -i.bak '/#include "sysemu\/blockdev.h"/d'
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/block/m25p80.c          | 1 -
>  hw/block/onenand.c         | 1 -
>  hw/i386/xen/xen-mapcache.c | 1 -
>  hw/s390x/virtio-ccw.c      | 1 -
>  hw/scsi/scsi-generic.c     | 1 -
>  hw/sd/sdhci.c              | 1 -
>  hw/usb/dev-storage.c       | 1 -
>  monitor.c                  | 1 -
>  8 files changed, 8 deletions(-)

Acked-by: Cornelia Huck <cohuck@redhat.com>

