Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R6JwN-0006Te-1M
	for mharc-qemu-trivial@gnu.org; Wed, 21 Sep 2011 06:22:07 -0400
Received: from eggs.gnu.org ([140.186.70.92]:58861)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1R6JwJ-0006TD-AT
	for qemu-trivial@nongnu.org; Wed, 21 Sep 2011 06:22:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1R6JwD-0005Rx-Hw
	for qemu-trivial@nongnu.org; Wed, 21 Sep 2011 06:22:03 -0400
Received: from mail-ew0-f47.google.com ([209.85.215.47]:42246)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1R6JwD-0005Rp-Bj; Wed, 21 Sep 2011 06:21:57 -0400
Received: by ewy7 with SMTP id 7so1203031ewy.34
	for <multiple recipients>; Wed, 21 Sep 2011 03:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bbnXZ1Vk5Z2PLPW1oLH2dQdS5u1b/6gkUI2mSMt2wq4=;
	b=rMnapYrYyOmBwvofusF0RRTXdtK4ZT1wgzosJWIk/SCfpwN9FBYTC1nvwqGrLvYjzv
	L0gWaLpMxdrxlqVyTKv8BeDQ77Xxlw1nNtQEPzPVBG5Utjr0N1vzbYz9QewyE36BzTCc
	xWoA0v8QynN+t10f0C3A9gKmzzw7qj0dtiBXA=
Received: by 10.216.140.165 with SMTP id e37mr1972264wej.71.1316600516291;
	Wed, 21 Sep 2011 03:21:56 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id en9sm6288898wbb.24.2011.09.21.03.21.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Sep 2011 03:21:55 -0700 (PDT)
Date: Wed, 21 Sep 2011 11:21:53 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <20110921102153.GA5351@stefanha-thinkpad.localdomain>
References: <4E78AD3E.5070509@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4E78AD3E.5070509@siemens.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.215.47
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] Drop unneeded pthread.h inclusions
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
X-List-Received-Date: Wed, 21 Sep 2011 10:22:04 -0000

On Tue, Sep 20, 2011 at 05:11:58PM +0200, Jan Kiszka wrote:
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  hw/xen_nic.c       |    1 -
>  hw/xics.c          |    2 --
>  ui/spice-display.c |    2 --
>  3 files changed, 0 insertions(+), 5 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

