Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z3Pis-0006C3-Ev
	for mharc-qemu-trivial@gnu.org; Fri, 12 Jun 2015 10:14:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41690)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Z3Pin-00062v-Fv
	for qemu-trivial@nongnu.org; Fri, 12 Jun 2015 10:14:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Z3Pii-0005tx-H7
	for qemu-trivial@nongnu.org; Fri, 12 Jun 2015 10:14:13 -0400
Received: from mail-vn0-f43.google.com ([209.85.216.43]:39582)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Z3Pii-0005tr-Dt
	for qemu-trivial@nongnu.org; Fri, 12 Jun 2015 10:14:08 -0400
Received: by vnbg190 with SMTP id g190so6216036vnb.6
	for <qemu-trivial@nongnu.org>; Fri, 12 Jun 2015 07:14:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=ZlBumMcFXiXS5ZtBDHDUXEAZe0s8oKnS64ETuft1Uwk=;
	b=LfW9or+7O4IvfICurQDu7lve68eJY3T5BDfitR4fToTzJBqdc1a0T6DIEm6+B1CHby
	jcIWx81pDGmJyigAjAUKVH5RC9D/oK9zsMB0f3HYVxtQtx8Rp5uWD3G0ehWYXUvcZOS3
	rUinULcaAxzrB3bUiO9ZKYw4qxpvrwrxmx3NfP0YUGPZ0q0u8Va8FKtQ78/caudMOv2T
	o4wqIRSDcY+T3EQSOSXYnp+ezUXvJz+4GwESIfsEObH+X92u9gxVGLAXSDiud8k/CB67
	Y9CxM9YJK0M6pNFFBUHT7NR9qyvi4dNwN0rk+S+0H2j4r4/LORI+FS0SSgfDq6ic7nFO
	HElw==
X-Gm-Message-State: ALoCoQmzS1n1iOpTljRNfVVKh1bWKwsLbsn28gpuGWY5gO3DIN05Ofqf1YVqqqRbDet2k7xJsBhy
X-Received: by 10.52.114.163 with SMTP id jh3mr8440819vdb.93.1434118448056;
	Fri, 12 Jun 2015 07:14:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.153.135 with HTTP; Fri, 12 Jun 2015 07:13:47 -0700 (PDT)
In-Reply-To: <1434020015-8868-1-git-send-email-alex.bennee@linaro.org>
References: <1434020015-8868-1-git-send-email-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Jun 2015 15:13:47 +0100
Message-ID: <CAFEAcA88heku+bkgX8egM432kok2i0=c4UZAJ94vnbMcU4G-oA@mail.gmail.com>
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.216.43
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] target-arm/cpu.h: remove
	pending_exception
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
X-List-Received-Date: Fri, 12 Jun 2015 14:14:15 -0000

On 11 June 2015 at 11:53, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
> This isn't used by any of the code. In fact it looks like it was never
> used as it came in with ARMv7 support.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  target-arm/cpu.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
> index 21b5b8e..7c1d95c 100644
> --- a/target-arm/cpu.h
> +++ b/target-arm/cpu.h
> @@ -384,7 +384,6 @@ typedef struct CPUARMState {
>          uint32_t control;
>          int current_sp;
>          int exception;
> -        int pending_exception;
>      } v7m;
>
>      /* Information associated with an exception about to be taken:

Applied, thanks.

-- PMM

