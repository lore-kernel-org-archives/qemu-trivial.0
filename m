Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VLzZU-00065O-6g
	for mharc-qemu-trivial@gnu.org; Tue, 17 Sep 2013 14:00:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60185)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VLzZO-0005xP-5Z
	for qemu-trivial@nongnu.org; Tue, 17 Sep 2013 14:00:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VLzZI-0000FC-90
	for qemu-trivial@nongnu.org; Tue, 17 Sep 2013 14:00:14 -0400
Received: from [2a03:4000:1::4e2f:c7ac:d] (port=41657
	helo=v220110690675601.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1VLzZ7-0008I4-0z; Tue, 17 Sep 2013 13:59:57 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	8156B72819E7; Tue, 17 Sep 2013 19:59:55 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id oZLTBFZ81vnh; Tue, 17 Sep 2013 19:59:44 +0200 (CEST)
Received: from [192.168.178.35] (p54ADBB22.dip0.t-ipconnect.de [84.173.187.34])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	0FDEA72819DE; Tue, 17 Sep 2013 19:59:44 +0200 (CEST)
Message-ID: <5238988F.8050807@weilnetz.de>
Date: Tue, 17 Sep 2013 19:59:43 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1379188061-7634-1-git-send-email-mjt@msgid.tls.msk.ru>
	<1379188061-7634-6-git-send-email-mjt@msgid.tls.msk.ru>
In-Reply-To: <1379188061-7634-6-git-send-email-mjt@msgid.tls.msk.ru>
X-Enigmail-Version: 1.4.6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:1::4e2f:c7ac:d
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: [Qemu-trivial] [PULL 05/15] translate-all: Fix formatting of
	dump output
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
X-List-Received-Date: Tue, 17 Sep 2013 18:00:19 -0000

Am 14.09.2013 21:47, schrieb Michael Tokarev:
> From: Stefan Weil <sw@weilnetz.de>
>
> The page dump writes a table with 3 abi_ulong values in each row.
> These values take 8 or 16 characters (depending on sizeof abi_ulong).
>
> Fix the table headings to be aligned with the table columns.
>
> old:
> start    end      size     prot
> 0000000120000000-000000012021e000 000000000021e000 rwx
> 0000004000000000-0000004000002000 0000000000002000 ---
> 0000004000002000-0000004000802000 0000000000800000 rw-
>
> new:
> start            end              size             prot
> 0000000120000000-000000012021e000 000000000021e000 rwx
> 0000004000000000-0000004000002000 0000000000002000 ---
> 0000004000002000-0000004000802000 0000000000800000 rw-
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  translate-all.c |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/translate-all.c b/translate-all.c
> index 2c923c6..3b97c66 100644
> --- a/translate-all.c
> +++ b/translate-all.c
> @@ -1679,8 +1679,9 @@ static int dump_region(void *priv, abi_ulong star=
t,
>  /* dump memory mappings */
>  void page_dump(FILE *f)
>  {
> -    (void) fprintf(f, "%-8s %-8s %-8s %s\n",
> -            "start", "end", "size", "prot");
> +    const size_t length =3D sizeof(abi_ulong) * 2;
> +    (void) fprintf(f, "%-*s %-*s %-*s %s\n",
> +            length, "start", length, "end", length, "size", "prot");
>      walk_memory_regions(f, dump_region);
>  }
> =20

Sorry, I just noticed that this patch causes compiler warnings on some
systems:

translate-all.c:1684:13: error: field width specifier =E2=80=98*=E2=80=99=
 expects
argument of type =E2=80=98int=E2=80=99, but argument 3 has type =E2=80=98=
size_t=E2=80=99 [-Werror=3Dformat]
translate-all.c:1684:13: error: field width specifier =E2=80=98*=E2=80=99=
 expects
argument of type =E2=80=98int=E2=80=99, but argument 5 has type =E2=80=98=
size_t=E2=80=99 [-Werror=3Dformat]
translate-all.c:1684:13: error: field width specifier =E2=80=98*=E2=80=99=
 expects
argument of type =E2=80=98int=E2=80=99, but argument 7 has type =E2=80=98=
size_t=E2=80=99 [-Werror=3Dformat]

Changing the type of variable 'length' to int fixes this:

+    const int length =3D sizeof(abi_ulong) * 2;


Regards,
Stefan


