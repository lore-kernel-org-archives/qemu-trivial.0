Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TK6W8-0005YV-Du
	for mharc-qemu-trivial@gnu.org; Fri, 05 Oct 2012 07:56:32 -0400
Received: from eggs.gnu.org ([208.118.235.92]:40499)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TK6Vw-0004yB-5W
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2012 07:56:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TK6Vv-0004M9-4F
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2012 07:56:20 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:64392)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TK6Vm-0004KG-0i; Fri, 05 Oct 2012 07:56:10 -0400
Received: by mail-bk0-f45.google.com with SMTP id jf3so752827bkc.4
	for <multiple recipients>; Fri, 05 Oct 2012 04:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=HM5/2FpW9+bFWT6gTnFbFqxW+7e0aaByih8xoU/MeIU=;
	b=ADilY+aj5luKoEXHJIS7lfZOlpFrz7c+8EQ4BYI5tYcRwgKwhQtSu0FHAA+1QGN4uW
	gJfFyMPGPUnxErU6fdLHu20oLKsSZhAKD11OBbsLLxRm7YGYXWWBjf/YaNqWtCR9Prcq
	lblZYjXr8BJqtGiX/iItoRxOdL5XW903WPnLvxU24MCi6rtxRj6Q3mmUnKtv3CLjFmbc
	Civ090qgSxEuJGjn+2XDPGqqKJPJjglthPEF1Ozd0MXOzXynREomirpH0kwZiEtIqCpv
	rKtEkUZC6MjDD6Wt99tKi8TxTyqx9cGsuoHzx83iHwEbpc5sdHw/Fj33mWPMNAsBqzb4
	dVJQ==
Received: by 10.204.11.194 with SMTP id u2mr2642596bku.41.1349438168937;
	Fri, 05 Oct 2012 04:56:08 -0700 (PDT)
Received: from localhost ([82.113.121.2])
	by mx.google.com with ESMTPS id j24sm7479046bkv.0.2012.10.05.04.56.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 05 Oct 2012 04:56:08 -0700 (PDT)
Date: Fri, 5 Oct 2012 13:56:06 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20121005115606.GB7068@stefanha-thinkpad.redhat.com>
References: <1348383061-29754-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1348383061-29754-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] hw: Fix return value check for bdrv_read,
 bdrv_write
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
X-List-Received-Date: Fri, 05 Oct 2012 11:56:30 -0000

On Sun, Sep 23, 2012 at 08:51:01AM +0200, Stefan Weil wrote:
> Those functions return -errno in case of an error.
> The old code would typically only detect EPERM (1) errors.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/nand.c    |   34 ++++++++++++++++++++++------------
>  hw/onenand.c |    2 +-
>  hw/sd.c      |   16 +++++++++-------
>  3 files changed, 32 insertions(+), 20 deletions(-)

Applied, thanks!

https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

