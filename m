Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XcxKY-0002Gk-9Z
	for mharc-qemu-trivial@gnu.org; Sat, 11 Oct 2014 10:07:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32822)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1XcxKN-0002FQ-Q1
	for qemu-trivial@nongnu.org; Sat, 11 Oct 2014 10:07:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1XcxKE-0004ZK-BA
	for qemu-trivial@nongnu.org; Sat, 11 Oct 2014 10:07:23 -0400
Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c]:40905)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1XcxKD-0004Yt-O5; Sat, 11 Oct 2014 10:07:14 -0400
Received: by mail-pa0-f44.google.com with SMTP id et14so3406954pad.31
	for <multiple recipients>; Sat, 11 Oct 2014 07:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=J5AI3s7fxt+/jn8hoAlp2yU0m5jAJPKdTJmix39XxZ8=;
	b=pfnWgvC+8XZ7a58yVBb4WLTRboFR8CN+v/tl67ux+skDElQw/6owPlY6ds6DSmb6uZ
	+2cexFhBr66heshgSju8T1OFeysXVOe8TFdtjazdO8nT8msXasKE6pAJpxHOjmnlGJuM
	KsTjfrUdAWJVPGO2wvKVRuv2HB9OgWGux1RNj8+xM/hlRhecOVi3LVcnqeprRVqEq84e
	PGPcmAK169Hb5bs64V5iRCSgEN29kh222sOKLgQs3AEw14KwsQWsRWW38RDNiIAM18/y
	h95kDebNd4RMVBqyfDeh7Ap6LDj7Vf47//jTeBv6KNPtR4vp0xFO1h9iVo145cyPrOX6
	bfFQ==
X-Received: by 10.70.108.134 with SMTP id hk6mr1532670pdb.140.1413036432681;
	Sat, 11 Oct 2014 07:07:12 -0700 (PDT)
Received: from ShengShiZhuChengdeMacBook-Pro.local ([223.72.65.81])
	by mx.google.com with ESMTPSA id h6sm2543157pdk.38.2014.10.11.07.07.09
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 11 Oct 2014 07:07:11 -0700 (PDT)
Message-ID: <54393AF0.1010708@gmail.com>
Date: Sat, 11 Oct 2014 22:13:04 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: peter.maydell@linaro.org, rth@twiddle.net, Eric Blake <eblake@redhat.com>
References: <5439399D.4020004@gmail.com>
In-Reply-To: <5439399D.4020004@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::22c
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH v2] libvixl: a64: Skip
 "-Wunused-variable" for gcc 5.0.0 or higher
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
X-List-Received-Date: Sat, 11 Oct 2014 14:07:33 -0000

On 10/11/14 22:07, Chen Gang wrote:
> 'instructions-a64.h' has unused variables for qemu which can be found by
> gcc 5.0.0 or higher. and qemu needs "-Werror", and cause building break.
> But they may be used by another projects (not qemu).
> 
> So for gcc 5.0.0 or higher, need still keep them, but ignore diagnostic
> (still print warning, but not break building). The related warnings:
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
> After this patch, can pass upstream gcc 5.0.0 building (print warning,
> but not break building), and fedora 20 gcc 4.8.1 building (not find

Oh, sorry, under fedora 20, it is "gcc version 4.8.3 20140624 (Red Hat
4.8.3-1) (GCC)".

And the detail gcc 5.0.0 is "gcc version 5.0.0 20141003 (experimental)
(GCC)"

> warnings).
> 
> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
> ---
>  disas/libvixl/a64/instructions-a64.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/disas/libvixl/a64/instructions-a64.h b/disas/libvixl/a64/instructions-a64.h
> index d5b90c5..5f707f3 100644
> --- a/disas/libvixl/a64/instructions-a64.h
> +++ b/disas/libvixl/a64/instructions-a64.h
> @@ -95,6 +95,12 @@ const unsigned kDoubleExponentBits = 11;
>  const unsigned kFloatMantissaBits = 23;
>  const unsigned kFloatExponentBits = 8;
>  
> +/* For QEMU, gcc 5.0.0 or higher finds unused variables, so ignore diagnostic */
> +#if __GNUC__ >= 5
> +#pragma GCC diagnostic push
> +#pragma GCC diagnostic ignored "-Wunused-variable"
> +#endif
> +
>  const float kFP32PositiveInfinity = rawbits_to_float(0x7f800000);
>  const float kFP32NegativeInfinity = rawbits_to_float(0xff800000);
>  const double kFP64PositiveInfinity =
> @@ -118,6 +124,9 @@ static const double kFP64DefaultNaN =
>      rawbits_to_double(UINT64_C(0x7ff8000000000000));
>  static const float kFP32DefaultNaN = rawbits_to_float(0x7fc00000);
>  
> +#if __GNUC__ >= 5
> +#pragma GCC diagnostic pop
> +#endif
>  
>  enum LSDataSize {
>    LSByte        = 0,
> 

-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

