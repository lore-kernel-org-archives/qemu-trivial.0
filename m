Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R6JvG-00057n-3p
	for mharc-qemu-trivial@gnu.org; Wed, 21 Sep 2011 06:20:58 -0400
Received: from eggs.gnu.org ([140.186.70.92]:56871)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1R6JvD-00057a-GJ
	for qemu-trivial@nongnu.org; Wed, 21 Sep 2011 06:20:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1R6JvC-0005JG-Cx
	for qemu-trivial@nongnu.org; Wed, 21 Sep 2011 06:20:55 -0400
Received: from mail-wy0-f173.google.com ([74.125.82.173]:56509)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1R6JvC-0005Iw-8G; Wed, 21 Sep 2011 06:20:54 -0400
Received: by wyh22 with SMTP id 22so1745941wyh.4
	for <multiple recipients>; Wed, 21 Sep 2011 03:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1Bow6yZh6Kabn+lE3Awwd5yM+5jkO6+dLUfCuUAqW9g=;
	b=t2tFJ9mprxsrLo7Xm5mJB1Klg16IB7e2Ml/nxb6WHBtEX5GgkVniYTYTx8o7LZ9w42
	mxr+H4jz4DH1LmZqo1CXIaxl2HEBFzfOpjK3g/iaCUq3yz20CTr1HfFZu6lMpf6ggWXy
	HOo5onbLzLYKZrQ6kxT5PfsrqnHjnntgffSWg=
Received: by 10.227.3.4 with SMTP id 4mr511026wbl.35.1316600453423;
	Wed, 21 Sep 2011 03:20:53 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id gd6sm6336784wbb.1.2011.09.21.03.20.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Sep 2011 03:20:52 -0700 (PDT)
Date: Wed, 21 Sep 2011 11:20:50 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <20110921102050.GA5308@stefanha-thinkpad.localdomain>
References: <4E79921F.5080605@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4E79921F.5080605@siemens.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] Abort on thread layer errors
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
X-List-Received-Date: Wed, 21 Sep 2011 10:20:56 -0000

On Wed, Sep 21, 2011 at 09:28:31AM +0200, Jan Kiszka wrote:
> Makes it easier to catch the bug in gdb as there is no need to set an
> explicit breakpoint.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  qemu-thread-posix.c |    2 +-
>  qemu-thread-win32.c |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

