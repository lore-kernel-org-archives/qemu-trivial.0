Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1agZMZ-0003jA-Gj
	for mharc-qemu-trivial@gnu.org; Thu, 17 Mar 2016 10:57:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48620)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1agZMT-0003Y7-79
	for qemu-trivial@nongnu.org; Thu, 17 Mar 2016 10:57:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1agZMN-0006rk-ND
	for qemu-trivial@nongnu.org; Thu, 17 Mar 2016 10:57:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47731)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1agZMH-0006qi-Lz; Thu, 17 Mar 2016 10:57:05 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id E98D864394;
	Thu, 17 Mar 2016 14:57:04 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2HEv3bF026273; Thu, 17 Mar 2016 10:57:04 -0400
Date: Thu, 17 Mar 2016 15:57:02 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20160317155702.5f186eda@nial.brq.redhat.com>
In-Reply-To: <1458157417-15856-1-git-send-email-sw@weilnetz.de>
References: <1458157417-15856-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 17 Mar 2016 14:57:04 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developer <qemu-devel@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] acpi: Add missing GCC_FMT_ATTR
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
X-List-Received-Date: Thu, 17 Mar 2016 14:57:22 -0000

On Wed, 16 Mar 2016 20:43:37 +0100
Stefan Weil <sw@weilnetz.de> wrote:

> This fixes a compiler warning when compiling with -Wextra.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  include/hw/acpi/aml-build.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index 66f48ec..2c994b3 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -369,6 +369,7 @@ build_rsdt(GArray *table_data, GArray *linker, GArray *table_offsets,
>             const char *oem_id, const char *oem_table_id);
>  
>  int
> -build_append_named_dword(GArray *array, const char *name_format, ...);
> +build_append_named_dword(GArray *array, const char *name_format, ...)
> +GCC_FMT_ATTR(2, 3);
>  
>  #endif


