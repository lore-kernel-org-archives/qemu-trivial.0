Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U3rxf-0006v6-Ql
	for mharc-qemu-trivial@gnu.org; Fri, 08 Feb 2013 12:42:07 -0500
Received: from eggs.gnu.org ([208.118.235.92]:56221)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1U3rxc-0006mL-MS
	for qemu-trivial@nongnu.org; Fri, 08 Feb 2013 12:42:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1U3rxb-0005XY-EM
	for qemu-trivial@nongnu.org; Fri, 08 Feb 2013 12:42:04 -0500
Received: from mx1.redhat.com ([209.132.183.28]:19974)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1U3rxX-0005Wc-W2; Fri, 08 Feb 2013 12:42:00 -0500
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r18Hfup0031394
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 8 Feb 2013 12:41:56 -0500
Received: from localhost (ovpn-113-129.phx2.redhat.com [10.3.113.129])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r18HfsgC028243; Fri, 8 Feb 2013 12:41:55 -0500
Date: Fri, 8 Feb 2013 15:41:54 -0200
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20130208154154.7bf7ab79@redhat.com>
In-Reply-To: <1360340232-4670-2-git-send-email-armbru@redhat.com>
References: <1360340232-4670-1-git-send-email-armbru@redhat.com>
	<1360340232-4670-2-git-send-email-armbru@redhat.com>
Organization: Red Hat
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH for-1.4 v2 1/6] error: Clean up error
 strings with embedded newlines
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
X-List-Received-Date: Fri, 08 Feb 2013 17:42:06 -0000

On Fri,  8 Feb 2013 17:17:07 +0100
Markus Armbruster <armbru@redhat.com> wrote:

> The arguments of error_report() should yield a short error string
> without newlines.
> 
> A few places try to print additional help after the error message by
> embedding newlines in the error string.  That's nice, but let's do it
> the right way.
> 
> Since I'm touching these lines anyway, drop a stray preposition and
> some tabs.  We don't use tabs for similar messages elsewhere.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/kvm/pci-assign.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/kvm/pci-assign.c b/hw/kvm/pci-assign.c
> index 896cfe8..da64b5b 100644
> --- a/hw/kvm/pci-assign.c
> +++ b/hw/kvm/pci-assign.c
> @@ -936,8 +936,8 @@ retry:
>              /* Retry with host-side MSI. There might be an IRQ conflict and
>               * either the kernel or the device doesn't support sharing. */
>              error_report("Host-side INTx sharing not supported, "
> -                         "using MSI instead.\n"
> -                         "Some devices do not to work properly in this mode.");
> +                         "using MSI instead");
> +            error_printf("Some devices do not work properly in this mode.\n");

This is fixing command-line, right?

I honestly don't know which is less worse, the current code or having
to call two different functions in the correct order to report an
error :(

I'd say the best solution for this would be to propagate errors, but this
will loose LOC support.

>              dev->features |= ASSIGNED_DEVICE_PREFER_MSI_MASK;
>              goto retry;
>          }
> @@ -1903,10 +1903,10 @@ static void assigned_dev_load_option_rom(AssignedDevice *dev)
>      memset(ptr, 0xff, st.st_size);
>  
>      if (!fread(ptr, 1, st.st_size, fp)) {
> -        error_report("pci-assign: Cannot read from host %s\n"
> -                     "\tDevice option ROM contents are probably invalid "
> -                     "(check dmesg).\n\tSkip option ROM probe with rombar=0, "
> -                     "or load from file with romfile=", rom_file);
> +        error_report("pci-assign: Cannot read from host %s", rom_file);
> +        error_printf("Device option ROM contents are probably invalid "
> +                     "(check dmesg).\nSkip option ROM probe with rombar=0, "
> +                     "or load from file with romfile=\n");
>          memory_region_destroy(&dev->dev.rom);
>          goto close_rom;
>      }


