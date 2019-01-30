Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gokyT-0004DW-Vo
	for mharc-qemu-trivial@gnu.org; Wed, 30 Jan 2019 03:11:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53167)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gokyR-0004BK-5w
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 03:11:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gokyQ-0005Qj-Ey
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 03:11:55 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59558)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gokyO-0005Q1-Tf; Wed, 30 Jan 2019 03:11:53 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1936EC04BD46;
	Wed, 30 Jan 2019 08:11:52 +0000 (UTC)
Received: from Igors-MacBook-Pro.local (unknown [10.36.112.15])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 532505C21E;
	Wed, 30 Jan 2019 08:11:50 +0000 (UTC)
Date: Wed, 30 Jan 2019 09:11:47 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com,
	laurent@vivier.eu, philmd@redhat.com
Message-ID: <20190130091147.4fb3ebc7@Igors-MacBook-Pro.local>
In-Reply-To: <20190130000653.16267-4-richardw.yang@linux.intel.com>
References: <20190130000653.16267-1-richardw.yang@linux.intel.com>
	<20190130000653.16267-4-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 30 Jan 2019 08:11:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v3 3/3] hw/acpi: remove unnecessary
 variable acpi_table_builtin
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
X-List-Received-Date: Wed, 30 Jan 2019 08:11:56 -0000

On Wed, 30 Jan 2019 08:06:53 +0800
Wei Yang <richardw.yang@linux.intel.com> wrote:

> acpi_table_builtin is now always false, it is not necessary to check it
> again.
>=20
> This patch just removes it.
>=20
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> Reviewed-by: Philippe Mathieu-Daud=E8=8C=85 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=E8=8C=85 <philmd@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/acpi/core.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/hw/acpi/core.c b/hw/acpi/core.c
> index e9b1a85e54..f9c96535d1 100644
> --- a/hw/acpi/core.c
> +++ b/hw/acpi/core.c
> @@ -303,8 +303,6 @@ out:
>      error_propagate(errp, err);
>  }
> =20
> -static bool acpi_table_builtin =3D false;
> -
>  unsigned acpi_table_len(void *current)
>  {
>      struct acpi_table_header *hdr =3D current - sizeof(hdr->_length);
> @@ -320,7 +318,7 @@ void *acpi_table_hdr(void *h)
> =20
>  uint8_t *acpi_table_first(void)
>  {
> -    if (acpi_table_builtin || !acpi_tables) {
> +    if (!acpi_tables) {
>          return NULL;
>      }
>      return acpi_table_hdr(acpi_tables + ACPI_TABLE_PFX_SIZE);


