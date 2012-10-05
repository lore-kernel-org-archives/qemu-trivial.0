Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TK7LL-0003wZ-Az
	for mharc-qemu-trivial@gnu.org; Fri, 05 Oct 2012 08:49:27 -0400
Received: from eggs.gnu.org ([208.118.235.92]:41081)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TK7LC-0003rP-UH
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2012 08:49:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TK7L7-0000pB-5v
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2012 08:49:18 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:58390)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TK7L6-0000mf-V3; Fri, 05 Oct 2012 08:49:13 -0400
Received: by mail-bk0-f45.google.com with SMTP id jf3so778660bkc.4
	for <multiple recipients>; Fri, 05 Oct 2012 05:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8tLGKiW5MDAPkwOmB5RttwxYHWM2QmDIgh1DLdZjMyA=;
	b=I9ULhATyHvaCbs11j8vLSG+RlaW7Uh+7HHipTFiqHqGrmAPhFcMMdBjbGf3m8Kw0Qz
	Qjj8hTv7anGsRLr2xm4tQj4AAH1RQ1lqREtdgfmTRovF9a1Zjfy/ibdbq4au626kBx7W
	uTY1By2a04ikik2UTGzfagQMzw49xuilomAAA2iVUnjpakcq01SkkYayV+5ofTvzZVZI
	20+AI8vNENx2DgvlAQy/Ndxeu4GXyKiRC3P1fJLxjw7ZhxXWm7ThYDapj+b5KRS2h5nb
	X5n3VC/aynm177e/AhVVxMIgwZ09JzT2lrc4VuTUFF5T0dwY3+v5SQeYgU9ABj2X/las
	wUfw==
Received: by 10.204.5.148 with SMTP id 20mr2810571bkv.28.1349441351766;
	Fri, 05 Oct 2012 05:49:11 -0700 (PDT)
Received: from localhost ([82.113.121.2])
	by mx.google.com with ESMTPS id s20sm6920991bkw.15.2012.10.05.05.49.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 05 Oct 2012 05:49:11 -0700 (PDT)
Date: Fri, 5 Oct 2012 14:49:08 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20121005124908.GE10951@stefanha-thinkpad.redhat.com>
References: <1348852059-8678-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1348852059-8678-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] qemu-sockets: Fix compiler warning
 (regression for MinGW)
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
X-List-Received-Date: Fri, 05 Oct 2012 12:49:25 -0000

On Fri, Sep 28, 2012 at 07:07:39PM +0200, Stefan Weil wrote:
> setsockopt needs a type cast for MinGW. That type cast is missing in
> a recent commit which results in a compiler warning.
> 
> Like for other socket related functions which have the same problem,
> we add a 'qemu_setsockopt' macro which provides that type cast where
> needed and use the new macro to avoid the warning.
> 
> A 'qemu_getsockopt' is also added and can be used for future
> modifications.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  qemu-common.h  |   10 +++++++++-
>  qemu-sockets.c |    2 +-
>  2 files changed, 10 insertions(+), 2 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

