Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UeNz5-0007sW-FW
	for mharc-qemu-trivial@gnu.org; Mon, 20 May 2013 07:10:31 -0400
Received: from eggs.gnu.org ([208.118.235.92]:37568)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1UeNyy-0007jw-PC
	for qemu-trivial@nongnu.org; Mon, 20 May 2013 07:10:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1UeNyu-0004kS-4O
	for qemu-trivial@nongnu.org; Mon, 20 May 2013 07:10:24 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:48408)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1UeNyj-0004iZ-Jv; Mon, 20 May 2013 07:10:09 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	C5B057280034; Mon, 20 May 2013 13:10:08 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id gWqudSRb_1t9; Mon, 20 May 2013 13:10:02 +0200 (CEST)
Received: from [192.168.178.35] (p54AD9AE9.dip0.t-ipconnect.de
	[84.173.154.233])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	B4BF8728001E; Mon, 20 May 2013 13:10:01 +0200 (CEST)
Message-ID: <519A0488.60608@weilnetz.de>
Date: Mon, 20 May 2013 13:10:00 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: Lei Li <lilei@linux.vnet.ibm.com>
References: <1369041650-22056-1-git-send-email-lilei@linux.vnet.ibm.com>
In-Reply-To: <1369041650-22056-1-git-send-email-lilei@linux.vnet.ibm.com>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user: Fix typo in
	comment
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
X-List-Received-Date: Mon, 20 May 2013 11:10:29 -0000

Am 20.05.2013 11:20, schrieb Lei Li:
> Signed-off-by: Lei Li <lilei@linux.vnet.ibm.com>
> ---
>  linux-user/syscall.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 30e93bc..72c6866 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8236,7 +8236,7 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
>  #ifdef TARGET_NR_madvise
>      case TARGET_NR_madvise:
>          /* A straight passthrough may not be safe because qemu sometimes
> -           turns private flie-backed mappings into anonymous mappings.
> +           turns private file-backed mappings into anonymous mappings.
>             This will break MADV_DONTNEED.
>             This is a hint, so ignoring and returning success is ok.  */
>          ret = get_errno(0);

Reviewed-by: Stefan Weil <sw@weilnetz.de>


