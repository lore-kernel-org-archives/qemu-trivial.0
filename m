Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bHuTr-0006qo-TO
	for mharc-qemu-trivial@gnu.org; Tue, 28 Jun 2016 10:59:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40230)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bHuTp-0006mL-PJ
	for qemu-trivial@nongnu.org; Tue, 28 Jun 2016 10:59:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bHuTn-000831-Fc
	for qemu-trivial@nongnu.org; Tue, 28 Jun 2016 10:59:12 -0400
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:33476)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bHuTn-00082p-BQ
	for qemu-trivial@nongnu.org; Tue, 28 Jun 2016 10:59:11 -0400
Received: by mail-vk0-x235.google.com with SMTP id j3so25656337vkb.0
	for <qemu-trivial@nongnu.org>; Tue, 28 Jun 2016 07:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=k816OXwb9516pClz94W6y00OMN6uZauvS1oVtsFttos=;
	b=IPMFZFRhvtWDXwCFDZww0W5lU63UrJEYYJC047Z0fOtnKSyU+drdBwjT3r7X3VsO0C
	kdA6Dy+Mt6goLkoIjwDQ1gyR+EE3WwWX+KyLYCRKKEhmu/uYY2TKywkPiaeXIMcffI+2
	WBkr3LRagXSOpvHmzx3KIwR0XPH7oMdZxuwrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=k816OXwb9516pClz94W6y00OMN6uZauvS1oVtsFttos=;
	b=kenChnxgFPWEjZv1U1dJlzP3jhb+7lJwhkfV7Zuy/cuf0DTQAmgWKDanMdCyVEZtHf
	fydlmS4bu5tCOzEO4MgqgObIzDBO7JbCz3gqHmQ4mI7JH79YgAxrj8sjIYqy50yej0nf
	0SoA1z5r29y5SZS6rf9PdyLz3GzQ5wJQjQIrTwZ+9ollI+fHJCul+0ceO1IfkGDqQB1h
	aaM2Rn2W176rTiHHrpcHKR/980Txp45z8b5yVQsM7MfI4L3ijhbku+Fom6p8mufuUR19
	lZx1NeWjSiV+hJ5hx4US0NUjIVKjpwHJIHQrNW2Smg42f9QZ7MOTZAucjJ79m+gb/22Q
	kxcA==
X-Gm-Message-State: ALyK8tIZYkuYVYK84ESstW3EBLICTnghDSWVZRLV04GQGC2/tC61dmBixCCumshG2cvIUQhYJges/5eBFUOBLzmI
X-Received: by 10.31.109.197 with SMTP id i188mr780377vkc.157.1467125950728;
	Tue, 28 Jun 2016 07:59:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Tue, 28 Jun 2016 07:58:51 -0700 (PDT)
In-Reply-To: <1467125451-16700-7-git-send-email-peter.maydell@linaro.org>
References: <1467125451-16700-1-git-send-email-peter.maydell@linaro.org>
	<1467125451-16700-7-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jun 2016 15:58:51 +0100
Message-ID: <CAFEAcA_9NQ_VRj5S4ZwuxA_wi9VAABNnwqF6AMbxdwa4R0RiNg@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Cc: Patch Tracking <patches@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 6/6] bswap.h: Document
 cpu_to_* and *_to_cpu conversion functions
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
X-List-Received-Date: Tue, 28 Jun 2016 14:59:15 -0000

On 28 June 2016 at 15:50, Peter Maydell <peter.maydell@linaro.org> wrote:
> Add a documentation comment describing the functions for
> converting between the cpu and little or bigendian formats.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/qemu/bswap.h | 58 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>
> diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
> index a17d9aa..be3233a 100644
> --- a/include/qemu/bswap.h
> +++ b/include/qemu/bswap.h
> @@ -80,6 +80,64 @@ static inline void bswap64s(uint64_t *s)
>  #define be_bswaps(p, size) do { *p = glue(bswap, size)(*p); } while(0)
>  #endif
>
> +/**
> + * Endianness conversion functions between host cpu and specified endianness.
> + * (We list the complete set of prototypes produced by the macros below
> + * to assist people who search the headers to find their definitions.)
> + *
> + * uint16_t le16_to_cpu(uint16_t v);
> + * uint32_t le32_to_cpu(uint32_t v);
> + * uint64_t le64_to_cpu(uint64_t v);
> + * uint16_t be16_to_cpu(uint16_t v);
> + * uint32_t be32_to_cpu(uint32_t v);
> + * uint64_t be64_to_cpu(uint64_t v);
> + *
> + * Convert the value @v from the specified format to the native
> + * endianness of the host CPU by byteswapping if necessary, and
> + * return the converted value.
> + *
> + * uint16_t cpu_to_le16(uint16_t v);
> + * uint32_t cpu_to_le32(uint32_t v);
> + * uint64_t cpu_to_le64(uint64_t v);
> + * uint16_t cpu_to_be16(uint16_t v);
> + * uint32_t cpu_to_be32(uint32_t v);
> + * uint64_t cpu_to_be64(uint64_t v);
> + *
> + * Convert the value @v from the native endianness of the host CPU to
> + * the specified format by byteswapping if necessary, and return
> + * the converted value.
> + *
> + * uint16_t le16_to_cpus(uint16_t *v);
> + * uint32_t le32_to_cpus(uint32_t *v);
> + * uint64_t le64_to_cpus(uint64_t *v);
> + * uint16_t be16_to_cpus(uint16_t *v);
> + * uint32_t be32_to_cpus(uint32_t *v);
> + * uint64_t be64_to_cpus(uint64_t *v);

Doh. All these prototypes, and the ones in the block below,
should be 'void' return type rather than the integer type.

> + *
> + * Do an in-place conversion of the value pointed to by @v from the
> + * specified format to the native endianness of the host CPU.
> + *
> + * uint16_t cpu_to_le16s(uint16_t *v);
> + * uint32_t cpu_to_le32s(uint32_t *v);
> + * uint64_t cpu_to_le64s(uint64_t *v);
> + * uint16_t cpu_to_be16s(uint16_t *v);
> + * uint32_t cpu_to_be32s(uint32_t *v);
> + * uint64_t cpu_to_be64s(uint64_t *v);
> + *
> + * Do an in-place conversion of the value pointed to by @v from the
> + * native endianness of the host CPU to the specified format.
> + *
> + * Both X_to_cpu() and cpu_to_X() perform the same operation; you
> + * should use whichever one is better documenting of the function your
> + * code is performing.
> + *
> + * Do not use these functions for conversion of values which are in guest
> + * memory, since the data may not be sufficiently aligned for the host CPU's
> + * load and store instructions. Instead you should use the ld*_p() and
> + * st*_p() functions, which perform loads and stores of data of any
> + * required size and endianness and handle possible misalignment.
> + */
> +
>  #define CPU_CONVERT(endian, size, type)\
>  static inline type endian ## size ## _to_cpu(type v)\
>  {\
> --
> 1.9.1
>
>


thanks
-- PMM

