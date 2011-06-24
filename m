Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Qa3Ze-0006FL-G0
	for mharc-qemu-trivial@gnu.org; Fri, 24 Jun 2011 06:25:18 -0400
Received: from eggs.gnu.org ([140.186.70.92]:34566)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Qa3Za-0006Cg-Qi
	for qemu-trivial@nongnu.org; Fri, 24 Jun 2011 06:25:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Qa3ZY-0002Ji-D9
	for qemu-trivial@nongnu.org; Fri, 24 Jun 2011 06:25:14 -0400
Received: from mail-ww0-f53.google.com ([74.125.82.53]:53589)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Qa3ZT-0002Fk-Ro; Fri, 24 Jun 2011 06:25:08 -0400
Received: by wwf26 with SMTP id 26so2409032wwf.10
	for <multiple recipients>; Fri, 24 Jun 2011 03:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=SItrTblBbFvbezldaU9Xp1BLA50OGeBfyuvd2qK1w0c=;
	b=sQ2GM2A5uAm6cKkEOnDXZgw+FM70xO/6trO8KqG95rSyh+a611OtlWIP/u5vEszeXw
	xDxJgmUhjHXyzY4Z8WeOO4x9HLUJco1Ee1LHOnaaa3nu11flBHGbEW/IDOeHI3TKKB4O
	cqTlXTFaLHzxAMe5Uij42EFENDwffI3sUbJ7U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=xRQ7fg6+48KD9MBzfs3F6Sk6l5XBDDmsCPFnSZkCk3iazB5luJ1W+viCDVrQ1HIUgM
	WIxPk+KWzSHHPVIOGM75SIac4XHuAIlhwwXPnZjXCW7+wQvW2dZITSssyJQEjBMPI7d3
	FSmA2IW7E07hVoL2q4fuMgavdtrY50VF/vM7g=
Received: by 10.227.206.82 with SMTP id ft18mr2847107wbb.64.1308911105567;
	Fri, 24 Jun 2011 03:25:05 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain
	(gbibp9ph1--blueice2n1.emea.ibm.com [195.212.29.75])
	by mx.google.com with ESMTPS id et5sm1893522wbb.50.2011.06.24.03.25.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Jun 2011 03:25:04 -0700 (PDT)
Date: Fri, 24 Jun 2011 11:24:59 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <weil@mail.berlios.de>
Message-ID: <20110624102459.GA18653@stefanha-thinkpad.localdomain>
References: <1308856793-29724-1-git-send-email-weil@mail.berlios.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1308856793-29724-1-git-send-email-weil@mail.berlios.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] Fix compilation for non-POSIX system
	(w64)
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
X-List-Received-Date: Fri, 24 Jun 2011 10:25:16 -0000

On Thu, Jun 23, 2011 at 09:19:53PM +0200, Stefan Weil wrote:
> compatfd.h is only needed with CONFIG_POSIX.
> Compilation fails in compatfd.h for at least one non-POSIX systems (w64).
> 
> Signed-off-by: Stefan Weil <weil@mail.berlios.de>
> ---
>  cpus.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)

Thanks!  Jan's patch which is similar but uses #ifndef _WIN32 is already
queued.  The cpus.c qemu_signalfd() usage is #ifndef _WIN32, so I think
there's a logic to keeping that patch.

Stefan

