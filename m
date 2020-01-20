Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1itWfn-0003VX-P6
	for mharc-qemu-trivial@gnu.org; Mon, 20 Jan 2020 08:00:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57199)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1itWfk-0003Ug-Lo
 for qemu-trivial@nongnu.org; Mon, 20 Jan 2020 08:00:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1itWfj-0003jk-H0
 for qemu-trivial@nongnu.org; Mon, 20 Jan 2020 08:00:52 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:34110)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1itWfh-0003hX-V3
 for qemu-trivial@nongnu.org; Mon, 20 Jan 2020 08:00:50 -0500
Received: by mail-ot1-x342.google.com with SMTP id a15so28588721otf.1
 for <qemu-trivial@nongnu.org>; Mon, 20 Jan 2020 05:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=enEzIYGOJ3Z9BcpMWQn0M59KHHmkVRX4jfdLkG5CuCk=;
 b=bX4XaQYDs43MyIIESYHeI8kkQ/pwbnQSNPMjHiF4P5Za1GD8YduN/DSGcEL0Hvge6Y
 8LRks6GSVgt4jnH9Jk6XfTZUmxKMbtRpDcmx2797dyffQ3lyUqijBsGYoswec3N1vAGP
 cta9GInwB8/jAyRdXCkddjf65qN0Rao9VrvIzF3z3P2ieA5yer6O4xG/So1Nz2eX6UnP
 5+x0GOGxCLwMWdOzpbrCIHTEGDYuiUfCr21KqVSESPxRMzHakzuAIXEbdLM5EP7DtfZG
 8kg5BACFwa5U/q1S+5RDuE1uv2G/foA/5D8mFA8aRfaxj8r5Ui1qOprvHQ5cNmAGJUQ7
 TW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=enEzIYGOJ3Z9BcpMWQn0M59KHHmkVRX4jfdLkG5CuCk=;
 b=qhrMUgk19Jzw2pGo+1quS4lW5Tp6oqF4nv/ampZ0FgxFtnW1QbaNGtth/ttkp8gk0M
 Y1S3H/jZgPmfvQInQosXKT4QmPA/aTXgkg/rFUuhIJLRmhtQFLfpCO3GHDOkLXZaYRDC
 ZrVqg4jakP7I/V8Yjwl2d78otfDQUz0YhVfd2SiZ0rtQ/FKGkIquf0Lx01X8yPm1Xygd
 ChzEmaDaB1D0mFpSuMPZbkSPSKxKr2Q33tGIpnMZJdsCJIDu98qXeT95YfgjJXBqkFra
 6mQekPVgV+fJcpy+eTWZDUQdZ8Vac27h6DGgxEGQhjL1k+cWVA9o2JSALGAbT2rLDFcS
 PIVA==
X-Gm-Message-State: APjAAAUM5hQWpLG2E5XuOL/5WQfCiLuQoF9R6ZuPFxICET3neutrWxfE
 l2cPV9RTu6lMf9Vl86JidseNWQZJJijkvoI0JikpwA==
X-Google-Smtp-Source: APXvYqxYrXh+bs0hosTD/hzmdQkN1G90/b647zIel/Jl7hKZbVY6pkzUQgTI+fIWHmnErEf5W84Du3nysbF+feMrkrE=
X-Received: by 2002:a05:6830:13da:: with SMTP id
 e26mr14993763otq.97.1579525248039; 
 Mon, 20 Jan 2020 05:00:48 -0800 (PST)
MIME-Version: 1.0
References: <20200114105918.2366370-1-clement.deschamps@greensocs.com>
 <03110090-dd50-b124-e60a-9cf136e8f7fd@redhat.com>
In-Reply-To: <03110090-dd50-b124-e60a-9cf136e8f7fd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Jan 2020 13:00:37 +0000
Message-ID: <CAFEAcA92pO3j+d8wS2PHhUKTjViLS3GbrmT4ocaDUYKFZLWgAg@mail.gmail.com>
Subject: Re: [PATCH] target/arm: add PMU feature to cortex-r5 and cortex-r5f
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Clement Deschamps <clement.deschamps@greensocs.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
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
X-List-Received-Date: Mon, 20 Jan 2020 13:00:53 -0000

On Tue, 14 Jan 2020 at 12:44, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 1/14/20 11:59 AM, Clement Deschamps wrote:
>
> Maybe describe here:
>
> The PMU is not optional on cortex-r5 and cortex-r5f (see
> the "Features" chapter of the Technical Reference Manual).
>
> > Signed-off-by: Clement Deschamps <clement.deschamps@greensocs.com>
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>



Applied to target-arm.next, thanks (with the suggested
improvement to the commit message).

-- PMM

