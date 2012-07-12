Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SpGsn-0006WZ-G0
	for mharc-qemu-trivial@gnu.org; Thu, 12 Jul 2012 06:44:29 -0400
Received: from eggs.gnu.org ([208.118.235.92]:47712)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SpGsk-0006V8-Lw
	for qemu-trivial@nongnu.org; Thu, 12 Jul 2012 06:44:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SpGse-0008R8-Vz
	for qemu-trivial@nongnu.org; Thu, 12 Jul 2012 06:44:26 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:55087)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SpGse-0008Qs-Ob; Thu, 12 Jul 2012 06:44:20 -0400
Received: by bkcji1 with SMTP id ji1so1617592bkc.4
	for <multiple recipients>; Thu, 12 Jul 2012 03:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wkC5wFWDWxC8L/lHJsBJ9LecBowHxcK/t4HpTjFVlSM=;
	b=Ao9L+3+qu3VQ+uSwkStdg7pVNSmInMAPoJFU9jxa9NnCwokhlNWQEOH+uo57YFFyUm
	D7wgHxP6Sd5LFNw4ULa0N+1VhakgiaYy2zj2tmDvk11NULeMwQK0skb5I6a78UsS+Rkg
	c2lpbdh0oqRcZ1wlkfQxlOQocf5H3ZTb/yzH4zy5z5eBmBurcftH3rwWZ/y1kaDbHr7p
	bDgVco2Z0fbwMa1VI/cke15kOcvI3Ucm6EEpZp1OsWqn3YVbzAOvc+DwrLBH3n5xcrSG
	+GS4fruFgGLVpx6JBGY9j2UH+J5IopkpVs/ODwwO8tieSZAzrypN9UTkVonT5yOz9r1W
	CMoA==
Received: by 10.204.130.209 with SMTP id u17mr9224865bks.35.1342089858842;
	Thu, 12 Jul 2012 03:44:18 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id 25sm2702506bkx.9.2012.07.12.03.44.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Jul 2012 03:44:18 -0700 (PDT)
Date: Thu, 12 Jul 2012 11:44:16 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Hannes Reinecke <hare@suse.de>
Message-ID: <20120712104416.GA22719@stefanha-thinkpad.localdomain>
References: <1341396127-31269-1-git-send-email-hare@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1341396127-31269-1-git-send-email-hare@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, Blue Swirl <blauwirbel@gmail.com>,
	qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] megasas: mark mfi_frame_desc as 'static'
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
X-List-Received-Date: Thu, 12 Jul 2012 10:44:27 -0000

On Wed, Jul 04, 2012 at 12:02:07PM +0200, Hannes Reinecke wrote:
> Suggested by blue swirl. Patch is on top of Paolo's
> scsi-next tree.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Blue Swirl <blauwirbel@gmail.com>
> ---
>  hw/megasas.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

