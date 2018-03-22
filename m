Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eyvXV-0003zF-I9
	for mharc-qemu-trivial@gnu.org; Thu, 22 Mar 2018 04:25:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45322)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eyvXT-0003xk-Av
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2018 04:25:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eyvXQ-0003b8-M6
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2018 04:25:35 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:33085)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eyvXQ-0003ai-GQ; Thu, 22 Mar 2018 04:25:32 -0400
Received: by mail-qt0-x244.google.com with SMTP id i8so8065582qtj.0;
	Thu, 22 Mar 2018 01:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=V3wL9dZn7aYFpOV7S/Z7xRm+BjoSe/IG37Q9B3OgyjM=;
	b=PApknRn0Va7OEXNOFLS5YwzvP4pV6e4DkeTWo2FuhudbPE1+zTS1SWhCQ9nFjUJxoz
	cC0rvUeiHJFiGmFB7H7Ilod877KCy0sifbHMUJqBIWoij7tYOX+cSv28rM4iwLZxdu2B
	STwNP3Hp2qwVu3l/GU2MBphg0/diHr1Mj0x1bHRG2Va9nky0PR2HwtwZd/0kxEVKFUDJ
	kV4rksT08vbSeWFPm6osyn9JM56TSRZQAy3o4TFgWqPfAZmF1jxhgJtpy8fJaelzRRv2
	cCC/N1AO35rxqPRMvzdZh6UyOGllfHzsLdvwqc8YRK2VDG1ffDFi5CYX2kNHLxOASZ7h
	hYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=V3wL9dZn7aYFpOV7S/Z7xRm+BjoSe/IG37Q9B3OgyjM=;
	b=XMj6tn0MsCyJpAFSUfKS1Mu8x/c6Jod3SfL70Tlr47HG5t2M35Cl2hj+/VnHiATYJ4
	0K8kxlRmIw/bW7+6gMbTivElFouJkNlmGIErMLjZJMJIOEV6XDIb571KMOeVIifi9az2
	txh34Rr9xXw25POpfRsqUtPcTKNgoKiKN8C0JulQ+0NVohWXRsc/OEY+JIZz9MADnJFz
	OILbVYS/E35lOtjLEC06iWY8jdTiISPeQx8l0sF41hOarmF8mCF7zX1tbvbGRgdH42Bk
	W0236L1U62lCt06HHGJZ+110HrQhv0bYfhM4998i6bYX5J2eLfcsLCcggWXU6IPSidak
	qxsQ==
X-Gm-Message-State: AElRT7FDtowhMKXaKRmT/Z3PZWUGAL0A1hz0fBQZqt2RtETe0A4weh7g
	qyII9wDwyOMgjrQsAaeVp2nt10Vj
X-Google-Smtp-Source: AG47ELvK9QEivFaks1P/0IaowwtBNGm7VlguNNUOBSf9vj0pJVPpZrJ14uwlkoN+7su5KWCeUbNDJA==
X-Received: by 10.237.62.130 with SMTP id n2mr34908720qtf.81.1521707131846;
	Thu, 22 Mar 2018 01:25:31 -0700 (PDT)
Received: from [10.66.0.177] (host157.181-15-149.telecom.net.ar.
	[181.15.149.157]) by smtp.gmail.com with ESMTPSA id
	n58sm4417128qta.34.2018.03.22.01.25.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Mar 2018 01:25:31 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Yuval Shaia <yuval.shaia@oracle.com>, marcel@redhat.com,
	eblake@redhat.com, qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20180321211056.3339-1-yuval.shaia@oracle.com>
	<20180321211056.3339-2-yuval.shaia@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <1679c87d-9378-03d7-6292-5d17818bab32@amsat.org>
Date: Thu, 22 Mar 2018 05:25:26 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180321211056.3339-2-yuval.shaia@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-trivial] [PATCH 1/3] hw/rdma: Change host_virt to void *
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
X-List-Received-Date: Thu, 22 Mar 2018 08:25:36 -0000

