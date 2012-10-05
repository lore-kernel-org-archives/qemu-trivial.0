Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TK8Q6-0004R5-UV
	for mharc-qemu-trivial@gnu.org; Fri, 05 Oct 2012 09:58:26 -0400
Received: from eggs.gnu.org ([208.118.235.92]:39602)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TK8Pv-0003uD-BQ
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2012 09:58:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TK8Pp-00052W-JR
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2012 09:58:15 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:61418)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TK8Pf-00050k-JH; Fri, 05 Oct 2012 09:57:59 -0400
Received: by mail-bk0-f45.google.com with SMTP id jf3so813564bkc.4
	for <multiple recipients>; Fri, 05 Oct 2012 06:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wC5cHjRGP50NzYAbbILaOqnQHu+Wo2mWHbBFvARr6d4=;
	b=h9yoLHBkeXV5ObtUcmcrqlEqfbj34u//a+hSEhNviZ9FFss2Htbg1JQ2fOlwtc1cKm
	GE54YzXHFA+TQUL2Cw9EZd1QDe8hospDnKSbIBOrUnN5ZO2kL+hr/TnkTnl5xjtLPV4i
	onQgT+M1BCLp52RhUazbr7m2uIvWTRkzPe03dKjCoJHwmUPmqpIS5gOtcIG8MBQ+I7Ln
	9wrTNYc3RSB1do660xOJtlvpG4U+Qhlkm0YyaLeBRwTOccxIAV0pCqFhCu4C4u/hSASu
	s1mYmJR/zF1LZI4kKS6rkYxma3Ylz46+gwJuIkqrkpV/7EFd0ZQ3asfpPfmeNH/fZgLm
	nK4A==
Received: by 10.204.8.194 with SMTP id i2mr2761200bki.117.1349445006576;
	Fri, 05 Oct 2012 06:50:06 -0700 (PDT)
Received: from localhost (188-194-152-192-dynip.superkabel.de.
	[188.194.152.192])
	by mx.google.com with ESMTPS id e3sm7740642bks.7.2012.10.05.06.50.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 05 Oct 2012 06:50:06 -0700 (PDT)
Date: Fri, 5 Oct 2012 15:50:04 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20121005135004.GJ10951@stefanha-thinkpad.redhat.com>
References: <1349383783-21392-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1349383783-21392-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, Paul Brook <paul@codesourcery.com>
Subject: Re: [Qemu-trivial] [PATCH] versatilepb: Use symbolic indices for
 ARM PIC
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
X-List-Received-Date: Fri, 05 Oct 2012 13:58:24 -0000

On Thu, Oct 04, 2012 at 10:49:43PM +0200, Stefan Weil wrote:
> It is more readable, and all other code does it like that, too.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/versatilepb.c |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

