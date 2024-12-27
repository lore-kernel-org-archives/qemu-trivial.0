Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tRK6L-0003ET-0p
	for mharc-qemu-trivial@gnu.org; Fri, 27 Dec 2024 18:50:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tRK6C-0003Dk-0k
 for qemu-trivial@nongnu.org; Fri, 27 Dec 2024 18:50:34 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tRK69-0002At-QO
 for qemu-trivial@nongnu.org; Fri, 27 Dec 2024 18:50:31 -0500
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5d3f28881d6so10664136a12.1
 for <qemu-trivial@nongnu.org>; Fri, 27 Dec 2024 15:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735343428; x=1735948228; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dF+1ER+/8M5BNCjZEF+X8u8bl/QJ5STyGXKopeSSf/g=;
 b=saGaT466QwmOYMzEpIQQQnVdJuzpiz93ayhlzr1HoZC2hp4dObYZafpNIk4zmqaoRw
 CxDKGyjlLjixuCoRXsrB3TuZ1SeWDylrHMCwXJIzk1JADTb3UEFjNBYZXeVz1DRS8XX3
 djvnxqDQ5mabI0PaUgWLLPOSaKeH9AqzHpsrAsYIsXzdVqIj9bqZldtlbp33RG1h4elR
 Emu3UQe9EqIjiHGGMyvcAObk6I4f7OO+8nwbW/+5st8ORMlwsryRN55IrXCigNc+CGGo
 Nqnyuveg5Q0rcrAGaQbwaRAavisflLndvCRJLQ1JdJoU1PJ3CG3oKcSAvpHswtZsDhZq
 1kyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735343428; x=1735948228;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dF+1ER+/8M5BNCjZEF+X8u8bl/QJ5STyGXKopeSSf/g=;
 b=KU/hph5CykKEc6JOPLO6ngWPFvnCgPBGsxJYo/wJLAxD2RDDkOlZuCG8Nh+HitFNqo
 cRvITOVKYZT6/PkidGY3LlOL7pVyLN+f70G/szf27MQELyKSQhQ2N2DEzRcgitdhIxcI
 QqRm1XHixtoJaTWbzCKnc4dDdyOmjsOymuF2E41KnrvMircdWeVUjPUcSHdVqFQwZX/H
 SQ1Kg32dvyiQKlWNCnu8bx/BWQX7ba2FVMSloK7D7GN9St8W2uT+4fkQw5N1AWvjpnJT
 CbLQ6btvnvVBZl5b+9GF8i/PAKkkUhS5Vz91xb7vaXf+FOhVqp6H1tpc4ib/dFCCwEW6
 a8wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxlmVEQPgtq5CHX0G3+CTgT5/I9IiDSfD5mz/VKXjssDQdd1/b2eN/TgycWX0QCvN2SYTWdteO+A63Aus=@nongnu.org
X-Gm-Message-State: AOJu0YxYJ/FoLzazUcIu2pU2Jj77nQgcNSe2ZAxnVpdp0qa6MfAFJfMX
 Blhy4cN9dGYpY7KIMG4vFp37jkylbbPZPWPucAd59Xyy/wMZ2E9OMhf5hAPTOrw7LpZ5rIN4JAj
 RBqk=
X-Gm-Gg: ASbGncvKEa8ItFt1Uz/X6g5L916tlKaRw3y3UvDRRYgxckhUrwBfCHK7obdlstRU49H
 uJbE7uOHIVfhbo2V/3FLo38hU9KvqkAZZSY2akhD7CVVh2/3AOD6V9Iw6A7P9GUbKwkXQp3AZsW
 krRPnaS4JizScwxTIDZOXivi6CPbcohggUBRoiZnaMWkUAK76PE69giwnrhppZgIGArZHB+HCfH
 d1L2bhbIxGsAB5Mggjh+vNsl7XaITBAz2W0Pqjn9B62EXt77UpbvwA=
X-Google-Smtp-Source: AGHT+IH024CGNL0vaFGyQxmU2N5OwtSoSA3A+E46Fs3n4bfmwRfkgZo+IorD9Dcl/Ni7I5mH6/dp4Q==
X-Received: by 2002:a05:6402:2790:b0:5d0:e73c:b7f0 with SMTP id
 4fb4d7f45d1cf-5d81de1c241mr69356297a12.28.1735343426438; 
 Fri, 27 Dec 2024 15:50:26 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0efe41a6sm1191383266b.102.2024.12.27.15.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Dec 2024 15:50:25 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 56C145F792;
 Fri, 27 Dec 2024 23:50:23 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: ckf104 <1900011634@pku.edu.cn>,  qemu-trivial@nongnu.org,  Alexandre
 Iooss <erdnaxe@crans.org>,  Mahmoud Mandour <ma.mandourr@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,  QEMU-Devel
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH] contrib/plugins/bbv.c: Start bb index from 1
In-Reply-To: <514c2c90-4c0f-486e-857d-fa0360c47d38@tls.msk.ru> (Michael
 Tokarev's message of "Sun, 22 Dec 2024 12:11:51 +0300")
References: <20241217142413.148978-1-1900011634@pku.edu.cn>
 <514c2c90-4c0f-486e-857d-fa0360c47d38@tls.msk.ru>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Fri, 27 Dec 2024 23:50:23 +0000
Message-ID: <875xn4lm80.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 27 Dec 2024 23:50:36 -0000

Michael Tokarev <mjt@tls.msk.ru> writes:

> 17.12.2024 17:24, ckf104 wrote:
>> Standard simpoint tool reqeusts that index of basic block index starts f=
rom 1.
>
> While this patch is a trivial one-liner, but the underlying issue require=
s at least
> a minimal understanding of what it is all about, what *is* bbv to begin w=
ith, what
> `simpoint' is.  I'm not sure it really is a trivial material?
>
>> Signed-off-by: ckf104 <1900011634@pku.edu.cn>
>
> Do we accept such SoBs these days?

The guidance is covered here: https://qemu.readthedocs.io/en/master/devel/s=
ubmitting-a-patch.html#patch-emails-must-include-a-signed-off-by-line

The wording: "It is the identity you choose to be known by in the
community, but should not be anonymous, nor misrepresent whom you are"
implies you should be identifiable to assert you can submit code and
currently this email only shows up for this patch so is functionally
anonymous I think?


>
> Thanks,
>
> /mjt

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

