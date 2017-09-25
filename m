Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwOVY-0001Aj-Kr
	for mharc-qemu-trivial@gnu.org; Mon, 25 Sep 2017 04:12:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43508)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1dwOVW-00019C-FS
	for qemu-trivial@nongnu.org; Mon, 25 Sep 2017 04:12:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1dwOVT-0000tb-Rh
	for qemu-trivial@nongnu.org; Mon, 25 Sep 2017 04:12:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47428)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1dwOVP-0000qX-Oe; Mon, 25 Sep 2017 04:12:43 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C54A680F9C;
	Mon, 25 Sep 2017 08:12:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com C54A680F9C
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=cohuck@redhat.com
Received: from gondolin (dhcp-192-215.str.redhat.com [10.33.192.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 164746C1E0;
	Mon, 25 Sep 2017 08:12:34 +0000 (UTC)
Date: Mon, 25 Sep 2017 10:12:32 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth
	<thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Peter Crosthwaite
	<crosthwaite.peter@gmail.com>, Richard Henderson <rth@twiddle.net>, Stefano
	Stabellini <sstabellini@kernel.org>, Anthony Perard
	<anthony.perard@citrix.com>, Eduardo Habkost <ehabkost@redhat.com>, Marcel
	Apfelbaum <marcel@redhat.com>, Christian Borntraeger
	<borntraeger@de.ibm.com>, Alexander Graf <agraf@suse.de>, Stafford Horne
	<shorne@gmail.com>, =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau
	<marcandre.lureau@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20170925101232.4d5dd45c.cohuck@redhat.com>
In-Reply-To: <20170922154014.29350-6-f4bug@amsat.org>
References: <20170922154014.29350-1-f4bug@amsat.org>
	<20170922154014.29350-6-f4bug@amsat.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 25 Sep 2017 08:12:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH 05/34] misc: remove duplicated includes
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
X-List-Received-Date: Mon, 25 Sep 2017 08:12:51 -0000

On Fri, 22 Sep 2017 12:39:45 -0300
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> exec: housekeeping (funny since 02d0e095031)
>=20
> applied using ./scripts/clean-includes
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  accel/tcg/translate-all.c          | 1 -
>  exec.c                             | 3 ---
>  hw/arm/spitz.c                     | 1 -
>  hw/char/xen_console.c              | 1 -
>  hw/core/machine.c                  | 1 -
>  hw/s390x/css.c                     | 1 -
>  target/openrisc/exception_helper.c | 1 -
>  tests/vhost-user-test.c            | 1 -
>  util/qemu-sockets.c                | 1 -
>  vl.c                               | 1 -
>  10 files changed, 12 deletions(-)

> diff --git a/hw/s390x/css.c b/hw/s390x/css.c
> index 75d4f301fb..3938fa5909 100644
> --- a/hw/s390x/css.c
> +++ b/hw/s390x/css.c
> @@ -13,7 +13,6 @@
>  #include "qapi/error.h"
>  #include "qapi/visitor.h"
>  #include "hw/qdev.h"
> -#include "qemu/error-report.h"
>  #include "qemu/bitops.h"
>  #include "qemu/error-report.h"
>  #include "exec/address-spaces.h"

Acked-by: Cornelia Huck <cohuck@redhat.com>

