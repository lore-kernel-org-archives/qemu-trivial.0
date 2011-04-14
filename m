Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QAOa9-00036k-Ga
	for mharc-qemu-trivial@gnu.org; Thu, 14 Apr 2011 11:35:45 -0400
Received: from eggs.gnu.org ([140.186.70.92]:44374)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1QAOa7-00032p-6N
	for qemu-trivial@nongnu.org; Thu, 14 Apr 2011 11:35:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1QAOa6-0002jC-Ab
	for qemu-trivial@nongnu.org; Thu, 14 Apr 2011 11:35:43 -0400
Received: from mail-wy0-f173.google.com ([74.125.82.173]:38788)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1QAOa3-0002ir-PZ; Thu, 14 Apr 2011 11:35:39 -0400
Received: by wyb42 with SMTP id 42so1733119wyb.4
	for <multiple recipients>; Thu, 14 Apr 2011 08:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=led8WPo5QEQ8zaOqQjSzG/fcXigT3vThKviJNuZxU6s=;
	b=JoH8Hc6kFZ6K6hAwhE1sPWyxCHroaWqLDqJ2mkXog8XV16JYCm0JwCfdJuyEWXzQbq
	Y8OSyhIsoR/xvkQ0nf/D4IIp3Tkt/c0fk8Qq1nH3fHDbUPGFC2/AnxfveejYJboaPl5b
	S4JOyym8ZVzS0hCp1rZRh/Z2uRXfm40Gp77Eo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=dk56/2k27pC/Wn8oGhsOMUd3AScp2BghJMt+fEhG18lQJSY4nZprtBgO4IRnorlt5R
	iqATW3QoaG5VLymE9jMlgmSnvimc+D1ZiqVBH1/Lp8DYocBcIcA6Q+il4gshkYGuTrCU
	wGJGD89ULZ5tTX3q4Ft2O+uTR1It1zJTkKb6M=
Received: by 10.216.61.78 with SMTP id v56mr3819657wec.60.1302795338794;
	Thu, 14 Apr 2011 08:35:38 -0700 (PDT)
Received: from localhost (h59ec3266.selukar.dyn.perspektivbredband.net
	[89.236.50.102])
	by mx.google.com with ESMTPS id d59sm873829wed.21.2011.04.14.08.35.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 14 Apr 2011 08:35:37 -0700 (PDT)
Date: Thu, 14 Apr 2011 17:35:34 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20110414153534.GA24879@laped.lan>
References: <1302786716-20933-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1302786716-20933-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tests/test-mmap.c: Check
 mmap() return value before using it
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <http://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <http://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Apr 2011 15:35:44 -0000

On Thu, Apr 14, 2011 at 02:11:56PM +0100, Peter Maydell wrote:
> Correct the position of a "stop if MAP_FAILED" check in the mmap()
> tests, so that if mmap() does fail we print a failure message
> rather than segfaulting inside memcpy().
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

I've applied this, thanks.


> ---
>  tests/test-mmap.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/tests/test-mmap.c b/tests/test-mmap.c
> index fcb365f..c578e25 100644
> --- a/tests/test-mmap.c
> +++ b/tests/test-mmap.c
> @@ -164,6 +164,7 @@ void check_aligned_anonymous_unfixed_colliding_mmaps(void)
>  		nlen = pagesize * 8;
>  		p3 = mmap(NULL, nlen, PROT_READ, 
>  			  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> +		fail_unless (p3 != MAP_FAILED);
>  
>  		/* Check if the mmaped areas collide.  */
>  		if (p3 < p2 
> @@ -174,7 +175,6 @@ void check_aligned_anonymous_unfixed_colliding_mmaps(void)
>  
>  		/* Make sure we get pages aligned with the pagesize. The
>  		   target expects this.  */
> -		fail_unless (p3 != MAP_FAILED);
>  		p = (uintptr_t) p3;
>  		fail_unless ((p & pagemask) == 0);
>  		munmap (p2, pagesize);
> -- 
> 1.7.1
> 
> 

