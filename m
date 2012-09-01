Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T7m5Y-00016o-OY
	for mharc-qemu-trivial@gnu.org; Sat, 01 Sep 2012 07:42:08 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43478)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1T7m5W-00016g-Rh
	for qemu-trivial@nongnu.org; Sat, 01 Sep 2012 07:42:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1T7m5V-0003xR-S8
	for qemu-trivial@nongnu.org; Sat, 01 Sep 2012 07:42:06 -0400
Received: from mail-ie0-f173.google.com ([209.85.223.173]:61911)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1T7m5V-0003xK-N1
	for qemu-trivial@nongnu.org; Sat, 01 Sep 2012 07:42:05 -0400
Received: by iebc10 with SMTP id c10so2249262ieb.4
	for <qemu-trivial@nongnu.org>; Sat, 01 Sep 2012 04:42:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=2+Enzg0S/eGbgnC93mRTO6I8/feuwnoYCqlg06kIROc=;
	b=hti+lxy5+1/RFpZun/fuqq5Dx/ZOjRDPFX4u0aVoOF5OMArV33WGkFjfXe3BfuaXcb
	jhwHGtHBhEGRhNyP4+Eol9a4Zl4vJBf/nfO8EVllZ5wokYLbOu6WwRHPhCn1tEjrVmU+
	Zfq8Hkf68P2gGfWGziC4P/MWFNCVxGO5NUgsVGI9CvQDCQ4yUvxdTBPmGNqJQdeWqpyG
	tl3jm+q6eK54+A6EBHqQKSaizRlumNjyPsR8QNDjedh/PFP18oVSana57z2AAb6mEKXt
	QCJ9kCINt15FcccSusjNeNPmuzeyBJIozwKyRL6KoCLtVkn1kwSCmdE8vTfCfcBymeBT
	UFwA==
MIME-Version: 1.0
Received: by 10.50.40.225 with SMTP id a1mr5764216igl.51.1346499724515; Sat,
	01 Sep 2012 04:42:04 -0700 (PDT)
Received: by 10.50.160.161 with HTTP; Sat, 1 Sep 2012 04:42:04 -0700 (PDT)
In-Reply-To: <1346496221-11188-1-git-send-email-sw@weilnetz.de>
References: <1346496221-11188-1-git-send-email-sw@weilnetz.de>
Date: Sat, 1 Sep 2012 12:42:04 +0100
Message-ID: <CAFEAcA9V=YsP+womOB1EaET2O8YbjR5jXRD6EUvhLopQcQMW6g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQl75PzV9jMNrmITYqYeYTQGPaobLehJX3ov4dGUxZYrDvA7PFfJ0YGvK+ysrQk6HHNRBvUS
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.223.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Mathieu Sonet <contact@elasticsheep.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] lm4549: Fix buffer overflow
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
X-List-Received-Date: Sat, 01 Sep 2012 11:42:08 -0000

On 1 September 2012 11:43, Stefan Weil <sw@weilnetz.de> wrote:
> Report from smatch:
> lm4549.c:234 lm4549_write_samples(14) error:
>  buffer overflow 's->buffer' 1024 <= 1024
>
> There must be enough space to add two entries starting with index
> s->buffer_level, therefore the old check was wrong.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/lm4549.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/lm4549.c b/hw/lm4549.c
> index 80b3ec4..e0137d5 100644
> --- a/hw/lm4549.c
> +++ b/hw/lm4549.c
> @@ -224,7 +224,7 @@ uint32_t lm4549_write_samples(lm4549_state *s, uint32_t left, uint32_t right)
>         This model supports 16-bit playback.
>      */
>
> -    if (s->buffer_level >= LM4549_BUFFER_SIZE) {
> +    if (s->buffer_level > LM4549_BUFFER_SIZE - 2) {
>          DPRINTF("write_sample Buffer full\n");
>          return 0;
>      }
> --
> 1.7.10


I don't object to making the change to placate the analyser,
but I don't think this is actually a buffer overrun. We always
add and remove samples from the buffer two at a time, so it's
not possible to get here with s->buffer_level == BUFFER_SIZE-1
(which is the only case where the old and new conditions
give different answers).

-- PMM

