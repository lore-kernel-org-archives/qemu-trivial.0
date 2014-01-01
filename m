Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VyMIU-00066U-Nv
	for mharc-qemu-trivial@gnu.org; Wed, 01 Jan 2014 08:57:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38837)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VyMIN-0005vM-UG
	for qemu-trivial@nongnu.org; Wed, 01 Jan 2014 08:57:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VyMII-00077D-Is
	for qemu-trivial@nongnu.org; Wed, 01 Jan 2014 08:57:15 -0500
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:40185)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1VyMI7-000753-Al; Wed, 01 Jan 2014 08:56:59 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	F14BC7280694; Wed,  1 Jan 2014 14:56:56 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id oeTsDUEU6ISy; Wed,  1 Jan 2014 14:56:45 +0100 (CET)
Received: from [192.168.178.35] (p54AD9219.dip0.t-ipconnect.de [84.173.146.25])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	221C3728008C; Wed,  1 Jan 2014 14:56:44 +0100 (CET)
Message-ID: <52C41E9B.40704@weilnetz.de>
Date: Wed, 01 Jan 2014 14:56:43 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, aliguori@amazon.com
References: <1388182050-10270-1-git-send-email-mjt@msgid.tls.msk.ru>
	<1388182050-10270-11-git-send-email-mjt@msgid.tls.msk.ru>
In-Reply-To: <1388182050-10270-11-git-send-email-mjt@msgid.tls.msk.ru>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PULL 10/17] target-m68k: Replace qemu_assert by
	hw_error
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
X-List-Received-Date: Wed, 01 Jan 2014 13:57:21 -0000

Am 27.12.2013 23:07, schrieb Michael Tokarev:
> From: Stefan Weil <sw@weilnetz.de>
>
> hw_error is already used for target-arm and target-s390x.
> Using it for target-m68k fixes this compiler warning with Darwin because
> hw_error is declared with QEMU_NORETURN:
>
> target-m68k/translate.c:671:13: warning:
>  variable 'offset' is used uninitialized whenever switch default is taken
>  [-Wsometimes-uninitialized]
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  target-m68k/translate.c |   28 +++++++++-------------------
>  1 file changed, 9 insertions(+), 19 deletions(-)
>

Hi,

I'm sorry that I have to revoke this patch.

hw_error is not available for user mode, so this patch fixes Darwin
(which only provides system emulation), but it breaks linking of
m68k-linux-user on Linux hosts.

target-arm and target-s390x use hw_error in conditional code which is
not compiled for user emulation, so they don't have this problem.

Regards
Stefan


