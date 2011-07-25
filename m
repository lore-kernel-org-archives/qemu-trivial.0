Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QlIIt-0000P1-7p
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jul 2011 06:22:27 -0400
Received: from eggs.gnu.org ([140.186.70.92]:51624)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QlIIq-0000Jy-NS
	for qemu-trivial@nongnu.org; Mon, 25 Jul 2011 06:22:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QlIIp-0005JX-Sj
	for qemu-trivial@nongnu.org; Mon, 25 Jul 2011 06:22:24 -0400
Received: from mail-fx0-f47.google.com ([209.85.161.47]:38029)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QlIIn-0005Iq-Em; Mon, 25 Jul 2011 06:22:21 -0400
Received: by fxg11 with SMTP id 11so9500353fxg.34
	for <multiple recipients>; Mon, 25 Jul 2011 03:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dYD/wGPm/mvapxMpjVQSYAt8SbN5Sl8jcnMK105RIws=;
	b=eBx5VJy3dF3mXyUaTsj+wlWeytRGplXvA19X0ldBGNL58LsXg6P2aMYRNghBTxLdYF
	6W13xLmyJyuPMn5Hc+eKi/aLDybZhiFhnPMZv2rYvKzTLbGl71Oq9I3wLG3FHYO7SXZk
	oMsNhQQKAeILEre5fypHl85Ygw81E4+CXEkLs=
Received: by 10.223.27.71 with SMTP id h7mr6587302fac.142.1311589340680;
	Mon, 25 Jul 2011 03:22:20 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain
	(gbibp9ph1--blueice3n2.emea.ibm.com [195.212.29.84])
	by mx.google.com with ESMTPS id 12sm3207286fad.16.2011.07.25.03.22.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Jul 2011 03:22:19 -0700 (PDT)
Date: Mon, 25 Jul 2011 11:22:16 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <weil@mail.berlios.de>
Message-ID: <20110725102216.GB15078@stefanha-thinkpad.localdomain>
References: <1311188196-2867-1-git-send-email-weil@mail.berlios.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1311188196-2867-1-git-send-email-weil@mail.berlios.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.47
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [Qemu-trivial] [PATCH] sh4: Fix potential crash in debug code
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
X-List-Received-Date: Mon, 25 Jul 2011 10:22:25 -0000

On Wed, Jul 20, 2011 at 08:56:35PM +0200, Stefan Weil wrote:
> cppcheck reports this error:
> 
> qemu/hw/sh_intc.c:390: error: Possible null pointer dereference:
>  s - otherwise it is redundant to check if s is null at line 385
> 
> If s were NULL, the printf() statement would crash.
> Setting braces fixes this bug.
> 
> Signed-off-by: Stefan Weil <weil@mail.berlios.de>
> ---
>  hw/sh_intc.c |    9 +++++----
>  1 files changed, 5 insertions(+), 4 deletions(-)

Aurelien Jarno is listed as active maintainer for this code.  Patches
should go through him.

Stefan

