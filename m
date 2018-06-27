Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fY8Z2-0004At-7L
	for mharc-qemu-trivial@gnu.org; Wed, 27 Jun 2018 07:24:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55632)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1fY8Z0-00049k-6M
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 07:24:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1fY8Yz-0003zO-7x
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 07:24:42 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:59956 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1fY8Yt-0003sC-0g; Wed, 27 Jun 2018 07:24:35 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8B8A9402212B;
	Wed, 27 Jun 2018 11:24:34 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2FC401C5AD;
	Wed, 27 Jun 2018 11:24:30 +0000 (UTC)
Date: Wed, 27 Jun 2018 13:24:29 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, "Michael S. Tsirkin"
	<mst@redhat.com>, Stefan Berger <stefanb@linux.vnet.ibm.com>
Message-ID: <20180627132429.03e418ec@redhat.com>
In-Reply-To: <20180625124238.25339-13-f4bug@amsat.org>
References: <20180625124238.25339-1-f4bug@amsat.org>
	<20180625124238.25339-13-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Wed, 27 Jun 2018 11:24:34 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Wed, 27 Jun 2018 11:24:34 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH v5 12/46] hw/tpm: Use the IEC binary
 prefix definitions
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
X-List-Received-Date: Wed, 27 Jun 2018 11:24:43 -0000

On Mon, 25 Jun 2018 09:42:04 -0300
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> It eases code review, unit is explicit.
>=20
> Patch generated using:
>=20
>   $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/h=
w/
>=20
> and modified manually.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  include/hw/acpi/tpm.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/hw/acpi/tpm.h b/include/hw/acpi/tpm.h
> index 46ac4dc581..3580ffd50c 100644
> --- a/include/hw/acpi/tpm.h
> +++ b/include/hw/acpi/tpm.h
> @@ -16,6 +16,7 @@
>  #ifndef HW_ACPI_TPM_H
>  #define HW_ACPI_TPM_H
> =20
> +#include "qemu/units.h"
>  #include "hw/registerfields.h"
> =20
>  #define TPM_TIS_ADDR_BASE           0xFED40000
> @@ -176,7 +177,7 @@ REG32(CRB_DATA_BUFFER, 0x80)
>  #define TPM_CRB_ADDR_CTRL           (TPM_CRB_ADDR_BASE + A_CRB_CTRL_REQ)
>  #define TPM_CRB_R_MAX               R_CRB_DATA_BUFFER
> =20
> -#define TPM_LOG_AREA_MINIMUM_SIZE   (64 * 1024)
> +#define TPM_LOG_AREA_MINIMUM_SIZE   (64 * KiB)
> =20
>  #define TPM_TCPA_ACPI_CLASS_CLIENT  0
>  #define TPM_TCPA_ACPI_CLASS_SERVER  1


