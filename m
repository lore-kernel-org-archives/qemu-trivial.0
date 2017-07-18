Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXQLx-0002lT-9K
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 07:07:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54083)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1dXQLu-0002hx-CT
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 07:07:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1dXQLo-0005YR-Oy
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 07:07:42 -0400
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:33156)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1dXQLo-0005Y8-F2; Tue, 18 Jul 2017 07:07:36 -0400
Received: by mail-lf0-x241.google.com with SMTP id t72so1426875lff.0;
	Tue, 18 Jul 2017 04:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=RfefbyO0FN81EWXOsRhzchldHz+dC66CluQKAHx3fuQ=;
	b=Gg66GEYmSiLFNm3P1qfkGhT7toWtqMBH7D07IT+vWHNEmeNvbIr013jsPh9BPB4cKP
	wOnHvOzeXA8gEJv8w3hy2bHguMDwGXAya/k3EQCpokSGDHpVEBNyotRU0Fpy6a1GgHST
	P6kDCPZLr9Njuvcy8wt5Tv/aJRBSQ6jvCb56rUj7towLmO/dPdLsrlcpPnWKK9g+bvNV
	TONlnge9ywY5eLL/V5TlLGOGmiGIsXMIuvm3EmUNnD0yar1UIRmBHy7JZWn7EwTGNBLj
	WaAmBNgKJMgWfPa2DB1iKAOAt+Cm2k4L/+3uC+bc7RvBkGGx138/E6Ba1JVmZkW7hIN7
	3g4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=RfefbyO0FN81EWXOsRhzchldHz+dC66CluQKAHx3fuQ=;
	b=iKAjxSq/9UakPE33MwxAz7E9bZe4JHB/0VO7seAsDv9ZYJFT+W60pc9iG9aE+goYqy
	Xclv8UqBJwgyRxfOsK467ukcKj34F4YqRJy58mJ9A+WVBxckuVyWiZancS6FLPhPQ3EW
	f3ygyR0MfU7OoL1POl/RWmGiRHmVpoj0Aq3gPikiBXB8b96PiSyoNQKj6mxAlvEQ9Q9B
	jt30u6Kkwb4fcOFZ007CmML9DzzBqjXmCVQnvNG+wx2TCXqAX+Vg/fKsGr/Lj8CoUiLu
	Z0Xl2Os37TOzefQ5PYIjiCvurOy2WM6Gvj9NhRw16tibTclgHnAKg9DNSP8qLMMlSBDj
	y+zw==
X-Gm-Message-State: AIVw111v9q+9o+Nk8k2shWyNSd6NsALwc2Nm8ElOsTVNgcrxs7hjrvaw
	kss1b7F0by//r9doFRMwKq0XORKtxw==
X-Received: by 10.46.21.71 with SMTP id 7mr535824ljv.50.1500376055184; Tue, 18
	Jul 2017 04:07:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.59.145 with HTTP; Tue, 18 Jul 2017 04:07:34 -0700 (PDT)
In-Reply-To: <20170718061005.29518-20-f4bug@amsat.org>
References: <20170718061005.29518-1-f4bug@amsat.org>
	<20170718061005.29518-20-f4bug@amsat.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 18 Jul 2017 04:07:34 -0700
Message-ID: <CAJ+F1CJL8krrmFwCgqx6qZepkNZbcvTJrkOEVcsWiHurCBcUZw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: qemu trival <qemu-trivial@nongnu.org>, Richard Henderson <rth@twiddle.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Huth <thuth@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	QEMU <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 19/29] disas: use
 QEMU_IS_ALIGNED macro
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Jul 2017 11:07:43 -0000

Hi

On Mon, Jul 17, 2017 at 11:09 PM, Philippe Mathieu-Daud=C3=A9
<f4bug@amsat.org> wrote:
> Applied using the Coccinelle semantic patch scripts/coccinelle/use_osdep.=
cocci
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>
> There is no entry for this file in MAINTAINERS, should it go under TCG/Ov=
erall?

That would make sense to me.

>
>  disas.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/disas.c b/disas.c
> index d335c55bbf..8b59448286 100644
> --- a/disas.c
> +++ b/disas.c
> @@ -151,7 +151,7 @@ static int print_insn_objdump(bfd_vma pc, disassemble=
_info *info,
>      info->read_memory_func(pc, buf, n, info);
>
>      for (i =3D 0; i < n; ++i) {
> -        if (i % 32 =3D=3D 0) {
> +        if (QEMU_IS_ALIGNED(i, 32)) {
>              info->fprintf_func(info->stream, "\n%s: ", prefix);
>          }
>          info->fprintf_func(info->stream, "%02x", buf[i]);
> --
> 2.13.2
>
>



--=20
Marc-Andr=C3=A9 Lureau

