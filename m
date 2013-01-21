Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TxEmp-0007bU-67
	for mharc-qemu-trivial@gnu.org; Mon, 21 Jan 2013 05:39:31 -0500
Received: from eggs.gnu.org ([208.118.235.92]:47836)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TxEmm-0007aY-8c
	for qemu-trivial@nongnu.org; Mon, 21 Jan 2013 05:39:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TxEmk-0001Eh-OQ
	for qemu-trivial@nongnu.org; Mon, 21 Jan 2013 05:39:28 -0500
Received: from mail-bk0-f51.google.com ([209.85.214.51]:48953)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TxEmk-0001EJ-Ge; Mon, 21 Jan 2013 05:39:26 -0500
Received: by mail-bk0-f51.google.com with SMTP id y8so544084bkt.10
	for <multiple recipients>; Mon, 21 Jan 2013 02:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=z7tjM8PRUg8ccKkiCkfvXWVU4a558OepIINXNCWs0LE=;
	b=hOVgrWszs/4qzNlxct3LCgXS74FmjHa04yXujNqW1mFFb9lEJfRxXjamckU34Q4G+x
	XSzmbX46KQAhdznVyqwwMjjsf3Lk59mw5thIgLptgisVgo+IrlfMu2/k/9KxSNJC1fQw
	B+TknVwr1sM7nY9ZfXnefwPp+DgN/1L+krxeqSqH7Ald2AW7+GXQPD1uqf5zRzoIfPgh
	EK9XZ/6fjiH2ax4hjAmhDfmWrrSQM+74n/SwpkKdjqFw8nOxivu6PcZkNgxTC4mEg5yY
	EE/udboczNVhpfkljAEA6Y0wQOl0CrI1L/D7FwI5tqayX4ZotNlMT0v5UxXGpDx6LA53
	Nh2g==
X-Received: by 10.204.4.133 with SMTP id 5mr4802799bkr.21.1358764764908;
	Mon, 21 Jan 2013 02:39:24 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id e22sm7913964bke.14.2013.01.21.02.39.23
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 21 Jan 2013 02:39:24 -0800 (PST)
Date: Mon, 21 Jan 2013 11:39:22 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20130121103922.GA9472@stefanha-thinkpad.redhat.com>
References: <1358750991-18501-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1358750991-18501-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.214.51
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] hw/tpci200: Fix compiler
 warning (redefined symbol with MinGW)
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
X-List-Received-Date: Mon, 21 Jan 2013 10:39:29 -0000

On Mon, Jan 21, 2013 at 07:49:51AM +0100, Stefan Weil wrote:
> STATUS_TIMEOUT is defined in winnt.h:
> 
>   CC    hw/tpci200.o
> hw/tpci200.c:34:0:
>  warning: "STATUS_TIMEOUT" redefined [enabled by default]
> /usr/lib/gcc/x86_64-w64-mingw32/4.6/../../../../x86_64-w64-mingw32/include/winnt.h:1036:0:
>  note: this is the location of the previous definition
> 
> Use STATUS_TIME instead of STATUS_TIMEOUT as suggested by Alberto Garcia.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> 
> v1: Add QEMU_PREFIX (http://patchwork.ozlabs.org/patch/212348/)
> v2: Use STATUS_TIME
> 
> Like v1, this patch fixes a warning for MinGW.
> We could also mix v1 and v2.
> 
> Please commit one of those variants to git master.
> 
> Regards,
> Stefan W.
> 
> 
>  hw/tpci200.c |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

