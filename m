Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TmREc-0006iC-9j
	for mharc-qemu-trivial@gnu.org; Sat, 22 Dec 2012 10:43:34 -0500
Received: from eggs.gnu.org ([208.118.235.92]:41988)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TmREX-0006Tl-8t
	for qemu-trivial@nongnu.org; Sat, 22 Dec 2012 10:43:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TmREV-0001Ge-MY
	for qemu-trivial@nongnu.org; Sat, 22 Dec 2012 10:43:29 -0500
Received: from mail-pb0-f41.google.com ([209.85.160.41]:36512)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TmREV-0001GY-9F
	for qemu-trivial@nongnu.org; Sat, 22 Dec 2012 10:43:27 -0500
Received: by mail-pb0-f41.google.com with SMTP id xa7so3303394pbc.0
	for <qemu-trivial@nongnu.org>; Sat, 22 Dec 2012 07:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=JtlAvHneA2ONWzu8WrIUZP4qvG5mPnjWFXqSZa3Pv9E=;
	b=DtH4NLcnmwNBy8Tkv9872GLCSxae7tDmb9B9M/kgf8S2/VtIuDGSC37kAwKxekiepn
	auMOGj/rTa/VdqE4ZoqGPLVNaA5skEl/PdgD4bs54CBPSE+wF8njazx4g8y+ZQjt8DQd
	hQCAtk560nFatnz62thhoQ4aikwvWGLO5yQzMXUHMxICWJqX4h2WqgvqhmQ2Np4vAM9C
	WolUptTGbL/DvNexBbjsRQaFeGeZ5x8yZAns6onD+Qnq0IVd0utrvPe37x+Y84xQZO9d
	VaW8EFSEEQalLsR0NCR1CleW02CYOJkh0jc+Ilr4a8cZQ2vGIgeY2fzbMrG+Ba782FB4
	uhoQ==
Received: by 10.66.75.162 with SMTP id d2mr46913272paw.27.1356191006388; Sat,
	22 Dec 2012 07:43:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.68.49.101 with HTTP; Sat, 22 Dec 2012 07:43:06 -0800 (PST)
In-Reply-To: <20121220013916.GA10560@cs.nctu.edu.tw>
References: <20121220013916.GA10560@cs.nctu.edu.tw>
From: Blue Swirl <blauwirbel@gmail.com>
Date: Sat, 22 Dec 2012 15:43:06 +0000
Message-ID: <CAAu8pHumCmDJGpKUAa3vmSG2NNxLmKGAGYNE+xhxJHMysud0vA@mail.gmail.com>
To: =?UTF-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.160.41
Cc: qemu-trivial@nongnu.org, Evgeny Voevodin <e.voevodin@samsung.com>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] translate-all.c: Use
 tb1->phys_hash_next directly in tb_remove
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
X-List-Received-Date: Sat, 22 Dec 2012 15:43:32 -0000

Thanks, applied.

On Thu, Dec 20, 2012 at 1:39 AM, =E9=99=B3=E9=9F=8B=E4=BB=BB (Wei-Ren Chen)
<chenwj@iis.sinica.edu.tw> wrote:
>   When tb_remove was first commited at fd6ce8f6, there were three differe=
nt
> calls pass different names to offsetof. In current codebase, the other tw=
o
> calls are replaced with tb_page_remove. There is no need to have a genera=
l
> tb_remove. Omit passing the third parameter and using tb1->phys_hash_next
> directly.
>
> Signed-off-by: Chen Wei-Ren <chenwj@iis.sinica.edu.tw>
> ---
> v3: Rebasing
>
> v2: Address Peter's comment.
>     - place comment used belong tb_remove above tb_phys_invalidate.
>     - remove unnecessary bracket.
>
>  translate-all.c |   12 +++++-------
>  1 files changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/translate-all.c b/translate-all.c
> index b621748..d367fc4 100644
> --- a/translate-all.c
> +++ b/translate-all.c
> @@ -759,19 +759,17 @@ static void tb_page_check(void)
>
>  #endif
>
> -/* invalidate one TB */
> -static inline void tb_remove(TranslationBlock **ptb, TranslationBlock *t=
b,
> -                             int next_offset)
> +static inline void tb_hash_remove(TranslationBlock **ptb, TranslationBlo=
ck *tb)
>  {
>      TranslationBlock *tb1;
>
>      for (;;) {
>          tb1 =3D *ptb;
>          if (tb1 =3D=3D tb) {
> -            *ptb =3D *(TranslationBlock **)((char *)tb1 + next_offset);
> +            *ptb =3D tb1->phys_hash_next;
>              break;
>          }
> -        ptb =3D (TranslationBlock **)((char *)tb1 + next_offset);
> +        ptb =3D &tb1->phys_hash_next;
>      }
>  }
>
> @@ -828,6 +826,7 @@ static inline void tb_reset_jump(TranslationBlock *tb=
, int n)
>      tb_set_jmp_target(tb, n, (uintptr_t)(tb->tc_ptr + tb->tb_next_offset=
[n]));
>  }
>
> +/* invalidate one TB */
>  void tb_phys_invalidate(TranslationBlock *tb, tb_page_addr_t page_addr)
>  {
>      CPUArchState *env;
> @@ -839,8 +838,7 @@ void tb_phys_invalidate(TranslationBlock *tb, tb_page=
_addr_t page_addr)
>      /* remove the TB from the hash list */
>      phys_pc =3D tb->page_addr[0] + (tb->pc & ~TARGET_PAGE_MASK);
>      h =3D tb_phys_hash_func(phys_pc);
> -    tb_remove(&tb_phys_hash[h], tb,
> -              offsetof(TranslationBlock, phys_hash_next));
> +    tb_hash_remove(&tb_phys_hash[h], tb);
>
>      /* remove the TB from the page list */
>      if (tb->page_addr[0] !=3D page_addr) {
> --
> 1.7.3.4
>

