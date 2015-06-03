Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z08q8-0005by-Kp
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jun 2015 09:36:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45197)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1Z02g4-0006rO-Or
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 03:01:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1Z02g4-0000Vz-15
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 03:01:28 -0400
Received: from mail-oi0-x22b.google.com ([2607:f8b0:4003:c06::22b]:36040)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1Z02fx-0000LD-7t; Wed, 03 Jun 2015 03:01:21 -0400
Received: by oihb142 with SMTP id b142so694874oih.3;
	Wed, 03 Jun 2015 00:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=GJVgZlp55T4h9ILfBSpDO/C7BWbOrW2C3hn4y3LAto0=;
	b=O4bLDdvrkbyBhN9l6GMHsnVlCCAvMPnMcnji9L3GwjgxDWONHczbKzzcBl4gBlbB1s
	Y6kbzO4fmcSo3WUQ8JQ8lYEz8e2kEcTRxqj9QaH2SsEDG1Em1aelOqwXIq20hsdt8etl
	IIM/Wnak3HCpa3d3i9bLoMMLeqyAVUFEdXcfUKzObVGGEN1APAsuBV9kQ1a+4grlvNKw
	zImWUeuL3DFe9MQFlX52A6vlYMVAIrGOXEON9tXYgzMH4jIFQ9sqOonNL1A4qV+qZp/S
	898rS03xQPC4fj3LtT8XDLlt7KBIXE+aHmell05VMadTkgDqMy8HoTR9fw4l/HEgU3Sq
	WOmA==
X-Received: by 10.182.81.229 with SMTP id d5mr7863446oby.28.1433314880775;
	Wed, 03 Jun 2015 00:01:20 -0700 (PDT)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.182.213.33 with HTTP; Wed, 3 Jun 2015 00:00:50 -0700 (PDT)
In-Reply-To: <14e62e727b01a64c188921b7ef2862f0f92734e4.1432711923.git.alistair.francis@xilinx.com>
References: <14e62e727b01a64c188921b7ef2862f0f92734e4.1432711923.git.alistair.francis@xilinx.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 3 Jun 2015 17:00:50 +1000
X-Google-Sender-Auth: w8q0uiUwQ9ZTMvs2tPRd4AvfTPk
Message-ID: <CAKmqyKNT8GChxJOcWE4c3TR_A9edxtvM6yF6OcD05rHJCGeKJA@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>, qemu-trivial@nongnu.org
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c06::22b
X-Mailman-Approved-At: Wed, 03 Jun 2015 09:36:15 -0400
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>, saipava@xilinx.com,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH v1 1/1] xilinx_axidma.c: Fix up the
	stream_running() function
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
X-List-Received-Date: Wed, 03 Jun 2015 07:01:29 -0000

On Wed, May 27, 2015 at 5:37 PM, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> Previously the stream_running() function didn't check
> if the DMA was halted. This caused hangs in recent versions
> of MicroBlaze u-boot. Correct stream_running() to check
> DMASR_HALTED as well as DMACR_RUNSTOP.
>
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> Reviewed-by: Sai Pavan Boddu <saipava@xilinx.com>

Ping!

Also add QEMU Trivial.

Thanks,

Alistair

> ---
>  hw/dma/xilinx_axidma.c |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
> index d06002d..27fba40 100644
> --- a/hw/dma/xilinx_axidma.c
> +++ b/hw/dma/xilinx_axidma.c
> @@ -154,7 +154,8 @@ static inline int stream_resetting(struct Stream *s)
>
>  static inline int stream_running(struct Stream *s)
>  {
> -    return s->regs[R_DMACR] & DMACR_RUNSTOP;
> +    return s->regs[R_DMACR] & DMACR_RUNSTOP &&
> +           !(s->regs[R_DMASR] & DMASR_HALTED);
>  }
>
>  static inline int stream_idle(struct Stream *s)
> --
> 1.7.1
>

