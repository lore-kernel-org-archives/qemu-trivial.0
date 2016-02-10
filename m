Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aTUiC-0004f9-TF
	for mharc-qemu-trivial@gnu.org; Wed, 10 Feb 2016 08:21:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38384)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <borntraeger@de.ibm.com>) id 1aTT3f-0006t8-Mr
	for qemu-trivial@nongnu.org; Wed, 10 Feb 2016 06:35:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <borntraeger@de.ibm.com>) id 1aTT3d-0004m1-2M
	for qemu-trivial@nongnu.org; Wed, 10 Feb 2016 06:35:43 -0500
Received: from e06smtp08.uk.ibm.com ([195.75.94.104]:50530)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <borntraeger@de.ibm.com>) id 1aTT3c-0004le-I3
	for qemu-trivial@nongnu.org; Wed, 10 Feb 2016 06:35:40 -0500
Received: from localhost
	by e06smtp08.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <borntraeger@de.ibm.com>;
	Wed, 10 Feb 2016 11:35:38 -0000
Received: from d06dlp03.portsmouth.uk.ibm.com (9.149.20.15)
	by e06smtp08.uk.ibm.com (192.168.101.138) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Wed, 10 Feb 2016 11:35:36 -0000
X-IBM-Helo: d06dlp03.portsmouth.uk.ibm.com
X-IBM-MailFrom: borntraeger@de.ibm.com
X-IBM-RcptTo: qemu-devel@nongnu.org;qemu-trivial@nongnu.org
Received: from b06cxnps4074.portsmouth.uk.ibm.com
	(d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by d06dlp03.portsmouth.uk.ibm.com (Postfix) with ESMTP id EAAD41B08067; 
	Wed, 10 Feb 2016 11:35:49 +0000 (GMT)
Received: from d06av04.portsmouth.uk.ibm.com (d06av04.portsmouth.uk.ibm.com
	[9.149.37.216])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id u1ABZaGd10355120; Wed, 10 Feb 2016 11:35:36 GMT
Received: from d06av04.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av04.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id u1ABZZlP025987; Wed, 10 Feb 2016 04:35:35 -0700
Received: from oc1450873852.ibm.com (dyn-9-152-224-136.boeblingen.de.ibm.com
	[9.152.224.136])
	by d06av04.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id u1ABZYq3025949; Wed, 10 Feb 2016 04:35:35 -0700
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
References: <1455102397-14425-1-git-send-email-mjt@msgid.tls.msk.ru>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <56BB2086.2040001@de.ibm.com>
Date: Wed, 10 Feb 2016 12:35:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <1455102397-14425-1-git-send-email-mjt@msgid.tls.msk.ru>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16021011-0033-0000-0000-000005AC5A81
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.104
X-Mailman-Approved-At: Wed, 10 Feb 2016 08:21:39 -0500
Cc: qemu-trivial@nongnu.org, Pierre Morel <pmorel@linux.vnet.ibm.com>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] s390x: remove s390-zipl.rom
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
X-List-Received-Date: Wed, 10 Feb 2016 11:35:45 -0000

On 02/10/2016 12:06 PM, Michael Tokarev wrote:
> This is an s390 boot rom which was used in s390-virtio machine.
> but since commit 3538fb6f89dd9bb2e7e59de2bfad52a45321c744
> "s390x: remove s390-virtio machine", this file isn't used.
> The only place it is referenced in the code is an unused
> which I'm modifying too, to refer to s390-ccw.rom instead.
> 
> Cc: Pierre Morel <pmorel@linux.vnet.ibm.com>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>

a minor nit below, otherwise 
Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>


> ---
>  Makefile               |   1 -
>  hw/s390x/ipl.c         |   2 +-
>  hw/s390x/s390-virtio.c |   1 -
>  pc-bios/README         |   4 ----
>  pc-bios/s390-zipl.rom  | Bin 3304 -> 0 bytes
>  5 files changed, 1 insertion(+), 7 deletions(-)
>  delete mode 100644 pc-bios/s390-zipl.rom
> 
> diff --git a/Makefile b/Makefile
> index 30b1b2d..f9fae3a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -400,7 +400,6 @@ efi-pcnet.rom efi-rtl8139.rom efi-virtio.rom \
>  qemu-icon.bmp qemu_logo_no_text.svg \
>  bamboo.dtb petalogix-s3adsp1800.dtb petalogix-ml605.dtb \
>  multiboot.bin linuxboot.bin kvmvapic.bin \
> -s390-zipl.rom \
>  s390-ccw.img \
>  spapr-rtas.bin slof.bin \
>  palcode-clipper \
> diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
> index 6992add..4e6a0ac 100644
> --- a/hw/s390x/ipl.c
> +++ b/hw/s390x/ipl.c
> @@ -106,7 +106,7 @@ static void s390_ipl_realize(DeviceState *dev, Error **errp)
>              /* Adjust ELF start address to final location */
>              ipl->bios_start_addr += fwbase;
>          } else {
> -            /* Try to load non-ELF file (e.g. s390-zipl.rom) */
> +            /* Try to load non-ELF file (e.g. s390-ccw.rom) */

						s390-ccw.img



