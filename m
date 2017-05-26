Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dEBcm-0001Td-AI
	for mharc-qemu-trivial@gnu.org; Fri, 26 May 2017 05:33:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47915)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dEBcj-0001S6-Vd
	for qemu-trivial@nongnu.org; Fri, 26 May 2017 05:33:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dEBcj-0000ru-8U
	for qemu-trivial@nongnu.org; Fri, 26 May 2017 05:33:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34410)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1dEBce-0000qf-3U; Fri, 26 May 2017 05:33:28 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 99999C056782;
	Fri, 26 May 2017 09:33:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 99999C056782
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=pbonzini@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 99999C056782
Received: from [10.36.117.65] (ovpn-117-65.ams2.redhat.com [10.36.117.65])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v4Q9XNan002868
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 26 May 2017 05:33:25 -0400
To: Mao Zhongyi <maozy.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org
Cc: armbru@redhat.com, "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
References: <20170526014614.19840-1-maozy.fnst@cn.fujitsu.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <62e6e879-04d5-5549-e2e6-a3e45735b449@redhat.com>
Date: Fri, 26 May 2017 11:33:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <20170526014614.19840-1-maozy.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 26 May 2017 09:33:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] scsi/lsi53c895a: Remove unused
 lsi_mem_*() return value
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
X-List-Received-Date: Fri, 26 May 2017 09:33:35 -0000



On 26/05/2017 03:46, Mao Zhongyi wrote:
> lsi_mem_read/write() always return 0 about which their
> callers actually don't care. Change the function type
> to void.
> 
> Signed-off-by: Mao Zhongyi <maozy.fnst@cn.fujitsu.com>
> ---
>  hw/scsi/lsi53c895a.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
> index 595c260..3e56ab2 100644
> --- a/hw/scsi/lsi53c895a.c
> +++ b/hw/scsi/lsi53c895a.c
> @@ -408,27 +408,25 @@ static void lsi_reg_writeb(LSIState *s, int offset, uint8_t val);
>  static void lsi_execute_script(LSIState *s);
>  static void lsi_reselect(LSIState *s, lsi_request *p);
>  
> -static inline int lsi_mem_read(LSIState *s, dma_addr_t addr,
> +static inline void lsi_mem_read(LSIState *s, dma_addr_t addr,
>                                 void *buf, dma_addr_t len)
>  {
>      if (s->dmode & LSI_DMODE_SIOM) {
>          address_space_read(&s->pci_io_as, addr, MEMTXATTRS_UNSPECIFIED,
>                             buf, len);
> -        return 0;
>      } else {
> -        return pci_dma_read(PCI_DEVICE(s), addr, buf, len);
> +        pci_dma_read(PCI_DEVICE(s), addr, buf, len);
>      }
>  }
>  
> -static inline int lsi_mem_write(LSIState *s, dma_addr_t addr,
> +static inline void lsi_mem_write(LSIState *s, dma_addr_t addr,
>                                  const void *buf, dma_addr_t len)
>  {
>      if (s->dmode & LSI_DMODE_DIOM) {
>          address_space_write(&s->pci_io_as, addr, MEMTXATTRS_UNSPECIFIED,
>                              buf, len);
> -        return 0;
>      } else {
> -        return pci_dma_write(PCI_DEVICE(s), addr, buf, len);
> +        pci_dma_write(PCI_DEVICE(s), addr, buf, len);
>      }
>  }
>  
> 

Cc: qemu-trivial@nongnu.org

