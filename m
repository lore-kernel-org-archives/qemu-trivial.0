Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gZGwQ-0007Nu-0u
	for mharc-qemu-trivial@gnu.org; Tue, 18 Dec 2018 10:05:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57706)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gZGwI-0007Jc-FY
	for qemu-trivial@nongnu.org; Tue, 18 Dec 2018 10:05:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gZGwB-0000Xk-RC
	for qemu-trivial@nongnu.org; Tue, 18 Dec 2018 10:05:39 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37992)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1gZGvx-0000Cc-AO; Tue, 18 Dec 2018 10:05:22 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 98F50C0C0FA8;
	Tue, 18 Dec 2018 12:39:54 +0000 (UTC)
Received: from redhat.com (ovpn-120-67.rdu2.redhat.com [10.10.120.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D48072D321;
	Tue, 18 Dec 2018 12:39:52 +0000 (UTC)
Date: Tue, 18 Dec 2018 07:39:52 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Markus Armbruster <armbru@redhat.com>, Helge Deller <deller@gmx.de>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Luc Michel <luc.michel@greensocs.com>,
	"Daniel P . Berrange" <berrange@redhat.com>
Message-ID: <20181218073945-mutt-send-email-mst@kernel.org>
References: <20181218115615.1499-1-philmd@redhat.com>
	<20181218115615.1499-4-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20181218115615.1499-4-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 18 Dec 2018 12:39:54 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v2 03/12] MAINTAINERS: Add missing
 entries for the PC machines
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
X-List-Received-Date: Tue, 18 Dec 2018 15:05:48 -0000

On Tue, Dec 18, 2018 at 12:56:06PM +0100, Philippe Mathieu-Daud=E9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  MAINTAINERS | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index dac394d125..f3305a65b6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1141,6 +1141,10 @@ F: hw/acpi/ich9.c
>  F: include/hw/acpi/ich9.h
>  F: include/hw/acpi/piix4.h
>  F: hw/misc/sga.c
> +F: hw/isa/apm.c
> +F: include/hw/isa/apm.h
> +F: tests/test-x86-cpuid.c
> +F: tests/test-x86-cpuid-compat.c
> =20
>  PC Chipset
>  M: Michael S. Tsirkin <mst@redhat.com>
> --=20
> 2.17.2

