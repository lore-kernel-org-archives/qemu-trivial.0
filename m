Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fqiup-0002x2-2h
	for mharc-qemu-trivial@gnu.org; Fri, 17 Aug 2018 13:52:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45695)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqiun-0002vu-3z
	for qemu-trivial@nongnu.org; Fri, 17 Aug 2018 13:52:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqium-0005jt-2w
	for qemu-trivial@nongnu.org; Fri, 17 Aug 2018 13:52:01 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:36708)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fqiul-0005jV-BS
	for qemu-trivial@nongnu.org; Fri, 17 Aug 2018 13:52:00 -0400
Received: by mail-oi0-x243.google.com with SMTP id n21-v6so15403648oig.3
	for <qemu-trivial@nongnu.org>; Fri, 17 Aug 2018 10:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CtSkBDfOIKQCNtTANim6s6Pm8dRNOY7q3X3CPZl9vH8=;
	b=OJI3kBTN4G7qLhOPVU1/ZtNP/if19wGiLhMlmpU0/sR5qw1cmqDfeQIyC3kgJCXRMt
	ILfoXiAjzehp2n2XDAm+PFSgAed0pG7YkbajckFK2lvqiZ7CIDt3tiBsG0+Kt10Pv3i5
	U4DTpjR+aMVubXvBKpvC1NQcf4FxWFR0WZGs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CtSkBDfOIKQCNtTANim6s6Pm8dRNOY7q3X3CPZl9vH8=;
	b=chBDZ8+0aRe4+H/1gOU9EpW0WlJ9HZzhH4SqTLdT2HylRvj9w2qJBlbMNzKciImJH3
	AnJWyBSTDiC3lX82dSYrqv6ily0KKHNmf+C5OVfRDW+issIJxrTpUtHFjskymHnhUgPL
	E+ZrnQ1egb0+mSgpHCMKBZKxmEKQX67IMD/xa08KoiQtMIQB4XWk19zB3D3h2YaIflNx
	fW7//eByxhWn5aso1B6WB/5Lxnq+5feEUiUC7PTsWJ9VWYB0kIsNOyL6i8f3VxHZIuAQ
	CbplWB33rJPnBG/5aI3tD7TM4I1tlvoHoz3+npvjp/YNWG9PqYNXlwMLABK+LVv9c3T1
	tDrw==
X-Gm-Message-State: AOUpUlHgFwQD/CEEF33jYD3KR4FFLsTzNrPy77Xr6KacNiMNDBakReMx
	MgGZGUjtV5vNJ/lDZy6lbO65FRPXZAeHHs4qN8Zpzg==
X-Google-Smtp-Source: AA+uWPw/ydGlWr+sLxrKqSdM0W8rwsSxCu+Dmt8gaB1dZY/l+Bo0M5krdv27+hrI2rtGhxJPaQMoTCoBK0xWvnipGbI=
X-Received: by 2002:aca:401:: with SMTP id 1-v6mr3252365oie.28.1534528318712; 
	Fri, 17 Aug 2018 10:51:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Fri, 17 Aug 2018 10:51:38
	-0700 (PDT)
In-Reply-To: <1534507843-4251-1-git-send-email-hans-erik.floryd@rt-labs.com>
References: <1534507843-4251-1-git-send-email-hans-erik.floryd@rt-labs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Aug 2018 18:51:38 +0100
Message-ID: <CAFEAcA_Ki4Sqke3qExAihjx+x9XpX2e6DJG0ua-VEvdes_gKBw@mail.gmail.com>
To: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	"open list:All patches CC here" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] sdhci: add i.MX SD
 Stable Clock bit
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
X-List-Received-Date: Fri, 17 Aug 2018 17:52:02 -0000

On 17 August 2018 at 13:10, Hans-Erik Floryd
<hans-erik.floryd@rt-labs.com> wrote:
> Add the ESDHC PRSSTAT_SDSTB bit, using the value of SDHC_CLOCK_INT_STABLE.
> Freescale recommends checking this bit when changing clock frequency.
>
> Signed-off-by: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>
> ---
>  hw/sd/sdhci-internal.h | 2 ++
>  hw/sd/sdhci.c          | 8 ++++++++
>  2 files changed, 10 insertions(+)

Applied to target-arm.next, thanks.

(Your indentation was off-by-one -- we use 4-space indent -- but I fixed that.)

-- PMM

