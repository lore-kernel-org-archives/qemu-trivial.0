Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eyvdh-0007Yj-Sd
	for mharc-qemu-trivial@gnu.org; Thu, 22 Mar 2018 04:32:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46847)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eyvde-0007YK-3u
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2018 04:32:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eyvdZ-0007tm-TL
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2018 04:31:58 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:41495)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eyvdZ-0007tb-Nb; Thu, 22 Mar 2018 04:31:53 -0400
Received: by mail-qt0-x241.google.com with SMTP id j4so8076068qth.8;
	Thu, 22 Mar 2018 01:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=CDRmU3Fr1mTSMqAvcoyxdHogUaYk6CjavaNsH8IOmzs=;
	b=gjNsChFC/HWwTFs+qKb7H3QfGZgabfkrO67BDBV/H3gY0bEcYinB8ivQ7wVlczmZJF
	KZwUn7p1IEVrFpsfv6NcSOwMGS9TpEaM1DW2ow7rZKjXC2YDNww6TNU4Jxjg17gPdI5b
	LPPlWCOL4wEWZNus6EW7xOT7f421J3TFUO1m41HSas7hFwW3N4UI9wisMBIk5GO3ERQq
	KL4x++lkLRLsO1/i/7wvx3FkuJNsede5s2RXoavUSV7gKjtrMEUx9ujR3yydxdjvYQvj
	sWEJ2jx+R98aBE8hcFp6cdCVUQimN+brSQUqM9bDYDYy5E+YjZbnUntuUuvhxtAFN3WR
	OYaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=CDRmU3Fr1mTSMqAvcoyxdHogUaYk6CjavaNsH8IOmzs=;
	b=o1IDLyyzDUjBLpbXUJcGqDghd/bR2+RWXtKOZpdqgvYj5+iDN+IHLfV/zFEe0bEQ9M
	LnxxYIOGQledWeTR7umHqH5hOdzonc72JcxIpnV9lFZzM242xfkcAis55qtTD1bC5/1y
	MnTKqVFdLD6C+/DpkIKYoSisgjkVF2gBSn9cl7AdN6F+ke4KrAAjwr7edKke2BUKL9dv
	hHRoj91Fd8Blf5HLJqUCHG77m8qf+4xiIMzon8J6a4lOpn2x6v8rUM6QtpiS0k4HDNI1
	DP3Bxow6l50UddvVU00qtNM5t2+OTlSsjpnVqqjs23VaLr25/APxlHDLLm6cfIyttsz2
	G/Lw==
X-Gm-Message-State: AElRT7Hiz2lMYT8YL6F1Ey7CTyNsBUErLiW5ySMj4E6nm69AKk9XZ70V
	1PDir8VBFm7iaz/n+RtYW/+3x+/S
X-Google-Smtp-Source: AG47ELsg7sFtI0aATsKdONSh8Lptcz4wellWdpWlxxajIDhIpGYoF8evYIk6kY8RT4Xlkk8U7IXeeA==
X-Received: by 10.200.15.107 with SMTP id l40mr34897054qtk.45.1521707512858;
	Thu, 22 Mar 2018 01:31:52 -0700 (PDT)
Received: from [10.66.0.177] (host157.181-15-149.telecom.net.ar.
	[181.15.149.157]) by smtp.gmail.com with ESMTPSA id
	t48sm4420490qtc.37.2018.03.22.01.31.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Mar 2018 01:31:52 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Yuval Shaia <yuval.shaia@oracle.com>, marcel@redhat.com,
	eblake@redhat.com, qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20180321211056.3339-1-yuval.shaia@oracle.com>
	<20180321211056.3339-4-yuval.shaia@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <5b55758d-124b-b569-8000-421cc2e880f7@amsat.org>
Date: Thu, 22 Mar 2018 05:31:48 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180321211056.3339-4-yuval.shaia@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-trivial] [PATCH 3/3] hw/rdma: Fix 32-bit compilation
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
X-List-Received-Date: Thu, 22 Mar 2018 08:32:00 -0000

Hi Yuval,

