Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jUBXl-0000It-BA
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2020 11:56:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44614)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUBWb-0007cK-LM
 for qemu-trivial@nongnu.org; Thu, 30 Apr 2020 11:56:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUBUH-00032U-JF
 for qemu-trivial@nongnu.org; Thu, 30 Apr 2020 11:54:57 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:41490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jUBUH-000327-1P
 for qemu-trivial@nongnu.org; Thu, 30 Apr 2020 11:52:33 -0400
Received: by mail-ot1-x342.google.com with SMTP id c3so5299510otp.8
 for <qemu-trivial@nongnu.org>; Thu, 30 Apr 2020 08:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OqJGNyVDz211UW5Fz6r9VsMwrvbPs0yJjE+VVXfRzaY=;
 b=NgU1xVL5dlm6s/vd508ky3LILETIShXJR9DvsuTXIu5wNU14jxv6LBeelmlVsqo37m
 c2QNxwyA/zH6z8Lqphum/NUhatGuN6BJoSdiYBcpFn97mCkPfLmGuieq440TQ9mn+nuW
 zRjsWCLdCgIAOV6GM+b3n/oMIcnIqba0AzXs70I/IscDhUJhogpLitXw65PaAqlo26S6
 TXy5KJ68AgZp8X++SD580wRKofYxCsok3P1UEVhFufdvSQgPbkE9NP2zfJlv8fHqsZeF
 WRx049Yai0N6D/FaxPdHv+fPwa18tg9AEuTToU4VUoOV9Xd4/CWChKimAhPzc9QHgzHg
 8eTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OqJGNyVDz211UW5Fz6r9VsMwrvbPs0yJjE+VVXfRzaY=;
 b=H740l8KTHdSoVPMGMZCuq6JDCImDYYZsLpS1dGwOJvzaT5DiRD5hOCMSR7GNUOujQc
 Il4044XFtEuDcLko+Py32B81cpadvwQmKzmJVmS5e5Xdn79akyEhIs4nKQv71kR2sI7d
 u4S0NK0P/tJQ8+RIqRde19NuRQTMTkaFshelBnEVdtqkTSMmcA7dRWk1+Tgw8jcL5ULb
 w8FHojgjAM90SczRHz2iwiFMQwXWeHFb56JFPmLvknPGtpEqO/BeC9K7QFQVsatq1/A9
 thXt3/J/2qobdyu0n46dimnzuOllptuCHwX09SsqgUJv7bYWHZzIU5wu2C6vqafG8Gaz
 l6iQ==
X-Gm-Message-State: AGi0PuZK82uf2gqMcF6zeQU7wB2ZpkTgTS+6OJwFeloRfeaxYtSMfk7s
 UsJMETm60w+wWFxnvjkG9mjM8ph7LqGjc9x27VRY2w==
X-Google-Smtp-Source: APiQypKwzEHA9CQrVuq2torBs0zfWrQDfXi7K37xxkMF51uz0u5so8s1eR9NSMClyelz1K3Qsbw2lqjkl0oxr/kMA/Q=
X-Received: by 2002:a05:6830:22dc:: with SMTP id
 q28mr2937146otc.221.1588261951836; 
 Thu, 30 Apr 2020 08:52:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200428154650.21991-1-f4bug@amsat.org>
In-Reply-To: <20200428154650.21991-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Apr 2020 16:52:21 +0100
Message-ID: <CAFEAcA-1FmK0x3+X2Gzd_e20oz4OaRWV=CSVHA7EOLjc3EvJGw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/mps2-tz: Use TYPE_IOTKIT instead of hardcoded
 string
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::342
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
X-List-Received-Date: Thu, 30 Apr 2020 15:56:07 -0000

On Tue, 28 Apr 2020 at 16:46, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> By using the TYPE_* definitions for devices, we can:
>  - quickly find where devices are used with 'git-grep'
>  - easily rename a device (one-line change).
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/mps2-tz.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)



Applied to target-arm.next, thanks.

-- PMM

