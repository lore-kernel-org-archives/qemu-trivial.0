Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WooLw-0002OH-Gk
	for mharc-qemu-trivial@gnu.org; Mon, 26 May 2014 02:25:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35821)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1WooLo-0002Bc-Lu
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 02:25:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1WooLg-00086A-Cb
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 02:25:36 -0400
Received: from oxygen.pond.sub.org ([144.76.244.19]:46271)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1WooLf-00085p-Vg
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 02:25:28 -0400
Received: from blackfin.pond.sub.org (p5B328AAB.dip0.t-ipconnect.de
	[91.50.138.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by oxygen.pond.sub.org (Postfix) with ESMTPSA id 9BB3B24C53;
	Mon, 26 May 2014 08:25:25 +0200 (CEST)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id E3D9830403AF; Mon, 26 May 2014 08:25:24 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1400878647-22176-1-git-send-email-mjt@msgid.tls.msk.ru>
Date: Mon, 26 May 2014 08:25:24 +0200
In-Reply-To: <1400878647-22176-1-git-send-email-mjt@msgid.tls.msk.ru> (Michael
	Tokarev's message of "Sat, 24 May 2014 00:57:27 +0400")
Message-ID: <87vbstawff.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 144.76.244.19
Cc: qemu-trivial@nongnu.org, alevy@redhat.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] libcacard: fix wrong array
	expansion logic
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
X-List-Received-Date: Mon, 26 May 2014 06:25:42 -0000

Michael Tokarev <mjt@tls.msk.ru> writes:

> The currrent code in libcacard/vcard_emul_nss.c:vcard_emul_options()
> has a weird bug in variable usage around expanding opts->vreader
> array.
>
> There's a helper variable, vreaderOpt, which is first needlessly
> initialized to NULL, next, conditionally, only we have to expand
> opts->vreader, receives array expansion from g_renew() (initially
> realloc), and next, even if we don't actually perform expansion,

I don't get the "(initially realloc)" part.  The sentence makes sense to
me just fine without it, though.

> the value of this variable is assigned to the actual array,
> opts->vreader, which was supposed to be expanded.
>
> So, since we expand the array by READER_STEP increments, only
> once in READER_STEP (=4) the code will work, in other 3/4 times
> it will fail badly.
>
> Fix this by not using this temp variable when expanding the
> array, and by dropping the useless =NULL initializer too -
> if it wasn't in place initially, compiler warned us about

"would have warned us"?

> this problem at the beginning.
>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  libcacard/vcard_emul_nss.c |    9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/libcacard/vcard_emul_nss.c b/libcacard/vcard_emul_nss.c
> index b7db51d..8462aef 100644
> --- a/libcacard/vcard_emul_nss.c
> +++ b/libcacard/vcard_emul_nss.c
> @@ -1149,7 +1149,7 @@ vcard_emul_options(const char *args)
>              char type_str[100];
>              VCardEmulType type;
>              int count, i;
> -            VirtualReaderOptions *vreaderOpt = NULL;
> +            VirtualReaderOptions *vreaderOpt;
>  
>              args = strip(args + 5);
>              if (*args != '(') {
> @@ -1173,11 +1173,10 @@ vcard_emul_options(const char *args)
>  
>              if (opts->vreader_count >= reader_count) {
>                  reader_count += READER_STEP;
> -                vreaderOpt = g_renew(VirtualReaderOptions, opts->vreader,
> -                                     reader_count);
> +                opts->vreader = g_renew(VirtualReaderOptions, opts->vreader,
> +                                        reader_count);
>              }
> -            opts->vreader = vreaderOpt;
> -            vreaderOpt = &vreaderOpt[opts->vreader_count];
> +            vreaderOpt = &opts->vreader[opts->vreader_count];
>              vreaderOpt->name = g_strndup(name, name_length);
>              vreaderOpt->vname = g_strndup(vname, vname_length);
>              vreaderOpt->card_type = type;

Much more straightforward now.  Thanks!

Reviewed-by: Markus Armbruster <armbru@redhat.com>

