Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bG2UE-0002Ax-1c
	for mharc-qemu-trivial@gnu.org; Thu, 23 Jun 2016 07:07:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58378)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1bG2U8-000232-Te
	for qemu-trivial@nongnu.org; Thu, 23 Jun 2016 07:07:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1bG2U6-000514-Lk
	for qemu-trivial@nongnu.org; Thu, 23 Jun 2016 07:07:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44534)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1bG2Ty-0004zX-OV; Thu, 23 Jun 2016 07:07:38 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5E1B57F6A8;
	Thu, 23 Jun 2016 11:07:38 +0000 (UTC)
Received: from redhat.com (vpn1-7-123.ams2.redhat.com [10.36.7.123])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5NB7Z7v014105
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 23 Jun 2016 07:07:37 -0400
Date: Thu, 23 Jun 2016 12:07:35 +0100
From: "Daniel P. Berrange" <berrange@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Message-ID: <20160623110735.GN17868@redhat.com>
Reply-To: "Daniel P. Berrange" <berrange@redhat.com>
References: <1466007277-17525-1-git-send-email-lvivier@redhat.com>
	<1466007277-17525-7-git-send-email-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1466007277-17525-7-git-send-email-lvivier@redhat.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 23 Jun 2016 11:07:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Thu, 23 Jun 2016 11:07:52 -0000

On Wed, Jun 15, 2016 at 06:14:36PM +0200, Laurent Vivier wrote:
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
> @@ -132,7 +132,7 @@ static void qcrypto_cipher_aes_xts_encrypt(const void *ctx,
>  {
>      const QCryptoCipherBuiltinAESContext *aesctx = ctx;
>  
> -    qcrypto_cipher_aes_ecb_encrypt((AES_KEY *)&aesctx->enc,
> +    qcrypto_cipher_aes_ecb_encrypt(&aesctx->enc,
>                                     src, dst, length);
>  }
>  
> @@ -144,7 +144,7 @@ static void qcrypto_cipher_aes_xts_decrypt(const void *ctx,
>  {
>      const QCryptoCipherBuiltinAESContext *aesctx = ctx;
>  
> -    qcrypto_cipher_aes_ecb_decrypt((AES_KEY *)&aesctx->dec,
> +    qcrypto_cipher_aes_ecb_decrypt(&aesctx->dec,
>                                     src, dst, length);
>  }

Reviewed-by: Daniel P. Berrange <berrange@redhat.com>

I'm fine with this going in via qemu-trivial.

Regards,
Daniel
-- 
|: http://berrange.com      -o-    http://www.flickr.com/photos/dberrange/ :|
|: http://libvirt.org              -o-             http://virt-manager.org :|
|: http://autobuild.org       -o-         http://search.cpan.org/~danberr/ :|
|: http://entangle-photo.org       -o-       http://live.gnome.org/gtk-vnc :|

