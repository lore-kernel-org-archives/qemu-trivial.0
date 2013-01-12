Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ttuis-0005fD-Jk
	for mharc-qemu-trivial@gnu.org; Sat, 12 Jan 2013 01:37:42 -0500
Received: from eggs.gnu.org ([208.118.235.92]:58962)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Ttuin-0005N9-79
	for qemu-trivial@nongnu.org; Sat, 12 Jan 2013 01:37:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Ttuii-0006nZ-BI
	for qemu-trivial@nongnu.org; Sat, 12 Jan 2013 01:37:37 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:44847)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1Ttuia-0006mv-I6; Sat, 12 Jan 2013 01:37:24 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	6F009728004D; Sat, 12 Jan 2013 07:37:22 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 01JvChsc5SfP; Sat, 12 Jan 2013 07:37:21 +0100 (CET)
Received: from [192.168.178.35] (p5086E50F.dip.t-dialin.net [80.134.229.15])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	77520728004C; Sat, 12 Jan 2013 07:37:21 +0100 (CET)
Message-ID: <50F104A0.9080201@weilnetz.de>
Date: Sat, 12 Jan 2013 07:37:20 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Julien Grall <julien.grall@citrix.com>
References: <1357922503-20202-1-git-send-email-julien.grall@citrix.com>
In-Reply-To: <1357922503-20202-1-git-send-email-julien.grall@citrix.com>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, aliguori@us.ibm.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/pc.c: add ULL suffix in
 ioport80_read and ioportF0_read return value
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
X-List-Received-Date: Sat, 12 Jan 2013 06:37:41 -0000

Am 11.01.2013 17:41, schrieb Julien Grall:
> The commit c02e1eac887b1b0aee7361b1fcf889e7d47fed9d broke the compilation
> for i386. ULL need to be specify for uint64_t value.
>
> Signed-off-by: Julien Grall <julien.grall@citrix.com>
> ---
>   hw/pc.c |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/pc.c b/hw/pc.c
> index dfa3144..ba1f19d 100644
> --- a/hw/pc.c
> +++ b/hw/pc.c
> @@ -105,7 +105,7 @@ static void ioport80_write(void *opaque, hwaddr addr, uint64_t data,
>   
>   static uint64_t ioport80_read(void *opaque, hwaddr addr, unsigned size)
>   {
> -    return 0xffffffffffffffff;
> +    return 0xffffffffffffffffULL;
>   }
>   
>   /* MSDOS compatibility mode FPU exception support */
> @@ -130,7 +130,7 @@ static void ioportF0_write(void *opaque, hwaddr addr, uint64_t data,
>   
>   static uint64_t ioportF0_read(void *opaque, hwaddr addr, unsigned size)
>   {
> -    return 0xffffffffffffffff;
> +    return 0xffffffffffffffffULL;
>   }
>   
>   /* TSC handling */


Better: use UINT64_MAX. Then reviewers don't have to count 'f's.

As this patch is a build fix, it should be committed directly without
waiting for a qemu-trivial pull request.

Stefan


