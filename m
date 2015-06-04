Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z0Vyx-00013G-Fb
	for mharc-qemu-trivial@gnu.org; Thu, 04 Jun 2015 10:18:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45210)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z0Vyv-00011w-Gh
	for qemu-trivial@nongnu.org; Thu, 04 Jun 2015 10:18:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z0Vyu-0007ae-LY
	for qemu-trivial@nongnu.org; Thu, 04 Jun 2015 10:18:53 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58113)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z0Vyp-0007Zq-Az; Thu, 04 Jun 2015 10:18:47 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 9C6D740937;
	Thu,  4 Jun 2015 17:18:46 +0300 (MSK)
Message-ID: <55705E46.4010106@msgid.tls.msk.ru>
Date: Thu, 04 Jun 2015 17:18:46 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Shannon Zhao <zhaoshenglong@huawei.com>, qemu-devel@nongnu.org
References: <1432972477-13504-1-git-send-email-zhaoshenglong@huawei.com>
	<1432972477-13504-3-git-send-email-zhaoshenglong@huawei.com>
In-Reply-To: <1432972477-13504-3-git-send-email-zhaoshenglong@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, shannon.zhao@linaro.org
Subject: Re: [Qemu-trivial] [PATCH v2 2/7] hw/mips/mips_jazz.c: Store irq
 array in MachineState to fix memory leak
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
X-List-Received-Date: Thu, 04 Jun 2015 14:18:54 -0000

30.05.2015 10:54, Shannon Zhao =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> From: Shannon Zhao <shannon.zhao@linaro.org>
>=20
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>  hw/mips/mips_jazz.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
>=20
> diff --git a/hw/mips/mips_jazz.c b/hw/mips/mips_jazz.c
> index 2c153e0..259458b 100644
> --- a/hw/mips/mips_jazz.c
> +++ b/hw/mips/mips_jazz.c
> @@ -135,7 +135,7 @@ static void mips_jazz_init(MachineState *machine,
>      MIPSCPU *cpu;
>      CPUClass *cc;
>      CPUMIPSState *env;
> -    qemu_irq *rc4030, *i8259;
> +    qemu_irq *i8259;

Hm. Why do you only cover rc4030, not i8259?

Besides, in order to keep the changes smaller, I think it is okay to
keep the variables like that, here and in the rest of the function,
and only add assignment of it to machine->irqs.  This way, we also
keep semantic names of the variables, rc4030[i] is easier to understand
than machine->irqs[i], the former's more specific.

BTW, there's also cpu_exit_irq in this function whose allocation also
suffers from qemu_allocate_irqs(..., 1) API abuse.

/mjt