On 03/21/2018 06:10 PM, Yuval Shaia wrote:
> Use the correct printf formats, so that a 32-bit compile doesn't spit
> out lots of warnings about %lx being incompatible with uint64_t.
> 
> Suggested-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Yuval Shaia <yuval.shaia@oracle.com>
> ---
>  hw/rdma/rdma_backend.c        | 21 +++++++++++----------
>  hw/rdma/rdma_rm.c             |  4 ++--
>  hw/rdma/rdma_utils.c          |  6 +++---
>  hw/rdma/vmw/pvrdma_cmd.c      |  8 ++++----
>  hw/rdma/vmw/pvrdma_dev_ring.c |  6 +++---
>  hw/rdma/vmw/pvrdma_dev_ring.h |  2 +-
>  hw/rdma/vmw/pvrdma_main.c     | 25 +++++++++++++------------
>  hw/rdma/vmw/pvrdma_qp_ops.c   |  6 +++---
>  8 files changed, 40 insertions(+), 38 deletions(-)
> 
> diff --git a/hw/rdma/rdma_backend.c b/hw/rdma/rdma_backend.c
> index 0391a7dd95..9e427306b3 100644
> --- a/hw/rdma/rdma_backend.c
> +++ b/hw/rdma/rdma_backend.c
> @@ -62,12 +62,13 @@ static void poll_cq(RdmaDeviceResources *rdma_dev_res, struct ibv_cq *ibcq)
>          pr_dbg("Got %d completion(s) from cq %p\n", ne, ibcq);
>  
>          for (i = 0; i < ne; i++) {
> -            pr_dbg("wr_id=0x%lx\n", wc[i].wr_id);
> +            pr_dbg("wr_id=0x%" PRIx64 "\n", wc[i].wr_id);
>              pr_dbg("status=%d\n", wc[i].status);
>  
>              bctx = rdma_rm_get_cqe_ctx(rdma_dev_res, wc[i].wr_id);
>              if (unlikely(!bctx)) {
> -                pr_dbg("Error: Failed to find ctx for req %ld\n", wc[i].wr_id);
> +                pr_dbg("Error: Failed to find ctx for req %" PRId64 "\n",
> +                       wc[i].wr_id);
>                  continue;
>              }
>              pr_dbg("Processing %s CQE\n", bctx->is_tx_req ? "send" : "recv");
> @@ -176,7 +177,7 @@ static struct ibv_ah *create_ah(RdmaBackendDev *backend_dev, struct ibv_pd *pd,
>              g_hash_table_insert(ah_hash, ah_key, ah);
>          } else {
>              g_bytes_unref(ah_key);
> -            pr_dbg("ibv_create_ah failed for gid <%lx %lx>\n",
> +            pr_dbg("ibv_create_ah failed for gid <0x%" PRIx64 ", 0x%" PRIx64 ">\n",
>                      be64_to_cpu(dgid->global.subnet_prefix),
>                      be64_to_cpu(dgid->global.interface_id));
>          }
> @@ -227,8 +228,8 @@ static int build_host_sge_array(RdmaDeviceResources *rdma_dev_res,
>          dsge->length = ssge[ssge_idx].length;
>          dsge->lkey = rdma_backend_mr_lkey(&mr->backend_mr);
>  
> -        pr_dbg("ssge->addr=0x%lx\n", (uint64_t)ssge[ssge_idx].addr);
> -        pr_dbg("dsge->addr=0x%lx\n", dsge->addr);
> +        pr_dbg("ssge->addr=0x%" PRIx64 "\n", ssge[ssge_idx].addr);
> +        pr_dbg("dsge->addr=0x%" PRIx64 "\n", dsge->addr);
>          pr_dbg("dsge->length=%d\n", dsge->length);
>          pr_dbg("dsge->lkey=0x%x\n", dsge->lkey);
>  
> @@ -405,7 +406,7 @@ int rdma_backend_create_mr(RdmaBackendMR *mr, RdmaBackendPD *pd, void *addr,
>                             size_t length, int access)
>  {
>      pr_dbg("addr=0x%p\n", addr);
> -    pr_dbg("len=%ld\n", length);
> +    pr_dbg("len=%zd\n", length);

%zd is for ssize_t, size_t format is %zu.

>      mr->ibmr = ibv_reg_mr(pd->ibpd, addr, length, access);
>      if (mr->ibmr) {
>          pr_dbg("lkey=0x%x\n", mr->ibmr->lkey);
> @@ -562,7 +563,7 @@ int rdma_backend_qp_state_rtr(RdmaBackendDev *backend_dev, RdmaBackendQP *qp,
>  
>      switch (qp_type) {
>      case IBV_QPT_RC:
> -        pr_dbg("dgid=0x%lx,%lx\n",
> +        pr_dbg("dgid=0x%" PRIx64 ",%" PRIx64 "\n",
>                 be64_to_cpu(ibv_gid.global.subnet_prefix),
>                 be64_to_cpu(ibv_gid.global.interface_id));
>          pr_dbg("dqpn=0x%x\n", dqpn);
> @@ -669,7 +670,7 @@ static int init_device_caps(RdmaBackendDev *backend_dev,
>          return -EIO;
>      }
>  
> -    CHK_ATTR(dev_attr, backend_dev->dev_attr, max_mr_size, "%ld");
> +    CHK_ATTR(dev_attr, backend_dev->dev_attr, max_mr_size, "%" PRId64 );
>      CHK_ATTR(dev_attr, backend_dev->dev_attr, max_qp, "%d");
>      CHK_ATTR(dev_attr, backend_dev->dev_attr, max_sge, "%d");
>      CHK_ATTR(dev_attr, backend_dev->dev_attr, max_qp_wr, "%d");
> @@ -782,9 +783,9 @@ int rdma_backend_init(RdmaBackendDev *backend_dev,
>          ret = -EIO;
>          goto out_destroy_comm_channel;
>      }
> -    pr_dbg("subnet_prefix=0x%lx\n",
> +    pr_dbg("subnet_prefix=0x%" PRIx64 "\n",
>             be64_to_cpu(backend_dev->gid.global.subnet_prefix));
> -    pr_dbg("interface_id=0x%lx\n",
> +    pr_dbg("interface_id=0x%" PRIx64 "\n",
>             be64_to_cpu(backend_dev->gid.global.interface_id));
>  
>      snprintf(thread_name, sizeof(thread_name), "rdma_comp_%s",
> diff --git a/hw/rdma/rdma_rm.c b/hw/rdma/rdma_rm.c
> index 296e40518e..8da510c0d2 100644
> --- a/hw/rdma/rdma_rm.c
> +++ b/hw/rdma/rdma_rm.c
> @@ -170,9 +170,9 @@ int rdma_rm_alloc_mr(RdmaDeviceResources *dev_res, uint32_t pd_handle,
>          mr->user_mr.host_virt = host_virt;
>          pr_dbg("host_virt=0x%p\n", mr->user_mr.host_virt);
>          mr->user_mr.length = guest_length;
> -        pr_dbg("length=0x%lx\n", guest_length);
> +        pr_dbg("length=%zd\n", guest_length);

%zu

>          mr->user_mr.guest_start = guest_start;
> -        pr_dbg("guest_start=0x%lx\n", mr->user_mr.guest_start);
> +        pr_dbg("guest_start=0x%" PRIx64 "\n", mr->user_mr.guest_start);
>  
>          length = mr->user_mr.length;
>          addr = mr->user_mr.host_virt;
> diff --git a/hw/rdma/rdma_utils.c b/hw/rdma/rdma_utils.c
> index 0e5caffd40..d713f635f1 100644
> --- a/hw/rdma/rdma_utils.c
> +++ b/hw/rdma/rdma_utils.c
> @@ -27,8 +27,8 @@ void *rdma_pci_dma_map(PCIDevice *dev, dma_addr_t addr, dma_addr_t plen)
>  
>      p = pci_dma_map(dev, addr, &len, DMA_DIRECTION_TO_DEVICE);
>      if (!p) {
> -        pr_dbg("Fail in pci_dma_map, addr=0x%llx, len=%ld\n",
> -               (long long unsigned int)addr, len);
> +        pr_dbg("Fail in pci_dma_map, addr=0x%" PRIx64 ", len=%" PRId64 "\n",
> +               addr, len);
>          return NULL;
>      }
>  
> @@ -37,7 +37,7 @@ void *rdma_pci_dma_map(PCIDevice *dev, dma_addr_t addr, dma_addr_t plen)
>          return NULL;
>      }
>  
> -    pr_dbg("0x%llx -> %p (len=%ld)\n", (long long unsigned int)addr, p, len);
> +    pr_dbg("0x%" PRIx64 " -> %p (len=% " PRId64 ")\n", addr, p, len);
>  
>      return p;
>  }
> diff --git a/hw/rdma/vmw/pvrdma_cmd.c b/hw/rdma/vmw/pvrdma_cmd.c
> index 293dfed29f..dbdd002cc2 100644
> --- a/hw/rdma/vmw/pvrdma_cmd.c
> +++ b/hw/rdma/vmw/pvrdma_cmd.c
> @@ -85,7 +85,7 @@ static void *pvrdma_map_to_pdir(PCIDevice *pdev, uint64_t pdir_dma,
>              }
>          }
>  
> -        pr_dbg("guest_dma[%d]=0x%lx\n", addr_idx, tbl[tbl_idx]);
> +        pr_dbg("guest_dma[%d]=0x%" PRIx64 "\n", addr_idx, tbl[tbl_idx]);
>  
>          curr_page = rdma_pci_dma_map(pdev, (dma_addr_t)tbl[tbl_idx],
>                                       TARGET_PAGE_SIZE);
> @@ -285,7 +285,7 @@ static int create_cq_ring(PCIDevice *pci_dev , PvrdmaRing **ring,
>          goto out_free_ring;
>      }
>  
> -    sprintf(ring_name, "cq_ring_%lx", pdir_dma);
> +    sprintf(ring_name, "cq_ring_%" PRIx64, pdir_dma);
>      rc = pvrdma_ring_init(r, ring_name, pci_dev, &r->ring_state[1],
>                            cqe, sizeof(struct pvrdma_cqe),
>                            /* first page is ring state */
> @@ -415,7 +415,7 @@ static int create_qp_rings(PCIDevice *pci_dev, uint64_t pdir_dma,
>      wqe_sz = pow2ceil(sizeof(struct pvrdma_sq_wqe_hdr) +
>                        sizeof(struct pvrdma_sge) * smax_sge - 1);
>  
> -    sprintf(ring_name, "qp_sring_%lx", pdir_dma);
> +    sprintf(ring_name, "qp_sring_%" PRIx64, pdir_dma);
>      rc = pvrdma_ring_init(sr, ring_name, pci_dev, sr->ring_state,
>                            scqe, wqe_sz, (dma_addr_t *)&tbl[1], spages);
>      if (rc) {
> @@ -426,7 +426,7 @@ static int create_qp_rings(PCIDevice *pci_dev, uint64_t pdir_dma,
>      rr->ring_state = &sr->ring_state[1];
>      wqe_sz = pow2ceil(sizeof(struct pvrdma_rq_wqe_hdr) +
>                        sizeof(struct pvrdma_sge) * rmax_sge - 1);
> -    sprintf(ring_name, "qp_rring_%lx", pdir_dma);
> +    sprintf(ring_name, "qp_rring_%" PRIx64, pdir_dma);
>      rc = pvrdma_ring_init(rr, ring_name, pci_dev, rr->ring_state,
>                            rcqe, wqe_sz, (dma_addr_t *)&tbl[1 + spages], rpages);
>      if (rc) {
> diff --git a/hw/rdma/vmw/pvrdma_dev_ring.c b/hw/rdma/vmw/pvrdma_dev_ring.c
> index ec309dad55..be3d651139 100644
> --- a/hw/rdma/vmw/pvrdma_dev_ring.c
> +++ b/hw/rdma/vmw/pvrdma_dev_ring.c
> @@ -23,7 +23,7 @@
>  
>  int pvrdma_ring_init(PvrdmaRing *ring, const char *name, PCIDevice *dev,
>                       struct pvrdma_ring *ring_state, uint32_t max_elems,
> -                     size_t elem_sz, dma_addr_t *tbl, dma_addr_t npages)
> +                     size_t elem_sz, dma_addr_t *tbl, uint32_t npages)
>  {
>      int i;
>      int rc = 0;
> @@ -35,8 +35,8 @@ int pvrdma_ring_init(PvrdmaRing *ring, const char *name, PCIDevice *dev,
>      ring->ring_state = ring_state;
>      ring->max_elems = max_elems;
>      ring->elem_sz = elem_sz;
> -    pr_dbg("ring->elem_sz=%ld\n", ring->elem_sz);
> -    pr_dbg("npages=%ld\n", npages);
> +    pr_dbg("ring->elem_sz=%zd\n", ring->elem_sz);

%zu

> +    pr_dbg("npages=%d\n", npages);
>      /* TODO: Give a moment to think if we want to redo driver settings
>      atomic_set(&ring->ring_state->prod_tail, 0);
>      atomic_set(&ring->ring_state->cons_head, 0);
> diff --git a/hw/rdma/vmw/pvrdma_dev_ring.h b/hw/rdma/vmw/pvrdma_dev_ring.h
> index 02a590b86d..4a6752f08a 100644
> --- a/hw/rdma/vmw/pvrdma_dev_ring.h
> +++ b/hw/rdma/vmw/pvrdma_dev_ring.h
> @@ -32,7 +32,7 @@ typedef struct PvrdmaRing {
>  
>  int pvrdma_ring_init(PvrdmaRing *ring, const char *name, PCIDevice *dev,
>                       struct pvrdma_ring *ring_state, uint32_t max_elems,
> -                     size_t elem_sz, dma_addr_t *tbl, dma_addr_t npages);
> +                     size_t elem_sz, dma_addr_t *tbl, uint32_t npages);
>  void *pvrdma_ring_next_elem_read(PvrdmaRing *ring);
>  void pvrdma_ring_read_inc(PvrdmaRing *ring);
>  void *pvrdma_ring_next_elem_write(PvrdmaRing *ring);
> diff --git a/hw/rdma/vmw/pvrdma_main.c b/hw/rdma/vmw/pvrdma_main.c
> index 99787812ba..ee6981a6a8 100644
> --- a/hw/rdma/vmw/pvrdma_main.c
> +++ b/hw/rdma/vmw/pvrdma_main.c
> @@ -236,7 +236,7 @@ static void init_dsr_dev_caps(PVRDMADev *dev)
>      dsr = dev->dsr_info.dsr;
>  
>      dsr->caps.fw_ver = PVRDMA_FW_VERSION;
> -    pr_dbg("fw_ver=0x%lx\n", dsr->caps.fw_ver);
> +    pr_dbg("fw_ver=0x%" PRIx64 "\n", dsr->caps.fw_ver);
>  
>      dsr->caps.mode = PVRDMA_DEVICE_MODE_ROCE;
>      pr_dbg("mode=%d\n", dsr->caps.mode);
> @@ -261,11 +261,10 @@ static void init_dsr_dev_caps(PVRDMADev *dev)
>      pr_dbg("gid_tbl_len=%d\n", dsr->caps.gid_tbl_len);
>  
>      dsr->caps.sys_image_guid = 0;
> -    pr_dbg("sys_image_guid=%lx\n", dsr->caps.sys_image_guid);
> +    pr_dbg("sys_image_guid=%" PRIx64 "\n", dsr->caps.sys_image_guid);
>  
>      dsr->caps.node_guid = cpu_to_be64(dev->node_guid);
> -    pr_dbg("node_guid=%llx\n",
> -           (long long unsigned int)be64_to_cpu(dsr->caps.node_guid));
> +    pr_dbg("node_guid=%" PRIx64 "\n", be64_to_cpu(dsr->caps.node_guid));
>  
>      dsr->caps.phys_port_cnt = MAX_PORTS;
>      pr_dbg("phys_port_cnt=%d\n", dsr->caps.phys_port_cnt);
> @@ -343,8 +342,8 @@ static void regs_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
>      /* pr_dbg("addr=0x%lx, val=0x%x, size=%d\n", addr, (uint32_t)val, size); */
>  
>      if (set_reg_val(dev, addr, val)) {
> -        pr_err("Error trying to set REG value, addr=0x%lx, val=0x%lx\n",
> -               (uint64_t)addr, val);
> +        pr_err("Error trying to set REG value, addr=0x%" PRIx64 ", val=0x%" PRIx64 "\n",
> +               addr, val);
>          return;
>      }
>  
> @@ -373,7 +372,7 @@ static void regs_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
>          }
>      break;
>      case PVRDMA_REG_IMR:
> -        pr_dbg("Interrupt mask=0x%lx\n", val);
> +        pr_dbg("Interrupt mask=0x%" PRIx64 "\n", val);
>          dev->interrupt_mask = val;
>          break;
>      case PVRDMA_REG_REQUEST:
> @@ -404,7 +403,8 @@ static void uar_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
>  
>      switch (addr & 0xFFF) { /* Mask with 0xFFF as each UC gets page */
>      case PVRDMA_UAR_QP_OFFSET:
> -        pr_dbg("UAR QP command, addr=0x%x, val=0x%lx\n", (uint32_t)addr, val);
> +        pr_dbg("UAR QP command, addr=0x%" PRIx64 ", val=0x%" PRIx64 "\n",
> +               (uint64_t)addr, val);
>          if (val & PVRDMA_UAR_QP_SEND) {
>              pvrdma_qp_send(dev, val & PVRDMA_UAR_HANDLE_MASK);
>          }
> @@ -420,16 +420,17 @@ static void uar_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
>                                    !!(val & PVRDMA_UAR_CQ_ARM_SOL));
>          }
>          if (val & PVRDMA_UAR_CQ_ARM_SOL) {
> -            pr_dbg("UAR_CQ_ARM_SOL (%ld)\n", val & PVRDMA_UAR_HANDLE_MASK);
> +            pr_dbg("UAR_CQ_ARM_SOL (%" PRIx64 ")\n",
> +                   val & PVRDMA_UAR_HANDLE_MASK);
>          }
>          if (val & PVRDMA_UAR_CQ_POLL) {
> -            pr_dbg("UAR_CQ_POLL (%ld)\n", val & PVRDMA_UAR_HANDLE_MASK);
> +            pr_dbg("UAR_CQ_POLL (%" PRIx64 ")\n", val & PVRDMA_UAR_HANDLE_MASK);
>              pvrdma_cq_poll(&dev->rdma_dev_res, val & PVRDMA_UAR_HANDLE_MASK);
>          }
>          break;
>      default:
> -        pr_err("Unsupported command, addr=0x%lx, val=0x%lx\n",
> -               (uint64_t)addr, val);
> +        pr_err("Unsupported command, addr=0x%" PRIx64 ", val=0x%" PRIx64 "\n",
> +               addr, val);
>          break;
>      }
>  }
> diff --git a/hw/rdma/vmw/pvrdma_qp_ops.c b/hw/rdma/vmw/pvrdma_qp_ops.c
> index f0a1f9eb02..ccada31b54 100644
> --- a/hw/rdma/vmw/pvrdma_qp_ops.c
> +++ b/hw/rdma/vmw/pvrdma_qp_ops.c
> @@ -102,7 +102,7 @@ static void pvrdma_qp_ops_comp_handler(int status, unsigned int vendor_err,
>      CompHandlerCtx *comp_ctx = (CompHandlerCtx *)ctx;
>  
>      pr_dbg("cq_handle=%d\n", comp_ctx->cq_handle);
> -    pr_dbg("wr_id=%ld\n", comp_ctx->cqe.wr_id);
> +    pr_dbg("wr_id=%" PRIx64 "\n", comp_ctx->cqe.wr_id);
>      pr_dbg("status=%d\n", status);
>      pr_dbg("vendor_err=0x%x\n", vendor_err);
>      comp_ctx->cqe.status = status;
> @@ -143,7 +143,7 @@ int pvrdma_qp_send(PVRDMADev *dev, uint32_t qp_handle)
>      while (wqe) {
>          CompHandlerCtx *comp_ctx;
>  
> -        pr_dbg("wr_id=%ld\n", wqe->hdr.wr_id);
> +        pr_dbg("wr_id=%" PRIx64 "\n", wqe->hdr.wr_id);
>  
>          /* Prepare CQE */
>          comp_ctx = g_malloc(sizeof(CompHandlerCtx));
> @@ -187,7 +187,7 @@ int pvrdma_qp_recv(PVRDMADev *dev, uint32_t qp_handle)
>      while (wqe) {
>          CompHandlerCtx *comp_ctx;
>  
> -        pr_dbg("wr_id=%ld\n", wqe->hdr.wr_id);
> +        pr_dbg("wr_id=%" PRIx64 "\n", wqe->hdr.wr_id);
>  
>          /* Prepare CQE */
>          comp_ctx = g_malloc(sizeof(CompHandlerCtx));
> 

So many pr_err/pr_dbg() changes, you could have take the opportunity to
replace with updated error reporting API and tracepoint.

With %zu:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

