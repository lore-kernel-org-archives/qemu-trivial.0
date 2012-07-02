Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Slcee-0007J5-Ap
	for mharc-qemu-trivial@gnu.org; Mon, 02 Jul 2012 05:10:48 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54768)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SlceV-0006uR-Tk
	for qemu-trivial@nongnu.org; Mon, 02 Jul 2012 05:10:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SlceR-00078z-7p
	for qemu-trivial@nongnu.org; Mon, 02 Jul 2012 05:10:39 -0400
Received: from mail-wg0-f53.google.com ([74.125.82.53]:65202)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SlceF-00072B-2U; Mon, 02 Jul 2012 05:10:23 -0400
Received: by wgbfm10 with SMTP id fm10so4538146wgb.10
	for <multiple recipients>; Mon, 02 Jul 2012 02:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Ls2Ixb1jERngkfsYy542/oBd5JXAbVzbTjOoKi82nOg=;
	b=s4DojlM6tSeQI/9gnwzITsQqq0HqfV4u88KPnvEoOYgKCPSFB5D/JuA/dr9x5+QNzJ
	92FQDnjsRyYTMeHV46QgtZAmMBxgCTYFe5y2XEM3te9LAiURwUEFTzsDsUROf5+z3xzR
	tzsniwozEyn95AvDPNn76BwRBQj94OfRoLKoWETEB3Vnid/cTeDwqOihQPDfnZ9rJM6C
	qpui2pxULyuJ65yh2tORD028svU+IPRxvPR/TxulbIsbD4/N5mNQXDWMYQNCXXPKueJF
	pF47amYhiMjeOYxwrEwE2gbxWmsxo4sQXkvpT9f+TInOQSH1fkQbdGzO4GkzVGr0qcZa
	/LLA==
Received: by 10.180.102.136 with SMTP id fo8mr21739773wib.19.1341220220163;
	Mon, 02 Jul 2012 02:10:20 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id
	db7sm23908282wib.6.2012.07.02.02.10.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 02 Jul 2012 02:10:19 -0700 (PDT)
Date: Mon, 2 Jul 2012 10:10:17 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20120702091017.GA25781@stefanha-thinkpad.localdomain>
References: <1340364659-20200-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1340364659-20200-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/2] cpu-common.h: remove
 pointless ifdef guards
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
X-List-Received-Date: Mon, 02 Jul 2012 09:10:46 -0000

On Fri, Jun 22, 2012 at 12:30:57PM +0100, Peter Maydell wrote:
> These patches remove a couple of pointless ifdef guards in cpu-common.h
> that I happened to notice.
> 
> Peter Maydell (2):
>   cpu-common.h: Remove unnecessary guard on including targphys.h
>   cpu-common.h: Remove a pointless ifndef CONFIG_USER_ONLY
> 
>  cpu-common.h |    4 ----
>  1 files changed, 0 insertions(+), 4 deletions(-)
> 
> 

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