On 03/21/2018 06:10 PM, Yuval Shaia wrote:
> To avoid compilation warnings on 32-bit machines:
> rdma_backend.c: In function 'rdma_backend_create_mr':
> rdma_backend.c:409:37: error: cast to pointer from integer of different
> size [-Werror=int-to-pointer-cast]
> 	mr->ibmr = ibv_reg_mr(pd->ibpd, (void *)addr, length, access);
> 
> Reported-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Yuval Shaia <yuval.shaia@oracle.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/rdma/rdma_backend.c |  8 ++++----
>  hw/rdma/rdma_backend.h |  2 +-
>  hw/rdma/rdma_rm.c      | 10 +++++-----
>  hw/rdma/rdma_rm_defs.h |  2 +-
>  4 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/rdma/rdma_backend.c b/hw/rdma/rdma_backend.c
> index e306fba534..f1a37ba4a2 100644
> --- a/hw/rdma/rdma_backend.c
> +++ b/hw/rdma/rdma_backend.c
> @@ -222,7 +222,7 @@ static int build_host_sge_array(RdmaDeviceResources *rdma_dev_res,
>              return VENDOR_ERR_INVLKEY | ssge[ssge_idx].lkey;
>          }
>  
> -        dsge->addr = mr->user_mr.host_virt + ssge[ssge_idx].addr -
> +        dsge->addr = (uintptr_t)mr->user_mr.host_virt + ssge[ssge_idx].addr -
>                       mr->user_mr.guest_start;
>          dsge->length = ssge[ssge_idx].length;
>          dsge->lkey = rdma_backend_mr_lkey(&mr->backend_mr);
> @@ -401,12 +401,12 @@ void rdma_backend_destroy_pd(RdmaBackendPD *pd)
>      }
>  }
>  
> -int rdma_backend_create_mr(RdmaBackendMR *mr, RdmaBackendPD *pd, uint64_t addr,
> +int rdma_backend_create_mr(RdmaBackendMR *mr, RdmaBackendPD *pd, void *addr,
>                             size_t length, int access)
>  {
> -    pr_dbg("addr=0x%lx\n", addr);
> +    pr_dbg("addr=0x%p\n", addr);
>      pr_dbg("len=%ld\n", length);
> -    mr->ibmr = ibv_reg_mr(pd->ibpd, (void *)addr, length, access);
> +    mr->ibmr = ibv_reg_mr(pd->ibpd, addr, length, access);
>      if (mr->ibmr) {
>          pr_dbg("lkey=0x%x\n", mr->ibmr->lkey);
>          pr_dbg("rkey=0x%x\n", mr->ibmr->rkey);
> diff --git a/hw/rdma/rdma_backend.h b/hw/rdma/rdma_backend.h
> index 68f2b05ca7..07f6fed768 100644
> --- a/hw/rdma/rdma_backend.h
> +++ b/hw/rdma/rdma_backend.h
> @@ -61,7 +61,7 @@ int rdma_backend_query_port(RdmaBackendDev *backend_dev,
>  int rdma_backend_create_pd(RdmaBackendDev *backend_dev, RdmaBackendPD *pd);
>  void rdma_backend_destroy_pd(RdmaBackendPD *pd);
>  
> -int rdma_backend_create_mr(RdmaBackendMR *mr, RdmaBackendPD *pd, uint64_t addr,
> +int rdma_backend_create_mr(RdmaBackendMR *mr, RdmaBackendPD *pd, void *addr,
>                             size_t length, int access);
>  void rdma_backend_destroy_mr(RdmaBackendMR *mr);
>  
> diff --git a/hw/rdma/rdma_rm.c b/hw/rdma/rdma_rm.c
> index b5fc45ddab..296e40518e 100644
> --- a/hw/rdma/rdma_rm.c
> +++ b/hw/rdma/rdma_rm.c
> @@ -146,7 +146,7 @@ int rdma_rm_alloc_mr(RdmaDeviceResources *dev_res, uint32_t pd_handle,
>      RdmaRmMR *mr;
>      int ret = 0;
>      RdmaRmPD *pd;
> -    uint64_t addr;
> +    void *addr;
>      size_t length;
>  
>      pd = rdma_rm_get_pd(dev_res, pd_handle);
> @@ -165,10 +165,10 @@ int rdma_rm_alloc_mr(RdmaDeviceResources *dev_res, uint32_t pd_handle,
>          /* TODO: This is my guess but not so sure that this needs to be
>           * done */
>          length = TARGET_PAGE_SIZE;
> -        addr = (uint64_t)g_malloc(length);
> +        addr = g_malloc(length);
>      } else {
> -        mr->user_mr.host_virt = (uint64_t) host_virt;
> -        pr_dbg("host_virt=0x%lx\n", mr->user_mr.host_virt);
> +        mr->user_mr.host_virt = host_virt;
> +        pr_dbg("host_virt=0x%p\n", mr->user_mr.host_virt);
>          mr->user_mr.length = guest_length;
>          pr_dbg("length=0x%lx\n", guest_length);
>          mr->user_mr.guest_start = guest_start;
> @@ -216,7 +216,7 @@ void rdma_rm_dealloc_mr(RdmaDeviceResources *dev_res, uint32_t mr_handle)
>  
>      if (mr) {
>          rdma_backend_destroy_mr(&mr->backend_mr);
> -        munmap((void *)mr->user_mr.host_virt, mr->user_mr.length);
> +        munmap(mr->user_mr.host_virt, mr->user_mr.length);
>          res_tbl_dealloc(&dev_res->mr_tbl, mr_handle);
>      }
>  }
> diff --git a/hw/rdma/rdma_rm_defs.h b/hw/rdma/rdma_rm_defs.h
> index 6522dca68f..fc646da61f 100644
> --- a/hw/rdma/rdma_rm_defs.h
> +++ b/hw/rdma/rdma_rm_defs.h
> @@ -56,7 +56,7 @@ typedef struct RdmaRmCQ {
>  } RdmaRmCQ;
>  
>  typedef struct RdmaRmUserMR {
> -    uint64_t host_virt;
> +    void *host_virt;
>      uint64_t guest_start;
>      size_t length;
>  } RdmaRmUserMR;
> 

