Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R1wws-0004d0-Ai
	for mharc-qemu-trivial@gnu.org; Fri, 09 Sep 2011 05:00:34 -0400
Received: from eggs.gnu.org ([140.186.70.92]:36798)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1R1wwq-0004X5-Gm
	for qemu-trivial@nongnu.org; Fri, 09 Sep 2011 05:00:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1R1wwm-0001eE-6R
	for qemu-trivial@nongnu.org; Fri, 09 Sep 2011 05:00:32 -0400
Received: from mail-fx0-f45.google.com ([209.85.161.45]:40580)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1R1wwj-0001dR-0N; Fri, 09 Sep 2011 05:00:25 -0400
Received: by fxbb27 with SMTP id b27so2597185fxb.4
	for <multiple recipients>; Fri, 09 Sep 2011 02:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=i7Xu7SF8RR4RUJg2dMx2e4Q5R/9vgdTObDVm/tSPQVg=;
	b=QwwkxVpJzaUuZBoCIrjsN8olFeDz6htm2fGbxHjwo5sgzFhc463hG8jplnklXjErUV
	aNCV8ixYNcVb8gzkfrDmdySoCtLn+QKtyP0u/spsaO1dlhd0EK9zSVw4EA0a9g52skgm
	RHMaljmXY0e7jgo1tZ2vGH/FF3E0IA2wtbfao=
Received: by 10.223.97.210 with SMTP id m18mr1324552fan.127.1315558822256;
	Fri, 09 Sep 2011 02:00:22 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain
	(gbibp9ph1--blueice3n2.emea.ibm.com [195.212.29.84])
	by mx.google.com with ESMTPS id d23sm2591289fam.4.2011.09.09.02.00.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Sep 2011 02:00:21 -0700 (PDT)
Date: Fri, 9 Sep 2011 10:00:17 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <weil@mail.berlios.de>
Message-ID: <20110909090017.GC7699@stefanha-thinkpad.localdomain>
References: <1315497332-7258-1-git-send-email-weil@mail.berlios.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1315497332-7258-1-git-send-email-weil@mail.berlios.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.45
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>, QEMU Developers <qemu-devel@nongnu.org>,
	Jan Kiszka <jan.kiszka@siemens.com>
Subject: Re: [Qemu-trivial] [PATCH] Fix include statements for qemu-common.h
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
X-List-Received-Date: Fri, 09 Sep 2011 09:00:33 -0000

On Thu, Sep 08, 2011 at 05:55:32PM +0200, Stefan Weil wrote:
> * qemu-common.h is not a system include file, so it should be included
>   with "" instead of <>. Otherwise incremental builds might fail
>   because only local include files are checked for changes.
> 
> * linux-user/syscall.c included the file twice.
> 
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Riku Voipio <riku.voipio@iki.fi>
> Cc: Jan Kiszka <jan.kiszka@siemens.com>
> Signed-off-by: Stefan Weil <weil@mail.berlios.de>
> ---
>  hw/virtio-blk.c      |    2 +-
>  linux-user/syscall.c |    3 +--
>  nbd.h                |    2 +-
>  qemu-nbd.c           |    2 +-
>  slirp/libslirp.h     |    2 +-
>  5 files changed, 5 insertions(+), 6 deletions(-)

Thanks, applied to the trivial patches -next tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches-next

Perhaps I'm being too quick but seems like an obvious fix.

Stefan

