Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QQ18Y-0003dU-4e
	for mharc-qemu-trivial@gnu.org; Fri, 27 May 2011 13:47:50 -0400
Received: from eggs.gnu.org ([140.186.70.92]:60435)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>) id 1QQ18V-0003VT-J4
	for qemu-trivial@nongnu.org; Fri, 27 May 2011 13:47:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>) id 1QQ18U-0000Ry-Uy
	for qemu-trivial@nongnu.org; Fri, 27 May 2011 13:47:47 -0400
Received: from moutng.kundenserver.de ([212.227.126.171]:63174)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>)
	id 1QQ18S-0000RJ-Sq; Fri, 27 May 2011 13:47:45 -0400
Received: from flocke.weilnetz.de (p5086FC6B.dip.t-dialin.net [80.134.252.107])
	by mrelayeu.kundenserver.de (node=mrbap3) with ESMTP (Nemesis)
	id 0Mf1KL-1Q1UyR2M0H-00OTWp; Fri, 27 May 2011 19:35:07 +0200
Received: from localhost ([127.0.0.1] ident=stefan)
	by flocke.weilnetz.de with esmtp (Exim 4.72)
	(envelope-from <weil@mail.berlios.de>)
	id 1QQ0wD-0001S7-OW; Fri, 27 May 2011 19:35:05 +0200
Message-ID: <4DDFE0C9.5040907@mail.berlios.de>
Date: Fri, 27 May 2011 19:35:05 +0200
From: Stefan Weil <weil@mail.berlios.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20110307 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: Alexandre Raymond <cerbere@gmail.com>
References: <1306516951-31105-1-git-send-email-cerbere@gmail.com>
	<1306516951-31105-6-git-send-email-cerbere@gmail.com>
In-Reply-To: <1306516951-31105-6-git-send-email-cerbere@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V02:K0:CVdQslq4WtuQ5Ah9k/g7K0qYVVU7cOW6/djoif1CcJH
	84NSMpfa+ksHiwUGDGHYBmfw9/RQgn+QEh5WkM/8U5ZSctr08c
	4MkgGKRlcoShdS9ncASeC+nW4emLwQQT/wpwsm/xnKjYHvPVlg
	L0IkntNgGsIPC/GFAl/ljVHGwXchMaaouPMpP07VmZwg6PjaBq
	QYwsHByqFLW2reUPmPDyske293YnGmum5+fCiiV2tAh6Yecz6E hQ45oSuBe1MMK
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.227.126.171
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 5/6] Remove warning in
 printf due to type mismatch
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
X-List-Received-Date: Fri, 27 May 2011 17:47:48 -0000

Am 27.05.2011 19:22, schrieb Alexandre Raymond:
> ----8<----
> qemu/target-lm32/translate.c: In function 
> ‘gen_intermediate_code_internal’:
> qemu/target-lm32/translate.c:1135: warning: format ‘%zd’ expects type 
> ‘signed size_t’, but argument 4 has type ‘int’
> ----8<----
>
> Both gen_opc_ptr and gen_opc_buf are "uint16_t *", so a simple '%d' should
> be able to describe their relative difference.
>
> Signed-off-by: Alexandre Raymond <cerbere@gmail.com>
> ---
> target-lm32/translate.c | 2 +-
> 1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/target-lm32/translate.c b/target-lm32/translate.c
> index eb21158..0f69f27 100644
> --- a/target-lm32/translate.c
> +++ b/target-lm32/translate.c
> @@ -1132,7 +1132,7 @@ static void 
> gen_intermediate_code_internal(CPUState *env,
> if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)) {
> qemu_log("\n");
> log_target_disas(pc_start, dc->pc - pc_start, 0);
> - qemu_log("\nisize=%d osize=%zd\n",
> + qemu_log("\nisize=%d osize=%d\n",
> dc->pc - pc_start, gen_opc_ptr - gen_opc_buf);
> }
> #endif

Nack.

The original code is correct, because the difference of two pointers
is always of type ssize_t (well, obviously not with your compiler,
but then I assume that your compiler is broken).

This pattern is quite common in QEMU, so it looks like there is
another problem here (otherwise you would get more errors of this kind).

Cheers,
Stefan W.



