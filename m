Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WN8EP-0005ac-Qv
	for mharc-qemu-trivial@gnu.org; Mon, 10 Mar 2014 17:59:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36389)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1WN8EI-0005QL-NP
	for qemu-trivial@nongnu.org; Mon, 10 Mar 2014 17:59:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1WN8ED-0006Vu-WD
	for qemu-trivial@nongnu.org; Mon, 10 Mar 2014 17:59:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:16480)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1WN8E3-0006PR-VH; Mon, 10 Mar 2014 17:59:12 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2ALx8o9025481
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 10 Mar 2014 17:59:09 -0400
Received: from redhat.com (vpn1-5-84.ams2.redhat.com [10.36.5.84])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with SMTP
	id s2ALx5Tm008953; Mon, 10 Mar 2014 17:59:06 -0400
Date: Mon, 10 Mar 2014 23:59:10 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20140310215910.GE7104@redhat.com>
References: <1394478649-9453-1-git-send-email-peter.maydell@linaro.org>
	<1394478649-9453-13-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1394478649-9453-13-git-send-email-peter.maydell@linaro.org>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
	patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH 12/12] hw/pci-host/apb.c: Avoid shifting
 left into sign bit
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
X-List-Received-Date: Mon, 10 Mar 2014 21:59:32 -0000

On Mon, Mar 10, 2014 at 07:10:48PM +0000, Peter Maydell wrote:
> Add U suffix to avoid undefined behaviour.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

While not required for correctness, it would be cleaner
to change all constants around this line to 1U <<, for consistency.

> ---
>  hw/pci-host/apb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/pci-host/apb.c b/hw/pci-host/apb.c
> index 1b399dd..a6869b8 100644
> --- a/hw/pci-host/apb.c
> +++ b/hw/pci-host/apb.c
> @@ -58,7 +58,7 @@ do { printf("APB: " fmt , ## __VA_ARGS__); } while (0)
>  #define PBM_PCI_IMR_MASK    0x7fffffff
>  #define PBM_PCI_IMR_ENABLED 0x80000000
>  
> -#define POR          (1 << 31)
> +#define POR          (1U << 31)
>  #define SOFT_POR     (1 << 30)
>  #define SOFT_XIR     (1 << 29)
>  #define BTN_POR      (1 << 28)
> -- 
> 1.9.0
> 

