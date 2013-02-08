Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U3nLa-00022q-EV
	for mharc-qemu-trivial@gnu.org; Fri, 08 Feb 2013 07:46:30 -0500
Received: from eggs.gnu.org ([208.118.235.92]:40049)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1U3nLW-0001xN-Iy
	for qemu-trivial@nongnu.org; Fri, 08 Feb 2013 07:46:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1U3nLV-0005TU-3T
	for qemu-trivial@nongnu.org; Fri, 08 Feb 2013 07:46:26 -0500
Received: from mail-lb0-f170.google.com ([209.85.217.170]:62796)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1U3nLU-0005TP-Rx
	for qemu-trivial@nongnu.org; Fri, 08 Feb 2013 07:46:25 -0500
Received: by mail-lb0-f170.google.com with SMTP id ge1so2963450lbb.15
	for <qemu-trivial@nongnu.org>; Fri, 08 Feb 2013 04:46:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=zjzlfBVRW6T0QnJwSehotPvd86xOcQZCv9iZPTwNbCw=;
	b=dvnUbonRNo5KziUFHIq3UlxoxD9nt3s+p7vmYdpC7SBTiPVLTgt/xCG1zkhTocn0Qa
	p4aAdiUuyB2PqXlwjLGwtPvyrEEKAEjxKJQUr69R3CedA8npon3tNcF0ox/GLNUB/xcn
	3WZY978Br7KbiEtDPK3vUt35U04bvBvVCsZt/WdV0361HCh92hBhwmWc6pZthwse4Kll
	8ssvuivU35SMva4QeFMFeh5KGgplo3AAntm95PL2PxRh2G5ndJlxpNL9rh7sOeoLSIEJ
	qFMd/M45oYLgsPP8Prd6ZqyjntHNoG/NKYAD+BIdMD5V9jLnYi40qnyqV0aAZdyYauVH
	8xUQ==
X-Received: by 10.152.133.133 with SMTP id pc5mr4742353lab.32.1360327583634;
	Fri, 08 Feb 2013 04:46:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.69.234 with HTTP; Fri, 8 Feb 2013 04:46:03 -0800 (PST)
In-Reply-To: <1360325749-1989-2-git-send-email-armbru@redhat.com>
References: <1360325749-1989-1-git-send-email-armbru@redhat.com>
	<1360325749-1989-2-git-send-email-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Feb 2013 12:46:03 +0000
Message-ID: <CAFEAcA8XZ7AP0BL79vCfT7i3CwTQRTMFnAeVx4-7y-EPeji-hA@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQnOWNrE7fTMFnatsrkpFFZSneh3tprK8WmOfRd3/kZq8TjEnahfu4EfY6/jlzJ8/tf/t8Dr
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.217.170
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-1.4 1/6] error: Clean up
 error strings with embedded newlines
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
X-List-Received-Date: Fri, 08 Feb 2013 12:46:28 -0000

On 8 February 2013 12:15, Markus Armbruster <armbru@redhat.com> wrote:
> The arguments of error_report() should yield a short error string
> without newlines.
>
> A few places try to print additional help after the error message by
> embedding newlines in the error string.  That's nice, but let's do it
> the right way.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/kvm/pci-assign.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/hw/kvm/pci-assign.c b/hw/kvm/pci-assign.c
> index 896cfe8..c31a7f2 100644
> --- a/hw/kvm/pci-assign.c
> +++ b/hw/kvm/pci-assign.c
> @@ -936,8 +936,8 @@ retry:
>              /* Retry with host-side MSI. There might be an IRQ conflict and
>               * either the kernel or the device doesn't support sharing. */
>              error_report("Host-side INTx sharing not supported, "
> -                         "using MSI instead.\n"
> -                         "Some devices do not to work properly in this mode.");
> +                         "using MSI instead");
> +            error_printf("Some devices do not to work properly in this mode.");

"do not work properly"

>              dev->features |= ASSIGNED_DEVICE_PREFER_MSI_MASK;
>              goto retry;
>          }
> @@ -1903,10 +1903,10 @@ static void assigned_dev_load_option_rom(AssignedDevice *dev)
>      memset(ptr, 0xff, st.st_size);
>
>      if (!fread(ptr, 1, st.st_size, fp)) {
> -        error_report("pci-assign: Cannot read from host %s\n"
> -                     "\tDevice option ROM contents are probably invalid "
> +        error_report("pci-assign: Cannot read from host %s", rom_file);
> +        error_printf("\tDevice option ROM contents are probably invalid "
>                       "(check dmesg).\n\tSkip option ROM probe with rombar=0, "
> -                     "or load from file with romfile=", rom_file);
> +                     "or load from file with romfile=\n");

So should error_printf() strings end with \n or not? This one does,
the one in the hunk above doesn't...

(also we should probably either drop those \t indents or have
error_printf() add them automatically or otherwise indicate that
this is followon additional info about a previous error.)

-- PMM

