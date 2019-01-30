Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gomhn-0005xt-GL
	for mharc-qemu-trivial@gnu.org; Wed, 30 Jan 2019 05:02:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49535)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gomhk-0005vM-7k
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 05:02:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gomhd-000694-C0
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 05:02:48 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:59427)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gomhO-0005zQ-Gq; Wed, 30 Jan 2019 05:02:29 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
	1N3omW-1hFDYz3loW-00zkK6; Wed, 30 Jan 2019 11:02:14 +0100
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Richard Henderson <rth@twiddle.net>
References: <1548252536-6242-1-git-send-email-thuth@redhat.com>
	<1548252536-6242-5-git-send-email-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <ed852bd9-b821-48f7-5eba-fab222f2fb30@vivier.eu>
Date: Wed, 30 Jan 2019 11:02:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1548252536-6242-5-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:Cm1ANkGzS7BGWLaHry3faVzIcnjaK6nJn7gbE07bTOJNvSxpUHu
	XafEbbY+6t2bFtHDsniO8iOHM66Y2Grt45RmvifqK4EHLtkBAheb99YSMM+pljY1dXfxMcq
	RNsjzJrDbslwhQZWS9WcMyvO5GS53fAHab7EQ4Q/iSBsH60uP/JqNU/aOUnp41W1XZzD6hD
	/opKZC2M6enOA7LgcnDPw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WyfwPGI8SZc=:p66qcaHwiBR2mrdNWjXe1T
	LyAHA2V/gnguzJLdXrUlUwNGlrTiJAH2+WmIR0hr8BjZdiGZcfHVpIFwUCim+yPoBIFw2N4KR
	/cts1tw2ZBUu3WR/97pxpUAxmMX4f8q2L8t/PlZ4c/O8MuTed0/6JDjXFXFrmeaBDiZpF2B09
	atFVLH04vDENSBME+bqdFSHxOWbxcdsW+qFfLt5Q1XQCiRod56cxqfaa/+1brftFJdSc63tBC
	bMbK9Av/npPIYX512z6f5nIQ3ruRQKd7hMeisAEj7kvTB9xOMvsR5PzQ305a+HCzPkzzPOkzD
	OiNCIidoFbkC4FGv5PIUnyh5vEz5I5DHsHzdAEYNjTWPwuvA5xb7nobXxtF0lKT1Dzkx/df14
	jsZ+3yK6At6OnwsKX8DxBwDpd6R4vnots/rcxFIxyfxxd/Nzm6Pjfc1+k3LOK1Y7OM2HLMC/i
	uxByu6kFUB1tLFn6jF8ho+0qdOa6Ge5ZUmLN0SUIRPmdzclLO2+vghQEZ+0mQQVagLrJEzQ93
	jXBgKl5R0PRc/UegFdox+an4qCTmEcSCq2LM3zAzcw3SIcmn+XYctpppAWdEmcIU3f61//290
	74oYpvYg2b3teSUgkyC8RS7LESEGhLAto1dEd6yFktRri6jthbLKvIrbzIu9QEUuj5HbH4UZj
	em6l7wmqL4Uek2DL98LLaLPddPzF4YT2q2Cc8LETpmO+b0ixG4gE89kkNR04xS2XT5LKfqt7v
	BjJHKtT2Ru5HYSFMbpleZp6S9w0hSTyrfSoSV+iblCBxaaUHRwr5aktW1ac=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: Re: [Qemu-trivial] [PATCH 4/4] tcg: Fix LGPL version number
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
X-List-Received-Date: Wed, 30 Jan 2019 10:02:49 -0000

On 23/01/2019 15:08, Thomas Huth wrote:
> It's either "GNU *Library* General Public version 2" or "GNU Lesser
> General Public version *2.1*", but there was no "version 2.0" of the
> "Lesser" library. So assume that version 2.1 is meant here.
> 
> Cc: Richard Henderson <rth@twiddle.net>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  accel/tcg/atomic_template.h  | 2 +-
>  accel/tcg/cpu-exec-common.c  | 2 +-
>  accel/tcg/cpu-exec.c         | 2 +-
>  accel/tcg/cputlb.c           | 2 +-
>  accel/tcg/softmmu_template.h | 2 +-
>  accel/tcg/tcg-runtime-gvec.c | 2 +-
>  accel/tcg/translate-all.c    | 2 +-
>  accel/tcg/translate-all.h    | 2 +-
>  accel/tcg/user-exec.c        | 2 +-
>  tcg/tcg-gvec-desc.h          | 2 +-
>  tcg/tcg-op-gvec.c            | 2 +-
>  tcg/tcg-op-gvec.h            | 2 +-
>  tcg/tcg-op-vec.c             | 2 +-
>  13 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/accel/tcg/atomic_template.h b/accel/tcg/atomic_template.h
> index efde12f..685602b 100644
> --- a/accel/tcg/atomic_template.h
> +++ b/accel/tcg/atomic_template.h
> @@ -7,7 +7,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/accel/tcg/cpu-exec-common.c b/accel/tcg/cpu-exec-common.c
> index 2988fde..462a1f1 100644
> --- a/accel/tcg/cpu-exec-common.c
> +++ b/accel/tcg/cpu-exec-common.c
> @@ -6,7 +6,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 870027d..60d87d5 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -6,7 +6,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index af6bd8c..ec27f3d 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -6,7 +6,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/accel/tcg/softmmu_template.h b/accel/tcg/softmmu_template.h
> index b0adea0..1fdd262 100644
> --- a/accel/tcg/softmmu_template.h
> +++ b/accel/tcg/softmmu_template.h
> @@ -11,7 +11,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/accel/tcg/tcg-runtime-gvec.c b/accel/tcg/tcg-runtime-gvec.c
> index 90340e5..09424e9 100644
> --- a/accel/tcg/tcg-runtime-gvec.c
> +++ b/accel/tcg/tcg-runtime-gvec.c
> @@ -6,7 +6,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index 8cb8c88..1773d7e 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -6,7 +6,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/accel/tcg/translate-all.h b/accel/tcg/translate-all.h
> index 08e2f23..64f5fd9 100644
> --- a/accel/tcg/translate-all.h
> +++ b/accel/tcg/translate-all.h
> @@ -6,7 +6,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
> index 941295e..7741f5f 100644
> --- a/accel/tcg/user-exec.c
> +++ b/accel/tcg/user-exec.c
> @@ -6,7 +6,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/tcg/tcg-gvec-desc.h b/tcg/tcg-gvec-desc.h
> index 3b4c2d9..2dda7d6 100644
> --- a/tcg/tcg-gvec-desc.h
> +++ b/tcg/tcg-gvec-desc.h
> @@ -6,7 +6,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
> index 61c25f5..6d4207e 100644
> --- a/tcg/tcg-op-gvec.c
> +++ b/tcg/tcg-op-gvec.c
> @@ -6,7 +6,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/tcg/tcg-op-gvec.h b/tcg/tcg-op-gvec.h
> index ff43a29..b8b9fee 100644
> --- a/tcg/tcg-op-gvec.h
> +++ b/tcg/tcg-op-gvec.h
> @@ -6,7 +6,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/tcg/tcg-op-vec.c b/tcg/tcg-op-vec.c
> index cefba3d..0fbeaea 100644
> --- a/tcg/tcg-op-vec.c
> +++ b/tcg/tcg-op-vec.c
> @@ -6,7 +6,7 @@
>   * This library is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU Lesser General Public
>   * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>   *
>   * This library is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

