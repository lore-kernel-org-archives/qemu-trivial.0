Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T1dkm-0004Hv-Hg
	for mharc-qemu-trivial@gnu.org; Wed, 15 Aug 2012 09:35:20 -0400
Received: from eggs.gnu.org ([208.118.235.92]:36821)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T1dkj-00048i-W4
	for qemu-trivial@nongnu.org; Wed, 15 Aug 2012 09:35:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T1dkj-0002NW-0N
	for qemu-trivial@nongnu.org; Wed, 15 Aug 2012 09:35:17 -0400
Received: from mail-wg0-f53.google.com ([74.125.82.53]:45725)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1T1dkb-0002Mv-ER; Wed, 15 Aug 2012 09:35:09 -0400
Received: by wgbfm10 with SMTP id fm10so1113763wgb.10
	for <multiple recipients>; Wed, 15 Aug 2012 06:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=V1k0oSyrnVFd0O/wIOXvcTM+450Fqw5EtLYpTkcwBwY=;
	b=kFTd+FWrc2wBJH1lmQ4+1tGSIrV7eD4k8OrY507xhLUjsLw1MezyCRsy7tvhTqafGX
	1shTXe3A8Gx5RR+mk2bLWzOB0YbsJ+9uAPkfAhR82a/t910g9uWOZwrlFPEWx5G6+/vE
	2x1PNKt/9ztXpOfoopr/Jz2lvvP/uUHM0WzN73ppE7rcgH005BGkS6JhbzoyigZ7LtYG
	u7A7PUiOp1yPj52MlxtxEZBcHF6UhLmE+K3IywQeYxqO6TFTZTaafXZTxuNfdngdpAAR
	+RVjmS0MhtmtGPAhrfpNuaSeggaQIFTXnFF0N9KhVCJHzKdlMABezhj3vMCy3eJ3CgY4
	QeFw==
Received: by 10.180.100.37 with SMTP id ev5mr37197044wib.5.1345037708419;
	Wed, 15 Aug 2012 06:35:08 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id el6sm28681926wib.8.2012.08.15.06.35.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Aug 2012 06:35:07 -0700 (PDT)
Date: Wed, 15 Aug 2012 14:35:04 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Alejandro Martinez Ruiz <alex@securiforest.com>
Message-ID: <20120815133504.GC10742@stefanha-thinkpad.localdomain>
References: <1344953582-24303-1-git-send-email-alex@securiforest.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1344953582-24303-1-git-send-email-alex@securiforest.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] ehci: fix assertion typo
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
X-List-Received-Date: Wed, 15 Aug 2012 13:35:19 -0000

On Tue, Aug 14, 2012 at 04:13:02PM +0200, Alejandro Martinez Ruiz wrote:
> Signed-off-by: Alejandro Martinez Ruiz <alex@securiforest.com>
> ---
>  hw/usb/hcd-ehci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Looks good but would be good to hear from Gerd just to be sure.

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

