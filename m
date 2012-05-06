Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SQwrV-0007sf-47
	for mharc-qemu-trivial@gnu.org; Sun, 06 May 2012 04:30:37 -0400
Received: from eggs.gnu.org ([208.118.235.92]:38768)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1SQwrS-0007jo-6N
	for qemu-trivial@nongnu.org; Sun, 06 May 2012 04:30:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1SQwrQ-0007zI-5V
	for qemu-trivial@nongnu.org; Sun, 06 May 2012 04:30:33 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:57165)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1SQwrM-0007yP-Mu; Sun, 06 May 2012 04:30:28 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	394D672800BE; Sun,  6 May 2012 10:30:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id CjM9CY38GcKg; Sun,  6 May 2012 10:30:25 +0200 (CEST)
Received: from [192.168.1.69] (unknown [212.223.173.39])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	5EE1872800B6; Sun,  6 May 2012 10:30:25 +0200 (CEST)
Message-ID: <4FA636A0.2060803@weilnetz.de>
Date: Sun, 06 May 2012 10:30:24 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
References: <1336218047-8906-1-git-send-email-afaerber@suse.de>
In-Reply-To: <1336218047-8906-1-git-send-email-afaerber@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-1.1] target-mips: Remove
 commented-out function declaration
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
X-List-Received-Date: Sun, 06 May 2012 08:30:35 -0000

Am 05.05.2012 13:40, schrieb Andreas F=C3=A4rber:
> There is no function cpu_mips_get_clock(), so drop it.
>
> Signed-off-by: Andreas F=C3=A4rber<afaerber@suse.de>
> Cc: Stefan Weil<sw@weilnetz.de>
> ---
>   target-mips/cpu.h |    1 -
>   1 files changed, 0 insertions(+), 1 deletions(-)
>
> diff --git a/target-mips/cpu.h b/target-mips/cpu.h
> index c0f8826..44c1152 100644
> --- a/target-mips/cpu.h
> +++ b/target-mips/cpu.h
> @@ -627,7 +627,6 @@ enum {
>
>   int cpu_mips_exec(CPUMIPSState *s);
>   CPUMIPSState *cpu_mips_init(const char *cpu_model);
> -//~ uint32_t cpu_mips_get_clock (void);
>   int cpu_mips_signal_handler(int host_signum, void *pinfo, void *puc);
>
>   /* mips_timer.c */

Acked-by: Stefan Weil <sw@weilnetz.de>


