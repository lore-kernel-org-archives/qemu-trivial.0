Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T1zlo-0002x1-Lz
	for mharc-qemu-trivial@gnu.org; Thu, 16 Aug 2012 09:05:52 -0400
Received: from eggs.gnu.org ([208.118.235.92]:51851)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T1zlh-0002wW-Ig
	for qemu-trivial@nongnu.org; Thu, 16 Aug 2012 09:05:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T1zlb-0007Td-Li
	for qemu-trivial@nongnu.org; Thu, 16 Aug 2012 09:05:45 -0400
Received: from mail-wg0-f53.google.com ([74.125.82.53]:60318)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1T1zlb-0007Sj-FK; Thu, 16 Aug 2012 09:05:39 -0400
Received: by wgbfm10 with SMTP id fm10so1921397wgb.10
	for <multiple recipients>; Thu, 16 Aug 2012 06:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=jcwaP6wzlPj0Ssktec2XiuQ3G/3ggk4ukgqizpZJlN8=;
	b=ttp/VgKmqYo6psQ5KswcqCefDx+0wWgpbMfSVA4AW9ndlaIF42uZ1U1zP8lv0b+N++
	dW9zKYs0h3gmFApfts9YoSvdYxiySqrjuC10qhKkUT6/ONz/Q9AEi1BV7gBUEhMGqxb/
	VMHG4ukwJAh4pwTWcX2t/K6+UHBEaQ0du757dzG7gWL1JpsTGigexiZokp3eKBJaz8kX
	lLHN5XagrfPiJHEByPu1g565406ApKGvx8Q8IvWWinFh8LBWaAx3c/nr18/hPkzuWVWs
	8QrEdM0BEOy8xW8hia/r0vweFFU05YX4ddWzgkIIpBfPz43BiPNa5iTzabGi8EgPmwJQ
	MBlg==
Received: by 10.180.104.200 with SMTP id gg8mr3038850wib.14.1345122338673;
	Thu, 16 Aug 2012 06:05:38 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id l5sm5679738wix.5.2012.08.16.06.05.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Aug 2012 06:05:38 -0700 (PDT)
Date: Thu, 16 Aug 2012 14:05:36 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120816130536.GA3249@stefanha-thinkpad.localdomain>
References: <1344629007-23311-1-git-send-email-sw@weilnetz.de>
	<1344629007-23311-2-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1344629007-23311-2-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix spelling (licenced ->
	licensed) in GPL
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
X-List-Received-Date: Thu, 16 Aug 2012 13:05:51 -0000

On Fri, Aug 10, 2012 at 10:03:26PM +0200, Stefan Weil wrote:
> The patch also fixes the case of "written".
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/imx_avic.c  |    4 ++--
>  hw/imx_timer.c |    4 ++--
>  hw/kzm.c       |    2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

