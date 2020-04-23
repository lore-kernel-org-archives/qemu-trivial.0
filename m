Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jRilJ-0001hd-Nx
	for mharc-qemu-trivial@gnu.org; Thu, 23 Apr 2020 16:47:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32912)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jRilH-0001fU-4U
 for qemu-trivial@nongnu.org; Thu, 23 Apr 2020 16:47:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jRilG-0007VV-Ad
 for qemu-trivial@nongnu.org; Thu, 23 Apr 2020 16:47:54 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:39148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jRilD-0007RS-8p
 for qemu-trivial@nongnu.org; Thu, 23 Apr 2020 16:47:53 -0400
Received: by mail-ot1-x341.google.com with SMTP id m13so8571083otf.6
 for <qemu-trivial@nongnu.org>; Thu, 23 Apr 2020 13:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yuRNKYOyrXq31eODqoSQA8Il9L22mdjCutxbVpqukMo=;
 b=HYxBO9IocyV36w6tRGQlKtMJmW0UhLb9qOx9X2XuLJZu2XFkDJVvo0ZgLSoknvtt6v
 wCFLvSs7lsksmQB+zEJGHDFgjzFzgu2qb2SYZritGipdlRspy3HoxEvqSki9X2PXpmET
 wvp1ke/3ovYrBMJcQx3KBbj32aYU0RgXTkAgBcIBu8dONQSBNCXm+djdSrNQq9qW0SuM
 Z9V2RYOHgJPyQrWIH4+5syBL6QDntfDPPfb4XuaNjtYX8VjhqvoSHMRY0ZWK/23Xm2xQ
 +1kuGWtKMf0aGFckBieoRIFWgWY27oIdAgxc3wAUOrPaqWVY4AogdeQ6Ay/gZaSL21uC
 KuSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yuRNKYOyrXq31eODqoSQA8Il9L22mdjCutxbVpqukMo=;
 b=YhMy35dFRUIn4R+FwKMthb0KCYzrruV8egmDzATpGklsrHhOJMURB678g5aXNOEIKL
 ije/cwDYb8f1OjX+p5CCQJORxv9Rernb+7NYgzM/b6yJvsH4ieq/ox1H3/PyDzzcBXo2
 uTlUFfoVXN44L5eMqqUG56al1mqw0LYyMeOQ1rpsQX+00VoB8WvY+5+vIEGr5u3ZyszV
 tvmx/6SUxLzCDwwLVhK+0adNr6A7hNYKe3Cqtcqr26KZVMrQAe8s+ow/mF/MzbiaEPzO
 u0pd0k88AZrjSZ7+OeSAHFebc3cN3ZGJak5l+l2u81xLnIOGEz5c8VdekxageJkA34j+
 6L1w==
X-Gm-Message-State: AGi0PuZkfn+G0O2Aa5BqjqlP+CYElpkcYzvGUv5+mxCV2KSXxTT5XMiY
 eBLH6yZXKN14A2LQLJ1Dsk0i40kAQ2kX9yzfPuHugQ==
X-Google-Smtp-Source: APiQypLLJB0eckpV1phYkzfJtZrxZDdfSfHj5Q1EzFGoIucRTfYxasmJHAIVrrjNWAlKc6ajxzlXo4zHSXt2Sxy7xHA=
X-Received: by 2002:aca:3441:: with SMTP id b62mr3172454oia.146.1587674869774; 
 Thu, 23 Apr 2020 13:47:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200423202011.32686-1-peter.maydell@linaro.org>
 <d9e2c1cf-30e5-a889-3e87-eed6480610ab@redhat.com>
In-Reply-To: <d9e2c1cf-30e5-a889-3e87-eed6480610ab@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Apr 2020 21:47:38 +0100
Message-ID: <CAFEAcA8XBsfZvxsjXVFbcHwcBYx3ohyfhntAKTTEWKcCw9xSCg@mail.gmail.com>
Subject: Re: [PATCH] elf_ops: Don't try to g_mapped_file_unref(NULL)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Randy Yates <yates@ieee.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::341
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Apr 2020 20:47:55 -0000

On Thu, 23 Apr 2020 at 21:25, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 4/23/20 10:20 PM, Peter Maydell wrote:
> > This will fix the assertion; for the specific case of the generic
> > loader it will then fall back from "guess this is an ELF file" to
> > "maybe it's a uImage or a hex file" and eventually to "just load as
> > a raw data file".

> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Thanks; as a side note "let me just load this as a raw data file"
is not a very user-friendly way to report issues with the ELF
file like "seems to be truncated" or "has no program headers".
Not sure what to do about that...

thanks
-- PMM

