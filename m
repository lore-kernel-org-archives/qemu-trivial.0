Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TENPU-0002wn-Vl
	for mharc-qemu-trivial@gnu.org; Wed, 19 Sep 2012 12:46:00 -0400
Received: from eggs.gnu.org ([208.118.235.92]:46958)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TENPT-0002tn-65
	for qemu-trivial@nongnu.org; Wed, 19 Sep 2012 12:46:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TENPQ-0008UU-Rl
	for qemu-trivial@nongnu.org; Wed, 19 Sep 2012 12:45:59 -0400
Received: from mail-ie0-f173.google.com ([209.85.223.173]:35656)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TENPQ-0008UL-Mj
	for qemu-trivial@nongnu.org; Wed, 19 Sep 2012 12:45:56 -0400
Received: by iebc10 with SMTP id c10so1756168ieb.4
	for <qemu-trivial@nongnu.org>; Wed, 19 Sep 2012 09:45:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=AxFpu5YG2wKngPEJ9qdic7PHSiERkpXt2I5KqQdWn4I=;
	b=ZSjQCwyZG6bhQIC2crTS9MqaoYV3ZFkGnDEEk4YiN4C1UwGyBzi29T3tnMa1Y3Xvry
	JGqh2KyXjCQNkzmTt5kEcNDd4kEeiYrchaX4W/IQm4cSfUBVtVrHWmtE2jw6FhvNllON
	KLL4tCenYv+8g6iia0FwaZ3fRobVsjzyDxQobo/kly1YG3dhZJibJ8pOe54EaXAsuoMJ
	SGCfQFP3M8Pl12ZpzEW+8nDR0Ol/1sV4Ypl6x/+kPCeZ3S7W39jvHJ+OnhU3DaFYO88i
	NPp3zdB1pgBYFFi6Qsw61gIj58JJ9b9f7SOGHrjpDsNJO9DP6Pnb4tgaegQvyU1nYh2H
	PxjQ==
MIME-Version: 1.0
Received: by 10.50.156.132 with SMTP id we4mr3319242igb.60.1348073155862; Wed,
	19 Sep 2012 09:45:55 -0700 (PDT)
Received: by 10.50.19.36 with HTTP; Wed, 19 Sep 2012 09:45:55 -0700 (PDT)
In-Reply-To: <1348072874-2096-1-git-send-email-sw@weilnetz.de>
References: <1348072874-2096-1-git-send-email-sw@weilnetz.de>
Date: Wed, 19 Sep 2012 17:45:55 +0100
Message-ID: <CAFEAcA8Yc1V1jnqrsOPT-JVgNX2RmkM2RoZUg2DzAHtW+dWtUA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQngX5b2ST1hP9pd6NCMJVXi8MK/Fa5xdwQL80biqEyaeG7vSZHsGkkOomIEq9S52rqWjkuh
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.223.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] pflash: Avoid warnings from
	coverity
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
X-List-Received-Date: Wed, 19 Sep 2012 16:46:00 -0000

On 19 September 2012 17:41, Stefan Weil <sw@weilnetz.de> wrote:
> hw/pflash_cfi01.c:209:
> check_return: Calling function "bdrv_write" without checking return value (as is done elsewhere 35 out of 37 times).
>
> hw/pflash_cfi02.c:144:
> unterminated_default: The default case is not terminated by a 'break' statement.
>
> hw/pflash_cfi02.c:238:
> check_return: Calling function "bdrv_write" without checking return value (as is done elsewhere 35 out of 37 times).
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/pflash_cfi01.c |    6 ++++--
>  hw/pflash_cfi02.c |    7 +++++--
>  2 files changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/hw/pflash_cfi01.c b/hw/pflash_cfi01.c
> index 56ed33f..27ae4aa 100644
> --- a/hw/pflash_cfi01.c
> +++ b/hw/pflash_cfi01.c
> @@ -205,8 +205,10 @@ static void pflash_update(pflash_t *pfl, int offset,
>          /* round to sectors */
>          offset = offset >> 9;
>          offset_end = (offset_end + 511) >> 9;
> -        bdrv_write(pfl->bs, offset, pfl->storage + (offset << 9),
> -                   offset_end - offset);
> +        if (bdrv_write(pfl->bs, offset, pfl->storage + (offset << 9),
> +                       offset_end - offset) == -1) {
> +            fprintf(stderr, "pflash: Error writing to flash storage\n");
> +        }

...shouldn't we be propagating the write error up to the guest?
It feels like this change is just silencing the coverity error
without actually fixing the underlying problem.

-- PMM

