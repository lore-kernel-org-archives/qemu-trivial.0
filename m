Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RYGkR-0003e6-8F
	for mharc-qemu-trivial@gnu.org; Wed, 07 Dec 2011 07:37:19 -0500
Received: from eggs.gnu.org ([140.186.70.92]:45881)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zwu.kernel@gmail.com>) id 1RYGkO-0003WH-R7
	for qemu-trivial@nongnu.org; Wed, 07 Dec 2011 07:37:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zwu.kernel@gmail.com>) id 1RYGkN-0002ge-GT
	for qemu-trivial@nongnu.org; Wed, 07 Dec 2011 07:37:16 -0500
Received: from mail-vx0-f173.google.com ([209.85.220.173]:53419)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zwu.kernel@gmail.com>)
	id 1RYGkE-0002fK-Ls; Wed, 07 Dec 2011 07:37:06 -0500
Received: by vcbfl11 with SMTP id fl11so365380vcb.4
	for <multiple recipients>; Wed, 07 Dec 2011 04:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=9zEYErlDxYjvkjyEbLywg6AGb4MAjiTm5+rXKZxoHM0=;
	b=X+3D/kx4FYnQhyUIBBhtRgsMGRP6w2+llvuV/gkBJTZcPgk5KK9d0OAoSNT2RsSv/3
	wJQUHeccH8c/RE/TqebPIcp2/VRkZVs27e3bpB+/2HbyAgenT0nd8n9EaIF9Yx4ugCTz
	I697c9uTiLhvLu87VJb7muNdjyutITtUSHyUU=
MIME-Version: 1.0
Received: by 10.220.96.211 with SMTP id i19mr2246020vcn.12.1323261426145; Wed,
	07 Dec 2011 04:37:06 -0800 (PST)
Received: by 10.220.175.202 with HTTP; Wed, 7 Dec 2011 04:37:06 -0800 (PST)
In-Reply-To: <CAFEAcA-sXKtM7=M2ZpdO5bKkxzrSL2w6MdYMNAzoiuQw5dJ_YQ@mail.gmail.com>
References: <1322905525-354-1-git-send-email-sw@weilnetz.de>
	<CAEH94LgMfEgcqMh5ObAS1vpyVCkSTYz=a58tc0P7qGqwdddvqA@mail.gmail.com>
	<CAFEAcA-sXKtM7=M2ZpdO5bKkxzrSL2w6MdYMNAzoiuQw5dJ_YQ@mail.gmail.com>
Date: Wed, 7 Dec 2011 20:37:06 +0800
Message-ID: <CAEH94LhC+uCrCwnvGUrB-sic=JK=7p=GmzsgvBqu24uQRBQpsw@mail.gmail.com>
From: Zhi Yong Wu <zwu.kernel@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.220.173
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Convert keymap file to
	UTF-8 encoding
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
X-List-Received-Date: Wed, 07 Dec 2011 12:37:18 -0000

On Wed, Dec 7, 2011 at 8:31 PM, Peter Maydell <peter.maydell@linaro.org> wr=
ote:
> On 7 December 2011 12:13, Zhi Yong Wu <zwu.kernel@gmail.com> wrote:
>> Can you let me know how you see that it is ISO-8859-1 coding, not
>> UTF-8? They look same to me.
>
> This gets a bit confusing because mail clients and
> web browsers tend to try to fix up what they think are
> wrongly labelled encodings, so for example in my mail
> client the diff looks like it is not changing anything.
> However if you look at the file in the current git repo
> with a hex editor:
> 00000000 =A023 20 32 30 30 34 2d 30 =A033 2d 31 36 20 48 61 6c =A0|# 2004=
-03-16 Hal|
> 00000010 =A06c 64 f3 72 20 47 75 f0 =A06d 75 6e 64 73 73 6f 6e =A0|ld.r G=
u.mundsson|
>
> you can see that there is an 0xf3 at offset 0x12, which
> is LATIN SMALL LETTER O WITH ACUTE in ISO-8859-1. ISO-8859-1
> is a one-byte-per-character encoding which is why it has a
> raw 0xf3 here. However although the character is at Unicode
> codepoint 0xf3 as well, the encoding of this in UTF-8 is
> the two byte sequence 0xc3 0xb3. Similarly the 0xf0 LATIN
> SMALL LETTER ETH has to be encoded as 0xc3 0xb0.
>
> If you look at the raw text of Stefan's email it reads:
> -# 2004-03-16 Halld=3DF3r Gu=3DF0mundsson and Morten Lange
> +# 2004-03-16 Halld=3DC3=3DB3r Gu=3DC3=3DB0mundsson and Morten Lange
>
> which is the quoted-printable encoding of this change.
thanks for your explain.

>
> -- PMM



--=20
Regards,

Zhi Yong Wu

