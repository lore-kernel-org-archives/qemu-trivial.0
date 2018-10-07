Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g9Crh-0000NA-La
	for mharc-qemu-trivial@gnu.org; Sun, 07 Oct 2018 13:29:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48331)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1g9Crf-0000Lb-Dz
	for qemu-trivial@nongnu.org; Sun, 07 Oct 2018 13:29:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1g9Cre-0000cc-Nd
	for qemu-trivial@nongnu.org; Sun, 07 Oct 2018 13:29:11 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:37598)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1g9CrZ-0000YV-KI; Sun, 07 Oct 2018 13:29:05 -0400
Received: by mail-wm1-x341.google.com with SMTP id 185-v6so6150529wmt.2;
	Sun, 07 Oct 2018 10:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=mhBr4UJTiFJY0bfS1tOzjrthOUEmmpPLn0v/WMqk7xQ=;
	b=rw2p38RZWnyNpnAyw/vqmSD7D0LwsXXDjfYxvXnnRebtxDyc2CYPEHU5qZ2zGDlcSR
	sLjTIPeHpU1oq6Ia5P2v8buq50Vi1sp9RfkW5tn1WvvXJRIc7lfcEsvmdfeaGg9wjtlm
	n1KcDxx4Dp+w2TznNw+92p97Ty0U+OHCBm01gj2m4g+SP3xvkW7mu9p31GfmPkvLHgG1
	NAFgEtSSNs8/M9WZWVlzjssZJOCoYWPbVfpbjR+aDo5Gm+4+sYYfk2YXKrXn+qQdaFuv
	x1yKVyzxNGdaE0K+g76ZHlBnoROUQv3fMRbqjsHIfEUudtYO/vz9ziztaGB2wP+UxyT0
	RhBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=mhBr4UJTiFJY0bfS1tOzjrthOUEmmpPLn0v/WMqk7xQ=;
	b=VnBQeoHJk1xZLvcp12h9ayG0Dmp3xP0WX8vApxpjbmsr4CQhBX2jNw78uLOHi2DYo0
	vNb90NIWY+VkmAObj478Kal6tPm470WklEB+FyYGyrtikeT95E4K7HqLHBT2L63sv+7W
	oKRb3NRie+T0s5Hq5og7O1Zt5pxwThdstZuWTcCpP+eDdoVcHLkCBTzwD4ExxnVk/xdK
	QGlfffR84WAgwMKCYjVoucaaVegXMz0qDtfXVZK96dc2+UGKuVAehtU0Wr/hEkAFG37W
	6LoieU5ngK9CEgBPISeijhLu/F9ICBUK0rM0rwc+Ws8GiJrDOXGmfhq8loA3YSnfiRir
	ncnQ==
X-Gm-Message-State: ABuFfohxgJlv0moqKBTaG59Xz3DIga9uH7X3x6lKZSSQJheTKZcB+l3u
	9Bs9AUDuEVxwNR0013SFQtQ=
X-Google-Smtp-Source: ACcGV61w4/rmprgQM6dwll3qnZRc0KuEiHSAf32mldUDVYlUe5SrVk/umYoOQ0vJL0hma0JMweaeuQ==
X-Received: by 2002:a1c:f703:: with SMTP id
	v3-v6mr12853797wmh.48.1538933344317; 
	Sun, 07 Oct 2018 10:29:04 -0700 (PDT)
Received: from [192.168.2.51] (26.red-83-32-208.dynamicip.rima-tde.net.
	[83.32.208.26]) by smtp.gmail.com with ESMTPSA id
	g15-v6sm9931402wrp.56.2018.10.07.10.29.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 07 Oct 2018 10:29:03 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Stefan Weil <sw@weilnetz.de>, QEMU Developer <qemu-devel@nongnu.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
	qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
