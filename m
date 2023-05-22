Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1q190K-0004Nm-QE
	for mharc-qemu-trivial@gnu.org; Mon, 22 May 2023 13:07:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1q190J-0004MP-FS
 for qemu-trivial@nongnu.org; Mon, 22 May 2023 13:07:27 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1q190H-0005Fx-M3
 for qemu-trivial@nongnu.org; Mon, 22 May 2023 13:07:27 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f603ff9c02so10713145e9.2
 for <qemu-trivial@nongnu.org>; Mon, 22 May 2023 10:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684775244; x=1687367244;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TumTCVGWczqfeGY0qofqJIg+NkbqU+f10W6TWIj+B1w=;
 b=abZgR+rpiiu07lzWW+vU+gDfo8JqgG75CB7vwj47f6bzzVAeNjvxnPwBT9woj9mSXw
 WGBniQU0GYUp+OCfa/bMoZwJHAW4nv6rQPtQ4DV/arY0cslMKB/KZnC7bBwTcYaAbpEB
 JLKxYShPFHP59bWipXXr9u37urWe33nArgSVY/fVqfnpAbThAClSeWw0e7Ywa54aE5+u
 ciPlS5KwiB0TcbgLzlSBTFxKYL6zFz7+kqebNmdGgksWLFJ5YD5omqx5TQMEkhSeh11d
 0BACnlGjyGmTOH8ikkk6NK3kfkF1/nACpBKMjrnkcwRmKA2EhdEoBmqS0Zs5Mg9jBgqV
 dGoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684775244; x=1687367244;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TumTCVGWczqfeGY0qofqJIg+NkbqU+f10W6TWIj+B1w=;
 b=BESCrOeZ5ucGwh4tTMb3PZQLjbNZB+bKHSxT7bM5OpwqUjk+gFz07O1hsloa96tDzt
 pI2C2M23ljSFxVB8liyLJhWixbEnvYC475u/1T45ukNfa0pS+S4m42IjxUktlENBfxff
 auRUA+ggLFVaKwn79MGze4sqmaUBM/pt8gvgQqTVJsVvx5TqRKSrj+ev86jWm1DwL1bD
 0Fd1OcYJhYrBvVnEtOs9RBt4LkHdulRE45JJ5HxPA3BAfsEwekat6oDGbs7ooRvMjCCd
 0S1/IF1z/BbGVFst3WL3nN+XqIk807SaurK9+pO6+xdzG1Jz6xbXSdqPwj9rXnbkU53o
 IYKg==
X-Gm-Message-State: AC+VfDyUgIAJo4cfrhUx3qZyIrT08ooEQ3Ewc5TMEWXi3LoZPTwb3gns
 I/D+HGx7d50b8yV53yUAscVSPA==
X-Google-Smtp-Source: ACHHUZ7VuZAsesDVxrV8RA52ei896UKSHkXHt77Zv3woUxp5OjR74qhpfe55BYr3z04Smpgxe1lDMA==
X-Received: by 2002:a1c:ed18:0:b0:3f4:2374:3515 with SMTP id
 l24-20020a1ced18000000b003f423743515mr8408133wmh.5.1684775243686; 
 Mon, 22 May 2023 10:07:23 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 j17-20020a5d6191000000b0030639a86f9dsm8260809wru.51.2023.05.22.10.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 10:07:23 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C58A71FFBB;
 Mon, 22 May 2023 18:07:22 +0100 (BST)
References: <20230520205444.887287457E7@zero.eik.bme.hu>
 <874jo47cnd.fsf@linaro.org>
 <aaa22b3f-d548-5a69-489a-5777a7e98cef@eik.bme.hu>
User-agent: mu4e 1.11.6; emacs 29.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: BALATON Zoltan <balaton@eik.bme.hu>, Richard Henderson
 <richard.henderson@linaro.org>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH] bitops.h: Compile out asserts without --enable-debug
Date: Mon, 22 May 2023 17:48:48 +0100
In-reply-to: <aaa22b3f-d548-5a69-489a-5777a7e98cef@eik.bme.hu>
Message-ID: <87v8gk5m7p.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 22 May 2023 17:07:27 -0000


(ajb: add Richard for his compiler-fu)

BALATON Zoltan <balaton@eik.bme.hu> writes:

