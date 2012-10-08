Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TLKUf-0004pi-FO
	for mharc-qemu-trivial@gnu.org; Mon, 08 Oct 2012 17:04:05 -0400
Received: from eggs.gnu.org ([208.118.235.92]:49437)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1TLKUd-0004l5-6W
	for qemu-trivial@nongnu.org; Mon, 08 Oct 2012 17:04:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1TLKUb-00059D-Op
	for qemu-trivial@nongnu.org; Mon, 08 Oct 2012 17:04:03 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:48537)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1TLKUZ-00058j-KI; Mon, 08 Oct 2012 17:03:59 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	9F98A7280041; Mon,  8 Oct 2012 23:03:58 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id FKFdDw-PaRbh; Mon,  8 Oct 2012 23:03:56 +0200 (CEST)
Received: from [192.168.178.20] (p5086EDFD.dip.t-dialin.net [80.134.237.253])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	4A2A8728003D; Mon,  8 Oct 2012 23:03:56 +0200 (CEST)
Message-ID: <50733FBB.5060708@weilnetz.de>
Date: Mon, 08 Oct 2012 23:03:55 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:15.0) Gecko/20120912 Thunderbird/15.0.1
MIME-Version: 1.0
To: Michael Roth <mdroth@linux.vnet.ibm.com>
References: <1349729149-6481-1-git-send-email-mdroth@linux.vnet.ibm.com>
In-Reply-To: <1349729149-6481-1-git-send-email-mdroth@linux.vnet.ibm.com>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: blauwirbel@gmail.com, qemu-trivial <qemu-trivial@nongnu.org>,
	qemu-devel@nongnu.org, rth@twiddle.net
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tci: fix build breakage for
	target-sparc
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
X-List-Received-Date: Mon, 08 Oct 2012 21:04:04 -0000

Am 08.10.2012 22:45, schrieb Michael Roth:
> commit c28ae41 introduced GETPC() usage for sparc, which is currently
> not defined when building with --enable-tcg-interpreter. Add sparc to
> the list of targets we selectively define GETPC() for.
>
> Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
> ---
>   exec-all.h |    3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/exec-all.h b/exec-all.h
> index 6516da0..f7f649e 100644
> --- a/exec-all.h
> +++ b/exec-all.h
> @@ -296,7 +296,8 @@ extern int tb_invalidated_flag;
>   #if defined(CONFIG_TCG_INTERPRETER)
>   /* Alpha and SH4 user mode emulations and Softmmu call GETPC().
>      For all others, GETPC remains undefined (which makes TCI a little faster. */
> -# if defined(CONFIG_SOFTMMU) || defined(TARGET_ALPHA) || defined(TARGET_SH4)
> +# if defined(CONFIG_SOFTMMU) || defined(TARGET_ALPHA) || defined(TARGET_SH4) \
> +     || defined(TARGET_SPARC)
>   extern uintptr_t tci_tb_ptr;
>   #  define GETPC() tci_tb_ptr
>   # endif

Reviewed-by: Stefan Weil <sw@weilnetz.de>

Maybe whoever commits that patch can fix the comment, too.
I don't think we need a 2nd patch for that.

Regards

Stefan W.


