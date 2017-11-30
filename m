Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eKPJj-0005YW-HV
	for mharc-qemu-trivial@gnu.org; Thu, 30 Nov 2017 08:55:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44199)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1eKPJd-0005VL-IK
	for qemu-trivial@nongnu.org; Thu, 30 Nov 2017 08:55:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1eKPJX-0007V9-N7
	for qemu-trivial@nongnu.org; Thu, 30 Nov 2017 08:55:49 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59328)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1eKPIq-0006ra-1T; Thu, 30 Nov 2017 08:55:00 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A2AD16868C;
	Thu, 30 Nov 2017 13:54:58 +0000 (UTC)
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3E20B60621;
	Thu, 30 Nov 2017 13:54:49 +0000 (UTC)
Date: Thu, 30 Nov 2017 14:54:46 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, Gerd Hoffmann
	<kraxel@redhat.com>, Alistair Francis <alistair@alistair23.me>, Peter
	Crosthwaite <crosthwaite.peter@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>, "Edgar E. Iglesias"
	<edgar.iglesias@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Peter
	Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@suse.de>, Jason
	Wang <jasowang@redhat.com>, Subbaraya Sundeep <sundeep.lkml@gmail.com>, 
	Stefan Berger <stefanb@linux.vnet.ibm.com>, Juan Quintela
	<quintela@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
	Christian Borntraeger <borntraeger@de.ibm.com>, Richard Henderson
	<rth@twiddle.net>, "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov
	<imammedo@redhat.com>, qemu-block@nongnu.org (open list:Block layer core), 
	qemu-arm@nongnu.org (open list:Xilinx Zynq), qemu-ppc@nongnu.org (open
	list:New World), qemu-s390x@nongnu.org (open list:S390)
Message-ID: <20171130145446.3d47b906.cohuck@redhat.com>
In-Reply-To: <20171130134159.9697-4-eblake@redhat.com>
References: <20171130134159.9697-1-eblake@redhat.com>
	<20171130134159.9697-4-eblake@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 30 Nov 2017 13:54:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH 3/3] maint: Fix macros with broken
 'do/while(0); ' usage
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
X-List-Received-Date: Thu, 30 Nov 2017 13:55:54 -0000

On Thu, 30 Nov 2017 07:41:59 -0600
Eric Blake <eblake@redhat.com> wrote:

> The point of writing a macro embedded in a 'do { ... } while (0)'
> loop is so that the macro can be used as a drop-in statement with
> the caller supplying the trailing ';'.  Although our coding style
> frowns on brace-less 'if':
>   if (cond)
>     statement;
>   else
>     something else;
> the use of do/while (0) in a macro is absolutely essential for the
> purpose of avoiding a syntax error on the 'else' - but it only works
> if there is no trailing ';' in the macro (as the ';' in the code
> calling the macro would then be a second statement and cause the
> 'else' to not pair to the 'if').
> 
> Many of the places touched in this code are examples of the ugly
> bit-rotting debug print statements; cleaning those up is left as
> a bite-sized task for another day.
> 
> Found mechanically via: $ git grep -B1 'while (0);' | grep -A1 \\\\
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  tests/acpi-utils.h         | 8 ++++----
>  ui/sdl_zoom_template.h     | 8 ++++----
>  audio/paaudio.c            | 4 ++--
>  hw/adc/stm32f2xx_adc.c     | 2 +-
>  hw/block/m25p80.c          | 2 +-
>  hw/char/cadence_uart.c     | 2 +-
>  hw/char/stm32f2xx_usart.c  | 2 +-
>  hw/display/cg3.c           | 2 +-
>  hw/display/dpcd.c          | 2 +-
>  hw/display/xlnx_dp.c       | 2 +-
>  hw/dma/pl330.c             | 2 +-
>  hw/dma/xlnx-zynq-devcfg.c  | 2 +-
>  hw/dma/xlnx_dpdma.c        | 2 +-
>  hw/i2c/i2c-ddc.c           | 2 +-
>  hw/misc/auxbus.c           | 2 +-
>  hw/misc/macio/mac_dbdma.c  | 4 ++--
>  hw/misc/mmio_interface.c   | 2 +-
>  hw/misc/stm32f2xx_syscfg.c | 2 +-
>  hw/misc/zynq_slcr.c        | 2 +-
>  hw/net/cadence_gem.c       | 2 +-
>  hw/ssi/mss-spi.c           | 2 +-
>  hw/ssi/stm32f2xx_spi.c     | 2 +-
>  hw/ssi/xilinx_spi.c        | 2 +-
>  hw/ssi/xilinx_spips.c      | 2 +-
>  hw/timer/a9gtimer.c        | 2 +-
>  hw/timer/cadence_ttc.c     | 2 +-
>  hw/timer/mss-timer.c       | 2 +-
>  hw/timer/stm32f2xx_timer.c | 2 +-
>  hw/tpm/tpm_passthrough.c   | 2 +-
>  hw/tpm/tpm_tis.c           | 2 +-
>  migration/rdma.c           | 2 +-
>  target/arm/translate-a64.c | 2 +-
>  target/s390x/kvm.c         | 2 +-
>  tests/tcg/test-mmap.c      | 2 +-
>  34 files changed, 42 insertions(+), 42 deletions(-)

> diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
> index b03f583032..06d06010a4 100644
> --- a/target/s390x/kvm.c
> +++ b/target/s390x/kvm.c
> @@ -58,7 +58,7 @@
>      if (DEBUG_KVM) {                          \
>          fprintf(stderr, fmt, ## __VA_ARGS__); \
>      }                                         \
> -} while (0);
> +} while (0)
> 
>  #define kvm_vm_check_mem_attr(s, attr) \
>      kvm_vm_check_attr(s, KVM_S390_VM_MEM_CTRL, attr)

Acked-by: Cornelia Huck <cohuck@redhat.com>

