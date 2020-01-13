Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iqvfP-0007Jo-2d
	for mharc-qemu-trivial@gnu.org; Mon, 13 Jan 2020 04:05:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50538)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iqvfM-0007IG-2S
 for qemu-trivial@nongnu.org; Mon, 13 Jan 2020 04:05:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iqvfI-0003vm-Ri
 for qemu-trivial@nongnu.org; Mon, 13 Jan 2020 04:05:42 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:51710
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iqvfI-0003t0-MK
 for qemu-trivial@nongnu.org; Mon, 13 Jan 2020 04:05:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578906339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m9Yn0nKUurAnNc2PbA+DwIEPSgD+gocQNYfDP4/Q6lg=;
 b=SQIg6/xrzls1d0dEVCGWSFi0tM57WR21Wp5lYYiI/vWyBGx9mW2Ldmlipar18sdgYwM4c7
 JcSbSYkNJ0tsibLODDYwaBD5INPL6qC0PRq6jDWg4gfC2N4B1CNDsxWwKxOsSHstAJgOc8
 6PMXAuf5IbvAHQW16p2zStS98+g0pbc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-kFmzsKjgPCep-2Rs5ndLGw-1; Mon, 13 Jan 2020 04:05:38 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DAC881005502;
 Mon, 13 Jan 2020 09:05:36 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE91582475;
 Mon, 13 Jan 2020 09:05:32 +0000 (UTC)
Date: Mon, 13 Jan 2020 10:05:30 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Zengtao (B)" <prime.zeng@hisilicon.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Shannon Zhao
 <shannon.zhaosl@gmail.com>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Subject: Re: [PATCH] hw/arm/acpi: Pack the SRAT processors structure by
 node_id ascending order
Message-ID: <20200113100530.0bae41a3@redhat.com>
In-Reply-To: <678F3D1BB717D949B966B68EAEB446ED340C1B23@dggemm526-mbx.china.huawei.com>
References: <1578388729-55540-1-git-send-email-prime.zeng@hisilicon.com>
 <20200107042918-mutt-send-email-mst@kernel.org>
 <678F3D1BB717D949B966B68EAEB446ED340B608D@dggemm526-mbx.china.huawei.com>
 <20200107164958.7811777d@redhat.com>
 <678F3D1BB717D949B966B68EAEB446ED340B8B24@dggemm526-mbx.china.huawei.com>
 <20200108173832.61508f8b@redhat.com>
 <678F3D1BB717D949B966B68EAEB446ED340BD19F@dggemm526-mbx.china.huawei.com>
 <20200109105336.4932267b@redhat.com>
 <678F3D1BB717D949B966B68EAEB446ED340C1B23@dggemm526-mbx.china.huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: kFmzsKjgPCep-2Rs5ndLGw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Mon, 13 Jan 2020 09:05:46 -0000

On Fri, 10 Jan 2020 02:56:35 +0000
"Zengtao (B)" <prime.zeng@hisilicon.com> wrote:

