Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aVcEL-0001E1-Qa
	for mharc-qemu-trivial@gnu.org; Tue, 16 Feb 2016 04:47:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46442)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cornelia.huck@de.ibm.com>) id 1aVcEI-0001CT-K4
	for qemu-trivial@nongnu.org; Tue, 16 Feb 2016 04:47:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cornelia.huck@de.ibm.com>) id 1aVcEE-0004bo-Kq
	for qemu-trivial@nongnu.org; Tue, 16 Feb 2016 04:47:34 -0500
Received: from e06smtp10.uk.ibm.com ([195.75.94.106]:37177)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cornelia.huck@de.ibm.com>) id 1aVcEE-0004bb-A0
	for qemu-trivial@nongnu.org; Tue, 16 Feb 2016 04:47:30 -0500
Received: from localhost
	by e06smtp10.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <cornelia.huck@de.ibm.com>;
	Tue, 16 Feb 2016 09:47:28 -0000
Received: from d06dlp01.portsmouth.uk.ibm.com (9.149.20.13)
	by e06smtp10.uk.ibm.com (192.168.101.140) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 16 Feb 2016 09:47:26 -0000
X-IBM-Helo: d06dlp01.portsmouth.uk.ibm.com
X-IBM-MailFrom: cornelia.huck@de.ibm.com
X-IBM-RcptTo: qemu-devel@nongnu.org;qemu-trivial@nongnu.org
Received: from b06cxnps4075.portsmouth.uk.ibm.com
	(d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by d06dlp01.portsmouth.uk.ibm.com (Postfix) with ESMTP id 0DE3617D8042; 
	Tue, 16 Feb 2016 09:47:44 +0000 (GMT)
Received: from d06av04.portsmouth.uk.ibm.com (d06av04.portsmouth.uk.ibm.com
	[9.149.37.216])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id u1G9lQL66226394; Tue, 16 Feb 2016 09:47:26 GMT
Received: from d06av04.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av04.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id u1G9lPwG012474; Tue, 16 Feb 2016 02:47:25 -0700
Received: from gondolin (dyn-9-152-224-197.boeblingen.de.ibm.com
	[9.152.224.197])
	by d06av04.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id u1G9lPqq012455; Tue, 16 Feb 2016 02:47:25 -0700
Date: Tue, 16 Feb 2016 10:47:23 +0100
From: Cornelia Huck <cornelia.huck@de.ibm.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20160216104723.5b728fc8.cornelia.huck@de.ibm.com>
In-Reply-To: <1455604235-3313-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1455604235-3313-1-git-send-email-mjt@msgid.tls.msk.ru>
Organization: IBM Deutschland Research & Development GmbH Vorsitzende des
	Aufsichtsrats: Martina Koederitz
	=?UTF-8?B?R2VzY2jDpGZ0c2bDvGhydW5nOg==?=
	Dirk Wittkopp Sitz der Gesellschaft: =?UTF-8?B?QsO2Ymxpbmdlbg==?=
	Registergericht: Amtsgericht Stuttgart, HRB 243294
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; i686-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16021609-0041-0000-0000-00000749D79A
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.106
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] s390: remove misleading
	comment
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
X-List-Received-Date: Tue, 16 Feb 2016 09:47:35 -0000

On Tue, 16 Feb 2016 09:30:35 +0300
Michael Tokarev <mjt@tls.msk.ru> wrote:

> The comment talks about a non-ELF object while the
> example gives ELF object.
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  hw/s390x/ipl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
> index c9cf7cc..2213405 100644
> --- a/hw/s390x/ipl.c
> +++ b/hw/s390x/ipl.c
> @@ -106,7 +106,7 @@ static void s390_ipl_realize(DeviceState *dev, Error **errp)
>              /* Adjust ELF start address to final location */
>              ipl->bios_start_addr += fwbase;
>          } else {
> -            /* Try to load non-ELF file (e.g. s390-ccw.img) */
> +            /* Try to load non-ELF file */
>              bios_size = load_image_targphys(bios_filename, ZIPL_IMAGE_START,
>                                              4096);
>              ipl->bios_start_addr = ZIPL_IMAGE_START;

Acked-by: Cornelia Huck <cornelia.huck@de.ibm.com>


