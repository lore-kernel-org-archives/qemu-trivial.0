Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iVDMO-0006u5-7V
	for mharc-qemu-trivial@gnu.org; Thu, 14 Nov 2019 06:32:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34686)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iVDMM-0006tm-0y
 for qemu-trivial@nongnu.org; Thu, 14 Nov 2019 06:32:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iVDMK-0005VJ-My
 for qemu-trivial@nongnu.org; Thu, 14 Nov 2019 06:32:21 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:46319
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iVDMK-0005V9-JN
 for qemu-trivial@nongnu.org; Thu, 14 Nov 2019 06:32:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573731139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pgPCCiSHyIBFq6EJUGBSuA/voNIZAh/gwRwyhgHUZ0I=;
 b=R9QnWcNSSpSIeQrzIQ96Q6XiS0H3Ev/NzjaBWPRhB6qeIXTeZ5wxwX1kZFm4j6tFav+tC1
 DITNpYS2sR0Tr10TGUoP3r+IudbxHQA5G+k64YDmClrymUrWnuCdxzT41GWCWVeU6h1ZJy
 Uxc13R/hUZKChO9rCfHnjpCexfAZw9c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-P5sZXEB4MNOqLL8LAHay-g-1; Thu, 14 Nov 2019 06:32:18 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98C00A2C3A;
 Thu, 14 Nov 2019 11:32:17 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-89.ams2.redhat.com
 [10.36.116.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B94495DA7E;
 Thu, 14 Nov 2019 11:32:16 +0000 (UTC)
Subject: Re: [PATCH] tests: fix modules-test 'duplicate test case' error
To: Cole Robinson <crobinso@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <d64c9aa098cc6e5c0b638438c4959eddfa7e24e2.1573679311.git.crobinso@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <a8407dbf-85d4-c0d0-b339-0ab9ce7d3b63@redhat.com>
Date: Thu, 14 Nov 2019 12:32:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <d64c9aa098cc6e5c0b638438c4959eddfa7e24e2.1573679311.git.crobinso@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: P5sZXEB4MNOqLL8LAHay-g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Nov 2019 11:32:23 -0000

On 13/11/2019 22.09, Cole Robinson wrote:
> ./configure --enable-sdl --audio-drv-list=3Dsdl --enable-modules
>=20
> Will generate two identical test names: /$arch/module/load/sdl
> Which generates an error like:
>=20
> (tests/modules-test:23814): GLib-ERROR **: 18:23:06.359: duplicate test c=
ase path: /aarch64//module/load/sdl
>=20
> Add the subsystem prefix in the name as well, so instead we get:
>=20
> /$arch/module/load/audio-sdl
> /$arch/module/load/ui-sdl
>=20
> Signed-off-by: Cole Robinson <crobinso@redhat.com>
> ---
>  tests/modules-test.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/modules-test.c b/tests/modules-test.c
> index d1a6ace218..88217686e1 100644
> --- a/tests/modules-test.c
> +++ b/tests/modules-test.c
> @@ -64,7 +64,8 @@ int main(int argc, char *argv[])
>      g_test_init(&argc, &argv, NULL);
> =20
>      for (i =3D 0; i < G_N_ELEMENTS(modules); i +=3D 2) {
> -        char *testname =3D g_strdup_printf("/module/load/%s", modules[i =
+ 1]);
> +        char *testname =3D g_strdup_printf("/module/load/%s%s",
> +                                         modules[i], modules[i + 1]);
>          qtest_add_data_func(testname, modules + i, test_modules_load);
>          g_free(testname);
>      }
>=20

Reviewed-by: Thomas Huth <thuth@redhat.com>


