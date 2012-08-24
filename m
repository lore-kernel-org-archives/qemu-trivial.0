Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T4sC7-0007Tx-Q3
	for mharc-qemu-trivial@gnu.org; Fri, 24 Aug 2012 07:36:55 -0400
Received: from eggs.gnu.org ([208.118.235.92]:35113)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1T4sC5-0007TQ-Nt
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 07:36:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1T4sC3-0008L7-B9
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 07:36:53 -0400
Received: from mail-iy0-f173.google.com ([209.85.210.173]:53799)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1T4sC3-0008Kr-6b
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 07:36:51 -0400
Received: by iakx26 with SMTP id x26so3070690iak.4
	for <qemu-trivial@nongnu.org>; Fri, 24 Aug 2012 04:36:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=8+Y3502NEnrRgL1pb5UeyNYcctBu/srA2CgDCLO2R88=;
	b=QVvqXINKn41q309nr0akosfesvq7sbyU9m0UQuf5HWAi5Vu7dikvZgeZmKhACN73e0
	2x+aiT32gFM/YMxlpTIPs0C6uYIGEJsbaf4s7Fpyz1nZb924uIxszal1UulIUOsjN9st
	Ni55YIO/qBdzhJUrvlCLjH3drjxgDAx9S9WiVE4Bblvt1trgm81SHaHk+T36GOseQGD0
	7nt14B0CLCOG1v62U9WjGUizRKagBom7IaRs3AdjlA6W+x/l/nxEXYRaNaThiRRVPHbC
	b7GeL7dO2Inlz3RHm2XyrQN8Ok35pESpZYjYwaVGdkyb8mMuyukb9Dc7ruL7inCbj7YT
	ghZQ==
MIME-Version: 1.0
Received: by 10.50.5.196 with SMTP id u4mr1783680igu.41.1345808210438; Fri, 24
	Aug 2012 04:36:50 -0700 (PDT)
Received: by 10.50.160.161 with HTTP; Fri, 24 Aug 2012 04:36:50 -0700 (PDT)
In-Reply-To: <Pine.GSO.4.64.1208230207120.26411@mono>
References: <Pine.GSO.4.64.1208230207120.26411@mono>
Date: Fri, 24 Aug 2012 12:36:50 +0100
Message-ID: <CAFEAcA_+UWLfr5NQi-SCNq_+9-q=kM-URR-c4oWuC6vNMcMN5w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQnaRp25zx5zUFZAJJtYbiR1ilquPdAni34iwHWy5SngTSRNGXgQNDZcE73KGtu4APU98IcA
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] console: Cleanup
 computation of bytes per pixel and add missing cases
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
X-List-Received-Date: Fri, 24 Aug 2012 11:36:54 -0000

On 23 August 2012 01:08, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> Division with round up is the correct way to compute this even if the
> only case where division with round down gives incorrect result is
> probably 15 bpp. This case was explicitely patched up in one of these
> functions but was unhandled in the other. This patch also adds the
> missing cases and aborts for invalid unhandled cases. (I'm not sure
> about setting 16 bpp for the 15 bpp case so I left it there for now.)
>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  console.c |  230
> +++++++++++++++++++++++++++++++++++--------------------------
>  1 file changed, 131 insertions(+), 99 deletions(-)

It's a bit hard to see what's actually been changed in this
patch -- can you split it up into a patch that fixes the
switch indent first (and which has only whitespace changes,
so 'git diff -w' produces no output for it), and then a patch
making the actual changes, please?

(A useful rule of thumb, incidentally, is that if you find yourself
writing "also" in a commit message you should consider splitting
it into two separate commits instead :-))

thanks
-- PMM

