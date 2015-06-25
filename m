Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z88Wp-0005Bt-Sk
	for mharc-qemu-trivial@gnu.org; Thu, 25 Jun 2015 10:53:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33342)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1Z88Wh-0005BN-RR
	for qemu-trivial@nongnu.org; Thu, 25 Jun 2015 10:53:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1Z88Wb-000796-6E
	for qemu-trivial@nongnu.org; Thu, 25 Jun 2015 10:53:15 -0400
Received: from mail.uni-paderborn.de ([131.234.142.9]:45528)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1Z88Wa-00078j-VR; Thu, 25 Jun 2015 10:53:09 -0400
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1435147270-1040-1-git-send-email-pbonzini@redhat.com>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-ID: <558C15D0.40302@mail.uni-paderborn.de>
Date: Thu, 25 Jun 2015 16:53:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.0.1
MIME-Version: 1.0
In-Reply-To: <1435147270-1040-1-git-send-email-pbonzini@redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.2.1.2493963, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2015.6.25.144815
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-tricore: fix
 depositing bits from PCXI into ICR
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
X-List-Received-Date: Thu, 25 Jun 2015 14:53:22 -0000

On 06/24/2015 02:01 PM, Paolo Bonzini wrote:
> Spotted by Coverity, because (env->PCXI & MASK_PCXI_PCPN) >> 24
> is always zero.  The immediately preceding assignment is also
> wrong though.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   target-tricore/op_helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target-tricore/op_helper.c b/target-tricore/op_helper.c
> index 10ed541..53edbda 100644
> --- a/target-tricore/op_helper.c
> +++ b/target-tricore/op_helper.c
> @@ -2545,10 +2545,10 @@ void helper_rfm(CPUTriCoreState *env)
>       env->PC = (env->gpr_a[11] & ~0x1);
>       /* ICR.IE = PCXI.PIE; */
>       env->ICR = (env->ICR & ~MASK_ICR_IE) |
> -               ((env->PCXI & ~MASK_PCXI_PIE) >> 15);
> +               ((env->PCXI & MASK_PCXI_PIE) >> 15);
>       /* ICR.CCPN = PCXI.PCPN; */
>       env->ICR = (env->ICR & ~MASK_ICR_CCPN) |
> -               ((env->PCXI & ~MASK_PCXI_PCPN) >> 24);
> +               ((env->PCXI & MASK_PCXI_PCPN) >> 24);
>       /* {PCXI, PSW, A[10], A[11]} = M(DCX, 4 * word); */
>       env->PCXI = cpu_ldl_data(env, env->DCX);
>       psw_write(env, cpu_ldl_data(env, env->DCX+4));
Thanks, applied it to my tricore-next branch.

Cheers,
Bastian

