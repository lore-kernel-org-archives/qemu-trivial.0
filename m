Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WN8Bo-0001vO-HV
	for mharc-qemu-trivial@gnu.org; Mon, 10 Mar 2014 17:56:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35707)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1WN8Bg-0001mK-U9
	for qemu-trivial@nongnu.org; Mon, 10 Mar 2014 17:56:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1WN8Bb-0005Xb-UG
	for qemu-trivial@nongnu.org; Mon, 10 Mar 2014 17:56:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40480)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1WN8BS-0005VZ-4a; Mon, 10 Mar 2014 17:56:30 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2ALuRev018802
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 10 Mar 2014 17:56:27 -0400
Received: from redhat.com (vpn1-5-84.ams2.redhat.com [10.36.5.84])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with SMTP
	id s2ALuOqB007868; Mon, 10 Mar 2014 17:56:25 -0400
Date: Mon, 10 Mar 2014 23:56:29 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20140310215629.GA7104@redhat.com>
References: <1394478649-9453-1-git-send-email-peter.maydell@linaro.org>
	<1394478649-9453-5-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1394478649-9453-5-git-send-email-peter.maydell@linaro.org>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
	patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH 04/12] hw/i386/acpi_build.c: Avoid
 shifting left into sign bit
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
X-List-Received-Date: Mon, 10 Mar 2014 21:56:49 -0000

On Mon, Mar 10, 2014 at 07:10:40PM +0000, Peter Maydell wrote:
> Add U suffix to avoid undefined behaviour.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  hw/i386/acpi-build.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index b1a7ebb..46d4e60 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -813,7 +813,7 @@ static void build_pci_bus_end(PCIBus *bus, void *bus_state)
>  
>              build_append_byte(notify, 0x7B); /* AndOp */
>              build_append_byte(notify, 0x68); /* Arg0Op */
> -            build_append_int(notify, 0x1 << i);
> +            build_append_int(notify, 0x1U << i);
>              build_append_byte(notify, 0x00); /* NullName */
>              build_append_byte(notify, 0x86); /* NotifyOp */
>              build_append_nameseg(notify, "S%.02X_", PCI_DEVFN(i, 0));
> -- 
> 1.9.0
> 

