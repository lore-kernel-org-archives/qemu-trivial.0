Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RXi3p-0006Om-3H
	for mharc-qemu-trivial@gnu.org; Mon, 05 Dec 2011 18:35:01 -0500
Received: from eggs.gnu.org ([140.186.70.92]:38502)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1RXi3m-0006GG-Dh
	for qemu-trivial@nongnu.org; Mon, 05 Dec 2011 18:34:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1RXi3l-0004zn-Eg
	for qemu-trivial@nongnu.org; Mon, 05 Dec 2011 18:34:58 -0500
Received: from cantor2.suse.de ([195.135.220.15]:36875 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>)
	id 1RXi3i-0004yq-2n; Mon, 05 Dec 2011 18:34:54 -0500
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.221.2])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 531ED8F0D1;
	Tue,  6 Dec 2011 00:34:53 +0100 (CET)
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Type: text/plain; charset=us-ascii
From: Alexander Graf <agraf@suse.de>
In-Reply-To: <1323126710-2242-1-git-send-email-peter.maydell@linaro.org>
Date: Tue, 6 Dec 2011 00:34:52 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <CC613A47-963C-4B7E-9C6C-F7195469AE3A@suse.de>
References: <1323126710-2242-1-git-send-email-peter.maydell@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.1084)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
	qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] linux-user/syscall.c: Don't skip
	stracing for fcntl64 failure case
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
X-List-Received-Date: Mon, 05 Dec 2011 23:34:59 -0000


On 06.12.2011, at 00:11, Peter Maydell wrote:

> In an fcntl64 failure path, we were returning directly rather than
> simply breaking out of the switch statement. This skips the strace
> code for printing the syscall return value, so don't do that.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Acked-by: Alexander Graf <agraf@suse.de>


Alex

> ---
> Alex Graf spotted this one...
>=20
> linux-user/syscall.c |    6 ++++--
> 1 files changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index f227097..4846b41 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -7521,8 +7521,10 @@ abi_long do_syscall(void *cpu_env, int num, =
abi_long arg1,
> #endif
>=20
> 	cmd =3D target_to_host_fcntl_cmd(arg2);
> -	if (cmd =3D=3D -TARGET_EINVAL)
> -		return cmd;
> +        if (cmd =3D=3D -TARGET_EINVAL) {
> +            ret =3D cmd;
> +            break;
> +        }
>=20
>         switch(arg2) {
>         case TARGET_F_GETLK64:
> --=20
> 1.7.5.4
>=20


