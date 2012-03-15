Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S880u-0007Dw-80
	for mharc-qemu-trivial@gnu.org; Thu, 15 Mar 2012 06:34:32 -0400
Received: from eggs.gnu.org ([208.118.235.92]:53760)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S880i-0006kV-Sk
	for qemu-trivial@nongnu.org; Thu, 15 Mar 2012 06:34:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S880c-0006Rc-Li
	for qemu-trivial@nongnu.org; Thu, 15 Mar 2012 06:34:20 -0400
Received: from mail-we0-f173.google.com ([74.125.82.173]:48362)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1S880O-0006DJ-VL; Thu, 15 Mar 2012 06:34:01 -0400
Received: by werp12 with SMTP id p12so3059149wer.4
	for <multiple recipients>; Thu, 15 Mar 2012 03:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=PXdaXrKfgl55dR1TjMGhWwjZf+00WhgQ5mYDfAnFvs8=;
	b=NAI228oj6Npo3wsX266rbdq0HH9JRXFFpjncHGaEyMlqMCR1TGJdoIyaSoXIjng2hW
	uczyrndGTxv5mzq38AlL703dzYMJ+WlP0wPhfrt6uAYTx2qF5Lul8/blse64WBzRHBD2
	9oPnfXuv/rcQNHICkr8VYA9ueDT7Fx0NTkt9tnRb1p/ZldxhacZjigA8zBYUN4Ogprrr
	udb3pkNeHe6U48GSpmfboWXkwPzCzbOevTwu10qxzj+5LsHw9drZfhUmT+BalfMLkhDw
	QOKAYc/UpemW8kxp5Pmr+B9HLC+zs+J8mVH8AS298FQy7pYk6sZGFiB0iTL8HUNB5n1G
	O3Tg==
Received: by 10.180.80.104 with SMTP id q8mr14279710wix.14.1331807638356;
	Thu, 15 Mar 2012 03:33:58 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id k6sm4043111wiy.7.2012.03.15.03.33.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Mar 2012 03:33:57 -0700 (PDT)
Date: Thu, 15 Mar 2012 10:33:54 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jeff Cody <jcody@redhat.com>
Message-ID: <20120315103354.GA13004@stefanha-thinkpad.localdomain>
References: <14fd588cffd843789d6b6a4379f42ac1b2a6fbbf.1331575674.git.jcody@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14fd588cffd843789d6b6a4379f42ac1b2a6fbbf.1331575674.git.jcody@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, lcapitulino@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] monitor: Remove unused bool
 field 'qapi' in mon_cmd_t struct
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
X-List-Received-Date: Thu, 15 Mar 2012 10:34:30 -0000

On Mon, Mar 12, 2012 at 02:13:57PM -0400, Jeff Cody wrote:
> Some minor code cleanup: the 'qapi' bool field in mon_cmd_t is
> unused, and can be removed.
> 
> Signed-off-by: Jeff Cody <jcody@redhat.com>
> ---
>  monitor.c |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

