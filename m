Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WClmr-00035X-Jo
	for mharc-qemu-trivial@gnu.org; Mon, 10 Feb 2014 03:00:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52391)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1WClmk-0002wR-K4
	for qemu-trivial@nongnu.org; Mon, 10 Feb 2014 03:00:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1WClmf-0006yy-IJ
	for qemu-trivial@nongnu.org; Mon, 10 Feb 2014 03:00:10 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40873)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1WClmV-0006f4-Ho; Mon, 10 Feb 2014 02:59:55 -0500
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s1A7xri1010573
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 10 Feb 2014 02:59:53 -0500
Received: from nial.usersys.redhat.com (dhcp-1-126.brq.redhat.com
	[10.34.1.126])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s1A7xqd3025147; Mon, 10 Feb 2014 02:59:52 -0500
Date: Mon, 10 Feb 2014 08:59:51 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Gabriel L. Somlo" <gsomlo@gmail.com>
Message-ID: <20140210085951.59b3bd83@nial.usersys.redhat.com>
In-Reply-To: <20140207153039.GZ29329@ERROL.INI.CMU.EDU>
References: <20140207153039.GZ29329@ERROL.INI.CMU.EDU>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ACPI: Remove commented-out
 code from HPET._CRS
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
X-List-Received-Date: Mon, 10 Feb 2014 08:00:15 -0000

On Fri, 7 Feb 2014 10:30:40 -0500
"Gabriel L. Somlo" <gsomlo@gmail.com> wrote:

> IRQNoFlags on HPET._CRS crashes WinXP because it causes the HPET
> to conflict with the system timer and/or the RTC. It only occurs
> on Apple hardware, and even there it is exposed fully only when
> OS X is detected (via _OSI). Recent OS X versions work on QEMU
> without this statement, so at this time there is no need to find
> a better way to conditionally include the statement. This patch
> removes the commented out (and wrong, should have been {0, 8})
> statement from HPET._CRS.
> 
> Signed-off-by: Gabriel Somlo <somlo@cmu.edu>
> ---
>  hw/i386/acpi-dsdt-hpet.dsl | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/hw/i386/acpi-dsdt-hpet.dsl b/hw/i386/acpi-dsdt-hpet.dsl
> index dfde174..44961b8 100644
> --- a/hw/i386/acpi-dsdt-hpet.dsl
> +++ b/hw/i386/acpi-dsdt-hpet.dsl
> @@ -39,9 +39,6 @@ Scope(\_SB) {
>              Return (0x0F)
>          }
>          Name(_CRS, ResourceTemplate() {
> -#if 0       /* This makes WinXP BSOD for not yet figured reasons. */
> -            IRQNoFlags() {2, 8}
> -#endif
>              Memory32Fixed(ReadOnly,
>                  0xFED00000,         // Address Base
>                  0x00000400,         // Address Length

Reviewed-By: Igor Mammedov <imammedo@redhat.com>

