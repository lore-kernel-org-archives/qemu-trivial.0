Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ez3LM-0004uv-SO
	for mharc-qemu-trivial@gnu.org; Thu, 22 Mar 2018 12:45:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56594)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ez3LJ-0004se-NI
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2018 12:45:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ez3LI-0002pB-MT
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2018 12:45:33 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:35120 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1ez3L2-0002ci-4e; Thu, 22 Mar 2018 12:45:16 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8257B40704AB;
	Thu, 22 Mar 2018 16:45:15 +0000 (UTC)
Received: from [10.10.121.135] (ovpn-121-135.rdu2.redhat.com [10.10.121.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D74901C704;
	Thu, 22 Mar 2018 16:45:03 +0000 (UTC)
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20180322161226.29796-1-lvivier@redhat.com>
	<20180322161226.29796-5-lvivier@redhat.com>
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	=?UTF-8?Q?Daniel_P._Berrang=c3=a9?= <berrange@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>, 
	Richard Henderson <rth@twiddle.net>, qemu-arm@nongnu.org,
	Jason Wang <jasowang@redhat.com>, Max Reitz <mreitz@redhat.com>,
	Fam Zheng <famz@redhat.com>, qemu-trivial@nongnu.org,
	Alexander Graf <agraf@suse.de>, qemu-ppc@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Alberto Garcia <berto@igalia.com>, 
	qemu-block@nongnu.org, Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Yongbok Kim <yongbok.kim@mips.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost
	<ehabkost@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Markus Armbruster <armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <5a2e612c-368c-bc36-a852-0ce29bc36ab4@redhat.com>
Date: Thu, 22 Mar 2018 11:45:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180322161226.29796-5-lvivier@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Thu, 22 Mar 2018 16:45:15 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Thu, 22 Mar 2018 16:45:15 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH 4/4] Remove unnecessary variables for
 function return value
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
X-List-Received-Date: Thu, 22 Mar 2018 16:45:35 -0000

On 03/22/2018 11:12 AM, Laurent Vivier wrote:
> Re-run Coccinelle script scripts/coccinelle/return_directly.cocci
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---

> +++ b/hw/arm/exynos4210.c
> @@ -156,12 +156,7 @@ void exynos4210_write_secondary(ARMCPU *cpu,
>   
>   static uint64_t exynos4210_calc_affinity(int cpu)
>   {
> -    uint64_t mp_affinity;
> -
> -    /* Exynos4210 has 0x9 as cluster ID */
> -    mp_affinity = (0x9 << ARM_AFF1_SHIFT) | cpu;
> -
> -    return mp_affinity;
> +    return (0x9 << ARM_AFF1_SHIFT) | cpu;

Unchanged by this rewrite, but since this is converting a signed 32-bit 
int to an unsigned 64-bit value, are we sure that the upper 32 bits are 
always set correctly?  (Using unsigned values earlier in the expression 
would require less head-scratching on whether it is correct).  Any 
changes should be a separate fix by the file's maintainer.


> +++ b/hw/misc/mos6522.c
> @@ -176,12 +176,8 @@ static void mos6522_set_sr_int(MOS6522State *s)
>   
>   static uint64_t mos6522_get_counter_value(MOS6522State *s, MOS6522Timer *ti)
>   {
> -    uint64_t d;
> -
> -    d = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) - ti->load_time,
> +    return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) - ti->load_time,
>                    ti->frequency, NANOSECONDS_PER_SECOND);

Coccinelle missed that indentation is now off here.

> +++ b/hw/ppc/pnv_lpc.c
> @@ -125,25 +125,15 @@ static int pnv_lpc_dt_xscom(PnvXScomInterface *dev, void *fdt, int xscom_offset)
>   static bool opb_read(PnvLpcController *lpc, uint32_t addr, uint8_t *data,
>                        int sz)
>   {
> -    bool success;
> -
> -    /* XXX Handle access size limits and FW read caching here */
> -    success = !address_space_rw(&lpc->opb_as, addr, MEMTXATTRS_UNSPECIFIED,
> +    return !address_space_rw(&lpc->opb_as, addr, MEMTXATTRS_UNSPECIFIED,
>                                   data, sz, false);

and here.

> +++ b/target/xtensa/translate.c
> @@ -1272,11 +1272,8 @@ XtensaOpcodeOps *
>   xtensa_find_opcode_ops(const XtensaOpcodeTranslators *t,
>                          const char *name)
>   {
> -    XtensaOpcodeOps *ops;
> -
> -    ops = bsearch(name, t->opcode, t->num_opcodes,
> +    return bsearch(name, t->opcode, t->num_opcodes,
>                     sizeof(XtensaOpcodeOps), compare_opcode_ops);

and here


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

