Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WN8DI-0004AR-UL
	for mharc-qemu-trivial@gnu.org; Mon, 10 Mar 2014 17:58:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36046)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1WN8DD-00043d-AE
	for qemu-trivial@nongnu.org; Mon, 10 Mar 2014 17:58:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1WN8D8-0005mK-Il
	for qemu-trivial@nongnu.org; Mon, 10 Mar 2014 17:58:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:3035)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1WN8Cy-0005jk-Rd; Mon, 10 Mar 2014 17:58:05 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2ALw2V0018074
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 10 Mar 2014 17:58:02 -0400
Received: from redhat.com (vpn1-5-84.ams2.redhat.com [10.36.5.84])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with SMTP
	id s2ALw0KL008368; Mon, 10 Mar 2014 17:58:00 -0400
Date: Mon, 10 Mar 2014 23:58:04 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20140310215804.GD7104@redhat.com>
References: <1394478649-9453-1-git-send-email-peter.maydell@linaro.org>
	<1394478649-9453-4-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1394478649-9453-4-git-send-email-peter.maydell@linaro.org>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
	patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH 03/12] hw/pci/pci_host.c: Avoid shifting
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
X-List-Received-Date: Mon, 10 Mar 2014 21:58:24 -0000

On Mon, Mar 10, 2014 at 07:10:39PM +0000, Peter Maydell wrote:
> Add U suffix to avoid undefined behaviour.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  hw/pci/pci_host.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/pci/pci_host.c b/hw/pci/pci_host.c
> index 77c7d1f..2c17916 100644
> --- a/hw/pci/pci_host.c
> +++ b/hw/pci/pci_host.c
> @@ -142,8 +142,9 @@ static uint64_t pci_host_data_read(void *opaque,
>  {
>      PCIHostState *s = opaque;
>      uint32_t val;
> -    if (!(s->config_reg & (1 << 31)))
> +    if (!(s->config_reg & (1u << 31))) {
>          return 0xffffffff;
> +    }
>      val = pci_data_read(s->bus, s->config_reg | (addr & 3), len);
>      PCI_DPRINTF("read addr " TARGET_FMT_plx " len %d val %x\n",
>                  addr, len, val);
> -- 
> 1.9.0
> 

