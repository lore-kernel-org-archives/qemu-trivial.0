Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XopLw-0002cJ-Ao
	for mharc-qemu-trivial@gnu.org; Thu, 13 Nov 2014 03:02:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36390)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XopLp-0002Tp-NW
	for qemu-trivial@nongnu.org; Thu, 13 Nov 2014 03:02:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XopLk-0002ho-Rv
	for qemu-trivial@nongnu.org; Thu, 13 Nov 2014 03:01:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55259)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1XopLa-0002g3-2a; Thu, 13 Nov 2014 03:01:42 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sAD81YaD025591
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 13 Nov 2014 03:01:34 -0500
Received: from blackfin.pond.sub.org (ovpn-116-40.ams2.redhat.com
	[10.36.116.40])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sAD81W0n011131
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 13 Nov 2014 03:01:33 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id EF5BF303FED1; Thu, 13 Nov 2014 09:01:31 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: <arei.gonglei@huawei.com>
References: <1415847577-5820-1-git-send-email-arei.gonglei@huawei.com>
	<1415847577-5820-3-git-send-email-arei.gonglei@huawei.com>
Date: Thu, 13 Nov 2014 09:01:31 +0100
In-Reply-To: <1415847577-5820-3-git-send-email-arei.gonglei@huawei.com> (arei
	gonglei's message of "Thu, 13 Nov 2014 10:59:37 +0800")
Message-ID: <871tp7o7fo.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, mst@redhat.com,
	qemu-devel@nongnu.org, peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] acpi-build: Make
	DPRINTF working for acpi-build
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Nov 2014 08:02:02 -0000

<arei.gonglei@huawei.com> writes:

> From: Gonglei <arei.gonglei@huawei.com>
>
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  hw/i386/acpi-build.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 4ab44bf..8cec9aa 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -67,6 +67,14 @@
>  
>  #define ACPI_BUILD_TABLE_SIZE             0x20000
>  
> +/* #define DEBUG_ACPI_BUILD */
> +#ifdef DEBUG_ACPI_BUILD
> +#define ACPI_BUILD_DPRINTF(fmt, ...)        \
> +    do {printf("ACPI_BUILD: " fmt, ## __VA_ARGS__); } while (0)
> +#else
> +#define ACPI_BUILD_DPRINTF(fmt, ...)
> +#endif
> +
>  typedef struct AcpiCpuInfo {
>      DECLARE_BITMAP(found_cpus, ACPI_CPU_HOTPLUG_ID_LIMIT);
>  } AcpiCpuInfo;
> @@ -245,8 +253,6 @@ static void acpi_get_pci_info(PcPciInfo *info)
>  #define ACPI_BUILD_APPNAME6 "BOCHS "
>  #define ACPI_BUILD_APPNAME4 "BXPC"
>  
> -#define ACPI_BUILD_DPRINTF(level, fmt, ...) do {} while (0)
> -
>  #define ACPI_BUILD_TABLE_FILE "etc/acpi/tables"
>  #define ACPI_BUILD_RSDP_FILE "etc/acpi/rsdp"
>  #define ACPI_BUILD_TPMLOG_FILE "etc/tpm/log"

Have you considered replacing ACPI_BUILD_DPRINTF() by tracepoints?

[...]

