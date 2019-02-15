Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gug8Z-0001GQ-II
	for mharc-qemu-trivial@gnu.org; Fri, 15 Feb 2019 11:14:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51344)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gug8U-0001EG-OP
	for qemu-trivial@nongnu.org; Fri, 15 Feb 2019 11:14:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gug8T-0001zs-T0
	for qemu-trivial@nongnu.org; Fri, 15 Feb 2019 11:14:46 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51254)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1gug8R-0001wb-SE; Fri, 15 Feb 2019 11:14:43 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 052813F156;
	Fri, 15 Feb 2019 16:14:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-92.ams2.redhat.com
	[10.36.116.92])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 84A41608C4;
	Fri, 15 Feb 2019 16:14:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 1423511386C5; Fri, 15 Feb 2019 17:14:41 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Helge Deller <deller@gmx.de>, Cornelia Huck <cohuck@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Markus Armbruster <armbru@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Luc Michel <luc.michel@greensocs.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
References: <20181218115615.1499-1-philmd@redhat.com>
	<20181218115615.1499-6-philmd@redhat.com>
Date: Fri, 15 Feb 2019 17:14:41 +0100
In-Reply-To: <20181218115615.1499-6-philmd@redhat.com> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue,
	18 Dec 2018 12:56:08 +0100")
Message-ID: <87o97dyqoe.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 15 Feb 2019 16:14:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 05/12] MAINTAINERS: Add
 missing entries for the QObject section
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
X-List-Received-Date: Fri, 15 Feb 2019 16:14:49 -0000

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> v2: Removed qdist
> ---
>  MAINTAINERS | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7a94b0dab3..a381882c27 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1900,10 +1900,14 @@ F: include/qapi/qmp/
>  X: include/qapi/qmp/dispatch.h
>  F: scripts/coccinelle/qobject.cocci
>  F: tests/check-qdict.c
> -F: tests/check-qnum.c
>  F: tests/check-qjson.c
>  F: tests/check-qlist.c
> +F: tests/check-qlit.c
> +F: tests/check-qnull.c
> +F: tests/check-qnum.c
> +F: tests/check-qobject.c
>  F: tests/check-qstring.c
> +F: qdict-test-data.txt
>  T: git https://repo.or.cz/qemu/armbru.git qapi-next
>=20=20
>  QEMU Guest Agent

Reviewed-by: Markus Armbruster <armbru@redhat.com>

