Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T8kvx-0008Hu-U3
	for mharc-qemu-trivial@gnu.org; Tue, 04 Sep 2012 00:40:17 -0400
Received: from eggs.gnu.org ([208.118.235.92]:47251)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1T8kvv-0008BQ-Ls
	for qemu-trivial@nongnu.org; Tue, 04 Sep 2012 00:40:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1T8kvq-00045q-Qh
	for qemu-trivial@nongnu.org; Tue, 04 Sep 2012 00:40:15 -0400
Received: from mail-vb0-f45.google.com ([209.85.212.45]:45906)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1T8kvq-000441-Ms
	for qemu-trivial@nongnu.org; Tue, 04 Sep 2012 00:40:10 -0400
Received: by vbip1 with SMTP id p1so5730997vbi.4
	for <qemu-trivial@nongnu.org>; Mon, 03 Sep 2012 21:40:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=RDM18y//V11Q3YQJOtbSX7gy1pbmCQ16nUKvXo7xkls=;
	b=HABAYNoHMrXco7hYsTwljbadp7aRUIOxxJ+C8vJgx67GrGMV77FPdMTYNfDfv5t4sW
	WAVYGqqmhxV6TQmshaU39NxEGTuOmlVQBTxgVlFzUeaNl+Y5K2CZt1MhUcZCvvSzJTGP
	eDTPPqwN5V6GYmmqksWHgw5MImDENLAY4XxWo1Monp+y8aYyzD3d1MGYv5b9cwX9ut9R
	BhPL6z+j4sUZqdoogs2gil8dgArHWjWiSK7eBmOFikaC8cktMXVMdHFjqDZox++3snBv
	dHFcYYEKkxMKGyleGT4JV9CVKGYV8UFzFwu7vPNTp9lvlglBrZ38iVAuIrTfvq1FPUk2
	fjew==
MIME-Version: 1.0
Received: by 10.58.23.202 with SMTP id o10mr14426379vef.57.1346733609655; Mon,
	03 Sep 2012 21:40:09 -0700 (PDT)
Received: by 10.58.137.197 with HTTP; Mon, 3 Sep 2012 21:40:09 -0700 (PDT)
In-Reply-To: <1346490743-9652-1-git-send-email-sw@weilnetz.de>
References: <1346490743-9652-1-git-send-email-sw@weilnetz.de>
Date: Tue, 4 Sep 2012 14:40:09 +1000
Message-ID: <CAEgOgz6wVx=QNircYCL55e8AJN-0iWLfSVZiB4Ng2BY2-fOaJA@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-1
X-Gm-Message-State: ALoCoQlLdiFBrmt3zpf/nw5TBKcB+/17mwzO5ScbBsdubmmeL8tp+qY3RYpmViiMK17xTp83GY6I
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.45
Cc: qemu-trivial@nongnu.org, peter.crosthwaite@xilinx.com,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] cadence_uart: Fix buffer overflow
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
X-List-Received-Date: Tue, 04 Sep 2012 04:40:17 -0000

Thanks Stefan,

Please enqueue to Trivial.

Regards,
Peter

On Sat, Sep 1, 2012 at 7:12 PM, Stefan Weil <sw@weilnetz.de> wrote:
> Report from smatch:
> hw/cadence_uart.c:413 uart_read(13) error: buffer overflow 's->r' 18 <= 18
>
> This fixes read access to s->r[R_MAX] which is behind the limits of s->r.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Reviewed-by: Peter Crosthwaite <peter.crosthwaite@petalogix.com>

> ---
>  hw/cadence_uart.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/cadence_uart.c b/hw/cadence_uart.c
> index d98e531..f8afc4e 100644
> --- a/hw/cadence_uart.c
> +++ b/hw/cadence_uart.c
> @@ -404,7 +404,7 @@ static uint64_t uart_read(void *opaque, target_phys_addr_t offset,
>      uint32_t c = 0;
>
>      offset >>= 2;
> -    if (offset > R_MAX) {
> +    if (offset >= R_MAX) {
>          return 0;
>      } else if (offset == R_TX_RX) {
>          uart_read_rx_fifo(s, &c);
> --
> 1.7.10
>

