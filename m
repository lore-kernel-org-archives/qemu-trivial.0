Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bk4oj-0003jr-NW
	for mharc-qemu-trivial@gnu.org; Wed, 14 Sep 2016 03:41:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55542)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk4og-0003fQ-SY
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 03:41:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk4oe-0007GO-SM
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 03:41:09 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57833)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bk4oX-0007Cd-6P; Wed, 14 Sep 2016 03:41:01 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 248D54183E;
	Wed, 14 Sep 2016 10:40:57 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id A391CAAB;
	Wed, 14 Sep 2016 10:40:56 +0300 (MSK)
To: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
References: <1466007277-17525-1-git-send-email-lvivier@redhat.com>
	<1466007277-17525-7-git-send-email-lvivier@redhat.com>
Cc: "Daniel P. Berrange" <berrange@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <22c9c385-17f4-3a91-3ca3-1bfc2487aba2@msgid.tls.msk.ru>
Date: Wed, 14 Sep 2016 10:40:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <1466007277-17525-7-git-send-email-lvivier@redhat.com>
Content-Type: text/plain; charset=windows-1251; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH 6/7] crypto: remove useless casts
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
X-List-Received-Date: Wed, 14 Sep 2016 07:41:12 -0000

15.06.2016 19:14, Laurent Vivier =EF=E8=F8=E5=F2:
> This patch is the result of coccinelle script
> scripts/coccinelle/typecast.cocci
>
> CC: Daniel P. Berrange <berrange@redhat.com>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  crypto/cipher-builtin.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/crypto/cipher-builtin.c b/crypto/cipher-builtin.c
> index 88963f6..d791c80 100644
> --- a/crypto/cipher-builtin.c
> +++ b/crypto/cipher-builtin.c
> @@ -132,7 +132,7 @@ static void qcrypto_cipher_aes_xts_encrypt(const vo=
id *ctx,
>  {
>      const QCryptoCipherBuiltinAESContext *aesctx =3D ctx;
>
> -    qcrypto_cipher_aes_ecb_encrypt((AES_KEY *)&aesctx->enc,
> +    qcrypto_cipher_aes_ecb_encrypt(&aesctx->enc,
>                                     src, dst, length);
>  }
>
> @@ -144,7 +144,7 @@ static void qcrypto_cipher_aes_xts_decrypt(const vo=
id *ctx,
>  {
>      const QCryptoCipherBuiltinAESContext *aesctx =3D ctx;
>
> -    qcrypto_cipher_aes_ecb_decrypt((AES_KEY *)&aesctx->dec,
> +    qcrypto_cipher_aes_ecb_decrypt(&aesctx->dec,
>                                     src, dst, length);
>  }

This patch causes the following build failure:

   CC    crypto/block.o
In file included from=20
/build/qemu/git/crypto/cipher.c:156:0:crypto/cipher-builtin.c: In=20
function =91qcrypto_cipher_aes_xts_encrypt=92:
crypto/cipher-builtin.c:135:36: error: passing argument 1 of=20
=91qcrypto_cipher_aes_ecb_encrypt=92 discards =91const=92 qualifier from =
pointer=20
target type [-Werror]
      qcrypto_cipher_aes_ecb_encrypt(&aesctx->enc,
                                     ^
crypto/cipher-builtin.c:76:13: note: expected =91struct AES_KEY *=92 but=20
argument is of type =91const struct AES_KEY *=92
  static void qcrypto_cipher_aes_ecb_encrypt(AES_KEY *key,
              ^
crypto/cipher-builtin.c: In function =91qcrypto_cipher_aes_xts_decrypt=92=
:
crypto/cipher-builtin.c:147:36: error: passing argument 1 of=20
=91qcrypto_cipher_aes_ecb_decrypt=92 discards =91const=92 qualifier from =
pointer=20
target type [-Werror]
      qcrypto_cipher_aes_ecb_decrypt(&aesctx->dec,
                                     ^
crypto/cipher-builtin.c:102:13: note: expected =91struct AES_KEY *=92 but=
=20
argument is of type =91const struct AES_KEY *=92
  static void qcrypto_cipher_aes_ecb_decrypt(AES_KEY *key,
              ^
cc1: all warnings being treated as errors

It's interesting that the qemu functions accepts const argument,
while apparently this is wrong, as qcrypto functions modifies their
args.  Looks like a bug either in qemu or qcrypto... :)

I'll reverted this change for now.

Thanks,

/mjt

