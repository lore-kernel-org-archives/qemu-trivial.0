Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SgYYj-0008Md-CB
	for mharc-qemu-trivial@gnu.org; Mon, 18 Jun 2012 05:47:45 -0400
Received: from eggs.gnu.org ([208.118.235.92]:42960)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SgYYb-0007x2-AK
	for qemu-trivial@nongnu.org; Mon, 18 Jun 2012 05:47:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SgYYZ-0005HG-G4
	for qemu-trivial@nongnu.org; Mon, 18 Jun 2012 05:47:36 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:53676)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SgYYZ-0005ES-7C; Mon, 18 Jun 2012 05:47:35 -0400
Received: by mail-bk0-f45.google.com with SMTP id j10so4061465bkw.4
	for <multiple recipients>; Mon, 18 Jun 2012 02:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2ysIq9aQgNqkoBLEpkYB35I6MrhVeKNAi/WeY+hvpIM=;
	b=zbwEjookZ6CkaFs66cMpFitac72jeRRdcLnvchbYM6QJy7a4p6rY9vMjQg0cLpWCmJ
	c5Leswtel9cxXeT7chUT//mDwKAx8bhgF+Lv+uHAQV12Gn4KcO+EEhAhJxCC9FSamS0i
	ReSZWISMCN91KyXv6GVo946GAQ5CUNfVFXKCk3OMMeBwF49n91/VBVFfD3LI3YRKsIlz
	gxE95fnsKQChdSd6DT70mPNbm3l6yumXzK6h75ON7FijPleXTtGJYf98TbsB9x5EyA8l
	dJhw5P5OYGPU0pCjLj+6VO7dX+iCXMn07ZVADjK3KI2+k5VvrLmyjeM99d/sookIfSHT
	Rhvw==
Received: by 10.204.156.213 with SMTP id y21mr6053259bkw.91.1340012853376;
	Mon, 18 Jun 2012 02:47:33 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id
	e20sm17849336bkw.3.2012.06.18.02.47.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Jun 2012 02:47:33 -0700 (PDT)
Date: Mon, 18 Jun 2012 10:47:30 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120618094730.GB6031@stefanha-thinkpad.localdomain>
References: <1339909061-30971-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1339909061-30971-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] checkpatch: Add QEMU specific rule
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
X-List-Received-Date: Mon, 18 Jun 2012 09:47:43 -0000

On Sun, Jun 17, 2012 at 06:57:41AM +0200, Stefan Weil wrote:
> The new rule detects two wrong variants of QEMU.
> It was tested with commit b5a8fe5e.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  scripts/checkpatch.pl |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

