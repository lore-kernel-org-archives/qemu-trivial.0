Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TkzSU-00087U-Ne
	for mharc-qemu-trivial@gnu.org; Tue, 18 Dec 2012 10:51:54 -0500
Received: from eggs.gnu.org ([208.118.235.92]:34629)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TkzSS-00081b-M2
	for qemu-trivial@nongnu.org; Tue, 18 Dec 2012 10:51:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TkzSO-0003go-JA
	for qemu-trivial@nongnu.org; Tue, 18 Dec 2012 10:51:52 -0500
Received: from mail-we0-f178.google.com ([74.125.82.178]:38799)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TkzSH-0003eZ-Nr; Tue, 18 Dec 2012 10:51:41 -0500
Received: by mail-we0-f178.google.com with SMTP id x43so410602wey.9
	for <multiple recipients>; Tue, 18 Dec 2012 07:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=NuWTPbxm/x4XW+p+eV27VxeT9yAk6KpOGZhHfQ+XH5w=;
	b=mbwnl4vBkkFQ1oMg2D65bFCx3aUvlmAkCBK8oVt602QWxuSjki7j601sYWiTiaojcr
	Ccaq/JIzHRXv0cYknTnUTRjrmgsOCjbys9OoqgRJZbF4TMU7m9GCOHk891Nz9VtnveQx
	aKFJ2nAFVA+zjfNy0lpk/3ynKdlDNvvxodSs0rzhLHDTaJaz2Lp3KAbxiyq0kx8rE0Wg
	ZqVfOPeJIJJiQpKWuqyAMoIzIBMaCdTtG6qVG56cFPEJB9+JFGHh4fkN5s87WXKt9ofh
	D1PAl3jGGdxb0t2lJ9eeJA1tkagPlFgWsG3A6XwH0y0Pq4TRKQxIPrZucHt7u/nLceFm
	TnXQ==
X-Received: by 10.180.81.39 with SMTP id w7mr5258057wix.15.1355845900539;
	Tue, 18 Dec 2012 07:51:40 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id h19sm16368531wiv.7.2012.12.18.07.51.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Dec 2012 07:51:39 -0800 (PST)
Date: Tue, 18 Dec 2012 16:51:33 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Message-ID: <20121218155133.GA12099@stefanha-thinkpad.redhat.com>
References: <cover.1354600680.git.peter.crosthwaite@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1354600680.git.peter.crosthwaite@xilinx.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.125.82.178
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v1 0/4] Trivial patches
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
X-List-Received-Date: Tue, 18 Dec 2012 15:51:54 -0000

On Tue, Dec 04, 2012 at 04:04:32PM +1000, Peter Crosthwaite wrote:
> My trivial patches from during the freeze.
> 
> Peter Crosthwaite (4):
>   pflash_cfi01: qemu_log_mask "unimplemented" msg
>   pflash_cfi0x: Send debug messages to stderr
>   zynq_slcr: Compile time warning fixes.
>   arm_gic: Add cpu nr to Raised IRQ message
> 
>  hw/arm_gic.c      |    2 +-
>  hw/pflash_cfi01.c |   14 +++++++-------
>  hw/pflash_cfi02.c |    6 +++---
>  hw/zynq_slcr.c    |    7 ++++---
>  4 files changed, 15 insertions(+), 14 deletions(-)
> 
> 

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

