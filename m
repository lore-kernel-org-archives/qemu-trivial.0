Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSPXo-0001Z1-S6
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jun 2018 12:19:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36713)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1fSPXl-0001VY-Il
	for qemu-trivial@nongnu.org; Mon, 11 Jun 2018 12:19:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1fSPXk-00055P-Np
	for qemu-trivial@nongnu.org; Mon, 11 Jun 2018 12:19:45 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:38800 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1fSPXU-0004rI-5b; Mon, 11 Jun 2018 12:19:28 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 17660808255D;
	Mon, 11 Jun 2018 16:19:27 +0000 (UTC)
Received: from gondolin (ovpn-117-32.ams2.redhat.com [10.36.117.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 80834112D18D;
	Mon, 11 Jun 2018 16:19:00 +0000 (UTC)
Date: Mon, 11 Jun 2018 18:18:56 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>, Nikunj A
	Dadhania <nikunj@linux.vnet.ibm.com>, qemu-arm@nongnu.org,
	qemu-block@nongnu.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org, qemu-trivial@nongnu.org, Fabien Chouteau
	<chouteau@adacore.com>, Alistair Francis <alistair@alistair23.me>, Aurelien
	Jarno <aurelien@aurel32.net>, Anthony Perard <anthony.perard@citrix.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>, Marek Vasut
	<marex@denx.de>, Sagar Karandikar <sagark@eecs.berkeley.edu>, David Gibson
	<david@gibson.dropbear.id.au>, Antony Pavlov <antonynpavlov@gmail.com>, 
	Artyom Tarasenko <atar4qemu@gmail.com>, Andrzej Zaborowski
	<balrogg@gmail.com>, Beniamino Galvani <b.galvani@gmail.com>, Peter
	Crosthwaite <crosthwaite.peter@gmail.com>,
	Chris Wulff <crwulff@gmail.com>, 
	Dmitry Fleytman <dmitry.fleytman@gmail.com>, "Edgar E . Iglesias"
	<edgar.iglesias@gmail.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>, Max
	Filippov <jcmvbkbc@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, Marcel
	Apfelbaum <marcel.apfelbaum@gmail.com>, Subbaraya Sundeep
	<sundeep.lkml@gmail.com>, Alberto Garcia <berto@igalia.com>, Mark
	Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Keith Busch
	<keith.busch@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Peter
	Maydell <peter.maydell@linaro.org>, Stefan Berger
	<stefanb@linux.vnet.ibm.com>, Bastian Koppelmann
	<kbastian@mail.uni-paderborn.de>, Paul Burton <paul.burton@mips.com>,
	Yongbok Kim <yongbok.kim@mips.com>,
	Peter Chubb <peter.chubb@nicta.com.au>, 
	Yuval Shaia <yuval.shaia@oracle.com>, =?UTF-8?B?SGVydsOp?= Poussineau
	<hpoussin@reactos.org>, Alex Williamson <alex.williamson@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, David Hildenbrand
	<david@redhat.com>, Eric Blake <eblake@redhat.com>, Eduardo Habkost
	<ehabkost@redhat.com>, Fam Zheng <famz@redhat.com>, Igor Mammedov
	<imammedo@redhat.com>, Jason Wang <jasowang@redhat.com>, Gerd Hoffmann
	<kraxel@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Max Reitz
	<mreitz@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Paolo Bonzini
	<pbonzini@redhat.com>, Michael Clark <mjc@sifive.com>, Palmer Dabbelt
	<palmer@sifive.com>, Jiri Slaby <jslaby@suse.cz>, Alexander Graf
	<agraf@suse.de>, Richard Henderson <rth@twiddle.net>, Michael Walle
	<michael@walle.cc>, Jan Kiszka <jan.kiszka@web.de>
Message-ID: <20180611181856.71bf285a.cohuck@redhat.com>
In-Reply-To: <20180611011501.10235-1-f4bug@amsat.org>
References: <20180611011501.10235-1-f4bug@amsat.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Mon, 11 Jun 2018 16:19:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Mon, 11 Jun 2018 16:19:27 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'cohuck@redhat.com' RCPT:''
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
X-List-Received-Date: Mon, 11 Jun 2018 16:19:46 -0000

On Sun, 10 Jun 2018 22:14:21 -0300
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> Hi,
>=20
> This series:
>=20
> - split the byte-based definitions from "qemu/cutils.h" to "qemu/units.h"
>   (this now triggers WARNING: 1 added file, does MAINTAINERS need updatin=
g?)
> - clean hw/ includes;
> - replace different constants used for byte size with their corresponding
>   IEC binary prefix definitions.

Do we document preference for this somewhere? Can we automatically
check for this?

