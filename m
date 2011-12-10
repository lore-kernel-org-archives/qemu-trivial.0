Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RZB9c-0000HA-4V
	for mharc-qemu-trivial@gnu.org; Fri, 09 Dec 2011 19:51:04 -0500
Received: from eggs.gnu.org ([140.186.70.92]:33519)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1RZB9Y-000072-QA
	for qemu-trivial@nongnu.org; Fri, 09 Dec 2011 19:51:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1RZB9X-0003ci-WD
	for qemu-trivial@nongnu.org; Fri, 09 Dec 2011 19:51:00 -0500
Received: from cantor2.suse.de ([195.135.220.15]:36911 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1RZB9V-0003cF-Uf; Fri, 09 Dec 2011 19:50:58 -0500
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.221.2])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 6BE858B2F9;
	Sat, 10 Dec 2011 01:50:55 +0100 (CET)
Message-ID: <4EE2ACB3.1000704@suse.de>
Date: Sat, 10 Dec 2011 01:49:55 +0100
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1323472786-26821-1-git-send-email-sw@weilnetz.de>
	<1323472786-26821-2-git-send-email-sw@weilnetz.de>
In-Reply-To: <1323472786-26821-2-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.3.3
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/6] Add spelling exceptions
	for codespell
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
X-List-Received-Date: Sat, 10 Dec 2011 00:51:01 -0000

Am 10.12.2011 00:19, schrieb Stefan Weil:
> This file can be used with codespell to suppress wrong
> misspelling reports.
>=20
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  scripts/codespell.exclude |  215 +++++++++++++++++++++++++++++++++++++=
++++++++
>  1 files changed, 215 insertions(+), 0 deletions(-)
>  create mode 100644 scripts/codespell.exclude
>=20
> diff --git a/scripts/codespell.exclude b/scripts/codespell.exclude
> new file mode 100644
> index 0000000..d69c946
> --- /dev/null
> +++ b/scripts/codespell.exclude
> @@ -0,0 +1,215 @@
> +  .rela.bss      : { *(.rela.bss)               }
> +  .rela.bss      : { *(.rela.bss)		}
[...]

I don't like this.

Instead I suggest to keep a word list (that isn't whitespace-sensitive)
and to generate the .exclude file via shell script (grep -r) on the fly.

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

