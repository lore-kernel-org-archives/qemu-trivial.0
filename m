Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aVbNW-000703-JQ
	for mharc-qemu-trivial@gnu.org; Tue, 16 Feb 2016 03:53:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33116)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1aVbNV-0006xW-5p
	for qemu-trivial@nongnu.org; Tue, 16 Feb 2016 03:53:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1aVbNU-0007DG-B1
	for qemu-trivial@nongnu.org; Tue, 16 Feb 2016 03:53:01 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33121)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1aVbNO-0007Au-Do; Tue, 16 Feb 2016 03:52:54 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id CB53080508;
	Tue, 16 Feb 2016 08:52:53 +0000 (UTC)
Received: from [10.36.5.104] (vpn1-5-104.ams2.redhat.com [10.36.5.104])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1G8qlwn021648
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 16 Feb 2016 03:52:50 -0500
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
References: <1455604235-3313-1-git-send-email-mjt@msgid.tls.msk.ru>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <56C2E35F.1030103@redhat.com>
Date: Tue, 16 Feb 2016 09:52:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <1455604235-3313-1-git-send-email-mjt@msgid.tls.msk.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Christian Borntraeger <borntraeger@de.ibm.com>,
	Cornelia Huck <cornelia.huck@de.ibm.com>,
	Pierre Morel <pmorel@linux.vnet.ibm.com>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [PATCH] s390: remove misleading comment
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
X-List-Received-Date: Tue, 16 Feb 2016 08:53:02 -0000

On 16.02.2016 07:30, Michael Tokarev wrote:
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
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


