Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jeZWy-0001EC-Jj
	for mharc-qemu-trivial@gnu.org; Fri, 29 May 2020 03:34:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jeZWw-0001Dr-VA
 for qemu-trivial@nongnu.org; Fri, 29 May 2020 03:34:15 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:41818
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jeZWv-0007Tb-A9
 for qemu-trivial@nongnu.org; Fri, 29 May 2020 03:34:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590737651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QjsPgg/eo+EnSB81jDgLCSgnAifJ1sqb0agoZHUsDEY=;
 b=GxfEw22L7kMY+zAS5cv8kqdAZGgnZLxWWVCjo127Q0kPErSv0qnqJLbjlrrLELz0xbi2zO
 2uXeV4EVHNTURKSosTr/WQx4ugmA0ZyFbLkEBRgqzbgDNkuRaAmKaNrKNFTdRhZoEqGgkK
 EPBeYOlIcBNzSjpwS/bCspJSkEjSr/U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-XLzT_iibPe2b-lS6ieqmig-1; Fri, 29 May 2020 03:34:09 -0400
X-MC-Unique: XLzT_iibPe2b-lS6ieqmig-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA60A1005510;
 Fri, 29 May 2020 07:34:08 +0000 (UTC)
Received: from [10.36.113.56] (ovpn-113-56.ams2.redhat.com [10.36.113.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6720F6298C;
 Fri, 29 May 2020 07:34:01 +0000 (UTC)
Subject: Re: [PATCH v2] hw/vfio/common: Trace in which mode an IOMMU is opened
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>
References: <20200527155555.6833-1-philmd@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <6f7bcc0d-5f13-0070-43d8-454d3ed9ebce@redhat.com>
Date: Fri, 29 May 2020 09:33:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200527155555.6833-1-philmd@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/28 23:43:13
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 29 May 2020 07:34:15 -0000

Hi Philippe,

On 5/27/20 5:55 PM, Philippe Mathieu-Daudé wrote:
> One might want to check which IOMMU version the host kernel
> provide. Add a trace event to see in which mode we opened
> our container.
> 
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric

> ---
> v2: Only display string description (Eric)
> 
> Supersedes: <20200526173542.28710-1-philmd@redhat.com>
> ---
>  hw/vfio/common.c     | 19 ++++++++++++++-----
>  hw/vfio/trace-events |  1 +
>  2 files changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 0b3593b3c0..f24450472e 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -1157,15 +1157,24 @@ static void vfio_put_address_space(VFIOAddressSpace *space)
>  static int vfio_get_iommu_type(VFIOContainer *container,
>                                 Error **errp)
>  {
> -    int iommu_types[] = { VFIO_TYPE1v2_IOMMU, VFIO_TYPE1_IOMMU,
> -                          VFIO_SPAPR_TCE_v2_IOMMU, VFIO_SPAPR_TCE_IOMMU };
> +    static const struct {
> +        int type;
> +        const char *name;
> +    } iommu[] = {
> +        {VFIO_TYPE1v2_IOMMU, "Type1 (v2)"},
> +        {VFIO_TYPE1_IOMMU, "Type1 (v1)"},
> +        {VFIO_SPAPR_TCE_v2_IOMMU, "sPAPR TCE (v2)"},
> +        {VFIO_SPAPR_TCE_IOMMU, "sPAPR TCE (v1)"}
> +    };
>      int i;
>  
> -    for (i = 0; i < ARRAY_SIZE(iommu_types); i++) {
> -        if (ioctl(container->fd, VFIO_CHECK_EXTENSION, iommu_types[i])) {
> -            return iommu_types[i];
> +    for (i = 0; i < ARRAY_SIZE(iommu); i++) {
> +        if (ioctl(container->fd, VFIO_CHECK_EXTENSION, iommu[i].type)) {
> +            trace_vfio_get_iommu_type(iommu[i].name);
> +            return iommu[i].type;
>          }
>      }
> +    trace_vfio_get_iommu_type("Not available or not supported");
>      error_setg(errp, "No available IOMMU models");
>      return -EINVAL;
>  }
> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
> index b1ef55a33f..d3f1e48618 100644
> --- a/hw/vfio/trace-events
> +++ b/hw/vfio/trace-events
> @@ -115,6 +115,7 @@ vfio_region_sparse_mmap_header(const char *name, int index, int nr_areas) "Devic
>  vfio_region_sparse_mmap_entry(int i, unsigned long start, unsigned long end) "sparse entry %d [0x%lx - 0x%lx]"
>  vfio_get_dev_region(const char *name, int index, uint32_t type, uint32_t subtype) "%s index %d, %08x/%0x8"
>  vfio_dma_unmap_overflow_workaround(void) ""
> +vfio_get_iommu_type(const char *type) "IOMMU type: %s"
>  
>  # platform.c
>  vfio_platform_base_device_init(char *name, int groupid) "%s belongs to group #%d"
> 


