Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TwCI6-0006rY-TK
	for mharc-qemu-trivial@gnu.org; Fri, 18 Jan 2013 08:47:30 -0500
Received: from eggs.gnu.org ([208.118.235.92]:35088)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TwCI3-0006fw-5y
	for qemu-trivial@nongnu.org; Fri, 18 Jan 2013 08:47:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TwCI1-0005fq-O2
	for qemu-trivial@nongnu.org; Fri, 18 Jan 2013 08:47:26 -0500
Received: from mail-bk0-f43.google.com ([209.85.214.43]:49070)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TwCHx-0005fC-U3; Fri, 18 Jan 2013 08:47:22 -0500
Received: by mail-bk0-f43.google.com with SMTP id jf20so1992561bkc.16
	for <multiple recipients>; Fri, 18 Jan 2013 05:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=vjw2JrTXG6z8dNVEYjVsweELaSgFpAzEKrP1cbkUY6c=;
	b=EXnYmDYNrDebpJvr6yA61PAdimBx8C6ptgJXT5sq2ZAgK7uRy5u+gYVf8ucvaCXHPW
	YBRYWnyoR6UCS26r0PK2UR06zAV6671iV3AwUzHDsc7hwd/RSrjkloqImAsBH9ir16ea
	jY7VOHvQ0bdFFWyZDXplCY203bzZlLcQRBsmeV78Acx1oB+d7scmrgZiaJzCyAW4siUh
	KmJyvXSE8tD5f4FAFFcObxRzUZ/jB/ui707xB4K2y8zyqvqCcWbhNzNZIyL64abeLPoN
	mGIthMPC9sep3LCnG97Sz1iFta2aGBasgjtl21vxhRHIV4FzTOPotSctDDGmRxSB/Quh
	uq+g==
X-Received: by 10.204.5.133 with SMTP id 5mr2535779bkv.68.1358516840644;
	Fri, 18 Jan 2013 05:47:20 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id l17sm3894331bkw.12.2013.01.18.05.47.17
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 18 Jan 2013 05:47:18 -0800 (PST)
Date: Fri, 18 Jan 2013 14:47:16 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20130118134716.GD24367@stefanha-thinkpad.redhat.com>
References: <1358437928-2420-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1358437928-2420-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.214.43
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-pixman.h: Avoid mutual
 inclusion loop with console.h
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
X-List-Received-Date: Fri, 18 Jan 2013 13:47:29 -0000

On Thu, Jan 17, 2013 at 03:52:08PM +0000, Peter Maydell wrote:
> Remove an unnecessary mutual inclusion loop between qemu-pixman.h and
> console.h, since the former was only including the latter for
> 'PixelFormat*', which can be provided by typedefs.h.  This requires a
> minor adjustment to qemu-pixman.c, which was relying on the implicit
> inclusion of console.h for the actual struct PixelFormat definition,
> and on implicitly dragging in a header defining NULL.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I noticed this because I had an out of tree file which included
> ui/console.h before qemu-common.h and it didn't compile. But mutual
> include loops are a bad idea anyway IMHO.
> 
>  include/ui/qemu-pixman.h |    2 +-
>  ui/qemu-pixman.c         |    3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)

CC    ui/curses.o
In file included from ui/spice-core.c:40:0:
/home/stefanha/qemu/include/ui/spice-display.h:93:5: error: unknown type name ‘QEMUCursor’

Stefan

