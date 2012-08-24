Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T4rXQ-0001ej-C1
	for mharc-qemu-trivial@gnu.org; Fri, 24 Aug 2012 06:54:52 -0400
Received: from eggs.gnu.org ([208.118.235.92]:42311)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T4rXJ-0001cc-Lc
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 06:54:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T4rXI-00042A-Iy
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 06:54:45 -0400
Received: from mail-wi0-f181.google.com ([209.85.212.181]:59714)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1T4rXI-000425-Aw; Fri, 24 Aug 2012 06:54:44 -0400
Received: by wibhm2 with SMTP id hm2so514848wib.10
	for <multiple recipients>; Fri, 24 Aug 2012 03:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=LG7cFIIgatzOGYvh4GpQ9/9mNEd2uMSJ5EWl3E1ii8I=;
	b=tqEF4xyECzFGpdrMV5EXH5+9zpDPy3lbFdTnTmus+ktTFKSguNbaE78DyoSMbdhZFV
	rgLmWkFbs8H7F83nfivIn3wwCPNkvSr9gI0wLSuETtX0BjZK9cYGfIqFjD6a7aUrAttG
	U94JGP6WEXcADessop7xtNtsfvaNRr61isrZIxg9eD1p83pNJb2w61SrnA3kOKExYEbp
	UpBp4brZGsS4URlNR3nnKdHV5uvHKw2KQYg1TS5ulO6erQaKdItaYxnX7Em1nqJTxaUk
	HWfkFHlRWuMoJxDY+O/mSe32dqjXXyK6gz8lbtTkRUiI4FAxB8t+kPISyj/8sS09j17T
	g09A==
Received: by 10.216.241.198 with SMTP id g48mr2256499wer.164.1345805683343;
	Fri, 24 Aug 2012 03:54:43 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id k2sm5722337wiz.7.2012.08.24.03.54.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Aug 2012 03:54:41 -0700 (PDT)
Date: Fri, 24 Aug 2012 11:54:36 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120824105436.GC10867@stefanha-thinkpad.localdomain>
References: <1345437900-8001-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1345437900-8001-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.181
Cc: qemu-trivial@nongnu.org, imammedo@redhat.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] qemu-common: Declare qemu_irq earlier
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
X-List-Received-Date: Fri, 24 Aug 2012 10:54:51 -0000

On Mon, Aug 20, 2012 at 06:45:00AM +0200, Stefan Weil wrote:
> This allows using qemu_irq in the target specific cpu.h.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  qemu-common.h |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)

I'm not sure if there's a reason why qemu_irq was previously hidden from
cpu.h but the code change itself is fine and no one else has commented.

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

