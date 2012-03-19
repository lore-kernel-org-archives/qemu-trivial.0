Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S9ZuM-00006o-Pa
	for mharc-qemu-trivial@gnu.org; Mon, 19 Mar 2012 06:33:46 -0400
Received: from eggs.gnu.org ([208.118.235.92]:51036)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1S9Ztx-0007zn-F1
	for qemu-trivial@nongnu.org; Mon, 19 Mar 2012 06:33:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1S9Ztr-0005RL-6t
	for qemu-trivial@nongnu.org; Mon, 19 Mar 2012 06:33:21 -0400
Received: from cantor2.suse.de ([195.135.220.15]:36162 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1S9Ztk-0005Qh-PX; Mon, 19 Mar 2012 06:33:08 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 16CEE8FB75;
	Mon, 19 Mar 2012 11:33:07 +0100 (CET)
Message-ID: <4F670B62.2040606@suse.de>
Date: Mon, 19 Mar 2012 11:33:06 +0100
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120215 Thunderbird/10.0.2
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1331985651-16227-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1331985651-16227-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.3.5
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-mips: Remove unused
	inline function
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
X-List-Received-Date: Mon, 19 Mar 2012 10:33:45 -0000

Hello Stefan,

Am 17.03.2012 13:00, schrieb Stefan Weil:
> Function set_HILO is not needed anywhere.

Does this cause any warnings? Given the state mips is currently in (TCG
patches queuing), I'd suggest to hold this off for a bit, but I don't
really mind either way.

Commit message does not mention if this was never used in the first
place or became unused during TCG conversion or some other refactoring?

Andreas

>=20
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  target-mips/op_helper.c |    6 ------
>  1 files changed, 0 insertions(+), 6 deletions(-)
>=20
> diff --git a/target-mips/op_helper.c b/target-mips/op_helper.c
> index 3a20731..7b77d5a 100644
> --- a/target-mips/op_helper.c
> +++ b/target-mips/op_helper.c
> @@ -193,12 +193,6 @@ static inline uint64_t get_HILO (void)
>      return ((uint64_t)(env->active_tc.HI[0]) << 32) | (uint32_t)env->a=
ctive_tc.LO[0];
>  }
> =20
> -static inline void set_HILO (uint64_t HILO)
> -{
> -    env->active_tc.LO[0] =3D (int32_t)HILO;
> -    env->active_tc.HI[0] =3D (int32_t)(HILO >> 32);
> -}
> -
>  static inline void set_HIT0_LO (target_ulong arg1, uint64_t HILO)
>  {
>      env->active_tc.LO[0] =3D (int32_t)(HILO & 0xFFFFFFFF);

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

