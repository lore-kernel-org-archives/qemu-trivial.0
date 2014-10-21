Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XgbiO-0001oJ-0W
	for mharc-qemu-trivial@gnu.org; Tue, 21 Oct 2014 11:51:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51432)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XgbiH-0001mx-5r
	for qemu-trivial@nongnu.org; Tue, 21 Oct 2014 11:51:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XgbiC-0006Wb-9z
	for qemu-trivial@nongnu.org; Tue, 21 Oct 2014 11:51:09 -0400
Received: from mail-lb0-f180.google.com ([209.85.217.180]:62214)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XgbiB-0006WA-VK
	for qemu-trivial@nongnu.org; Tue, 21 Oct 2014 11:51:04 -0400
Received: by mail-lb0-f180.google.com with SMTP id n15so1243431lbi.25
	for <qemu-trivial@nongnu.org>; Tue, 21 Oct 2014 08:51:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=AlMocECwGzJNHbH0HUjftAzUZ+kdlfT8u29Rk+f3drA=;
	b=aTqnIL6yHELUS73xt1j6a5iV0czx+EnwG7fEO1FwDyvICHe6yjglcCKXcb91bHb4Ho
	phmK5WeuepjGYu2VnA6YjplN1hNgn4TN8RMrJTB24+lub6eii9QDT4/vnyoorGWbNH89
	sT4unz3g+TFB+zw97sSIKALXu5o4tWgWgnPnxrgwAu1MbBgA/fcAyLsIifLP/OM56yjI
	McQzQbSOJ9zZgZ5r9uu8VfaF2OlExJecmF0kNYGtxTmUGexcUEMJfWiE7LUtpg1zjKc0
	TBqhVYFDPo/AA1T4jta75XNON76rLm2OPG7sa4zpJHj/sqjfifNye/Jk38hf48BzftIP
	9ilA==
X-Gm-Message-State: ALoCoQknDhu1dwOjvchCxOrEJw/gWlQUfyWgGbRajmT/QgvSeo9u/W+XxqNraHbVopY5UTA2IPU9
X-Received: by 10.112.221.197 with SMTP id qg5mr35388499lbc.32.1413906661074; 
	Tue, 21 Oct 2014 08:51:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.130.161 with HTTP; Tue, 21 Oct 2014 08:50:40 -0700 (PDT)
In-Reply-To: <54369514.5000004@gmail.com>
References: <54369514.5000004@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Oct 2014 16:50:40 +0100
Message-ID: <CAFEAcA9KgX1gOtXPqTC2gX1HD69aPF9fbKkk1i5zbN2+tLW_og@mail.gmail.com>
To: Chen Gang <gang.chen.5i5j@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.180
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	"rth@twiddle.net" <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [PATCH] disas/libvixl/a64/instructions-a64.h:
 Remove useless varialbe to avoid building break with '-Werror'
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
X-List-Received-Date: Tue, 21 Oct 2014 15:51:14 -0000

