Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSPAj-0002G6-0m
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jun 2018 11:55:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52125)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1fSPAf-0002Dg-PP
	for qemu-trivial@nongnu.org; Mon, 11 Jun 2018 11:55:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1fSPAe-0000oU-Se
	for qemu-trivial@nongnu.org; Mon, 11 Jun 2018 11:55:53 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:36872 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1fSPAG-0000Ze-5R; Mon, 11 Jun 2018 11:55:28 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C5C418AA17;
	Mon, 11 Jun 2018 15:55:26 +0000 (UTC)
Received: from [10.10.120.103] (ovpn-120-103.rdu2.redhat.com [10.10.120.103])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0680420357CA;
	Mon, 11 Jun 2018 15:55:17 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
	Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>
References: <20180611011501.10235-1-f4bug@amsat.org>
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, qemu-trivial@nongnu.org,
	Fabien Chouteau <chouteau@adacore.com>,
	Alistair Francis <alistair@alistair23.me>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Anthony Perard <anthony.perard@citrix.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Marek Vasut <marex@denx.de>, Sagar Karandikar <sagark@eecs.berkeley.edu>,
	David Gibson <david@gibson.dropbear.id.au>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Beniamino Galvani <b.galvani@gmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Chris Wulff <crwulff@gmail.com>, Dmitry Fleytman
	<dmitry.fleytman@gmail.com>, "Edgar E . Iglesias"
	<edgar.iglesias@gmail.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>, Alberto Garcia
	<berto@igalia.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Keith Busch <keith.busch@intel.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Paul Burton <paul.burton@mips.com>, Yongbok Kim <yongbok.kim@mips.com>, 
	Peter Chubb <peter.chubb@nicta.com.au>, Yuval Shaia
	<yuval.shaia@oracle.com>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
	<hpoussin@reactos.org>, Alex Williamson <alex.williamson@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, 
	Fam Zheng <famz@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Jason Wang <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, 
	Michael Clark <mjc@sifive.com>, Palmer Dabbelt <palmer@sifive.com>,
	Jiri Slaby <jslaby@suse.cz>, Alexander Graf <agraf@suse.de>,
	Richard Henderson <rth@twiddle.net>, Michael Walle <michael@walle.cc>, 
	Jan Kiszka <jan.kiszka@web.de>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <54eb6ae9-d7e0-8a4d-6bd4-f8f1d0f00b92@redhat.com>
Date: Mon, 11 Jun 2018 10:55:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180611011501.10235-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Mon, 11 Jun 2018 15:55:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Mon, 11 Jun 2018 15:55:27 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH v4 00/40] Use the IEC binary prefix
 definitions
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
X-List-Received-Date: Mon, 11 Jun 2018 15:55:55 -0000

On 06/10/2018 08:14 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi,
>=20
> This series:
>=20
> - split the byte-based definitions from "qemu/cutils.h" to "qemu/units.=
h"
>    (this now triggers WARNING: 1 added file, does MAINTAINERS need upda=
ting?)
> - clean hw/ includes;
> - replace different constants used for byte size with their correspondi=
ng
>    IEC binary prefix definitions.
>=20
> Since v3:
> - use IEC binary prefix definitions (Stefan Weil)
> - rebased
> - added R-b tags
>=20

>   hw/net/ne2000.h                          |  5 ++--
...
>   tests/test-qemu-opts.c                   |  7 +++---
>   scripts/checkpatch.pl                    |  1 +
>   135 files changed, 533 insertions(+), 431 deletions(-)
>   create mode 100644 include/qemu/units.h
>=20

At least monitor.c and vl.c are missing from this list; a more general=20
grep shows that the following are all potential candidates for this clean=
up:

$ git grep -n '[<>][<>]=3D [1-5]0'
disas/m68k.c:787:      val >>=3D 10;
hw/mips/mips_malta.c:194:    ram_size >>=3D 20;
hw/ppc/sam460ex.c:129:    ram_size >>=3D 20;
hw/timer/sh_timer.c:112:        case 4: freq >>=3D 10; break;
linux-user/mips/cpu_loop.c:641:                                code >>=3D=
 10;
linux-user/mips/cpu_loop.c:664:                        code >>=3D 10;
monitor.c:3198:                    val <<=3D 20;
target/m68k/helper.c:386:    size >>=3D 10;
target/m68k/helper.c:390:        size >>=3D 10;
target/m68k/helper.c:394:            size >>=3D 10;
target/xtensa/helper.c:729:            sz >>=3D 20;
target/xtensa/helper.c:732:            sz >>=3D 10;
vl.c:2793:            sz <<=3D 20;

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

