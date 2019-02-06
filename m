Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1grOaO-0004DY-Hr
	for mharc-qemu-trivial@gnu.org; Wed, 06 Feb 2019 09:54:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48756)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grOaM-0004Ca-UB
	for qemu-trivial@nongnu.org; Wed, 06 Feb 2019 09:53:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grOaM-00063i-37
	for qemu-trivial@nongnu.org; Wed, 06 Feb 2019 09:53:58 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:34245)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1grOaJ-0005z3-VE; Wed, 06 Feb 2019 09:53:56 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1Mc0Aj-1hP5VS2qz9-00dTyz; Wed, 06 Feb 2019 15:53:41 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
	qemu-ppc@nongnu.org, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>
References: <20190204210433.26088-1-philmd@redhat.com>
	<20190204210433.26088-2-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <9b5cdbdd-4d54-88e5-ecad-2c08c89fcd5f@vivier.eu>
Date: Wed, 6 Feb 2019 15:53:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190204210433.26088-2-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8UQLVMpBw1iA2Kp6Cv7qhLvims1NMFndW6xasUUnxJLvMD5ZSqt
	TucyjgOzb5EVU1U2D0mW99Yk3wsufOsinGkABTtLl5SsRZQmiAQgVPbZopRzXdemYMDs0FU
	3mmVsECRaTCWAv3lUwCdrkOv9gaUKo6KrTeEMQjAni90Q3rykTuft23jgDQj4/5lDk5c8qG
	NDgHQ70k954UtH2K6mdPg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:S6B/pWBp4II=:eh9rqHKa483//btUa4btdg
	BW1rsLP6SMpMKeoFB+85o53SudaKTXqLKq/cYIC67iLCBQF9QuBO5E+poIrg1SMa9mi1lXl8k
	kGBvoeQpThcyCU0ATJ6J9Crn03xQ1rpJOjY3csWckUuye7UzN2FqnKgci0ZDZOnKK7bQY41YF
	QY+3zpi9+eMUs4jCZMW2754KQE7XwwGxwOTN35uQ3XX8wtV8dfZYaDA2Zzw3LlmXVqW90afbp
	GXLtDLEjjEflfKGVfBRUqqW9H5WqWpWEeRROaNoqzKfS14Kwjj3eujoXkWLP1UjfihB6tbYXE
	OExi5EEid60OwJRIP0Paw+YoCfnE8LSOUAglWTAaeFWAp41TWJmHiVlNTt6+tiXHNDASD6zXM
	OtN+ZWtDRZZTUCfy/zLTg7F2NtQqV3XmuQHgeX4AbyziOc0yakdQzCCcM7PenLqWUEIZymPdq
	3b0oHAa9lOJokJHUQMxFoA0OGUuKb2Wzn9rdMk0QAcK7xmLPGoKTqz0Gn2GJVoasm4V0Kn1oy
	nwbfxJ4GidJNjIu6siYQzAI4YnPOnxO6NKJRg2nzsrt5CeYC/3gqqeBz0tqN0nY4gDXoOgMcY
	wteCtSNvgUnaLSq9qem5AtGHhUnioRAaYlWufHBEN6SeGXpk2QOA2wC0r7oCt6dp+5EzXeKXu
	0Q6LTpHmZG/lILLzXJRCzO0x9x8SvC8HTKZUGG5IVnML5l66Lutb8lP35YJCWovZOxRcW31aX
	NdOdvHQvgG1zwXaFIRQvDes+pvSj0zc28RvKZmfm+27LGhsIgn6yxQjb6aE=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.74
Subject: Re: [Qemu-trivial] [PATCH 1/3] hw/sparc64/sun4u: Drop useless
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
X-List-Received-Date: Wed, 06 Feb 2019 14:53:59 -0000

On 04/02/2019 22:04, Philippe Mathieu-Daudé wrote:
> In 47973a2dbf we split the last generic chipset out of the PC
> board, but forgot to remove the include of "hw/i386/pc.h".
> Since it is now unused, remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/sparc64/sun4u.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
> index f76b19e4e9..fdf3f14a29 100644
> --- a/hw/sparc64/sun4u.c
> +++ b/hw/sparc64/sun4u.c
> @@ -33,7 +33,6 @@
>  #include "hw/pci/pci_bus.h"
>  #include "hw/pci/pci_host.h"
>  #include "hw/pci-host/sabre.h"
> -#include "hw/i386/pc.h"
>  #include "hw/char/serial.h"
>  #include "hw/char/parallel.h"
>  #include "hw/timer/m48t59.h"
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

