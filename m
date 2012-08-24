Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T4rwH-0001LF-Q2
	for mharc-qemu-trivial@gnu.org; Fri, 24 Aug 2012 07:20:33 -0400
Received: from eggs.gnu.org ([208.118.235.92]:53551)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T4rwB-0001L5-IH
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 07:20:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T4rwA-0003XL-EF
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 07:20:27 -0400
Received: from mail-we0-f173.google.com ([74.125.82.173]:36175)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1T4rwA-0003XA-7k; Fri, 24 Aug 2012 07:20:26 -0400
Received: by weyz53 with SMTP id z53so901224wey.4
	for <multiple recipients>; Fri, 24 Aug 2012 04:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=fdyMmatts4+wZxx9vX43aOlG7TKrvKk61wPTfovuyCc=;
	b=pxsIautTardDxxTADfWdIqbvqefQ7Qq2fpOfSSkBDkBj4kPWv2x2Sor7FbDxfR2Qyh
	QIZlqeXrdfa6EhBL5lkFLzTyV+tsK5B1Ds+TgUy6EbW1VoIfFOrXUC+HpQisPfPYQw1Z
	+Mi6CPD//0v9ZPSEBVpWFN2SSb+ObxLd9ja5gruOVN8foWRfi+41RNGdD3EOsU6I4frM
	g3gw3Fa6za1b5hsWPKYyPFawjCJV0d4owyfGTepuJZKYNMeltl/KWaK4tb8LcJ9emuLX
	udaJgcUKe/9wV8KHPKlPji2ksvB69RqOPcyZVUNFHw1JyFyGos3hnTtGna5x8lGrbBjP
	i2KA==
Received: by 10.180.86.3 with SMTP id l3mr4770607wiz.16.1345807225311;
	Fri, 24 Aug 2012 04:20:25 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id fu8sm3886762wib.5.2012.08.24.04.20.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Aug 2012 04:20:24 -0700 (PDT)
Date: Fri, 24 Aug 2012 12:20:21 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <20120824112021.GI10867@stefanha-thinkpad.localdomain>
References: <Pine.GSO.4.64.1208221718470.28960@mono>
	<5034FB7D.5050009@siemens.com> <503508CE.1020908@weilnetz.de>
	<50350C58.8060306@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50350C58.8060306@siemens.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.173
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] console: Correct
 computation of bytes per pixel from bits per pixel
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
X-List-Received-Date: Fri, 24 Aug 2012 11:20:32 -0000

On Wed, Aug 22, 2012 at 06:44:08PM +0200, Jan Kiszka wrote:
> On 2012-08-22 18:29, Stefan Weil wrote:
> > Am 22.08.2012 17:32, schrieb Jan Kiszka:
> >> On 2012-08-22 17:19, BALATON Zoltan wrote:
> >>> Division with round up is the correct way to compute this even if the
> >>> only case where division with round down gives incorrect result is
> >>> probably 15 bpp. This case was explicitely patched up in one of these
> >>> functions but was unhandled in the other. (I'm not sure about setting
> >>> 16 bpp for the 15bpp case either but I left that there for now.)
> >>>
> >>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> >>> ---
> >>>   console.c |    5 ++---
> >>>   1 file changed, 2 insertions(+), 3 deletions(-)
> >>>
> >>>   v2: Use DIV_ROUND_UP and extended commit message
> >>>
> >>> diff --git a/console.c b/console.c
> >>> index 4525cc7..9df1701 100644
> >>> --- a/console.c
> >>> +++ b/console.c
> >>> @@ -1612,7 +1612,7 @@ PixelFormat
> >>> qemu_different_endianness_pixelformat(int bpp)
> >>>       memset(&pf, 0x00, sizeof(PixelFormat));
> >>>
> >>>       pf.bits_per_pixel = bpp;
> >>> -    pf.bytes_per_pixel = bpp / 8;
> >>> +    pf.bytes_per_pixel = DIV_ROUND_UP(bpp, 8);
> >>>       pf.depth = bpp == 32 ? 24 : bpp;
> >>>
> >>>       switch (bpp) {
> >>> @@ -1661,13 +1661,12 @@ PixelFormat qemu_default_pixelformat(int bpp)
> >>>       memset(&pf, 0x00, sizeof(PixelFormat));
> >>>
> >>>       pf.bits_per_pixel = bpp;
> >>> -    pf.bytes_per_pixel = bpp / 8;
> >>> +    pf.bytes_per_pixel = DIV_ROUND_UP(bpp, 8);
> >>>       pf.depth = bpp == 32 ? 24 : bpp;
> >>>
> >>>       switch (bpp) {
> >>>           case 15:
> >>>               pf.bits_per_pixel = 16;
> >>> -            pf.bytes_per_pixel = 2;
> >> Removed unintentionally?
> >>
> >> Jan
> > 
> > 15 bpp no longer needs special handling because
> > the computation above is fixed by the same patch,
> > so the removal is correct.
> 
> Ok, actually starting to look at this code: This is apparently a code
> cleanup, not a bug fix like the subject suggests. No valid input for
> could have actually triggered the round-up issue. Please declare it as
> such. Bonus for abort() on the invalid default cases.

I have updated the commit message to "console: Clean up bytes per pixel
calculation".

Stefan

