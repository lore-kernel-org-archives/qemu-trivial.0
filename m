Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wopad-0001Xm-Q3
	for mharc-qemu-trivial@gnu.org; Mon, 26 May 2014 03:44:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48751)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1WopaX-0001Rj-Or
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 03:44:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1WopaP-0005sQ-Gd
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 03:44:53 -0400
Received: from mail-ve0-f169.google.com ([209.85.128.169]:51858)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1WopaO-0005mr-Mg
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 03:44:45 -0400
Received: by mail-ve0-f169.google.com with SMTP id jx11so9061950veb.28
	for <qemu-trivial@nongnu.org>; Mon, 26 May 2014 00:44:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=87NkSXm2tpobxJS7DbyzSGKvnJVgJh9ICI3PujRo/vY=;
	b=EG+VxPVJ5XWcScfYRJ4O8G7v3uu8ucORRAh4buk28SSAEAfYavlypYX6MauAIY+HHX
	SvD6EZikGFSGsfIdsXMUKRZcf7NpTlr0lqY3/QjKQ8ViAS39oR3nI2fu8w7o//UWelRx
	6dTyDVIJhffVSdQ1VYQI5WgYZFth/yMCrcBjL5YFQKyADGEXgW2ENwvG/PgQtvFKwLp3
	xbd3eWRBd4z9uukFP6zv2iGqjt7z5ozj9fPR8jDEQCJ59yTLr2D3dK5QOG3Li2IA1VTL
	61AsLwgH2eFKxqpmdJwhhYwE6ji2c4mgLly3KwqFDDq5TX4fAzXFR/JHaluOctSLDEOy
	gPcQ==
X-Gm-Message-State: ALoCoQlA7OROfwKl8E3HyT+KCPbocD5kr905kW7AsMGndJBYYHcBXu/v23smSuZeBuUWaDgTuAhQ
MIME-Version: 1.0
X-Received: by 10.52.12.229 with SMTP id b5mr1353905vdc.52.1401090283668; Mon,
	26 May 2014 00:44:43 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.220.176.137 with HTTP; Mon, 26 May 2014 00:44:43 -0700 (PDT)
In-Reply-To: <538047A0.2090704@msgid.tls.msk.ru>
References: <cover.1399449874.git.peter.crosthwaite@xilinx.com>
	<CAEgOgz4GgkEWpLpa8SKPsZGZnRcqE5CifqJ+UiiA4Lm8dOnLMA@mail.gmail.com>
	<CAEgOgz46UcJiGC6H==O1XZFkvZh4Wa+2kBy8DDwAfKG6SUmp+g@mail.gmail.com>
	<538047A0.2090704@msgid.tls.msk.ru>
Date: Mon, 26 May 2014 17:44:43 +1000
X-Google-Sender-Auth: bIlI_Hw94L0_yzc2XlSKgwMRg9E
Message-ID: <CAEgOgz6q24XiPab6DhjsugU34u9sw-Y73Q=nvNpwq7ifqzCzCQ@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.169
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Edgar Iglesias <edgar.iglesias@xilinx.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH net v1 0/4] Cadence GEM
	patches
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
X-List-Received-Date: Mon, 26 May 2014 07:44:58 -0000

On Sat, May 24, 2014 at 5:17 PM, Michael Tokarev <mjt@tls.msk.ru> wrote:
> 24.05.2014 03:06, Peter Crosthwaite wrote:
>> Ping^2!
>>
>> I'll try trivial queue too :)
>
> Actually this looks like trivial material.
>
> I'll comment in one place, for all.
>
>
>>>> Peter Crosthwaite (4):
>>>>   net: cadence_gem: Fix Tx descriptor update
>
> This appears to be a bugfix, but with an interesting "incomplete"
> update:
>
> ...
> +            unsigned    desc_first[2];
> ...
>              cpu_physical_memory_read(s->tx_desc_addr,
> -                                     (uint8_t *)&desc[0], sizeof(desc));
> +                                     (uint8_t *)&desc_first[0], sizeof(desc));
>
> sizeof(desc_first), not sizeof(desc).  Also can drop extra
> "readdressing".
>

Fixed.

>>>>   net: cadence_gem: Add Tx descriptor fetch printf
>
> +    DB_PRINT("read descriptor 0x%x\n", (unsigned)packet_desc_addr);
>
> packet_desc_addr is hwaddr, which is uint64_t, here it is being cast
> to unsigned,  Is it right?

Probably not.

  Other code in this file does the same,
> but it still does not mean it's right.  Maybe it is because it uses
> only the lower 32 bits of it, or that the high bits just aren't
> useful for debugging?
>

Well they are not useful because the IP is only 32-bit but converting
to HWADDR_PRIx because its probably the right thing to do anyway.

>>>>   net: cadence_gem: Fix top comment
>
> I applied this one.
>

Thanks.

Spinning V2. Thanks for review.

Regards,
Peter

>>>>   net: cadence_gem: Comment spelling sweep
>
> This look okay, except that it clashes a bit with the first.
>
> /mjt
>

