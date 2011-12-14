Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RammQ-0002By-95
	for mharc-qemu-trivial@gnu.org; Wed, 14 Dec 2011 06:13:46 -0500
Received: from eggs.gnu.org ([140.186.70.92]:54220)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RammI-0001hV-8I
	for qemu-trivial@nongnu.org; Wed, 14 Dec 2011 06:13:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RammH-00086K-6Q
	for qemu-trivial@nongnu.org; Wed, 14 Dec 2011 06:13:38 -0500
Received: from mail-ww0-f53.google.com ([74.125.82.53]:51298)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Ramm3-00081j-Fb; Wed, 14 Dec 2011 06:13:23 -0500
Received: by wgbds1 with SMTP id ds1so1360595wgb.10
	for <multiple recipients>; Wed, 14 Dec 2011 03:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=DeQpM6oNPt8ApV9VHyuTAOGY6JDt8ZEu+Vy99YBxdGs=;
	b=MUKXdgzyiXCSjXUyZcM+yhdvinhkJbjY3obNfUF2W3bO3kmfqOA4wCluCw/c+MPcOL
	4gcL5pSCWAsFOSydrqdWrN27y0UJzc3QuZjlqfETzKdGoqBs1c1/8NQWi+M1VUuFcdHj
	gFuSyHCfpB/VKNRcNuD04QTLWicTMIzDfizZI=
Received: by 10.216.136.232 with SMTP id w82mr830792wei.46.1323861202534;
	Wed, 14 Dec 2011 03:13:22 -0800 (PST)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id fg15sm3240370wbb.7.2011.12.14.03.13.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Dec 2011 03:13:21 -0800 (PST)
Date: Wed, 14 Dec 2011 11:13:20 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20111214111320.GB10403@stefanha-thinkpad.localdomain>
References: <1323534931-10853-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1323534931-10853-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tcg: make tcg_const_ptr
 actually accept a pointer argument
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
X-List-Received-Date: Wed, 14 Dec 2011 11:13:44 -0000

On Sat, Dec 10, 2011 at 04:35:31PM +0000, Peter Maydell wrote:
> Make tcg_const_ptr() include a cast so that you can pass it a
> pointer. This allows us to drop the casts we had in all the places
> that use this macro.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Minor cleanup; I have a patchset cooking that wants to use
> tcg_const_ptr(), which is why I noticed this infelicity.
> 
>  tcg/tcg-op.h |    6 +++---
>  tcg/tcg.h    |    4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)

Thanks, applied to the trivial patches -next tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches-next

Stefan

