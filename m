Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4TD4-0006i7-JO
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 10:51:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41252)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1e4TD2-0006gV-Bi
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 10:51:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1e4TD1-0004RQ-3G
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 10:51:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52002)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1e4TCw-0004Pj-0i; Tue, 17 Oct 2017 10:51:02 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B42AE7E427;
	Tue, 17 Oct 2017 14:51:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com B42AE7E427
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=lersek@redhat.com
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-43.rdu2.redhat.com
	[10.10.120.43])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2FC9A649A8;
	Tue, 17 Oct 2017 14:50:51 +0000 (UTC)
To: Ladi Prosek <lprosek@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <20171017144051.8452-1-lprosek@redhat.com>
Cc: Peter Chubb <peter.chubb@nicta.com.au>, Cornelia Huck
	<cohuck@redhat.com>, Christian Borntraeger <borntraeger@de.ibm.com>,
	Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>,
	Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <famz@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, 
	Aurelien Jarno <aurelien@aurel32.net>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <3651bc50-e8f4-8aa3-fff4-462ac7a7ff05@redhat.com>
Date: Tue, 17 Oct 2017 16:50:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171017144051.8452-1-lprosek@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 17 Oct 2017 14:51:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH trivial] Remove empty statements
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
X-List-Received-Date: Tue, 17 Oct 2017 14:51:09 -0000

On 10/17/17 16:40, Ladi Prosek wrote:
> Thanks to Laszlo Ersek for spotting the double semicolon in target/i386/kvm.c
> 
> I have trivially grepped the tree for ';;' in C files.
> 
> Suggested-by: Laszlo Ersek <lersek@redhat.com>
> Signed-off-by: Ladi Prosek <lprosek@redhat.com>
> ---
>  hw/misc/imx6_ccm.c     | 2 +-
>  hw/s390x/virtio-ccw.c  | 2 +-
>  linux-user/signal.c    | 2 +-
>  migration/block.c      | 2 +-
>  target/i386/cpu.c      | 2 +-
>  target/i386/kvm.c      | 2 +-
>  target/sh4/translate.c | 2 +-
>  7 files changed, 7 insertions(+), 7 deletions(-)

I've run "get_maintainer.pl" on the above files, and added some CCs.

Reviewed-by: Laszlo Ersek <lersek@redhat.com>

Thanks!
Laszlo

> 
> diff --git a/hw/misc/imx6_ccm.c b/hw/misc/imx6_ccm.c
> index 1b421013a3..4fa94835fe 100644
> --- a/hw/misc/imx6_ccm.c
> +++ b/hw/misc/imx6_ccm.c
> @@ -335,7 +335,7 @@ static uint64_t imx6_ccm_get_ipg_clk(IMX6CCMState *dev)
>      uint64_t freq = 0;
>  
>      freq = imx6_ccm_get_ahb_clk(dev)
> -           / (1 + EXTRACT(dev->ccm[CCM_CBCDR], IPG_PODF));;
> +           / (1 + EXTRACT(dev->ccm[CCM_CBCDR], IPG_PODF));
>  
>      DPRINTF("freq = %d\n", (uint32_t)freq);
>  
> diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
> index 085f17f871..429f10bc90 100644
> --- a/hw/s390x/virtio-ccw.c
> +++ b/hw/s390x/virtio-ccw.c
> @@ -486,7 +486,7 @@ static int virtio_ccw_cb(SubchDev *sch, CCW1 ccw)
>          } else {
>              address_space_stb(&address_space_memory, ccw.cda, vdev->status,
>                                          MEMTXATTRS_UNSPECIFIED, NULL);
> -            sch->curr_status.scsw.count = ccw.count - sizeof(vdev->status);;
> +            sch->curr_status.scsw.count = ccw.count - sizeof(vdev->status);
>              ret = 0;
>          }
>          break;
> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index cc0c3fcee9..09055e8920 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -6487,7 +6487,7 @@ static void setup_rt_frame(int sig, struct target_sigaction *ka,
>          haddr = dest;
>      }
>      env->iaoq_f = haddr;
> -    env->iaoq_b = haddr + 4;;
> +    env->iaoq_b = haddr + 4;
>      return;
>  
>   give_sigsegv:
> diff --git a/migration/block.c b/migration/block.c
> index 3282809583..565625b9b2 100644
> --- a/migration/block.c
> +++ b/migration/block.c
> @@ -896,7 +896,7 @@ static int block_load(QEMUFile *f, void *opaque, int version_id)
>      int len, flags;
>      char device_name[256];
>      int64_t addr;
> -    BlockBackend *blk, *blk_prev = NULL;;
> +    BlockBackend *blk, *blk_prev = NULL;
>      Error *local_err = NULL;
>      uint8_t *buf;
>      int64_t total_sectors = 0;
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 98732cd65f..d44b0ed56c 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -2218,7 +2218,7 @@ static void x86_cpu_class_check_missing_features(X86CPUClass *xcc,
>  
>      if (xcc->kvm_required && !kvm_enabled()) {
>          strList *new = g_new0(strList, 1);
> -        new->value = g_strdup("kvm");;
> +        new->value = g_strdup("kvm");
>          *missing_feats = new;
>          return;
>      }
> diff --git a/target/i386/kvm.c b/target/i386/kvm.c
> index b1e32e95d3..d4b2ce2e94 100644
> --- a/target/i386/kvm.c
> +++ b/target/i386/kvm.c
> @@ -1122,7 +1122,7 @@ static int kvm_get_supported_msrs(KVMState *s)
>                      break;
>                  case MSR_IA32_XSS:
>                      has_msr_xss = true;
> -                    break;;
> +                    break;
>                  case HV_X64_MSR_CRASH_CTL:
>                      has_msr_hv_crash = true;
>                      break;
> diff --git a/target/sh4/translate.c b/target/sh4/translate.c
> index 8db9fba26e..2b00cd2f35 100644
> --- a/target/sh4/translate.c
> +++ b/target/sh4/translate.c
> @@ -679,7 +679,7 @@ static void _decode_opc(DisasContext * ctx)
>  	return;
>      case 0x6008:		/* swap.b Rm,Rn */
>  	{
> -            TCGv low = tcg_temp_new();;
> +            TCGv low = tcg_temp_new();
>  	    tcg_gen_ext16u_i32(low, REG(B7_4));
>  	    tcg_gen_bswap16_i32(low, low);
>              tcg_gen_deposit_i32(REG(B11_8), REG(B7_4), low, 0, 16);
> 


