Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S4bAT-0004MO-CY
	for mharc-qemu-trivial@gnu.org; Mon, 05 Mar 2012 11:53:49 -0500
Received: from eggs.gnu.org ([208.118.235.92]:39472)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S4bAN-00044X-KG
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2012 11:53:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S4bAL-0008Km-PL
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2012 11:53:43 -0500
Received: from mail-ww0-f53.google.com ([74.125.82.53]:61638)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1S4bA0-0008Gm-1N; Mon, 05 Mar 2012 11:53:20 -0500
Received: by wgbfm10 with SMTP id fm10so2498227wgb.10
	for <multiple recipients>; Mon, 05 Mar 2012 08:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gQGiaHuU1zzGmSfbZs/eaXtR1njlMXjCa4RPWzC++VI=;
	b=swWNgRSIOadsktYcOM2A2+KPRG77Cfim82ECK8YpJBKBW1DYRksh49IIkAfWVf2tgr
	egxDQWHkJgqFcUjXg5Oq+pnnYQbGhErJsJ+RpcBUCMLZnyLlekD8ss3j51U4mXjITBVY
	1OluEriMoJXy0hcMX+PpP1uunTo2ukT/pnAxBPd1ouq2Owa/rqx+u+Hkky41A6BbDJuf
	MJ4AwbsaS5FmvA6sUlha0U1jOeXRFmDkiTvsnpGpqsIg6dNwKhwldtCYpvTlEAAIVsn2
	SkurnVsh8r3t0Yy7H88lsYCNCszdjKtu4W8WuUm1QPstoASrMgVsEOzkdQTP7jT7/7ha
	5BDg==
Received: by 10.180.95.197 with SMTP id dm5mr2540240wib.20.1330966397351;
	Mon, 05 Mar 2012 08:53:17 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	dw7sm21970969wib.4.2012.03.05.08.53.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Mar 2012 08:53:16 -0800 (PST)
Date: Mon, 5 Mar 2012 16:53:14 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120305165314.GD8197@stefanha-thinkpad.localdomain>
References: <1330928551-6452-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1330928551-6452-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.53
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] osdep: Remove local definition of macro
 offsetof
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
X-List-Received-Date: Mon, 05 Mar 2012 16:53:48 -0000

On Mon, Mar 05, 2012 at 07:22:31AM +0100, Stefan Weil wrote:
> The macro offsetof is defined in stddef.h. It is conforming to
> the standards C89, C99 and POSIX.1-2001 (see man page), so it
> is a sufficiently old standard.
> 
> Therefore chances are very high that QEMU never needs a local
> definition of this macro.
> 
> osdep.h already includes stddef.h, so this patch simply removes
> the unneeded code from the files configure and osdep.h.
> 
> If we ever need the local definition again, it should be added
> to compiler.h (the macro is usually provided with the compiler,
> it is not OS specific).
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  configure |   14 --------------
>  osdep.h   |    3 ---
>  2 files changed, 0 insertions(+), 17 deletions(-)

Andreas and Peter, thanks for looking into whether it's safe to remove
offsetof().  I feel the risk is very low.

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

