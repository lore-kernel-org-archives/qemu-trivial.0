Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UO68D-0008Qg-Hk
	for mharc-qemu-trivial@gnu.org; Fri, 05 Apr 2013 08:52:37 -0400
Received: from eggs.gnu.org ([208.118.235.92]:37955)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UO685-0008C1-6A
	for qemu-trivial@nongnu.org; Fri, 05 Apr 2013 08:52:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UO683-00025x-G9
	for qemu-trivial@nongnu.org; Fri, 05 Apr 2013 08:52:29 -0400
Received: from mail-wi0-x22b.google.com ([2a00:1450:400c:c05::22b]:33526)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UO683-00025Z-7B
	for qemu-trivial@nongnu.org; Fri, 05 Apr 2013 08:52:27 -0400
Received: by mail-wi0-f171.google.com with SMTP id hn17so550965wib.16
	for <qemu-trivial@nongnu.org>; Fri, 05 Apr 2013 05:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=1C6ZZTTTDxgK/W+/L9P24uktjDI9SFTaclksvLAoqGw=;
	b=mcAG6/BxHktA1kJIiVUdHw57uEpv2aFe3fsavwspZQh+V7NW2OGkV++AlAnmEu8CDh
	Q5k4EftQns0wgX2Hx9tNBcr583g8vp/bgu1xVtcEGaoC9GKWgxEgp1Fnjw08jQJoGJGG
	N92FNc5pXN2hBDnfWp1Pvc8lTf7hZy0IIPKJ+e3DWU6/V9H3wTDAKERE4gMRc29aJW4L
	iuEdpHkSLSmFqHNRX2heqTdTtZ+WnzJ3tsJzH5fyNZiTQcix48m5XmjhviLrD7VSJ+dX
	I/fWtpBuksstq8fUFPu1u0kx0cZWe8ttGquUJpoK5QGiTfN6cIy4QXJAKCLjKoB44YAc
	qOsg==
X-Received: by 10.194.122.166 with SMTP id lt6mr10882820wjb.56.1365166346404; 
	Fri, 05 Apr 2013 05:52:26 -0700 (PDT)
Received: from localhost ([2a02:810d:ec0:195:2d83:6a4a:ca86:7c26])
	by mx.google.com with ESMTPS id t7sm3571211wij.2.2013.04.05.05.52.24
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 05 Apr 2013 05:52:25 -0700 (PDT)
Date: Fri, 5 Apr 2013 14:52:23 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Alexander Aring <alex.aring@gmail.com>
Message-ID: <20130405125223.GB15818@stefanha-thinkpad.redhat.com>
References: <1364558442-11392-1-git-send-email-alex.aring@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1364558442-11392-1-git-send-email-alex.aring@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22b
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] softfloat: fix mask in extractFloat32Exp
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
X-List-Received-Date: Fri, 05 Apr 2013 12:52:36 -0000

On Fri, Mar 29, 2013 at 01:00:42PM +0100, Alexander Aring wrote:
> This will fix the mask of extractFloat32Exp from 0xFF to 0x7F.
> On bit 0x80 is the sign bit of IEEE 754.
> 
> Signed-off-by: Alexander Aring <alex.aring@gmail.com>
> ---
>  fpu/softfloat.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fpu/softfloat.c b/fpu/softfloat.c
> index 83ccc4b..4e8ed79 100644
> --- a/fpu/softfloat.c
> +++ b/fpu/softfloat.c
> @@ -221,7 +221,7 @@ INLINE uint32_t extractFloat32Frac( float32 a )
>  INLINE int_fast16_t extractFloat32Exp(float32 a)
>  {
>  
> -    return ( float32_val(a)>>23 ) & 0xFF;
> +    return ( float32_val(a)>>23 ) & 0x7F;

This patch seems wrong because the fraction is 23 bits, exponent is 8
bits, and sign is 1 bit.

IEEE 754 Binary32 representation:
SEEEEEEEEFFFFFFFFFFFFFFFFFFFFFFF
 3      2                      0
 0      3

http://en.wikipedia.org/wiki/Binary32

Since the exponent is *8* bits, 0xFF is correct.  The sign bit is 0x100
after >>23.

Stefan

