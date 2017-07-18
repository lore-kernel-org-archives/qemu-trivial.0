Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXQ7F-00059B-De
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 06:52:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48595)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1dXQ7B-00056z-NF
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 06:52:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1dXQ7A-0006NP-Se
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 06:52:29 -0400
Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243]:35009)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1dXQ7A-0006Mu-M3; Tue, 18 Jul 2017 06:52:28 -0400
Received: by mail-wr0-x243.google.com with SMTP id a10so3877911wrd.2;
	Tue, 18 Jul 2017 03:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=P1q2FMmYn+mTilfK7LQQBpTzrtwFvsa92L4VU0ZEDHs=;
	b=qUkSA5092goMz+PBRwbodRRkSjxj/C3/3qzOVXo0M/7ChqYqXkpaZSE30ajISHpCyR
	IB+W6o9GtG4JVq8BnOka7IonLzLDzx/wHgB5tVNF2OxAP1rZ/6N/xLI+qFjMgNGGlV5R
	tQLXQZveUAkNmesLbsqDs0Jlx3nvrQeiqa14Z7LRZzrBBwkxVQq2hvKVQ+fZtkemK1Oe
	aO2S3kZv6XCbXx8dopqbLBKqQmzu7RA/LJKO1e/Lb5R22VGbe144ACvnelC5co9FwmEy
	IW75ku13LLJMgyKLGHhDZ4D59kHeubGCP0ls7oST6SBdKflTR/RNyIeQdM1XKF9tq40+
	uAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=P1q2FMmYn+mTilfK7LQQBpTzrtwFvsa92L4VU0ZEDHs=;
	b=G6kdRU0xFPFlf9vnIInXUw246vNkO3swpEh6IsFc6iEm5UWJb1wjT4f3caMUUxjknW
	5LxFwV23PVGBkMBMX67f8dMSwpvcttIzqRYOYXdRaxwKv1nvDeWyFSquXVGY90TRDbrg
	771gzPsfEsKrAyxZtF4UkUl1Y2R79jRjf4At+HdmBs9FNhYoW+4kkzKWkar4y/5bYM/1
	ZUX50L8w67LFr579Pb5pXqPn4tkjpNRm4bHKHwX0KF06bZxdvmoQpP5xZJg7LKNRXfTa
	xcm6L9OLTRcDLOmaNKZH56GeVh0jkATSCnzzM7OPCgEtlTZUYsco0v57EIeVjcllQfhF
	fF6w==
X-Gm-Message-State: AIVw113/uaBY9z61fONUfX5LsV3O9+UbgzahHvxQsXT2+Oxrr4CkU4iK
	lykPIaMcXAn2w2YdSnrAkeDXelG/MA==
X-Received: by 10.80.168.70 with SMTP id j64mr1428039edc.110.1500375147550;
	Tue, 18 Jul 2017 03:52:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.175.70 with HTTP; Tue, 18 Jul 2017 03:52:26 -0700 (PDT)
In-Reply-To: <20170718061005.29518-28-f4bug@amsat.org>
References: <20170718061005.29518-1-f4bug@amsat.org>
	<20170718061005.29518-28-f4bug@amsat.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 18 Jul 2017 03:52:26 -0700
Message-ID: <CAJ+F1CKN2UUrEzq2Ut+HWWgFnYtuZ8opOF5TF5GqM-289UKLGQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: qemu trival <qemu-trivial@nongnu.org>, Fam Zheng <famz@redhat.com>, 
	John Snow <jsnow@redhat.com>,
	"open list:Block layer core" <qemu-block@nongnu.org>,
	QEMU <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 27/29] tests/hbitmap: use
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
X-List-Received-Date: Tue, 18 Jul 2017 10:52:31 -0000

On Mon, Jul 17, 2017 at 11:10 PM, Philippe Mathieu-Daud=C3=A9
<f4bug@amsat.org> wrote:
> Applied using the Coccinelle semantic patch scripts/coccinelle/use_osdep.=
cocci
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  tests/test-hbitmap.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/tests/test-hbitmap.c b/tests/test-hbitmap.c
> index 1acb353889..628e72122b 100644
> --- a/tests/test-hbitmap.c
> +++ b/tests/test-hbitmap.c
> @@ -813,7 +813,7 @@ static void test_hbitmap_serialize_basic(TestHBitmapD=
ata *data,
>      size_t buf_size;
>      uint8_t *buf;
>      uint64_t positions[] =3D { 0, 1, L1 - 1, L1, L2 - 1, L2, L2 + 1, L3 =
- 1 };
> -    int num_positions =3D sizeof(positions) / sizeof(positions[0]);
> +    int num_positions =3D ARRAY_SIZE(positions);
>
>      hbitmap_test_init(data, L3, 0);
>      g_assert(hbitmap_is_serializable(data->hb));
> @@ -838,7 +838,7 @@ static void test_hbitmap_serialize_part(TestHBitmapDa=
ta *data,
>      size_t buf_size;
>      uint8_t *buf;
>      uint64_t positions[] =3D { 0, 1, L1 - 1, L1, L2 - 1, L2, L2 + 1, L3 =
- 1 };
> -    int num_positions =3D sizeof(positions) / sizeof(positions[0]);
> +    int num_positions =3D ARRAY_SIZE(positions);
>
>      hbitmap_test_init(data, L3, 0);
>      buf_size =3D L2;
> @@ -880,7 +880,7 @@ static void test_hbitmap_serialize_zeroes(TestHBitmap=
Data *data,
>      int64_t next;
>      uint64_t min_l1 =3D MAX(L1, 64);
>      uint64_t positions[] =3D { 0, min_l1, L2, L3 - min_l1};
> -    int num_positions =3D sizeof(positions) / sizeof(positions[0]);
> +    int num_positions =3D ARRAY_SIZE(positions);
>
>      hbitmap_test_init(data, L3, 0);
>
> --
> 2.13.2
>
>



--=20
Marc-Andr=C3=A9 Lureau

