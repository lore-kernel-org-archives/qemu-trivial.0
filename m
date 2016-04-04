Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1an37l-0007LT-Ve
	for mharc-qemu-trivial@gnu.org; Mon, 04 Apr 2016 07:56:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36369)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1an37j-0007IG-Oq
	for qemu-trivial@nongnu.org; Mon, 04 Apr 2016 07:56:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1an37i-00029m-OJ
	for qemu-trivial@nongnu.org; Mon, 04 Apr 2016 07:56:51 -0400
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80]:35268)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1an37e-00024r-ET; Mon, 04 Apr 2016 07:56:46 -0400
Received: from localhost (localhost [127.0.0.1])
	by smtp.mail.uni-mannheim.de (Postfix) with ESMTP id 87D14103E28;
	Mon,  4 Apr 2016 13:56:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at uni-mannheim.de
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80])
	by localhost (smtp.mail.uni-mannheim.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 0wMJFMgQ7lAh; Mon,  4 Apr 2016 13:56:44 +0200 (CEST)
Received: from [134.155.36.179] (unknown [134.155.36.179])
	by smtp.mail.uni-mannheim.de (Postfix) with ESMTPSA id 6CA0F103033;
	Mon,  4 Apr 2016 13:56:44 +0200 (CEST)
To: Sergey Fedorov <sergey.fedorov@linaro.org>, qemu-devel@nongnu.org
References: <1459767918-796-1-git-send-email-sergey.fedorov@linaro.org>
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <5702567E.6060701@weilnetz.de>
Date: Mon, 4 Apr 2016 13:56:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.0
MIME-Version: 1.0
In-Reply-To: <1459767918-796-1-git-send-email-sergey.fedorov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 134.155.96.80
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Sergey Fedorov <serge.fdrv@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-trivial] [PATCH] tci: Fix build with no '-DNDEBUG'
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
X-List-Received-Date: Mon, 04 Apr 2016 11:56:52 -0000

Am 04.04.2016 um 13:05 schrieb Sergey Fedorov:
> From: Sergey Fedorov <serge.fdrv@gmail.com>
>
> assert() always evaluates its argument so there's no need to #ifdef the
> definitions which is only used for assert(). Actually, doing so
> generates a compilation warning which is treated as an error in QEMU
> build by default. Let compiler sort out and eliminate unnecessary
> local variables.
>
> Signed-off-by: Sergey Fedorov <serge.fdrv@gmail.com>
> Signed-off-by: Sergey Fedorov <sergey.fedorov@linaro.org>
> ---
>  tci.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/tci.c b/tci.c
> index 7cbb39ed4b6a..d709e008f3f9 100644
> --- a/tci.c
> +++ b/tci.c
> @@ -472,10 +472,8 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr)
>  
>      for (;;) {
>          TCGOpcode opc = tb_ptr[0];
> -#if !defined(NDEBUG)
>          uint8_t op_size = tb_ptr[1];
>          uint8_t *old_code_ptr = tb_ptr;
> -#endif
>          tcg_target_ulong t0;
>          tcg_target_ulong t1;
>          tcg_target_ulong t2;


This patch should not be applied.

From the Linux man page for assert: "the macro assert() generates no code".

Which variant of the assert macro evaluates its argument even when NDEBUG
is defined? On which system with which configuration did you see the
problem?

There is indeed a regression in the current code. Commit
d38ea87ac54af64ef611de434d07c12dc0399216 added an include statement
which includes assert.h before NDEBUG is defined. This is wrong and
needs a fix. Could you please try tci.c starting like this?

/* Defining NDEBUG disables assertions (which makes the code faster). */
#if !defined(CONFIG_DEBUG_TCG) && !defined(NDEBUG)
# define NDEBUG
#endif

#include "qemu/osdep.h"

Thanks,
Stefan

