Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXQ8O-0006FC-E1
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 06:53:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48934)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1dXQ8K-0006CW-5O
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 06:53:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1dXQ8J-0006u3-Dy
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 06:53:40 -0400
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:35614)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1dXQ8J-0006tq-5o; Tue, 18 Jul 2017 06:53:39 -0400
Received: by mail-lf0-x243.google.com with SMTP id z78so1376130lff.2;
	Tue, 18 Jul 2017 03:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=1upIxprBQctTdymfilLk/oa//aE7kQ6uzhE6DHFEv+E=;
	b=JK6uMJr44DM503jV2inu499z4qUpdfob8QSDZeq2JlPLg7ss9/2PgHgXDnZCwAgU0r
	OHp/X87UJLwJNxteY3ueV/u0qUNvnX0uqlrWNy1NWZOh5gfYC40G7PF+u3WEAuK/pk0J
	COnQE3KLYpa/bmyu/GUjqy/HS6xk0hGzBwvNMslSb1QrbbeIz8XP2Lg06OLYEIQCsoxJ
	9Gy/iw/AZ5KJPj1T5bBvrobjHhSsAjptePrjDp7R7gknT2Nl59rUc39+cEwBAaE/04ZS
	9EPeTNzwz5DpTw4qYRSL8bqXt4Hs2hnpywEPHmC66xGrDz9aySUDNUkdeuNxoyjxQK+7
	mg3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=1upIxprBQctTdymfilLk/oa//aE7kQ6uzhE6DHFEv+E=;
	b=jVqrhN88NggT92ndZFuhoufmSohVhH7C0ssGwSNagaIgHqW08mLXGQMNQ+ZGN1APRk
	d5Qu5jwmVK4IEZS60GQkEyI2s4Z9pLm0HUdFJKdn1zxxInu0EN07i1e7/Y6IHy93sdYK
	Ksgvxg5zbtAX/TBTVQchl/yJULSQkkto9IBhOSgXrhi8GmOmqOz7mvTU1uACBaZr1ZDV
	P3xKvpY+UbqQehVdIODuI4nI2CmM/gRmgncucEUU4FDBgzOqT5ykacYjeOTUw4TzLLxj
	swvjnTGxEu6RCRorPelkN2OWULz0QLQt/EjxJPNfq1NB/tOQFrboNEINqUgfvO7cw3f9
	Tx+A==
X-Gm-Message-State: AIVw111j1FQ1KT2WxEW1lyHkXst0mwue4w16sWdEARnwMNMGxJTGSeIO
	DHsc8EudUGz15qjZC90UfAw+kDIizQ==
X-Received: by 10.80.205.217 with SMTP id h25mr1416812edj.59.1500375217683;
	Tue, 18 Jul 2017 03:53:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.175.70 with HTTP; Tue, 18 Jul 2017 03:53:37 -0700 (PDT)
In-Reply-To: <20170718061005.29518-29-f4bug@amsat.org>
References: <20170718061005.29518-1-f4bug@amsat.org>
	<20170718061005.29518-29-f4bug@amsat.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 18 Jul 2017 03:53:37 -0700
Message-ID: <CAJ+F1CJM0ueL1n39CxPvmL6EbW5TBP1XEruNMTT6JkzB4hGhEw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: qemu trival <qemu-trivial@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, 
	Michael Roth <mdroth@linux.vnet.ibm.com>, QEMU <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 28/29] tests/qapi: use
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
X-List-Received-Date: Tue, 18 Jul 2017 10:53:41 -0000

On Mon, Jul 17, 2017 at 11:10 PM, Philippe Mathieu-Daud=C3=A9
<f4bug@amsat.org> wrote:
> Applied using the Coccinelle semantic patch scripts/coccinelle/use_osdep.=
cocci
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  tests/test-qobject-output-visitor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/test-qobject-output-visitor.c b/tests/test-qobject-out=
put-visitor.c
> index 749c54065f..121ee181a0 100644
> --- a/tests/test-qobject-output-visitor.c
> +++ b/tests/test-qobject-output-visitor.c
> @@ -558,7 +558,7 @@ static void init_native_list(UserDefNativeListUnion *=
cvalue)
>          boolList **list =3D &cvalue->u.boolean.data;
>          for (i =3D 0; i < 32; i++) {
>              *list =3D g_new0(boolList, 1);
> -            (*list)->value =3D (i % 3 =3D=3D 0);
> +            (*list)->value =3D QEMU_IS_ALIGNED(i, 3);
>              (*list)->next =3D NULL;
>              list =3D &(*list)->next;
>          }
> --
> 2.13.2
>
>



--=20
Marc-Andr=C3=A9 Lureau

