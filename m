Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gokyG-00041s-Kt
	for mharc-qemu-trivial@gnu.org; Wed, 30 Jan 2019 03:11:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53081)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gokyF-00040S-51
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 03:11:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gokyE-0005Nm-Cw
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 03:11:43 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53896)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gokyA-0005Lc-OQ; Wed, 30 Jan 2019 03:11:40 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 75AC313ABE6;
	Wed, 30 Jan 2019 08:11:32 +0000 (UTC)
Received: from Igors-MacBook-Pro.local (unknown [10.36.112.15])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 71C045D97A;
	Wed, 30 Jan 2019 08:11:23 +0000 (UTC)
Date: Wed, 30 Jan 2019 09:11:21 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com,
	laurent@vivier.eu, philmd@redhat.com
Message-ID: <20190130091121.2a05e7f5@Igors-MacBook-Pro.local>
In-Reply-To: <20190130000653.16267-3-richardw.yang@linux.intel.com>
References: <20190130000653.16267-1-richardw.yang@linux.intel.com>
	<20190130000653.16267-3-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 30 Jan 2019 08:11:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v3 2/3] hw/acpi: remove unused function
 acpi_table_add_builtin()
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
X-List-Received-Date: Wed, 30 Jan 2019 08:11:44 -0000

On Wed, 30 Jan 2019 08:06:52 +0800
Wei Yang <richardw.yang@linux.intel.com> wrote:

> Function acpi_table_add_builtin() is not used anymore.
>=20
> Remove the definition and declaration.
>=20
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> Reviewed-by: Philippe Mathieu-Daud=E8=8C=85 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=E8=8C=85 <philmd@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/acpi/core.c         | 6 ------
>  include/hw/acpi/acpi.h | 1 -
>  2 files changed, 7 deletions(-)
>=20
> diff --git a/hw/acpi/core.c b/hw/acpi/core.c
> index d6f0709691..e9b1a85e54 100644
> --- a/hw/acpi/core.c
> +++ b/hw/acpi/core.c
> @@ -305,12 +305,6 @@ out:
> =20
>  static bool acpi_table_builtin =3D false;
> =20
> -void acpi_table_add_builtin(const QemuOpts *opts, Error **errp)
> -{
> -    acpi_table_builtin =3D true;
> -    acpi_table_add(opts, errp);
> -}
> -
>  unsigned acpi_table_len(void *current)
>  {
>      struct acpi_table_header *hdr =3D current - sizeof(hdr->_length);
> diff --git a/include/hw/acpi/acpi.h b/include/hw/acpi/acpi.h
> index c20ace0d0b..4a8bbaf1b5 100644
> --- a/include/hw/acpi/acpi.h
> +++ b/include/hw/acpi/acpi.h
> @@ -190,7 +190,6 @@ uint8_t *acpi_table_first(void);
>  uint8_t *acpi_table_next(uint8_t *current);
>  unsigned acpi_table_len(void *current);
>  void acpi_table_add(const QemuOpts *opts, Error **errp);
> -void acpi_table_add_builtin(const QemuOpts *opts, Error **errp);
> =20
>  typedef struct AcpiSlicOem AcpiSlicOem;
>  struct AcpiSlicOem {


