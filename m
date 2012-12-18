Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tkzxe-0003ME-Q1
	for mharc-qemu-trivial@gnu.org; Tue, 18 Dec 2012 11:24:06 -0500
Received: from eggs.gnu.org ([208.118.235.92]:41326)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TkzxY-000345-OS
	for qemu-trivial@nongnu.org; Tue, 18 Dec 2012 11:24:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TkzxX-0004st-Bn
	for qemu-trivial@nongnu.org; Tue, 18 Dec 2012 11:24:00 -0500
Received: from mail-wi0-f177.google.com ([209.85.212.177]:46942)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TkzxX-0004sp-5u; Tue, 18 Dec 2012 11:23:59 -0500
Received: by mail-wi0-f177.google.com with SMTP id hm2so528711wib.4
	for <multiple recipients>; Tue, 18 Dec 2012 08:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=q6WA4Tz98+yROV8hs+MgBt3mxP0U8jh16BTLvFZuG5A=;
	b=VQKnD+cDZA2EnJEYsnb4CgcP7xg1cpJkyUa6lFUnRyvvBEN+6UR7/vOkGm1xGZf6i+
	dnuMWf3FaiXvJS7/pk0Pz6+4vjjr3eYrmvvCRZOT0mUEmD77y+CvAuQSOVqFtk16/Sps
	TpGdc0QSFT1SIPTWDAjZqC/Mmfgsmvy7wJJygEp6k2JPPXWX3aBvbi5qtxb3VqKTVAaE
	akkG4jNtJrAOLOTEyMJ5yoOC20HYAuPYFWM2gsa5GI1whzzrDMxGSO2cQup3Yx1ohra4
	mnHfeHilAp2uuFg94d7cZi0jSxHwFVZybxa87Pbx3I52HCMpJVAmmrN/zqpTLbNUNqwd
	SSaA==
X-Received: by 10.180.87.102 with SMTP id w6mr5463789wiz.19.1355847838178;
	Tue, 18 Dec 2012 08:23:58 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id i6sm16486108wix.5.2012.12.18.08.23.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Dec 2012 08:23:57 -0800 (PST)
Date: Tue, 18 Dec 2012 17:23:55 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: John Spencer <maillist-qemu@barfooze.de>
Message-ID: <20121218162355.GE12099@stefanha-thinkpad.redhat.com>
References: <1355122786-29243-1-git-send-email-maillist-qemu@barfooze.de>
	<1355122786-29243-4-git-send-email-maillist-qemu@barfooze.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1355122786-29243-4-git-send-email-maillist-qemu@barfooze.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.212.177
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 4/4] linux-user/syscall.c: remove wrong
 forward decl of setgroups()
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
X-List-Received-Date: Tue, 18 Dec 2012 16:24:05 -0000

On Mon, Dec 10, 2012 at 07:59:46AM +0100, John Spencer wrote:
> this declaration is wrong:
> the correct prototype on linux is:
> int setgroups(size_t size, const gid_t *list);
> 
> since by default musl libc exposes this symbol in unistd.h
> additionally to grp.h, the wrong declaration causes a build error.
> 
> the proper fix is to simply include the correct header.
> 
> Signed-off-by: John Spencer <maillist-qemu@barfooze.de>
> 
> ---
>  linux-user/syscall.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied Patch 4 to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

