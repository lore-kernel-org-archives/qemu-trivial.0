Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gZG5t-0002vL-7v
	for mharc-qemu-trivial@gnu.org; Tue, 18 Dec 2018 09:11:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56823)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1gZG5n-0002q8-EL
	for qemu-trivial@nongnu.org; Tue, 18 Dec 2018 09:11:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1gZG5m-0003MV-AO
	for qemu-trivial@nongnu.org; Tue, 18 Dec 2018 09:11:27 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35182)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1gZG5V-0003Fi-BT; Tue, 18 Dec 2018 09:11:09 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 224933D961;
	Tue, 18 Dec 2018 12:51:46 +0000 (UTC)
Received: from gondolin (ovpn-117-145.ams2.redhat.com [10.36.117.145])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5AC3B60C5C;
	Tue, 18 Dec 2018 12:51:34 +0000 (UTC)
Date: Tue, 18 Dec 2018 13:51:31 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, Paolo Bonzini
	<pbonzini@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>, 
	Richard Henderson <rth@twiddle.net>,
	Markus Armbruster <armbru@redhat.com>, 
	Helge Deller <deller@gmx.de>, Artyom Tarasenko <atar4qemu@gmail.com>, Alex
	Williamson <alex.williamson@redhat.com>, Luc Michel
	<luc.michel@greensocs.com>, "Daniel P . Berrange" <berrange@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Message-ID: <20181218135131.3f5cd35a.cohuck@redhat.com>
In-Reply-To: <20181218115615.1499-9-philmd@redhat.com>
References: <20181218115615.1499-1-philmd@redhat.com>
	<20181218115615.1499-9-philmd@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 18 Dec 2018 12:51:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v2 08/12] MAINTAINERS: Add maintainers to
 the Linux subsystem
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
X-List-Received-Date: Tue, 18 Dec 2018 14:11:32 -0000

On Tue, 18 Dec 2018 12:56:11 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> Add Michael, Cornelia and Paolo as maintainers of the Linux subsystem.
>=20
> Remove the qemu-devel@nongnu.org entry because the list is always
> selected by the 'All patches CC here' section.
>=20
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  MAINTAINERS | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f0fb2c74d7..5f39fa4b80 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -420,9 +420,10 @@ Hosts:
>  ------
> =20
>  LINUX
> -L: qemu-devel@nongnu.org
> +M: Michael S. Tsirkin <mst@redhat.com>
> +M: Cornelia Huck <cohuck@redhat.com>
> +M: Paolo Bonzini <pbonzini@redhat.com>
>  S: Maintained
> -F: linux-*
>  F: linux-headers/
> =20
>  POSIX

As this now basically an entry for linux-headers, should this now also
include the headers update script?

Acked-by: Cornelia Huck <cohuck@redhat.com>

