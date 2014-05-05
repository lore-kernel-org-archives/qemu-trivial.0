Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WhFNA-0003eu-Pf
	for mharc-qemu-trivial@gnu.org; Mon, 05 May 2014 05:39:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56681)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1WhFN4-0003Y8-TR
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 05:39:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1WhFMz-00051S-BT
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 05:39:38 -0400
Received: from cantor2.suse.de ([195.135.220.15]:33881 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1WhFMn-0004uJ-CQ; Mon, 05 May 2014 05:39:21 -0400
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id DEC2CAC4F;
	Mon,  5 May 2014 09:39:20 +0000 (UTC)
Message-ID: <53675C47.5020202@suse.de>
Date: Mon, 05 May 2014 11:39:19 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org
References: <1399281906-479-1-git-send-email-mjt@msgid.tls.msk.ru>
In-Reply-To: <1399281906-479-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 195.135.220.15
Cc: qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] readline: use g_strndup
 instead of open-coding it
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
X-List-Received-Date: Mon, 05 May 2014 09:39:44 -0000

Am 05.05.2014 11:25, schrieb Michael Tokarev:
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  util/readline.c |    4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/util/readline.c b/util/readline.c
> index 8441be4..a3fd2cb 100644
> --- a/util/readline.c
> +++ b/util/readline.c
> @@ -279,9 +279,7 @@ static void readline_completion(ReadLineState *rs)
> =20
>      rs->nb_completions =3D 0;
> =20
> -    cmdline =3D g_malloc(rs->cmd_buf_index + 1);
> -    memcpy(cmdline, rs->cmd_buf, rs->cmd_buf_index);
> -    cmdline[rs->cmd_buf_index] =3D '\0';
> +    cmdline =3D g_strndup(rs->cmd_buf, rs->cmd_buf_index);
>      rs->completion_finder(rs->opaque, cmdline);
>      g_free(cmdline);
> =20

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

