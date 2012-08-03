Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SxEcQ-0007rR-EV
	for mharc-qemu-trivial@gnu.org; Fri, 03 Aug 2012 05:56:30 -0400
Received: from eggs.gnu.org ([208.118.235.92]:57483)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SxEcK-0007Xn-Ck
	for qemu-trivial@nongnu.org; Fri, 03 Aug 2012 05:56:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SxEcJ-0006ta-IG
	for qemu-trivial@nongnu.org; Fri, 03 Aug 2012 05:56:24 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:34096)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SxEcE-0006t6-3f; Fri, 03 Aug 2012 05:56:18 -0400
Received: by bkcji1 with SMTP id ji1so163944bkc.4
	for <multiple recipients>; Fri, 03 Aug 2012 02:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=CPZXPdieC3t08VDmufpjkz9DQj3EgyMQieLFFzr0FFY=;
	b=BSF8HhlX6w+WltJEc6Ti9I+w7sye3xe89vtv2It5ekjVQFDNTAvK3yOicyLganrgRX
	B7d1wVFCbsl1fWpax2PQ+1YjgYCooIkTTD8dSi+OZrWvSt8/U3RZmeRTjCT0uuOUcP3y
	4OOw3u/e8TqrQ9w41kR3ph0Sb/NNZ8AEB6POaazOdS8go52UUT3A6bdUZ/neDR7R5YPm
	xp66XlgLdA9DuIg3jPIIsJKiQCipSPjPPq3PI0e+g18QHyZnBNviwZykBJJtTptr5jrY
	0eHIfNF549pfWxh9GnDMclZQ5sLeb/3NbvPtiIxyIf0FWDX13c3oMNr7Wz73ddQS9EpW
	hslA==
Received: by 10.204.152.145 with SMTP id g17mr384483bkw.120.1343987777083;
	Fri, 03 Aug 2012 02:56:17 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id n5sm4524140bkv.14.2012.08.03.02.56.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Aug 2012 02:56:16 -0700 (PDT)
Date: Fri, 3 Aug 2012 10:56:14 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20120803095614.GB23797@stefanha-thinkpad.localdomain>
References: <1343828147-9446-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1343828147-9446-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, patches@linaro.org, qemu-devel@nongnu.org,
	Avi Kivity <avi@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] exec.c: Remove out of date comment
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
X-List-Received-Date: Fri, 03 Aug 2012 09:56:28 -0000

On Wed, Aug 01, 2012 at 02:35:47PM +0100, Peter Maydell wrote:
> Remove an out of date comment: this comment used to be attached to
> cpu_register_physical_memory_log(), before commit 0f0cb164 accidentally
> inserted a couple of other functions between the comment and its function.
> It is in any case obsolete since (a) the function arguments it refers
> to have been replaced with a single MemoryRegionSection* argument and
> (b) the inability to handle regions whose offset_within_address_space
> and offset_within_region aren't equally aligned was fixed as part of
> the rewrite of this code.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Pretty sure my analysis is right and this comment is out of date --
> Avi, could you confirm that please?
> 
>  exec.c |    8 --------
>  1 file changed, 8 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

