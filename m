Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gol3O-0006Sv-Ip
	for mharc-qemu-trivial@gnu.org; Wed, 30 Jan 2019 03:17:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53985)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gol3M-0006S1-Ny
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 03:17:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gol3M-00070I-3x
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 03:17:00 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42754)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gol3K-0006zX-GX; Wed, 30 Jan 2019 03:16:58 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5B95089AE0;
	Wed, 30 Jan 2019 08:16:57 +0000 (UTC)
Received: from Igors-MacBook-Pro.local (unknown [10.36.112.15])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 09E285C2EE;
	Wed, 30 Jan 2019 08:16:52 +0000 (UTC)
Date: Wed, 30 Jan 2019 09:16:50 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, mst@redhat.com
Message-ID: <20190130091650.5c7b5f7e@Igors-MacBook-Pro.local>
In-Reply-To: <20190130030207.6770-1-richardw.yang@linux.intel.com>
References: <20190130030207.6770-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 30 Jan 2019 08:16:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] i386,
 acpi: cleanup build_facs by removing second unused argument
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
X-List-Received-Date: Wed, 30 Jan 2019 08:17:01 -0000

On Wed, 30 Jan 2019 11:02:07 +0800
Wei Yang <richardw.yang@linux.intel.com> wrote:

> The second argument of build_facs() is not used, just remove it.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/i386/acpi-build.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 236a20eaa8..023729c1f2 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -292,7 +292,7 @@ static void acpi_align_size(GArray *blob, unsigned align)
>  
>  /* FACS */
>  static void
> -build_facs(GArray *table_data, BIOSLinker *linker)
> +build_facs(GArray *table_data)
>  {
>      AcpiFacsDescriptorRev1 *facs = acpi_data_push(table_data, sizeof *facs);
>      memcpy(&facs->signature, "FACS", 4);
> @@ -2643,7 +2643,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>       * requirements.
>       */
>      facs = tables_blob->len;
> -    build_facs(tables_blob, tables->linker);
> +    build_facs(tables_blob);
>  
>      /* DSDT is pointed to by FADT */
>      dsdt = tables_blob->len;


