Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R0Ecd-0006ec-GL
	for mharc-qemu-trivial@gnu.org; Sun, 04 Sep 2011 11:28:35 -0400
Received: from eggs.gnu.org ([140.186.70.92]:48382)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1R0Ecb-0006a9-Dc
	for qemu-trivial@nongnu.org; Sun, 04 Sep 2011 11:28:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1R0Eca-0003L9-H4
	for qemu-trivial@nongnu.org; Sun, 04 Sep 2011 11:28:33 -0400
Received: from mail-wy0-f173.google.com ([74.125.82.173]:43230)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1R0EcY-0003Jz-05; Sun, 04 Sep 2011 11:28:30 -0400
Received: by mail-wy0-f173.google.com with SMTP id 22so3696567wyf.4
	for <multiple recipients>; Sun, 04 Sep 2011 08:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=DK6QEA0PVGB3lPT674IB7oL1RBrXpm09kAs42TCxNxY=;
	b=XYbDv5kLvfKuEHIbo2t2toUPxgvxRIkql9mVpkbfj+qVN5rWt0/pNAXH+OPtgk3SYU
	3L2R9CKG0cQyrevp+fyoFXjo+F+K46PxHwJ18nUDvE2/K8lHaRTOlJRcFseGAzkOOAPx
	skaVLGS77b5bQ+BYtA3FJcOvsbZMxD+CKTWso=
Received: by 10.227.55.17 with SMTP id s17mr2925032wbg.57.1315150109477;
	Sun, 04 Sep 2011 08:28:29 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain ([109.224.133.37])
	by mx.google.com with ESMTPS id ex16sm5214294wbb.4.2011.09.04.08.28.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Sep 2011 08:28:28 -0700 (PDT)
Date: Sun, 4 Sep 2011 16:28:25 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <weil@mail.berlios.de>
Message-ID: <20110904152825.GB15133@stefanha-thinkpad.localdomain>
References: <1315142972-11450-1-git-send-email-weil@mail.berlios.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1315142972-11450-1-git-send-email-weil@mail.berlios.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Remove relicts
 from --enable-io-thread
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
X-List-Received-Date: Sun, 04 Sep 2011 15:28:34 -0000

On Sun, Sep 04, 2011 at 03:29:32PM +0200, Stefan Weil wrote:
> Commit 12d4536f7d911b6d87a766ad7300482ea663cea2 removed
> configure option --enable-io-thread.
> 
> Remove help message which is now no longer valid.
> 
> Cc: Anthony Liguori <aliguori@us.ibm.com>
> Signed-off-by: Stefan Weil <weil@mail.berlios.de>
> ---
>  configure |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches -next tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches-next

Stefan