> > -----Original Message-----
> > From: Igor Mammedov [mailto:imammedo@redhat.com]
> > Sent: Thursday, January 09, 2020 5:54 PM
> > To: Zengtao (B)
> > Cc: Michael S. Tsirkin; qemu-devel@nongnu.org; qemu-trivial@nongnu.org;
> > Shannon Zhao; Peter Maydell; qemu-arm@nongnu.org
> > Subject: Re: [PATCH] hw/arm/acpi: Pack the SRAT processors structure by
> > node_id ascending order
> > 
> > On Thu, 9 Jan 2020 02:45:58 +0000
> > "Zengtao (B)" <prime.zeng@hisilicon.com> wrote:
> >   
> > > > -----Original Message-----
> > > > From: Igor Mammedov [mailto:imammedo@redhat.com]
> > > > Sent: Thursday, January 09, 2020 12:39 AM
> > > > To: Zengtao (B)
> > > > Cc: Michael S. Tsirkin; qemu-devel@nongnu.org;  
> > qemu-trivial@nongnu.org;  
> > > > Shannon Zhao; Peter Maydell; qemu-arm@nongnu.org
> > > > Subject: Re: [PATCH] hw/arm/acpi: Pack the SRAT processors structure  
> > by  
> > > > node_id ascending order
> > > >
> > > > On Wed, 8 Jan 2020 04:02:10 +0000
> > > > "Zengtao (B)" <prime.zeng@hisilicon.com> wrote:
> > > >  
> > > > > > -----Original Message-----
> > > > > > From: Igor Mammedov [mailto:imammedo@redhat.com]
> > > > > > Sent: Tuesday, January 07, 2020 11:50 PM
> > > > > > To: Zengtao (B)
> > > > > > Cc: Michael S. Tsirkin; qemu-devel@nongnu.org;  
> > > > qemu-trivial@nongnu.org;  
> > > > > > Shannon Zhao; Peter Maydell; qemu-arm@nongnu.org
> > > > > > Subject: Re: [PATCH] hw/arm/acpi: Pack the SRAT processors  
> > structure  
> > > > by  
> > > > > > node_id ascending order
> > > > > >
> > > > > > On Tue, 7 Jan 2020 10:29:22 +0000
> > > > > > "Zengtao (B)" <prime.zeng@hisilicon.com> wrote:
> > > > > >  
> > > > > > > > -----Original Message-----
> > > > > > > > From: Michael S. Tsirkin [mailto:mst@redhat.com]
> > > > > > > > Sent: Tuesday, January 07, 2020 5:33 PM
> > > > > > > > To: Zengtao (B)
> > > > > > > > Cc: qemu-devel@nongnu.org; qemu-trivial@nongnu.org;  
> > Shannon  
> > > > > > Zhao;  
> > > > > > > > Peter Maydell; Igor Mammedov; qemu-arm@nongnu.org
> > > > > > > > Subject: Re: [PATCH] hw/arm/acpi: Pack the SRAT processors  
> > > > structure  
> > > > > > by  
> > > > > > > > node_id ascending order
> > > > > > > >
> > > > > > > > On Tue, Jan 07, 2020 at 05:18:49PM +0800, Zeng Tao wrote:  
> > > > > > > > > When booting the guest linux with the following numa  
> > > > configuration:  
> > > > > > > > > -numa node,node_id=1,cpus=0-3
> > > > > > > > > -numa node,node_id=0,cpus=4-7
> > > > > > > > > We can get the following numa topology in the guest system:
> > > > > > > > > Architecture:          aarch64
> > > > > > > > > Byte Order:            Little Endian
> > > > > > > > > CPU(s):                8
> > > > > > > > > On-line CPU(s) list:   0-7
> > > > > > > > > Thread(s) per core:    1
> > > > > > > > > Core(s) per socket:    8
> > > > > > > > > Socket(s):             1
> > > > > > > > > NUMA node(s):          2
> > > > > > > > > L1d cache:             unknown size
> > > > > > > > > L1i cache:             unknown size
> > > > > > > > > L2 cache:              unknown size
> > > > > > > > > NUMA node0 CPU(s):     0-3
> > > > > > > > > NUMA node1 CPU(s):     4-7
> > > > > > > > > The Cpus 0-3 is assigned with NUMA node 1 in QEMU while it  
> > get  
> > > > > > NUMA  
> > > > > > > > node  
> > > > > > > > > 0 in the guest.
> > > > > > > > >
> > > > > > > > > In fact, In the linux kernel, numa_node_id is allocated per the  
> > > > ACPI  
> > > > > > > > > SRAT processors structure order,so the cpu 0 will be the first  
> > one  
> > > > to  
> > > > > > > > > allocate its NUMA node id, so it gets the NUMA node 0.
> > > > > > > > >
> > > > > > > > > To fix this issue, we pack the SRAT processors structure in  
> > numa  
> > > > node  
> > > > > > id  
> > > > > > > > > order but not the default cpu number order.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Zeng Tao <prime.zeng@hisilicon.com>  
> > > > > > > >
> > > > > > > >
> > > > > > > > Does this matter? If yes fixing linux to take node id from  
> > proximity  
> > > > > > > > field in ACPI seems cleaner ...
> > > > > > > >  
> > > > > > >
> > > > > > > In fact, I just want to align the node_id concept in QEMU and  
> > Linux.  
> > > > > > > If we fix the kernel side, we need to align with all platforms.
> > > > > > > i think maybe not a good idea.  
> > > > > > if linux makes up node ID's on it's own, it would be hard for it to
> > > > > > map SRAT entries to other tables that use proximity id as well.
> > > > > >
> > > > > > So it would need to maintain map of [proximity id] -> [node id] (and  
> > > > reverse)  
> > > > > > somewhere to resolve mappings on other tables.
> > > > > > If it doesn't do this then it's broken and works just by accident,
> > > > > > if it does the fix probably should be in that code and not in QEMU.
> > > > > >  
> > > > >
> > > > > Hmm, the problem is how to understand the concept of node id.
> > > > > 1. In dts, there is node id. Both the QEMU and Linux can use it
> > > > > directly, so no conflict.
> > > > > 2. In ACPI, there is only proximity domain, but no node id, there
> > > > >  should be a mapping between them, while kernel and QEMU  
> > maintain  
> > > > >  their own rule, and unfortunately they conflict with each other
> > > > >  sometimes.
> > > > >
> > > > > There is no specification to indicate what we should do to maintain  
> > the  
> > > > > mapping, so it's hard to align the QEMU and Linux.
> > > > >
> > > > > Any suggestion, or we just accept it as a rule since it don't affect  
> > much?  
> > > >
> > > > If node id generation is driven by SRAT content, it might be reasonable  
> > to  
> > > > ask for SRAT parser in kernel to create node ids using proximity value
> > > > instead of the order ACPI_SRAT_PROCESSOR_GICC structures are
> > > > enumerated.
> > > > That way node id would match ACPI spec.
> > > >  
> > >
> > > I don't quite understand "That way node id would match ACPI spec."
> > > I check the ACPI 6.3 spec, I didn't find any description that node id should
> > > be equal to proximity value, in section 6.2.15, there is indeed an example
> > > which node numbers equals to proximity value.  
> > 
> > There is only proximity id in spec (which conceptually is the same as node
> > id).
> > What I'm saying is that linux kernel ACPI parser could use it as node id
> > instead of using counter for making up node ids.
> > 
> > (issue with it is that proximity values could be sparse, so one
> > would need to audit current node id users to make sure that using
> > proximity id won't break anything)
> >   
> I think that is really a problem, in linux kernel:
> #if MAX_NUMNODEs > 256
> #define MAX_PXM_DOMAINS MAX_NUMNODEs
> #else
> #define MAX_PXM_DOMAINS 256
> #endif
> It seems that using counter is a better choice. 

In QEMU case nodeid isn't sparse. So even if kernel uses counter, it will
work fine as far as it sorts SRAT by proximity value (same thing you are trying
to do in this patch but on kernel side).
That way it would match what HW vendors think about node numbering in most cases.

(We a comparing apples to oranges, so arguing for one case vs another is
rather pointless)

Another question, does this patch fixes anything?
(if it is not, it might be better to just drop this idea)

> 
> > > Thanks
> > >  
> > > > But even with that I'd wouldn't expect cpu ids match as its basically
> > > > arbitrary numbers on both sided. One would need to use arch specific  
> > ids  
> > > > to reliably match cpus on both sides (MPIDR in ARM case or APICID in  
> > x86).  
> > > >.  
> > > > > > >  
> > > > > > > > > ---
> > > > > > > > >  hw/arm/virt-acpi-build.c | 23 +++++++++++++++--------
> > > > > > > > >  1 file changed, 15 insertions(+), 8 deletions(-)
> > > > > > > > >
> > > > > > > > > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > > > > > > > > index bd5f771..497192b 100644
> > > > > > > > > --- a/hw/arm/virt-acpi-build.c
> > > > > > > > > +++ b/hw/arm/virt-acpi-build.c
> > > > > > > > > @@ -520,7 +520,8 @@ build_srat(GArray *table_data,  
> > > > BIOSLinker  
> > > > > > > > *linker, VirtMachineState *vms)  
> > > > > > > > >      AcpiSystemResourceAffinityTable *srat;
> > > > > > > > >      AcpiSratProcessorGiccAffinity *core;
> > > > > > > > >      AcpiSratMemoryAffinity *numamem;
> > > > > > > > > -    int i, srat_start;
> > > > > > > > > +    int i, j, srat_start;
> > > > > > > > > +    uint32_t node_id;
> > > > > > > > >      uint64_t mem_base;
> > > > > > > > >      MachineClass *mc = MACHINE_GET_CLASS(vms);
> > > > > > > > >      MachineState *ms = MACHINE(vms);
> > > > > > > > > @@ -530,13 +531,19 @@ build_srat(GArray *table_data,  
> > > > BIOSLinker  
> > > > > > > > *linker, VirtMachineState *vms)  
> > > > > > > > >      srat = acpi_data_push(table_data, sizeof(*srat));
> > > > > > > > >      srat->reserved1 = cpu_to_le32(1);
> > > > > > > > >
> > > > > > > > > -    for (i = 0; i < cpu_list->len; ++i) {
> > > > > > > > > -        core = acpi_data_push(table_data, sizeof(*core));
> > > > > > > > > -        core->type = ACPI_SRAT_PROCESSOR_GICC;
> > > > > > > > > -        core->length = sizeof(*core);
> > > > > > > > > -        core->proximity =  
> > > > > > > > cpu_to_le32(cpu_list->cpus[i].props.node_id);  
> > > > > > > > > -        core->acpi_processor_uid = cpu_to_le32(i);
> > > > > > > > > -        core->flags = cpu_to_le32(1);
> > > > > > > > > +    for (i = 0; i < ms->numa_state->num_nodes; ++i) {
> > > > > > > > > +        for (j = 0; j < cpu_list->len; ++j) {  
> > > > > > > >
> > > > > > > > Hmm O(n ^2) isn't great ...  
> > > > > > > Good suggestion, 3Q.  
> > > > > > > >  
> > > > > > > > > +            node_id =  
> > > > > > cpu_to_le32(cpu_list->cpus[j].props.node_id);  
> > > > > > > > > +            if (node_id != i) {
> > > > > > > > > +                continue;
> > > > > > > > > +            }
> > > > > > > > > +            core = acpi_data_push(table_data,  
> > sizeof(*core));  
> > > > > > > > > +            core->type = ACPI_SRAT_PROCESSOR_GICC;
> > > > > > > > > +            core->length = sizeof(*core);
> > > > > > > > > +            core->proximity = node_id;
> > > > > > > > > +            core->acpi_processor_uid = cpu_to_le32(j);
> > > > > > > > > +            core->flags = cpu_to_le32(1);
> > > > > > > > > +        }
> > > > > > > > >      }  
> > > > > > > >
> > > > > > > > is the issue arm specific? wouldn't it affect x86 too?
> > > > > > > >  
> > > > > > > Good question, I think it will affect x86, but I need to confirm.
> > > > > > >  
> > > > > > > > >      mem_base = vms->memmap[VIRT_MEM].base;
> > > > > > > > > --
> > > > > > > > > 2.8.1  
> > > > > > >  
> > > > >  
> > >  
> 
> 


