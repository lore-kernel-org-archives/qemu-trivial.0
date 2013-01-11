Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TtaAP-00068L-NU
	for mharc-qemu-trivial@gnu.org; Fri, 11 Jan 2013 03:40:45 -0500
Received: from eggs.gnu.org ([208.118.235.92]:34186)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TtaAK-00068E-R3
	for qemu-trivial@nongnu.org; Fri, 11 Jan 2013 03:40:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TtaAF-0003UN-Ce
	for qemu-trivial@nongnu.org; Fri, 11 Jan 2013 03:40:40 -0500
Received: from mail-we0-f169.google.com ([74.125.82.169]:51672)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TtaAF-0003UF-5i; Fri, 11 Jan 2013 03:40:35 -0500
Received: by mail-we0-f169.google.com with SMTP id t49so728835wey.14
	for <multiple recipients>; Fri, 11 Jan 2013 00:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=WsX2R42PhLYGI1dIOPPZFxXcnuANzbsgzrYTXpr+TBQ=;
	b=LS0G8DM9YRFxLiqcngk0U/Wd58wdisZN5LepsRTpZVQeJEhri/7DuaogEtYOgPLcW6
	QK/dN3CULUsuZB/ynAyVPHYxBg3bOVibjtIYqtZB5T8b2QEUdUDsBXGPsizDBenP1BF3
	UumtH176SmOZ8TpWotpn6TI2wthNbolQshzXqNAKzxDP0RvBKctqC3yDIpRxrFtwLKvF
	7fHILdq/IqEZg3ZrQHmKeuUZEc+8eNDIWjnYMVgHmRMN4DF2lqCZNa9BfeIXVTQxQKPX
	HU2WZPID8+BSL4pKGkrTq1KtVyJ6J6UiPRkn0DhbPiA31J8Ng/yWTqzw+GmJtkfw0rx2
	/MoA==
X-Received: by 10.180.109.195 with SMTP id hu3mr13652915wib.31.1357893634252; 
	Fri, 11 Jan 2013 00:40:34 -0800 (PST)
Received: from localhost (nat-pool-muc-t.redhat.com. [209.132.186.12])
	by mx.google.com with ESMTPS id g2sm6150708wiy.0.2013.01.11.00.40.32
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 11 Jan 2013 00:40:33 -0800 (PST)
Date: Fri, 11 Jan 2013 09:40:31 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20130111084031.GC23656@stefanha-thinkpad.muc.redhat.com>
References: <1357593627-25648-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1357593627-25648-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.125.82.169
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] savevm: Remove MinGW specific code which
 is no longer needed
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
X-List-Received-Date: Fri, 11 Jan 2013 08:40:44 -0000

On Mon, Jan 07, 2013 at 10:20:27PM +0100, Stefan Weil wrote:
> QEMU provides a portable function qemu_gettimeofday instead of
> gettimeofday and also an implementation of localtime_r for MinGW.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  savevm.c |   30 ++----------------------------
>  1 file changed, 2 insertions(+), 28 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

