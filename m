Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXQ72-0004yv-0g
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 06:52:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48427)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1dXQ6z-0004x2-5J
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 06:52:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1dXQ6y-0006GH-Df
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 06:52:17 -0400
Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242]:36074)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1dXQ6y-0006Fk-64; Tue, 18 Jul 2017 06:52:16 -0400
Received: by mail-wr0-x242.google.com with SMTP id y67so1665048wrb.3;
	Tue, 18 Jul 2017 03:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=kGxfJk5h8IlvDnoO3XmdI6GqbF97NuZGWiECeIeRHZI=;
	b=j4FQQhx1Qu9QyJXLxe1uvy9gGEXn3ishyknvZMjzCYusolAhA27wedBEv/a8P98jCi
	GlhGUffkOa7dsFVBGuxvsMEqbx025z1byNzg/E3uUCj7VBqDLDkOVzMldzu6XYoRq9u8
	lKLDnmqHPoXJuZgj0NoYp1igG/1hVioTIFuEGw7NPMsc0WC8jM1VZ++/TneyD+HxVIif
	qVZO4ycFvpujeYBYZnSPTAlVe0rU9tr+i59TjteLZAjmpe8E/TJt4hZGCwQO6gQEcKiB
	Iem186MJnHeUQD7mbzYbiXO3Q507wS1RN3RdJSFVuaUHlpubIcwCskZLWqoBmQO8GDdb
	Cswg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=kGxfJk5h8IlvDnoO3XmdI6GqbF97NuZGWiECeIeRHZI=;
	b=ssg8lF8dzph79aDLk70qw6w4pJRle1brKldULe/tA8wLTKCl8DOGkSlaw8WWarbtpA
	8bNVlg74TAfkN5aYMG6OXXMwxDyVB2wq2ScI/OpHyO3KLDmpyKheyCrr8QwPtZGfXIkO
	/Fqb/tI5SdVSR3oBuzy13zRZGR7ykRRlE6Dl6yPo9XseEddMkjYn7XZNGZV58S025J+K
	5Hv1UoojuMfUY07LV24AfSlxemAPiGrpj/zeq5Wx105bEfwl5obWtEQLj1NVzB8uapMB
	H51qo82Ued/BhSqkb0gBNUhggxmLWalDqSKsQxiuIqi2V1rtGJHj9rEvpyE4G8rsL/Hf
	4BEQ==
X-Gm-Message-State: AIVw113/cgffCo0hR4XUPbCKxUQNct8c14whbYbQgmVd8CbXJNfLRZLr
	5kyrbsS2u5MO8WcyMqiPNJdFnWr+kg==
X-Received: by 10.80.168.197 with SMTP id k63mr1503968edc.10.1500375134323;
	Tue, 18 Jul 2017 03:52:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.175.70 with HTTP; Tue, 18 Jul 2017 03:52:13 -0700 (PDT)
In-Reply-To: <20170718061005.29518-30-f4bug@amsat.org>
References: <20170718061005.29518-1-f4bug@amsat.org>
	<20170718061005.29518-30-f4bug@amsat.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 18 Jul 2017 03:52:13 -0700
Message-ID: <CAJ+F1CLMxo1x8w_eiP7XKk1KXGnBN0z1ZTqMc2L7BmkSpE+N8g@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: qemu trival <qemu-trivial@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, 
	Michael Roth <mdroth@linux.vnet.ibm.com>, QEMU <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 29/29] tests/qapi: use
 ARRAY_SIZE macro
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
X-List-Received-Date: Tue, 18 Jul 2017 10:52:18 -0000

On Mon, Jul 17, 2017 at 11:10 PM, Philippe Mathieu-Daud=C3=A9
<f4bug@amsat.org> wrote:
> Applied using the Coccinelle semantic patch scripts/coccinelle/use_osdep.=
cocci
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  tests/test-string-output-visitor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/test-string-output-visitor.c b/tests/test-string-outpu=
t-visitor.c
> index e736db3af8..f0902dd49e 100644
> --- a/tests/test-string-output-visitor.c
> +++ b/tests/test-string-output-visitor.c
> @@ -97,7 +97,7 @@ static void test_visitor_out_intList(TestOutputVisitorD=
ata *data,
>      Error *err =3D NULL;
>      char *str;
>
> -    for (i =3D 0; i < sizeof(value) / sizeof(value[0]); i++) {
> +    for (i =3D 0; i < ARRAY_SIZE(value); i++) {
>          *tmp =3D g_malloc0(sizeof(**tmp));
>          (*tmp)->value =3D value[i];
>          tmp =3D &(*tmp)->next;
> --
> 2.13.2
>
>



--=20
Marc-Andr=C3=A9 Lureau

