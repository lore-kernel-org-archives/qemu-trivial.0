Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ipoGg-0004lu-V3
	for mharc-qemu-trivial@gnu.org; Fri, 10 Jan 2020 01:59:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49643)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dovgaluk@ispras.ru>) id 1ipnRv-0000sg-2Q
 for qemu-trivial@nongnu.org; Fri, 10 Jan 2020 01:07:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dovgaluk@ispras.ru>) id 1ipnRu-0005sJ-1e
 for qemu-trivial@nongnu.org; Fri, 10 Jan 2020 01:07:10 -0500
Received: from mail.ispras.ru ([83.149.199.45]:60068)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <dovgaluk@ispras.ru>)
 id 1ipnRr-0005Pn-2f; Fri, 10 Jan 2020 01:07:07 -0500
Received: from PASHAISP (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 09F69725C0;
 Fri, 10 Jan 2020 09:07:04 +0300 (MSK)
From: "Pavel Dovgalyuk" <dovgaluk@ispras.ru>
To: "'Daniel Henrique Barboza'" <danielhb413@gmail.com>,
 <qemu-devel@nongnu.org>
Cc: <qemu-trivial@nongnu.org>, "'Pavel Dovgalyuk'" <pavel.dovgaluk@ispras.ru>,
 "'Paolo Bonzini'" <pbonzini@redhat.com>
References: <20200106182425.20312-1-danielhb413@gmail.com>
 <20200106182425.20312-16-danielhb413@gmail.com>
In-Reply-To: <20200106182425.20312-16-danielhb413@gmail.com>
Subject: RE: [PATCH v1 15/59] block/blkreplay.c: remove unneeded 'fail' label
 in blkreplay_open()
Date: Fri, 10 Jan 2020 09:07:04 +0300
Message-ID: <000a01d5c77c$2ebb5a00$8c320e00$@ru>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AdXEvqbie5zFYprPSzi9IdjgcpaudwCvXYoQ
Content-Language: ru
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Received-From: 83.149.199.45
X-Mailman-Approved-At: Fri, 10 Jan 2020 01:59:37 -0500
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
X-List-Received-Date: Fri, 10 Jan 2020 06:07:12 -0000

> From: Daniel Henrique Barboza [mailto:danielhb413@gmail.com]
> Sent: Monday, January 06, 2020 9:24 PM
> To: qemu-devel@nongnu.org
> Cc: qemu-trivial@nongnu.org; Daniel Henrique Barboza; Pavel Dovgalyuk; Paolo Bonzini
> Subject: [PATCH v1 15/59] block/blkreplay.c: remove unneeded 'fail' label in blkreplay_open()
> 
> Both the 'fail' label and the 'ret' variable can be removed.
> Use 'return -EINVAL' in the error condition and 'return 0' in
> the end of the function.
> 
> CC: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
> CC: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>


Reviewed-by: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>

> ---
>  block/blkreplay.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/block/blkreplay.c b/block/blkreplay.c
> index c96ac8f4bc..d8c4c311f3 100644
> --- a/block/blkreplay.c
> +++ b/block/blkreplay.c
> @@ -24,23 +24,19 @@ static int blkreplay_open(BlockDriverState *bs, QDict *options, int flags,
>                            Error **errp)
>  {
>      Error *local_err = NULL;
> -    int ret;
> 
>      /* Open the image file */
>      bs->file = bdrv_open_child(NULL, options, "image",
>                                 bs, &child_file, false, &local_err);
>      if (local_err) {
> -        ret = -EINVAL;
>          error_propagate(errp, local_err);
> -        goto fail;
> +        return -EINVAL;
>      }
> 
>      bs->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED;
>      bs->supported_zero_flags = BDRV_REQ_WRITE_UNCHANGED;
> 
> -    ret = 0;
> -fail:
> -    return ret;
> +    return 0;
>  }
> 
>  static int64_t blkreplay_getlength(BlockDriverState *bs)
> --
> 2.24.1



Pavel Dovgalyuk


