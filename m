Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fTlVy-00028y-5Y
	for mharc-qemu-trivial@gnu.org; Fri, 15 Jun 2018 05:59:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52436)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1fTlVv-00026e-Tn
	for qemu-trivial@nongnu.org; Fri, 15 Jun 2018 05:59:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1fTlVv-00084O-5m
	for qemu-trivial@nongnu.org; Fri, 15 Jun 2018 05:59:27 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46696 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1fTlVi-0007j5-HX; Fri, 15 Jun 2018 05:59:14 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 52FB440122A1;
	Fri, 15 Jun 2018 09:59:13 +0000 (UTC)
Received: from gondolin (dhcp-192-215.str.redhat.com [10.33.192.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 73CE92166BB6;
	Fri, 15 Jun 2018 09:59:11 +0000 (UTC)
Date: Fri, 15 Jun 2018 11:59:09 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@de.ibm.com>,
	qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Yongbok Kim
	<yongbok.kim@mips.com>, Aurelien Jarno <aurelien@aurel32.net>, Mark
	Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko
	<atar4qemu@gmail.com>, Peter Maydell <peter.maydell@linaro.org>, Paolo
	Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org
Message-ID: <20180615115909.1c7df252.cohuck@redhat.com>
In-Reply-To: <1529056145-6404-1-git-send-email-thuth@redhat.com>
References: <1529056145-6404-1-git-send-email-thuth@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Fri, 15 Jun 2018 09:59:13 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Fri, 15 Jun 2018 09:59:13 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'cohuck@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH v3] loader: Check access size when
 calling rom_ptr() to avoid crashes
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
X-List-Received-Date: Fri, 15 Jun 2018 09:59:29 -0000

On Fri, 15 Jun 2018 11:49:05 +0200
Thomas Huth <thuth@redhat.com> wrote:

> The rom_ptr() function allows direct access to the ROM blobs that we
> load during startup. However, there are currently no checks for the
> size of the accesses, so it's currently possible to crash QEMU for
> example with:
> 
> $ echo "Insane in the mainframe" > /tmp/test.txt
> $ s390x-softmmu/qemu-system-s390x -kernel /tmp/test.txt -append xyz
> Segmentation fault (core dumped)
> $ s390x-softmmu/qemu-system-s390x -kernel /tmp/test.txt -initrd /tmp/test.txt
> Segmentation fault (core dumped)
> $ echo -n HdrS > /tmp/hdr.txt
> $ sparc64-softmmu/qemu-system-sparc64 -kernel /tmp/hdr.txt -initrd /tmp/hdr.txt
> Segmentation fault (core dumped)
> 
> We need a possibility to check the size of the ROM area that we want
> to access, thus let's add a size parameter to the rom_ptr() function
> to avoid these problems.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v3: Fix the check in find_rom()
> 
>  hw/core/loader.c     | 10 +++++-----
>  hw/mips/mips_malta.c |  6 ++++--
>  hw/s390x/ipl.c       | 13 ++++++++++---
>  hw/sparc/sun4m.c     |  4 ++--
>  hw/sparc64/sun4u.c   |  4 ++--
>  include/hw/loader.h  |  2 +-
>  target/arm/cpu.c     |  2 +-
>  7 files changed, 25 insertions(+), 16 deletions(-)

> diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
> index 04245b5..bcac204 100644
> --- a/hw/s390x/ipl.c
> +++ b/hw/s390x/ipl.c

> @@ -195,8 +199,11 @@ static void s390_ipl_realize(DeviceState *dev, Error **errp)
>               * we have to overwrite values in the kernel image,
>               * which are "rom"
>               */
> -            stq_p(rom_ptr(INITRD_PARM_START), initrd_offset);
> -            stq_p(rom_ptr(INITRD_PARM_SIZE), initrd_size);
> +            romptr = rom_ptr(INITRD_PARM_START, 16);
> +            if (romptr) {
> +                stq_p(romptr, initrd_offset);
> +                stq_p(romptr + 1, initrd_size);

INITRD_PARM_SIZE seems to be unused now. We can remove it in a separate
patch if you don't respin, though.

> +            }
>          }
>      }
>      /*

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

