Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T4rYu-0003A7-EA
	for mharc-qemu-trivial@gnu.org; Fri, 24 Aug 2012 06:56:24 -0400
Received: from eggs.gnu.org ([208.118.235.92]:47597)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T4rYs-00034R-Mc
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 06:56:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T4rYn-00059u-4Q
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 06:56:22 -0400
Received: from mail-wg0-f53.google.com ([74.125.82.53]:41871)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1T4rYl-00059b-AV; Fri, 24 Aug 2012 06:56:15 -0400
Received: by wgbfm10 with SMTP id fm10so1007471wgb.10
	for <multiple recipients>; Fri, 24 Aug 2012 03:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=UwCw7ahrsyiRdblTT5zOO0qWHWgVoRwXLwxu61hnsXI=;
	b=cXLnTdEy2ozQkZgVi10CEz2XjUJCS9c3L6TZmG2KcdBCNWkJyQr9/X7hkBghZ7aczR
	YvoG8GS8EB/r8tKQ/SWng7MRp5exrbGf/vsh+pQhpfkXHZ86gwhJMfjPWxM+FEvQgzse
	vwDLwpN4YWM+unNzogGxQjd40ydCE2RBHXD1p77YMLkFtDSRN0nCrFjZG3IAEeCQmJ7g
	/38SSLavQ0gbPn7f4iywhdwdF21CxIGZ3rUH3GelodTaiBurr8JfuE1D/jLYsYCHWluI
	5hMIvlmv5Dp0oeqBaS59m7wEwjuWqXrwJ71TvFRmC1x8Vz39ff1zZhycX7W+BfoYyGXW
	ow7g==
Received: by 10.216.162.141 with SMTP id y13mr2592190wek.14.1345805774199;
	Fri, 24 Aug 2012 03:56:14 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id w7sm3804820wiz.0.2012.08.24.03.56.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Aug 2012 03:56:13 -0700 (PDT)
Date: Fri, 24 Aug 2012 11:56:07 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20120824105607.GD10867@stefanha-thinkpad.localdomain>
References: <1345467816-10893-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1345467816-10893-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
	qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] linux-user: Remove #if 0'd
 cpu_get_real_ticks() definition
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
X-List-Received-Date: Fri, 24 Aug 2012 10:56:23 -0000

On Mon, Aug 20, 2012 at 02:03:36PM +0100, Peter Maydell wrote:
> Remove the cpu_get_real_ticks() definition from linux-user/main.c.
> This has been disabled via #if 0 and unused since commit 1dce7c3c22
> in 2006; the definitions we actually use are in qemu-timer.h.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  linux-user/main.c |   13 -------------
>  1 file changed, 13 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

