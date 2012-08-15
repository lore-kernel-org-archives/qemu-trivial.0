Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T1dxb-0000zw-FB
	for mharc-qemu-trivial@gnu.org; Wed, 15 Aug 2012 09:48:35 -0400
Received: from eggs.gnu.org ([208.118.235.92]:47625)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T1dxZ-0000zi-CI
	for qemu-trivial@nongnu.org; Wed, 15 Aug 2012 09:48:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T1dxY-00061v-GB
	for qemu-trivial@nongnu.org; Wed, 15 Aug 2012 09:48:33 -0400
Received: from mail-wg0-f41.google.com ([74.125.82.41]:42167)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1T1dxY-00061k-8a; Wed, 15 Aug 2012 09:48:32 -0400
Received: by wgbds1 with SMTP id ds1so4814004wgb.4
	for <multiple recipients>; Wed, 15 Aug 2012 06:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dz1S6CYQiywWn5wRZVGB1B3GMgurOJ6fKe0zyrcoVvQ=;
	b=K8cF5m+dP9RYZcG79ouO7LgeBIWwbkq0ka7m4QthTW3Ay3bUNv5dfuCQ0NDcKmH1qX
	R42awX1De3QCcBXOIusTRPCk32ba9GyMel7hGQisZs1W1NYba+FvczI2ZUODw+ypf32i
	NUS5JOel3jxwFAP/idt8LtPsL06yaAtN9oDx07zrdCTduolTcluIa83VGkm+Bc5VtWMP
	GWRHSqnspHuQc/efJWoO9RWt4euPiZo5RisSqofeQXVRYV9VdXmOp6XNpCpYznoBaOXz
	jcDyvPQZKeRL/HRMjQx0j9bzUddQKRi4nrCcmjYH+W5RSTJR0v4D1mxzQgLzGm3BdPTY
	Mt5A==
Received: by 10.216.214.208 with SMTP id c58mr8273286wep.148.1345038511111;
	Wed, 15 Aug 2012 06:48:31 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id bc2sm4745852wib.0.2012.08.15.06.48.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Aug 2012 06:48:30 -0700 (PDT)
Date: Wed, 15 Aug 2012 14:48:27 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120815134827.GG10742@stefanha-thinkpad.localdomain>
References: <1344628293-4565-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1344628293-4565-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.41
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] vnc: Improve comment
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
X-List-Received-Date: Wed, 15 Aug 2012 13:48:34 -0000

On Fri, Aug 10, 2012 at 09:51:33PM +0200, Stefan Weil wrote:
> It's still not good, but hopefully better than before.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  ui/vnc-enc-zywrle.h |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/ui/vnc-enc-zywrle.h b/ui/vnc-enc-zywrle.h
> index 188e247..addee55 100644
> --- a/ui/vnc-enc-zywrle.h
> +++ b/ui/vnc-enc-zywrle.h
> @@ -305,8 +305,8 @@ static inline void harr(int8_t *px0, int8_t *px1)
>     |L1H0H1H0|L1H0H1H0|L1H0H1H0|L1H0H1H0| : level 1
>  
>   In this method, H/L and X0/X1 is always same position.
> - This lead us to more speed and less memory.
> - Of cause, the result of both methods is quite same
> + This leads us to more speed and less memory.
> + Of course, the result of both methods is quite same
>   because its only difference is that coefficient position.
>  */
>  static inline void wavelet_level(int *data, int size, int l, int skip_pixel)

I would drop this patch since this file seems to be copied from an
external project and not customized for QEMU:

"THIS FILE IS PART OF THE 'ZYWRLE' VNC CODEC SOURCE CODE."

If we need to sync to a newer version in the future, the spelling fixes
just add diff noise.

Stefan

