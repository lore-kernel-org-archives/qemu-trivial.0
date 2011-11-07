Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RNLOV-0006yz-7E
	for mharc-qemu-trivial@gnu.org; Mon, 07 Nov 2011 04:21:31 -0500
Received: from eggs.gnu.org ([140.186.70.92]:34641)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RNLOR-0006nF-Q7
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2011 04:21:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RNLOQ-0001MK-Lg
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2011 04:21:27 -0500
Received: from mail-fx0-f45.google.com ([209.85.161.45]:56270)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RNLON-0001L3-Of; Mon, 07 Nov 2011 04:21:23 -0500
Received: by mail-fx0-f45.google.com with SMTP id p15so5986632faa.4
	for <multiple recipients>; Mon, 07 Nov 2011 01:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1dfGhQ70U0EumVUlcWkV3YEatSkLU0X3J1w4141qfQE=;
	b=jovrBKodDBASMC7baoYnm3Bw4lNEiJ1KEMB/c+NJ/fSn1bFAdmrNmuOUAUrx5s+o4Y
	CFLtXDiBBvdX7DCQYd5vIY6M/ZX4HFsss01atdpNLHIBYBpvn+lh0cCxLoLHtTPndds5
	Dvg+0xLXkVv/+U/LAuTyzuQb/5Z5FmlWl+UFo=
Received: by 10.223.7.20 with SMTP id b20mr45692717fab.21.1320657683275;
	Mon, 07 Nov 2011 01:21:23 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	x19sm30553353fag.5.2011.11.07.01.21.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Nov 2011 01:21:22 -0800 (PST)
Date: Mon, 7 Nov 2011 08:07:55 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20111107080755.GB9450@stefanha-thinkpad.localdomain>
References: <1320420911-32151-1-git-send-email-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1320420911-32151-1-git-send-email-anthony.perard@citrix.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.45
Cc: qemu-trivial@nongnu.org, QEMU-devel <qemu-devel@nongnu.org>,
	Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Subject: Re: [Qemu-trivial] [PATCH] xen-platform: Fix IO port read/write
 functions
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
X-List-Received-Date: Mon, 07 Nov 2011 09:21:29 -0000

On Fri, Nov 04, 2011 at 03:35:11PM +0000, Anthony PERARD wrote:
> Somehow, the read/write functions handle an offset that does not exist anymore.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> ---
>  hw/xen_platform.c |   18 +++++++++---------
>  1 files changed, 9 insertions(+), 9 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

