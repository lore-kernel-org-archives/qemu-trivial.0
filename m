Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ti3p0-00010F-Kv
	for mharc-qemu-trivial@gnu.org; Mon, 10 Dec 2012 08:55:02 -0500
Received: from eggs.gnu.org ([208.118.235.92]:59662)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1Ti3oq-0000cG-IG
	for qemu-trivial@nongnu.org; Mon, 10 Dec 2012 08:55:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1Ti3og-0008BW-Qb
	for qemu-trivial@nongnu.org; Mon, 10 Dec 2012 08:54:52 -0500
Received: from csmailer.cs.nctu.edu.tw ([140.113.235.130]:37898)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>)
	id 1Ti3oV-000894-Ah; Mon, 10 Dec 2012 08:54:31 -0500
Received: from csmailer.cs.nctu.edu.tw (localhost [127.0.0.1])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 2897F80E;
	Mon, 10 Dec 2012 21:54:30 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=cs.nctu.edu.tw; h=date
	:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to:content-transfer-encoding; s=rsa1024;
	bh=Yk8sVHyT/UrXaQJhzikza0FdlOY=; b=lRfz3B1KC39Lhl6TbX0yjX76r2y0
	qe+jOxNnVPpjlFLrhIL57ODqX+0eZc/5Ou2mU2q4Em/DFBfs19jVncEF4qnJbkbx
	j8nfYwBNcHqHZB3s2DLqLPLBxc8mtCqBdFEAksHP/8SzjEe9H5EXy8C5JrHc5Mhh
	m/YAh2utCcdfnRo=
Received: from alumni.cs.nctu.edu.tw (alumni.cs.nctu.edu.tw [140.113.235.116])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id F20E980D;
	Mon, 10 Dec 2012 21:54:29 +0800 (CST)
Received: (from chenwj@localhost)
	by alumni.cs.nctu.edu.tw (8.14.5/8.14.5/Submit) id qBADsT6M040976;
	Mon, 10 Dec 2012 21:54:29 +0800 (CST) (envelope-from chenwj)
Date: Mon, 10 Dec 2012 21:54:29 +0800
From: =?utf-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>
To: qemu-devel@nongnu.org
Message-ID: <20121210135429.GA40858@cs.nctu.edu.tw>
References: <20121120235248.GA24638@cs.nctu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20121120235248.GA24638@cs.nctu.edu.tw>
User-Agent: Mutt/1.5.21 (2010-09-15)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: FreeBSD 8.x
X-Received-From: 140.113.235.130
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Evgeny Voevodin <e.voevodin@samsung.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] exec.c: Use
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
X-List-Received-Date: Mon, 10 Dec 2012 13:55:00 -0000

  [CC'ed qemu-trivial]

  ping?

On Wed, Nov 21, 2012 at 07:52:48AM +0800, =E9=99=B3=E9=9F=8B=E4=BB=BB (We=
i-Ren Chen) wrote:
>   When tb_remove was first commited at fd6ce8f6, there were three diffe=
rent
> calls pass different names to offsetof. In current codebase, the other =
two
> calls are replaced with tb_page_remove. There is no need to have a gene=
ral
> tb_remove. Omit passing the third parameter and using tb1->phys_hash_ne=
xt
> directly.
>=20
> Signed-off-by: Chen Wei-Ren <chenwj@iis.sinica.edu.tw>
> ---
>=20
> v2: Address Peter's comment.
>     - place comment used belong tb_remove above tb_phys_invalidate.
>     - remove unnecessary bracket.
>=20
>  exec.c |   12 +++++-------
>  1 files changed, 5 insertions(+), 7 deletions(-)
>=20
> diff --git a/exec.c b/exec.c
> index 8435de0..6343838 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -862,18 +862,16 @@ static void tb_page_check(void)
> =20
>  #endif
> =20
> -/* invalidate one TB */
> -static inline void tb_remove(TranslationBlock **ptb, TranslationBlock =
*tb,
> -                             int next_offset)
> +static inline void tb_hash_remove(TranslationBlock **ptb, TranslationB=
lock *tb)
>  {
>      TranslationBlock *tb1;
>      for(;;) {
>          tb1 =3D *ptb;
>          if (tb1 =3D=3D tb) {
> -            *ptb =3D *(TranslationBlock **)((char *)tb1 + next_offset)=
;
> +            *ptb =3D tb1->phys_hash_next;
>              break;
>          }
> -        ptb =3D (TranslationBlock **)((char *)tb1 + next_offset);
> +        ptb =3D &tb1->phys_hash_next;
>      }
>  }
> =20
> @@ -929,6 +927,7 @@ static inline void tb_reset_jump(TranslationBlock *=
tb, int n)
>      tb_set_jmp_target(tb, n, (uintptr_t)(tb->tc_ptr + tb->tb_next_offs=
et[n]));
>  }
> =20
> +/* invalidate one TB */
>  void tb_phys_invalidate(TranslationBlock *tb, tb_page_addr_t page_addr=
)
>  {
>      CPUArchState *env;
> @@ -940,8 +939,7 @@ void tb_phys_invalidate(TranslationBlock *tb, tb_pa=
ge_addr_t page_addr)
>      /* remove the TB from the hash list */
>      phys_pc =3D tb->page_addr[0] + (tb->pc & ~TARGET_PAGE_MASK);
>      h =3D tb_phys_hash_func(phys_pc);
> -    tb_remove(&tb_phys_hash[h], tb,
> -              offsetof(TranslationBlock, phys_hash_next));
> +    tb_hash_remove(&tb_phys_hash[h], tb);
> =20
>      /* remove the TB from the page list */
>      if (tb->page_addr[0] !=3D page_addr) {
> --=20
> 1.7.3.4
>=20
>=20
> --=20
> Wei-Ren Chen (=E9=99=B3=E9=9F=8B=E4=BB=BB)
> Computer Systems Lab, Institute of Information Science,
> Academia Sinica, Taiwan (R.O.C.)
> Tel:886-2-2788-3799 #1667
> Homepage: http://people.cs.nctu.edu.tw/~chenwj

--=20
Wei-Ren Chen (=E9=99=B3=E9=9F=8B=E4=BB=BB)
Computer Systems Lab, Institute of Information Science,
Academia Sinica, Taiwan (R.O.C.)
Tel:886-2-2788-3799 #1667
Homepage: http://people.cs.nctu.edu.tw/~chenwj

