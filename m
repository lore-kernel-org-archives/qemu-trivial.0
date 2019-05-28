Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hVfT9-0007Zt-7O
	for mharc-qemu-trivial@gnu.org; Tue, 28 May 2019 13:00:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35033)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hVfT6-0007WB-MM
	for qemu-trivial@nongnu.org; Tue, 28 May 2019 13:00:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hVfT5-0008UJ-PR
	for qemu-trivial@nongnu.org; Tue, 28 May 2019 13:00:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59204)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1hVfSn-0007ve-Sn; Tue, 28 May 2019 13:00:40 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 50EB76147C;
	Tue, 28 May 2019 17:00:26 +0000 (UTC)
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B873F8082;
	Tue, 28 May 2019 17:00:03 +0000 (UTC)
Date: Tue, 28 May 2019 19:00:01 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, Dmitry Fleytman
	<dmitry.fleytman@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>, Marcel
	Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini
	<pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Aleksandar Rikalo
	<arikalo@wavecomp.com>, Halil Pasic <pasic@linux.ibm.com>, David
	Hildenbrand <david@redhat.com>, Christian Borntraeger
	<borntraeger@de.ibm.com>, Michael Walle <michael@walle.cc>, Richard
	Henderson <rth@twiddle.net>, Aleksandar Markovic <amarkovic@wavecomp.com>, 
	Alex Williamson <alex.williamson@redhat.com>, Peter Maydell
	<peter.maydell@linaro.org>, Fam Zheng <fam@euphon.net>,
	qemu-s390x@nongnu.org, Markus Armbruster <armbru@redhat.com>
Message-ID: <20190528190001.17d7cdf0.cohuck@redhat.com>
In-Reply-To: <20190528164020.32250-5-philmd@redhat.com>
References: <20190528164020.32250-1-philmd@redhat.com>
	<20190528164020.32250-5-philmd@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 28 May 2019 17:00:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v2 04/10] hw/s390x/event-facility: Use
 the QOM BUS() macro to access BusState.qbus
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
X-List-Received-Date: Tue, 28 May 2019 17:00:57 -0000

On Tue, 28 May 2019 18:40:14 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> Rather than looking inside the definition of a BusState with "s->bus.qbus=
",
> use the QOM prefered style: "BUS(&s->bus)".
>=20
> This patch was generated using the following Coccinelle script:
>=20
>     // Use BUS() macros to access BusState.qbus
>     @use_bus_macro_to_access_qbus@
>     expression obj;
>     identifier bus;
>     @@
>     -&obj->bus.qbus
>     +BUS(&obj->bus)
>=20
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/s390x/event-facility.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

(I assume this will go through the trivial tree?)

