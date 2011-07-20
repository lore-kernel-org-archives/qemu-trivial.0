Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Qja4d-0004er-Ct
	for mharc-qemu-trivial@gnu.org; Wed, 20 Jul 2011 12:56:39 -0400
Received: from eggs.gnu.org ([140.186.70.92]:35684)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1Qja4Y-0004dQ-BC
	for qemu-trivial@nongnu.org; Wed, 20 Jul 2011 12:56:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1Qja4V-000659-Df
	for qemu-trivial@nongnu.org; Wed, 20 Jul 2011 12:56:33 -0400
Received: from mail-qy0-f180.google.com ([209.85.216.180]:33430)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1Qja4Q-00064a-VY; Wed, 20 Jul 2011 12:56:27 -0400
Received: by qyk30 with SMTP id 30so267976qyk.4
	for <multiple recipients>; Wed, 20 Jul 2011 09:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=HOSfBYelwU1K/0xcGQzSE9K+vNu+2TE7/nRLHXPiAfo=;
	b=Z5PkFbSHM7HyAhUPDV3TR7gsi8czPdQEgY63bWscZ35KE1WVK30B9iumHpWczeFg+n
	bBaKesoJ7VYSqE6l/AdjhoDYx5IcIi4YYIekNzCorbvOHtYhO1J/vxnA5g3sJ3oM+/Ye
	DOQHGGXT1JyOIT9ZzBjPcxHBvo5P0KqYqOyPc=
Received: by 10.224.193.7 with SMTP id ds7mr5439112qab.366.1311180986075; Wed,
	20 Jul 2011 09:56:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.224.29.6 with HTTP; Wed, 20 Jul 2011 09:56:06 -0700 (PDT)
In-Reply-To: <1311133315-978-1-git-send-email-cerbere@gmail.com>
References: <1311133315-978-1-git-send-email-cerbere@gmail.com>
From: Blue Swirl <blauwirbel@gmail.com>
Date: Wed, 20 Jul 2011 19:56:06 +0300
Message-ID: <CAAu8pHtoGceWve8PMWUFihSmhpsDQeiiO-wCQg6tC=xacXkooQ@mail.gmail.com>
To: Alexandre Raymond <cerbere@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.180
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Makefile: Minor cscope
	fixups
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
X-List-Received-Date: Wed, 20 Jul 2011 16:56:37 -0000

On Wed, Jul 20, 2011 at 6:41 AM, Alexandre Raymond <cerbere@gmail.com> wrot=
e:
> -Create cscope symbols for assembly files in addition to .c/.h files.
> -Create cscope database with full path instead of relative path so cscope
> =C2=A0can be used with CSCOPE_DB in any directory.
>
> Signed-off-by: Alexandre Raymond <cerbere@gmail.com>
> ---
> =C2=A0Makefile | =C2=A0 =C2=A02 +-
> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index b3ffbe2..4273b6f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -254,7 +254,7 @@ TAGS:
>
> =C2=A0cscope:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ./cscope.*
> - =C2=A0 =C2=A0 =C2=A0 find . -name "*.[ch]" -print | sed 's,^\./,,' > ./=
cscope.files
> + =C2=A0 =C2=A0 =C2=A0 find $$PWD -name "*.[chsS]" -print | sed 's,^\./,,=
' > ./cscope.files

Please use $$SRC_PATH instead.

> =C2=A0 =C2=A0 =C2=A0 =C2=A0cscope -b
>
> =C2=A0# documentation
> --
> 1.7.5
>
>
>

