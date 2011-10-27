Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RJL35-0007VI-C7
	for mharc-qemu-trivial@gnu.org; Thu, 27 Oct 2011 04:10:51 -0400
Received: from eggs.gnu.org ([140.186.70.92]:33984)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RJL2x-00073X-Rv
	for qemu-trivial@nongnu.org; Thu, 27 Oct 2011 04:10:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RJL2w-0007vf-6e
	for qemu-trivial@nongnu.org; Thu, 27 Oct 2011 04:10:43 -0400
Received: from mail-ey0-f173.google.com ([209.85.215.173]:39922)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RJL2r-0007ua-LC; Thu, 27 Oct 2011 04:10:37 -0400
Received: by eyh6 with SMTP id 6so2486272eyh.4
	for <multiple recipients>; Thu, 27 Oct 2011 01:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2x/pNDuUI3AD3b6Bc1Px23lRqtPaM5ih8wAHdSec+MI=;
	b=DtabfZIuhXyNLPgFzade3EICM0irANuCXj/1SZBMekvmr3tjzRbUgC4z4dyNfSOo9F
	ehXB/Xnr99vHjIxJVH+Zgnnx0rvex3Bw7Wc9aqCkrbHXsUh1vQMG6f0L2AfumGbcoIV5
	1F5aMm3Corbr252jk23rHxF/BRXDvO3Qog1vQ=
Received: by 10.14.14.80 with SMTP id c56mr4428647eec.197.1319703036229;
	Thu, 27 Oct 2011 01:10:36 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id 54sm12603851eex.8.2011.10.27.01.10.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 27 Oct 2011 01:10:34 -0700 (PDT)
Date: Thu, 27 Oct 2011 08:05:36 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Eric Sunshine <sunshine@sunshineco.com>
Message-ID: <20111027070536.GA32265@stefanha-thinkpad.localdomain>
References: <1319658678-18355-1-git-send-email-sunshine@sunshineco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1319658678-18355-1-git-send-email-sunshine@sunshineco.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.215.173
Cc: qemu-trivial@nongnu.org, Stefan Weil <weil@mail.berlios.de>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] Teach block/vdi about "discarded" (no
 longer allocated) blocks
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
X-List-Received-Date: Thu, 27 Oct 2011 08:10:46 -0000

On Wed, Oct 26, 2011 at 03:51:18PM -0400, Eric Sunshine wrote:
> An entry in the VDI block map will hold an offset to the actual block if
> the block is allocated, or one of two specially-interpreted values if
> not allocated. Using VirtualBox terminology, value VDI_IMAGE_BLOCK_FREE
> (0xffffffff) represents a never-allocated block (semantically arbitrary
> content).  VDI_IMAGE_BLOCK_ZERO (0xfffffffe) represents a "discarded"
> block (semantically zero-filled).  block/vdi knows only about
> VDI_IMAGE_BLOCK_FREE.  Teach it about VDI_IMAGE_BLOCK_ZERO.
> 
> Signed-off-by: Eric Sunshine <sunshine@sunshineco.com>
> ---
> 
> Without this patch, "qemu-image check" on a VDI image containing
> discarded blocks reports errors such as:
> 
>   ERROR: block index 3434 too large, is 4294967294
> 
> Decimal 4294967294 is 0xfffffffe. Worse, "qemu-image convert" or direct
> access of the VDI image from qemu involves reads and writes of blocks at
> the bogus block offset 4294967294 within the image file.
> 
> Cc: Stefan Weil <weil@mail.berlios.de>
> Cc: Kevin Wolf <kwolf@redhat.com>
> 
>  block/vdi.c |   23 ++++++++++++++---------
>  1 files changed, 14 insertions(+), 9 deletions(-)

Good to see this improvement.  I recently talked to a CernVM developer
who had issues with vdi images.  This may fix the issue they were
seeing.

I think Kevin should take this through the block tree.  I won't apply it
to trivial-patches.

Stefan

