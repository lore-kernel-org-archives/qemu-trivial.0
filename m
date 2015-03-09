Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YV3H9-00013D-AV
	for mharc-qemu-trivial@gnu.org; Mon, 09 Mar 2015 15:23:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59029)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YV3H7-00010b-4s
	for qemu-trivial@nongnu.org; Mon, 09 Mar 2015 15:23:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YV3H6-0001jN-17
	for qemu-trivial@nongnu.org; Mon, 09 Mar 2015 15:23:37 -0400
Received: from mail-we0-x235.google.com ([2a00:1450:400c:c03::235]:41238)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1YV3Gz-0001hc-5x; Mon, 09 Mar 2015 15:23:29 -0400
Received: by wesw62 with SMTP id w62so7313806wes.8;
	Mon, 09 Mar 2015 12:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=o5udA1XKgVKPZEa1mPfT5Ai6nWwnO2KCN4vhHI78jV4=;
	b=e3uYGku6uYdX3NUlHi7AU7d+UH86eaLiPu9uGHvzHR9x32+XkCQw95R6Z7LtRHO6z0
	fp5UWbEVmCAySfDj9oPQh2Rih53LbXZRN95QJLeALfrhN3jGS/kCEeUpk8Xu1CgICLUB
	Vp71zkyT1IeiA/0Me6Qc4dMojTP3UEcOLlyf9E8KZFpmoFZXADbGcPtUGiPCYvPilfHL
	50qc/G6WFIeWPq/klCVstLG1uqngPdXTI4HAp4ewiVcQTIiIFKHvqxHo6gEROpk28vXU
	h8jyoE6zYIYyjiS+PiAuO0kA0JXT1xQF4kbIwGBixbsYLD2UWQ/LttxhTCE38jtKBUoZ
	vRBg==
X-Received: by 10.180.87.106 with SMTP id w10mr104959324wiz.62.1425929008615; 
	Mon, 09 Mar 2015 12:23:28 -0700 (PDT)
Received: from [192.168.10.165] (net-188-216-23-124.cust.vodafonedsl.it.
	[188.216.23.124]) by mx.google.com with ESMTPSA id
	v13sm11723244wij.10.2015.03.09.12.23.26
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Mar 2015 12:23:27 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <54FDF32C.5060305@redhat.com>
Date: Mon, 09 Mar 2015 20:23:24 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Thomas Huth <thuth@linux.vnet.ibm.com>, qemu-trivial@nongnu.org
References: <1425922215-20819-1-git-send-email-thuth@linux.vnet.ibm.com>
	<1425922215-20819-6-git-send-email-thuth@linux.vnet.ibm.com>
In-Reply-To: <1425922215-20819-6-git-send-email-thuth@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c03::235
Cc: qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 5/8] ioport: Remove unused functions
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
X-List-Received-Date: Mon, 09 Mar 2015 19:23:38 -0000



On 09/03/2015 18:30, Thomas Huth wrote:
> The functions portio_list_destroy() and portio_list_del()
> are not used anywhere, so let's remove them.
> 
> Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>

I think it's better to provide a complete API, mimicking memory_region_*
as much as possible, so I'd rather keep these.

Paolo

> ---
>  include/exec/ioport.h |    2 --
>  ioport.c              |   24 ------------------------
>  2 files changed, 0 insertions(+), 26 deletions(-)
> 
> diff --git a/include/exec/ioport.h b/include/exec/ioport.h
> index 3bd6722..218c835 100644
> --- a/include/exec/ioport.h
> +++ b/include/exec/ioport.h
> @@ -71,10 +71,8 @@ void portio_list_init(PortioList *piolist, Object *owner,
>                        const struct MemoryRegionPortio *callbacks,
>                        void *opaque, const char *name);
>  void portio_list_set_flush_coalesced(PortioList *piolist);
> -void portio_list_destroy(PortioList *piolist);
>  void portio_list_add(PortioList *piolist,
>                       struct MemoryRegion *address_space,
>                       uint32_t addr);
> -void portio_list_del(PortioList *piolist);
>  
>  #endif /* IOPORT_H */
> diff --git a/ioport.c b/ioport.c
> index 783a3ae..712b9e2 100644
> --- a/ioport.c
> +++ b/ioport.c
> @@ -147,19 +147,6 @@ void portio_list_set_flush_coalesced(PortioList *piolist)
>      piolist->flush_coalesced_mmio = true;
>  }
>  
> -void portio_list_destroy(PortioList *piolist)
> -{
> -    MemoryRegionPortioList *mrpio;
> -    unsigned i;
> -
> -    for (i = 0; i < piolist->nr; ++i) {
> -        mrpio = container_of(piolist->regions[i], MemoryRegionPortioList, mr);
> -        object_unparent(OBJECT(&mrpio->mr));
> -        g_free(mrpio);
> -    }
> -    g_free(piolist->regions);
> -}
> -
>  static const MemoryRegionPortio *find_portio(MemoryRegionPortioList *mrpio,
>                                               uint64_t offset, unsigned size,
>                                               bool write)
> @@ -290,14 +277,3 @@ void portio_list_add(PortioList *piolist,
>      /* There will always be an open sub-list.  */
>      portio_list_add_1(piolist, pio_start, count, start, off_low, off_high);
>  }
> -
> -void portio_list_del(PortioList *piolist)
> -{
> -    MemoryRegionPortioList *mrpio;
> -    unsigned i;
> -
> -    for (i = 0; i < piolist->nr; ++i) {
> -        mrpio = container_of(piolist->regions[i], MemoryRegionPortioList, mr);
> -        memory_region_del_subregion(piolist->address_space, &mrpio->mr);
> -    }
> -}
> 

