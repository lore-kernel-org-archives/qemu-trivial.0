Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TVFh0-0003VL-Oe
	for mharc-qemu-trivial@gnu.org; Mon, 05 Nov 2012 00:57:50 -0500
Received: from eggs.gnu.org ([208.118.235.92]:47667)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TVFgx-0003Nt-JK
	for qemu-trivial@nongnu.org; Mon, 05 Nov 2012 00:57:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TVFgw-0001Pc-B4
	for qemu-trivial@nongnu.org; Mon, 05 Nov 2012 00:57:47 -0500
Received: from mail-bk0-f45.google.com ([209.85.214.45]:37143)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TVFgw-0001PE-0e; Mon, 05 Nov 2012 00:57:46 -0500
Received: by mail-bk0-f45.google.com with SMTP id jf3so1664620bkc.4
	for <multiple recipients>; Sun, 04 Nov 2012 21:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ZQ1QFiPgxnd2qCpuOzBoDjiM32xpL+5qalIjHtMGUqw=;
	b=OIPxIoBQ//cLTF5oIklAXziXpPZtSCzPHkMBfFyyiMZ29NVBbQAbD5lFux4bd9c43s
	RDTWZ6gYUA+zz083ddNQ//Ss21DEfvQ8stbAcnuF8gE/z6jNT05mKCtwJJ9BzT108Xmt
	ZkbNflyOvuuR6kHmtttWuCj6OwQT/UF7HDnJKeW8mFURxOStM4YZvgZcXO+Fxy0jnLSm
	jrG6wrsmM9NoNTuEK/9SBTmf4iBJ08cuwoIgzAsz7AvtdpDAKnvVPO/F7S7PtnBMmGO6
	Gaq2MqFGrdMPNzjA9PTDaOMppGlpzi9KIM304MrjKjVNbUM+URM0MP2E5xYIqiI1opDo
	qoJQ==
Received: by 10.204.129.211 with SMTP id p19mr2094707bks.94.1352095064334;
	Sun, 04 Nov 2012 21:57:44 -0800 (PST)
Received: from localhost (88.Red-2-139-206.staticIP.rima-tde.net.
	[2.139.206.88])
	by mx.google.com with ESMTPS id s20sm8716934bkw.15.2012.11.04.21.57.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Nov 2012 21:57:43 -0800 (PST)
Date: Mon, 5 Nov 2012 06:57:39 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20121105055739.GA2452@stefanha-thinkpad.redhat.com>
References: <1352027374-30796-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1352027374-30796-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] block: Workaround for older versions of
 MinGW gcc
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
X-List-Received-Date: Mon, 05 Nov 2012 05:57:48 -0000

On Sun, Nov 04, 2012 at 12:09:34PM +0100, Stefan Weil wrote:
> Versions before gcc-4.6 don't support unnamed fields in initializers
> (see http://gcc.gnu.org/bugzilla/show_bug.cgi?id=10676).
> 
> Offset and OffsetHigh belong to an unnamed struct which is part of an
> unnamed union. Therefore the original code does not work with older
> versions of gcc.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> 
> This patch is needed for Debian's amd64-mingw32msvc-gcc-4.4.4
> which I use for MinGW-w64 cross compilation.
> 
> Regards
> Stefan W.
> 
>  block/win32-aio.c |   10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

