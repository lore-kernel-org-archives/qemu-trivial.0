Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XjjwH-0007LR-JF
	for mharc-qemu-trivial@gnu.org; Thu, 30 Oct 2014 03:14:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34102)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1XjjwB-0007DC-JG
	for qemu-trivial@nongnu.org; Thu, 30 Oct 2014 03:14:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1Xjjw6-0005se-UP
	for qemu-trivial@nongnu.org; Thu, 30 Oct 2014 03:14:27 -0400
Received: from mail.uni-paderborn.de ([131.234.142.9]:48269)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1Xjjvu-0005po-VF; Thu, 30 Oct 2014 03:14:11 -0400
Message-ID: <5451F365.5040506@mail.uni-paderborn.de>
Date: Thu, 30 Oct 2014 08:14:29 +0000
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 qemu-trivial@nongnu.org
References: <1414634608-31292-1-git-send-email-zhang.zhanghailiang@huawei.com>
In-Reply-To: <1414634608-31292-1-git-send-email-zhang.zhanghailiang@huawei.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.2.0.2453472, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2014.10.30.70323
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
Cc: qemu-devel@nongnu.org, peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-tricore: check
 return value before using it
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
X-List-Received-Date: Thu, 30 Oct 2014 07:14:32 -0000

Geez, thanks. I wonder how I missed that.

Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

On 10/30/2014 02:03 AM, zhanghailiang wrote:
> We reference the return value of cpu before checking whether it is NULL,
> The checking code is after that which violates code style.
>
> It makes no difference if the cpu is NULL, qemu process will terminate.
> But one will be 'Segmentation fault' and the other will report a error
> which is what we want.
>
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> ---
>   hw/tricore/tricore_testboard.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/tricore/tricore_testboard.c b/hw/tricore/tricore_testboard.c
> index eeb4922..a059a20 100644
> --- a/hw/tricore/tricore_testboard.c
> +++ b/hw/tricore/tricore_testboard.c
> @@ -71,11 +71,11 @@ static void tricore_testboard_init(MachineState *machine, int board_id)
>           machine->cpu_model = "tc1796";
>       }
>       cpu = cpu_tricore_init(machine->cpu_model);
> -    env = &cpu->env;
>       if (!cpu) {
>           error_report("Unable to find CPU definition");
>           exit(1);
>       }
> +    env = &cpu->env;
>       memory_region_init_ram(ext_cram, NULL, "powerlink_ext_c.ram", 2*1024*1024, &error_abort);
>       vmstate_register_ram_global(ext_cram);
>       memory_region_init_ram(ext_dram, NULL, "powerlink_ext_d.ram", 4*1024*1024, &error_abort);


