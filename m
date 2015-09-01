Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZWjZF-00069f-QN
	for mharc-qemu-trivial@gnu.org; Tue, 01 Sep 2015 07:17:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50533)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZWjZD-00068L-6W
	for qemu-trivial@nongnu.org; Tue, 01 Sep 2015 07:17:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZWjZ8-0003eg-Ce
	for qemu-trivial@nongnu.org; Tue, 01 Sep 2015 07:17:31 -0400
Received: from mail-vk0-f44.google.com ([209.85.213.44]:34492)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZWjZ8-0003ea-90
	for qemu-trivial@nongnu.org; Tue, 01 Sep 2015 07:17:26 -0400
Received: by vkhf67 with SMTP id f67so54692768vkh.1
	for <qemu-trivial@nongnu.org>; Tue, 01 Sep 2015 04:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=zVuJhK11iu8lYmhBtmy2Zc8nAOCU1cbPLQ8sCoSe6BE=;
	b=fS3x6M8xfrpml+EdJPpA5+zINap51wKnWNSEXAMGfMBN89wjVjPDC+RvrMJSbtq9Px
	1MNsNBhL9x+65wJmQa/47O8iYtSPisSlYAqVdwuTn7eJ62pm/EzlSQAHqbwIXeZc1MId
	CwC4+b5LBKcJS6pD6ZuHJPE6OXxlS6N48teqHeubgl3l3QimIzBIl69R27tO+xOekUkO
	nIxrQ4m7K3QXpP6ics/jJpKZbhpagK7yDlKrZgiW3/Ktc5Rr/MJdQwHZUJE9PaO5JqCp
	V9c0k34qK/Rdtj1/cUZ2vR6kle/hP0qOOg4e1Hb5OTl1MkU75PNm5lvFxNSdZkZbsvud
	iGOw==
X-Gm-Message-State: ALoCoQky7IrCp+Q1apOT9IRfyDLASMK2KKW4tG2QKtJaGNkvy5zhyZ9vL5ZbA6tN9Q6vUANnQLTq
X-Received: by 10.52.176.195 with SMTP id ck3mr14260355vdc.78.1441106245777;
	Tue, 01 Sep 2015 04:17:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.153.135 with HTTP; Tue, 1 Sep 2015 04:17:06 -0700 (PDT)
In-Reply-To: <1440703987-29012-7-git-send-email-lvivier@redhat.com>
References: <1440703987-29012-1-git-send-email-lvivier@redhat.com>
	<1440703987-29012-7-git-send-email-lvivier@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Sep 2015 12:17:06 +0100
Message-ID: <CAFEAcA9cm4g0wOEAXGmhNZkWbD82o+eWkWpK4R-uorfFtJyOXA@mail.gmail.com>
To: Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.44
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH v3 6/9] arm: clarify the use of muldiv64()
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
X-List-Received-Date: Tue, 01 Sep 2015 11:17:32 -0000

On 27 August 2015 at 20:33, Laurent Vivier <lvivier@redhat.com> wrote:
> muldiv64() is used to convert microseconds into CPU ticks.
>
> But it is not clear and not commented. This patch uses macro
> to clearly identify what is used: time, CPU frequency and ticks.
> For an elapsed time and a given frequency, we compute how many ticks
>  we have.
>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
> v2: replace "arm: remove muldiv64()"
>  target-arm/helper.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 7df1f06..4455761 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -12,6 +12,8 @@
>  #include <zlib.h> /* For crc32 */
>  #include "exec/semihost.h"
>
> +#define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */

LL suffix for large constants, please.

Otherwise
Acked-by: Peter Maydell <peter.maydell@linaro.org>

(assuming you're planning to put this somewhere other than the
target-arm tree).

thanks
-- PMM