On 9 October 2014 15:00, Chen Gang <gang.chen.5i5j@gmail.com> wrote:
> The related variables are useless, need be removed, or can not pass
> microblaze building, after fix it, can build microblaze, successfully.
>
> The related configuration:
>
>  ./configure --target-list="arm-softmmu,microblazeel-softmmu" --enable-fdt --disable-kvm
>
> The related compiling error:
>
>     CXX   disas/arm-a64.o
>   In file included from /upstream/qemu/disas/libvixl/a64/disasm-a64.h:32:0,
>                    from disas/arm-a64.cc:20:
>   disas/libvixl/a64/instructions-a64.h:98:13: error: 'vixl::kFP32PositiveInfinity' defined but not used [-Werror=unused-variable]
>    const float kFP32PositiveInfinity = rawbits_to_float(0x7f800000);
>                ^
>   disas/libvixl/a64/instructions-a64.h:99:13: error: 'vixl::kFP32NegativeInfinity' defined but not used [-Werror=unused-variable]
>    const float kFP32NegativeInfinity = rawbits_to_float(0xff800000);
>                ^
>   disas/libvixl/a64/instructions-a64.h:100:14: error: 'vixl::kFP64PositiveInfinity' defined but not used [-Werror=unused-variable]
>    const double kFP64PositiveInfinity =
>                 ^
>   disas/libvixl/a64/instructions-a64.h:102:14: error: 'vixl::kFP64NegativeInfinity' defined but not used [-Werror=unused-variable]
>    const double kFP64NegativeInfinity =
>                 ^
>   disas/libvixl/a64/instructions-a64.h:107:21: error: 'vixl::kFP64SignallingNaN' defined but not used [-Werror=unused-variable]
>    static const double kFP64SignallingNaN =
>                        ^
>   disas/libvixl/a64/instructions-a64.h:109:20: error: 'vixl::kFP32SignallingNaN' defined but not used [-Werror=unused-variable]
>    static const float kFP32SignallingNaN = rawbits_to_float(0x7f800001);
>                       ^
>   disas/libvixl/a64/instructions-a64.h:112:21: error: 'vixl::kFP64QuietNaN' defined but not used [-Werror=unused-variable]
>    static const double kFP64QuietNaN =
>                        ^
>   disas/libvixl/a64/instructions-a64.h:114:20: error: 'vixl::kFP32QuietNaN' defined but not used [-Werror=unused-variable]
>    static const float kFP32QuietNaN = rawbits_to_float(0x7fc00001);
>                       ^
>   disas/libvixl/a64/instructions-a64.h:117:21: error: 'vixl::kFP64DefaultNaN' defined but not used [-Werror=unused-variable]
>    static const double kFP64DefaultNaN =
>                        ^
>   disas/libvixl/a64/instructions-a64.h:119:20: error: 'vixl::kFP32DefaultNaN' defined but not used [-Werror=unused-variable]
>    static const float kFP32DefaultNaN = rawbits_to_float(0x7fc00000);
>                       ^
>   cc1plus: all warnings being treated as errors
>   make: *** [disas/arm-a64.o] Error 1
>
>
> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
> ---
>  disas/libvixl/a64/instructions-a64.h | 24 ------------------------
>  1 file changed, 24 deletions(-)
>
> diff --git a/disas/libvixl/a64/instructions-a64.h b/disas/libvixl/a64/instructions-a64.h
> index d5b90c5..1eea851 100644
> --- a/disas/libvixl/a64/instructions-a64.h
> +++ b/disas/libvixl/a64/instructions-a64.h
> @@ -95,30 +95,6 @@ const unsigned kDoubleExponentBits = 11;
>  const unsigned kFloatMantissaBits = 23;
>  const unsigned kFloatExponentBits = 8;
>
> -const float kFP32PositiveInfinity = rawbits_to_float(0x7f800000);
> -const float kFP32NegativeInfinity = rawbits_to_float(0xff800000);
> -const double kFP64PositiveInfinity =
> -    rawbits_to_double(UINT64_C(0x7ff0000000000000));
> -const double kFP64NegativeInfinity =
> -    rawbits_to_double(UINT64_C(0xfff0000000000000));
> -
> -// This value is a signalling NaN as both a double and as a float (taking the
> -// least-significant word).
> -static const double kFP64SignallingNaN =
> -    rawbits_to_double(UINT64_C(0x7ff000007f800001));
> -static const float kFP32SignallingNaN = rawbits_to_float(0x7f800001);
> -
> -// A similar value, but as a quiet NaN.
> -static const double kFP64QuietNaN =
> -    rawbits_to_double(UINT64_C(0x7ff800007fc00001));
> -static const float kFP32QuietNaN = rawbits_to_float(0x7fc00001);
> -
> -// The default NaN values (for FPCR.DN=1).
> -static const double kFP64DefaultNaN =
> -    rawbits_to_double(UINT64_C(0x7ff8000000000000));
> -static const float kFP32DefaultNaN = rawbits_to_float(0x7fc00000);
> -
> -

Upstream's plan for fixing this is to turn these into
'extern const double foo' in the header with the definition
in an appropriate .cc file. Given that, I think I'm happy for
us to take this patch in QEMU for the moment, with the expectation
that the next libvixl drop will just obsolete it.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM

