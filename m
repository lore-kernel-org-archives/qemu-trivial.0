Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1grObM-0004vf-Ob
	for mharc-qemu-trivial@gnu.org; Wed, 06 Feb 2019 09:55:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49026)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grObL-0004uV-7D
	for qemu-trivial@nongnu.org; Wed, 06 Feb 2019 09:54:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grObJ-0006TJ-Vr
	for qemu-trivial@nongnu.org; Wed, 06 Feb 2019 09:54:59 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:42263)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1grObB-0006KP-Iz; Wed, 06 Feb 2019 09:54:50 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1MsZif-1h6K9E2Pxj-00u3ER; Wed, 06 Feb 2019 15:54:31 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
	qemu-ppc@nongnu.org, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>
References: <20190204210433.26088-1-philmd@redhat.com>
	<20190204210433.26088-3-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <a131c869-cc90-eb4c-1a21-746cc9b29b33@vivier.eu>
Date: Wed, 6 Feb 2019 15:54:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190204210433.26088-3-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:1Z62lFfow/hTyu6tj8Tt9qf2BRv6J8+btfTTBW3lh72uJL3iNvG
	PqKRfgZGqoFt9UVMAMd+GC12tdrvvJBYfQ4/zo7iiRe02fmclo1ay3Fe3ON4TkJYKVeg88f
	zlOaAOjPsPU+vqYs+IbJx77yI7Z86IUdCke7zZ3KSNRY2FsnuPQDyP6YRzM/m8Q/Cjg4SA1
	Q9JA5GH6IlN+rtRzji6FQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AF+K1ekEhPg=:AaQA9C/HNljALrYjsLr1IH
	Nc3B8L6GqiESE7h4tIMDwDWfyqcQjOauyNLdHKqyKSsKsWMERQWciNbLgjVziAaaZ7r1DWzOI
	606gU1WgSImBxcA95HXpm7SoRrEFeXWtFOuASL/KVYWPr5+WE6R7207nXTadwvcun/AR5Ani7
	HUsSMsigcYi3AB63Zf43yxowTh0LPHlEECdgRR6Ns1E8Ycorqc96+47L04UeeJBK21QxEq0KY
	/DLaKYbzE7eg1PnGaArachxHYwZfy74Zuf0ciOf+xI5I+ysrrT6V7MB33h0PtLxXq49mkaS1A
	Ajn2NtmgAdWaEtuy+AM7eNlINZUkF+sguLvof1GBYvRlFwGJ0WO7Rp5LuYfPzQjih6KYfTc+Y
	+MrcYRSOWR1d1sslKIUO2Na7b4jwRe84g+Ztw7jX23BnfcJQ8cMdKMOH/uNXZXjm8M8KPli8a
	t/KpSc14bjS4w1Rv7L5CYxt6QlK8fxmzs7VH4V4KBL8fFhBzkPBnl5I3eMBEf9rKfPZPOeT2E
	nCAXNUayR4Z0SeoZ8DPQszFRNPMb/0hPcGe+EM0mng9VNeKFMDh+1KFXxQbWwMKZ4FJy199gz
	xYmVq3BVkvjC/jODptX1ktfwiNn2iZpm39VskSETqzWEnMWY5oCP4qheSk89hvv/tZOnKLWR6
	9Kif9N2fjGLL3YTskT7VmpwrEcAeT0zxqHmKJOW14QqycQ98f6b8qSPoPErW23OZDZ3gAnWtQ
	RSUciqS6kA726xWbHq8MIfx5KdMr3UGWSDIAmHCjgi0cwAARjaTCEuF3DdM=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.75
Subject: Re: [Qemu-trivial] [PATCH 2/3] hw/unicore32/puv3: Drop useless
 inclusion of "hw/i386/pc.h"
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Feb 2019 14:55:00 -0000

On 04/02/2019 22:04, Philippe Mathieu-Daudé wrote:
> In 47973a2dbf we split the last generic chipset out of the PC
> board, but forgot to remove the include of "hw/i386/pc.h".
> Since it is now unused, remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/unicore32/puv3.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/hw/unicore32/puv3.c b/hw/unicore32/puv3.c
> index 830fe3face..b42e600f74 100644
> --- a/hw/unicore32/puv3.c
> +++ b/hw/unicore32/puv3.c
> @@ -15,7 +15,6 @@
>  #include "ui/console.h"
>  #include "hw/boards.h"
>  #include "hw/loader.h"
> -#include "hw/i386/pc.h"
>  #include "sysemu/qtest.h"
>  
>  #undef DEBUG_PUV3
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

