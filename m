Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T4s2b-0004MN-Qu
	for mharc-qemu-trivial@gnu.org; Fri, 24 Aug 2012 07:27:05 -0400
Received: from eggs.gnu.org ([208.118.235.92]:53368)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T4s2a-0004I0-1Q
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 07:27:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T4s2Y-0005VH-T7
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 07:27:03 -0400
Received: from mail-we0-f173.google.com ([74.125.82.173]:40488)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1T4s2R-0005Uj-LF; Fri, 24 Aug 2012 07:26:55 -0400
Received: by weyz53 with SMTP id z53so904204wey.4
	for <multiple recipients>; Fri, 24 Aug 2012 04:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=O13KtOzQiqcHCIwj1D9g9Wu66SnprWIvAxPw1KRtLrQ=;
	b=ss/tDG2LcVgiB/HNkVdfBDQjand3r6/umOku9+K/kjsgiQN//2gBQbi2GQIzwFHfCI
	suRn/KyXlYQxYXqI1UgmP2uOqZI7l6qlQY8DpI+VPn7q9AUobYc78YTLaLGTzcZWDYdn
	sFE0zawYQ3vZeu7lTyo3AqhaxYsUMbTBZEMQk4UGqq1AJJc7O811AprzVHcWZ1BD71T6
	GRU1CWoUmC8p5Q9cMfwSI8lJI0Fl4ac8+AtRQV3aSJiVQ8NxpCVF786KNXb7v0w31z1u
	WD17S70L649Oi3jQplYpD0a++uOZXNGycTWkR0c6zzIFGAiAcIIwpWbTStUHUMUkIhWl
	kMtg==
Received: by 10.216.85.130 with SMTP id u2mr2482797wee.202.1345807614758;
	Fri, 24 Aug 2012 04:26:54 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id
	dv1sm5890787wib.10.2012.08.24.04.26.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Aug 2012 04:26:53 -0700 (PDT)
Date: Fri, 24 Aug 2012 12:26:47 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Message-ID: <20120824112647.GK10867@stefanha-thinkpad.localdomain>
References: <Pine.GSO.4.64.1208230207120.26411@mono>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.GSO.4.64.1208230207120.26411@mono>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.173
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
X-List-Received-Date: Fri, 24 Aug 2012 11:27:05 -0000

On Thu, Aug 23, 2012 at 02:08:36AM +0200, BALATON Zoltan wrote:
> Division with round up is the correct way to compute this even if the
> only case where division with round down gives incorrect result is
> probably 15 bpp. This case was explicitely patched up in one of these
> functions but was unhandled in the other. This patch also adds the
> missing cases and aborts for invalid unhandled cases. (I'm not sure
> about setting 16 bpp for the 15 bpp case so I left it there for now.)
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  console.c |  230 +++++++++++++++++++++++++++++++++++--------------------------
>  1 file changed, 131 insertions(+), 99 deletions(-)
> 
>  v2: Use DIV_ROUND_UP and extended commit message
>  v3: Add missing cases to qemu_different_endianness_pixelformat (I
>      have no way to test if this is correct though),
>      abort() for the default: case
>      also reindented as suggested by scripts/checkpatch.pl
> 
> diff --git a/console.c b/console.c
> index 4525cc7..21843cd 100644
> --- a/console.c
> +++ b/console.c
> @@ -1612,44 +1612,75 @@ PixelFormat qemu_different_endianness_pixelformat(int bpp)
>      memset(&pf, 0x00, sizeof(PixelFormat));
> 
>      pf.bits_per_pixel = bpp;
> -    pf.bytes_per_pixel = bpp / 8;
> +    pf.bytes_per_pixel = DIV_ROUND_UP(bpp, 8);
>      pf.depth = bpp == 32 ? 24 : bpp;
> 
>      switch (bpp) {
> -        case 24:
> -            pf.rmask = 0x000000FF;
> -            pf.gmask = 0x0000FF00;
> -            pf.bmask = 0x00FF0000;
> -            pf.rmax = 255;
> -            pf.gmax = 255;
> -            pf.bmax = 255;
> -            pf.rshift = 0;
> -            pf.gshift = 8;
> -            pf.bshift = 16;
> -            pf.rbits = 8;
> -            pf.gbits = 8;
> -            pf.bbits = 8;
> -            break;
> -        case 32:
> -            pf.rmask = 0x0000FF00;
> -            pf.gmask = 0x00FF0000;
> -            pf.bmask = 0xFF000000;
> -            pf.amask = 0x00000000;
> -            pf.amax = 255;
> -            pf.rmax = 255;
> -            pf.gmax = 255;
> -            pf.bmax = 255;
> -            pf.ashift = 0;
> -            pf.rshift = 8;
> -            pf.gshift = 16;
> -            pf.bshift = 24;
> -            pf.rbits = 8;
> -            pf.gbits = 8;
> -            pf.bbits = 8;
> -            pf.abits = 8;
> -            break;
> -        default:
> -            break;
> +    case 0:
> +        break;
> +    case 15:
> +        pf.bits_per_pixel = 16; /* Is this correct? */

A trivial patch can't have "Is this correct?" parts :).

I already applied the simple and correct v2 patch.  Feel free to follow
up with additional cleanups but with resolved "Is this correct?" parts.

Stefan

