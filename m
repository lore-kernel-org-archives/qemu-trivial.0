Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uknhz-0001sc-OE
	for mharc-qemu-trivial@gnu.org; Thu, 06 Jun 2013 23:51:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42877)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Uknhx-0001r6-4V
	for qemu-trivial@nongnu.org; Thu, 06 Jun 2013 23:51:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Uknhv-0002pS-W0
	for qemu-trivial@nongnu.org; Thu, 06 Jun 2013 23:51:21 -0400
Received: from mail-bk0-x235.google.com ([2a00:1450:4008:c01::235]:52531)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Uknhv-0002pA-OX
	for qemu-trivial@nongnu.org; Thu, 06 Jun 2013 23:51:19 -0400
Received: by mail-bk0-f53.google.com with SMTP id e11so1413239bkh.40
	for <qemu-trivial@nongnu.org>; Thu, 06 Jun 2013 20:51:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:x-gm-message-state;
	bh=9ngv9j5gnhuqP98LOGXIEuSE6E9EknGe2rFX4ZcG0sU=;
	b=jVG0UexRixQbTjOlDD89YwnUhip2WjUGSc6EX1NRWtQxWDpamXGhbJMWGmzlG0G0At
	kOSCX9HW9XqVwE+vwnmYzBcCaDBkEVdDJEfCThkxshwiT7yo6Qey2C/8Ua8qdNZQvcDh
	WePjqPNhu0dpM+l1Lh+UTMf9mXNrV17jH2yIdm5/Fyfk777kGJH9Dtd2Rp1p/N1rAET0
	HAxRDUoWChoz9r9YUyxMNIzaOCpF4Jlcpsen+e/2/qsaCwqBVHeJKUIGtn2XgrSMo7DJ
	wkWVvT3Eud2s9lTaXNIHr6lJk4GMC9woP5AKpbvvSdldp2ctbW6XFOBdY4KO22t36Va6
	+Eqg==
MIME-Version: 1.0
X-Received: by 10.204.55.201 with SMTP id v9mr11839513bkg.149.1370577078683;
	Thu, 06 Jun 2013 20:51:18 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.204.35.136 with HTTP; Thu, 6 Jun 2013 20:51:18 -0700 (PDT)
In-Reply-To: <1370361554-91658-1-git-send-email-emaste@freebsd.org>
References: <1370361554-91658-1-git-send-email-emaste@freebsd.org>
Date: Fri, 7 Jun 2013 13:51:18 +1000
X-Google-Sender-Auth: el8xwFRYH2B6Fh6mLWcU4blyXME
Message-ID: <CAEgOgz5fKfhum3DmLv_rNgNz4HAJNQs5Vp5OOtEdD4nieMrXUA@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: Ed Maste <emaste@freebsd.org>
Content-Type: text/plain; charset=ISO-8859-1
X-Gm-Message-State: ALoCoQnI3DV7uTw+L9Od4TJNLSByO2h1BR/mad4URtt93v++KfMGx0Mx8lYBndy9/UwurRBCVrMZ
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4008:c01::235
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] block/m25p80: Update Micron
	entries
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
X-List-Received-Date: Fri, 07 Jun 2013 03:51:22 -0000

Hi Ed,

On Wed, Jun 5, 2013 at 1:59 AM, Ed Maste <emaste@freebsd.org> wrote:
> - Split 32Mb and 256Mb parts into a11 and a13 variants.
> - Add the 4K sector flag to the 128Mb parts.  (These entries were taken from
>   the Linux kernel list, which is missing the flag.)
> - Fill out the table of sizes with entries for 64Mb parts.
>
> Prodded by Peter Crosthwaite.
>
> Signed-off-by: Ed Maste <emaste@freebsd.org>
> ---
>  hw/block/m25p80.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index a927a6b..8c3b7f0 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -123,10 +123,14 @@ static const FlashPartInfo known_devices[] = {
>      { INFO("mx25l25655e", 0xc22619,      0,  64 << 10, 512, 0) },
>
>      /* Micron */
> -    { INFO("n25q032a",    0x20bb16,      0,  64 << 10,  64, ER_4K) },
> -    { INFO("n25q128a11",  0x20bb18,      0,  64 << 10, 256, 0) },
> -    { INFO("n25q128a13",  0x20ba18,      0,  64 << 10, 256, 0) },
> -    { INFO("n25q256a",    0x20ba19,      0,  64 << 10, 512, ER_4K) },
> +    { INFO("n25q032a11",  0x20bb16,      0,  64 << 10,  64, ER_4K) },
> +    { INFO("n25q032a13",  0x20ba16,      0,  64 << 10,  64, ER_4K) },
> +    { INFO("n25q064a11",  0x20bb17,      0,  64 << 10, 128, ER_4K) },
> +    { INFO("n25q064a13",  0x20ba17,      0,  64 << 10, 128, ER_4K) },
> +    { INFO("n25q128a11",  0x20bb18,      0,  64 << 10, 256, ER_4K) },
> +    { INFO("n25q128a13",  0x20ba18,      0,  64 << 10, 256, ER_4K) },
> +    { INFO("n25q256a11",  0x20bb19,      0,  64 << 10, 512, ER_4K) },
> +    { INFO("n25q256a13",  0x20ba19,      0,  64 << 10, 512, ER_4K) },
>

Thanks for the patch. Ive copied this hunk to LKML to see what they
think (I got one reply but off list unfortunately) about synchronising
with us.

Id like to give it a few days to see what they say before we merge
this. Ideally we have agreement between the two source trees, so we
can continue the copy-paste based update strategy.

Regards,
Peter

>      /* Spansion -- single (large) sector size only, at least
>       * for the chips listed here (without boot sectors).
> --
> 1.7.11.5
>
>