References: <20181006183851.3797-1-sw@weilnetz.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Autocrypt: addr=f4bug@amsat.org; prefer-encrypt=mutual; keydata=
	mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
	u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
	HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
	YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
	ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
	dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
	ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
	Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
	HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
	Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
	YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQJVBBMBAgA/AhsPBgsJ
	CAcDAgYVCAIJCgsEFgIDAQIeAQIXgBYhBPqr514SkXIh3P1rsuPjLCzercDeBQJbkphvBQkm
	loU1AAoJEOPjLCzercDeTLIP/3pzTBotxvkddIREaw2j/6RoxN1lj5hnCx/XHGF7QxAlO4uV
	7eB6hcZxAqlt4AyNX5jcsSxNMfVNGnZ+u4ni6VdRRLUOw/QPXKGV8siK2E1zOG1GwZSCJ5zb
	ol7gpXNnOG/+ZXDfvkfSNnpim0ahNIPX8WAaZ/qN7I1qsPGupK2JrlCot561TfIOT7KNZFAZ
	m66Hf8MeNr8HQtn+oDk6j7g6WuIYZiqvF1MladikIZXndDMCsopXsjOikMXtoVuC/df7BlwS
	UaM+DT47onbIfXOtsWQGd2dJhu07Kxphqlz1Uh3YA7IHsFzZkX+S9waPBEzC8YB39dkZKA2E
	XbObk/ZTtCBLb39KTN2L7bv3Agm6wYO/hw3DQJQV3/07vW1EJd4fglQB5IY2A3eQ/ZSuRVm1
	E1GyFszjLXKUQIKx1938zoLrUDDdWQH7bhhSvG7JWk1BKmJrIXDTDx1tvTOW2pYZuO1PNx+p
	EhJraVuu3jtSbEfH+uPeoWtJtqSRkz1fLqp+dbha24ldPeKw4ija/YTviOem5baUlf/iNgS+
	a0s0eoRiJFrGZFCKLGKgZYoJe1rccQR6JKKd8JpoaIQuzptcHZD4+qn8W8FUlkNWGfpTQrsN
	iPLZt2EFOFkbjoZ2EoEByCs9nZ8ro91+lq7QfH9RFcldKLZfPEWwHPrchQ42
Message-ID: <eddc100f-944d-7661-77c0-bb1c90ed315a@amsat.org>
Date: Sun, 7 Oct 2018 19:29:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181006183851.3797-1-sw@weilnetz.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: Re: [Qemu-trivial] [PATCH] qemu-io-cmds: Fix two format strings
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
X-List-Received-Date: Sun, 07 Oct 2018 17:29:12 -0000

On 10/6/18 8:38 PM, Stefan Weil wrote:
> Use %zu instead of %zd for unsigned numbers.
> 
> This fixes two error messages from the LSTM static code analyzer:
> 
> This argument should be of type 'ssize_t' but is of type 'unsigned long'

Eventually prepend some spaces to have the difference between your
statement and the analyzer output.

> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  qemu-io-cmds.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
> index db0b3ee5ef..5363482213 100644
> --- a/qemu-io-cmds.c
> +++ b/qemu-io-cmds.c
> @@ -907,7 +907,7 @@ static int readv_f(BlockBackend *blk, int argc, char **argv)
>          memset(cmp_buf, pattern, qiov.size);
>          if (memcmp(buf, cmp_buf, qiov.size)) {
>              printf("Pattern verification failed at offset %"
> -                   PRId64 ", %zd bytes\n", offset, qiov.size);
> +                   PRId64 ", %zu bytes\n", offset, qiov.size);
>              ret = -EINVAL;
>          }
>          g_free(cmp_buf);
> @@ -1294,7 +1294,7 @@ static void aio_read_done(void *opaque, int ret)
>          memset(cmp_buf, ctx->pattern, ctx->qiov.size);
>          if (memcmp(ctx->buf, cmp_buf, ctx->qiov.size)) {
>              printf("Pattern verification failed at offset %"
> -                   PRId64 ", %zd bytes\n", ctx->offset, ctx->qiov.size);
> +                   PRId64 ", %zu bytes\n", ctx->offset, ctx->qiov.size);
>          }
>          g_free(cmp_buf);
>      }
> 