> On Mon, 22 May 2023, Alex Benn=C3=A9e wrote:
>> BALATON Zoltan <balaton@eik.bme.hu> writes:
>>
>>> The low level extract and deposit funtions provided by bitops.h are
>>> used in performance critical places. It crept into target/ppc via
>>> FIELD_EX64 and also used by softfloat so PPC code using a lot of FPU
>>> where hardfloat is also disabled is doubly affected.
>>
>> Most of these asserts compile out to nothing if the compiler is able to
>> verify the constants are in the range. For example examining
>> the start of float64_add:
>>
<snip>
>>
>> I don't see any check and abort steps because all the shift and mask
>> values are known at compile time. The softfloat compilation certainly
>> does have some assert points though:
>>
>> readelf -s ./libqemu-ppc64-softmmu.fa.p/fpu_softfloat.c.o  |grep assert
>>   136: 0000000000000000     0 NOTYPE  GLOBAL DEFAULT  UND g_assertion_me=
ss[...]
>>   138: 0000000000000000     0 NOTYPE  GLOBAL DEFAULT  UND __assert_fail
>>
>> but the references are for the ISRA segments so its tricky to know if
>> they get used or are just there for LTO purposes.
>>
>> If there are hot-paths that show up the extract/deposit functions I
>> suspect a better approach would be to implement _nocheck variants (or
>> maybe _noassert?) and use them where required rather than turning off
>> the assert checking for these utility functions.
>
> Just to clarify again, the asserts are still there when compiled with
> --enable-debug. The patch only turns them off for optimised release
> builds which I think makes sense if these asserts are to catch
> programming errors.

Well as Peter said the general policy is to keep asserts in but I
appreciate this is a hotpath case.

> I think I've also suggested adding noassert
> versions of these but that wasn't a popular idea and it may also not
> be easy to convert all places to use that like for example the
> register fields related usage in target/ppc as that would also affect
> other places.

Is code generation or device emulation really on the hot-path. Generally
a well predicted assert is in the noise for those operations.

> So this seems to be the simplest and most effective
> approach.
>
> The softfloat related usage in these tests I've done seem to mostly
> come from unpacking and repacking floats in softfloat which is done
> for every operation, e.g. muladd which mp3 encoding mostly uses does 3
> unpacks and 1 pack for each call and each unpack is 3 extracts so even
> small overheads add app quickly. Just 1 muladd will result in 9
> extracts and 2 deposits at least plus updating PPC flags for each FPU
> op adds a bunch more. I did some profiling with perf to find these.

After some messing about trying to get lame to cross compile to a static
binary I was able to replicate what you've seen:

  11.44%  qemu-ppc64  qemu-ppc64               [.] unpack_raw64.isra.0
  11.03%  qemu-ppc64  qemu-ppc64               [.] parts64_uncanon_normal
   8.26%  qemu-ppc64  qemu-ppc64               [.] helper_compute_fprf_floa=
t64
   6.75%  qemu-ppc64  qemu-ppc64               [.] do_float_check_status
   5.34%  qemu-ppc64  qemu-ppc64               [.] parts64_muladd
   4.75%  qemu-ppc64  qemu-ppc64               [.] pack_raw64.isra.0
   4.38%  qemu-ppc64  qemu-ppc64               [.] parts64_canonicalize
   3.62%  qemu-ppc64  qemu-ppc64               [.] float64r32_round_pack_ca=
nonical
   3.32%  qemu-ppc64  qemu-ppc64               [.] helper_todouble
   2.68%  qemu-ppc64  qemu-ppc64               [.] float64_add
   2.51%  qemu-ppc64  qemu-ppc64               [.] float64_hs_compare
   2.30%  qemu-ppc64  qemu-ppc64               [.] float64r32_muladd
   1.80%  qemu-ppc64  qemu-ppc64               [.] float64r32_mul
   1.40%  qemu-ppc64  qemu-ppc64               [.] float64r32_add
   1.34%  qemu-ppc64  qemu-ppc64               [.] parts64_mul
   1.16%  qemu-ppc64  qemu-ppc64               [.] parts64_addsub
   1.14%  qemu-ppc64  qemu-ppc64               [.] helper_reset_fpstatus
   1.06%  qemu-ppc64  qemu-ppc64               [.] helper_float_check_status
   1.04%  qemu-ppc64  qemu-ppc64               [.] float64_muladd

what I find confusing is the fact the parts extraction and packing
should all be known constants which should cause the asserts to
disappear. However it looks like the compiler decided to bring in a copy
of the whole inline function (ISRA =3D >interprocedural scalar replacement
of aggregates) which obviously can't fold the constants and eliminate
the assert.

Richard,

Any idea of why the compiler might decide to do something like this?

>
> Regards,
> BALATON Zoltan


--
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

