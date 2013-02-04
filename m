Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U2MKG-0005Nx-J0
	for mharc-qemu-trivial@gnu.org; Mon, 04 Feb 2013 08:43:12 -0500
Received: from eggs.gnu.org ([208.118.235.92]:34145)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1U2MKA-00056P-2E
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2013 08:43:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1U2MK8-0001WO-TH
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2013 08:43:05 -0500
Received: from cantor2.suse.de ([195.135.220.15]:53408 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1U2MK2-0001Un-9n; Mon, 04 Feb 2013 08:42:58 -0500
Received: from relay1.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 3B6ACA50F4;
	Mon,  4 Feb 2013 14:42:57 +0100 (CET)
Message-ID: <510FBADF.7000406@suse.de>
Date: Mon, 04 Feb 2013 14:42:55 +0100
From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130105 Thunderbird/17.0.2
MIME-Version: 1.0
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <1359267965-19902-1-git-send-email-afaerber@suse.de>
In-Reply-To: <1359267965-19902-1-git-send-email-afaerber@suse.de>
X-Enigmail-Version: 1.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-1.4] target-cris: Build
 fix for debug output
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
X-List-Received-Date: Mon, 04 Feb 2013 13:43:11 -0000

Am 27.01.2013 07:26, schrieb Andreas F=C3=A4rber:
> Around r3361 (81fdc5f8d2d681da8d255baf0713144f8656bac9) env->debug1 use=
d
> to contain the address of an MMU fault. This is now written into
> env->pregs[PR_EDA] instead.
>=20
> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
> ---
>  target-cris/op_helper.c |    2 +-
>  1 Datei ge=C3=A4ndert, 1 Zeile hinzugef=C3=BCgt(+), 1 Zeile entfernt(-=
)

Ping! Resent as part of my debug output RFC already, and it missed rc0.

CC'ing qemu-trivial as it should be easily confirmable by comparing the
mentioned commit with today's MMU fault handler (helper.c iirc).

Andreas

> diff --git a/target-cris/op_helper.c b/target-cris/op_helper.c
> index 0f6a1ee..b580513 100644
> --- a/target-cris/op_helper.c
> +++ b/target-cris/op_helper.c
> @@ -60,7 +60,7 @@ void tlb_fill(CPUCRISState *env, target_ulong addr, i=
nt is_write, int mmu_idx,
>      int ret;
> =20
>      D_LOG("%s pc=3D%x tpc=3D%x ra=3D%p\n", __func__,
> -          env->pc, env->debug1, (void *)retaddr);
> +          env->pc, env->pregs[PR_EDA], (void *)retaddr);
>      ret =3D cpu_cris_handle_mmu_fault(env, addr, is_write, mmu_idx);
>      if (unlikely(ret)) {
>          if (retaddr) {

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg

