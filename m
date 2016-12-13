Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cGmFi-0002ui-K2
	for mharc-qemu-trivial@gnu.org; Tue, 13 Dec 2016 07:32:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54570)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cGmFd-0002rF-0w
	for qemu-trivial@nongnu.org; Tue, 13 Dec 2016 07:32:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cGmFZ-0004Lv-Rl
	for qemu-trivial@nongnu.org; Tue, 13 Dec 2016 07:32:09 -0500
Received: from mail-vk0-f45.google.com ([209.85.213.45]:36052)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cGmFZ-0004LV-Na
	for qemu-trivial@nongnu.org; Tue, 13 Dec 2016 07:32:05 -0500
Received: by mail-vk0-f45.google.com with SMTP id p9so58677184vkd.3
	for <qemu-trivial@nongnu.org>; Tue, 13 Dec 2016 04:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=BJJWs4nZmmrhRsmPgTvtLVpJocMMiCWo7txeX2J6dcU=;
	b=EwhwHtw+HoDwg5w0FG/XIyQMwo0TkKi7IZnf+oHf7jxotvq4jkfsO99CcYZjXjOtZp
	ZrGoYWAQpyLOKotx5+h2I9tqtTtuiLu+t3bd05gqswiW4bMC9xwIW/e5G5jIIySl7gK+
	OGhVU97wElL65iB+QwZ6aZxR+2GvBIE7PDSYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=BJJWs4nZmmrhRsmPgTvtLVpJocMMiCWo7txeX2J6dcU=;
	b=Mu5ufZ5Sc2fHRgwXvKsaCaqpEZOZb61vpzPO4BcxuRVspR7KghBHFEZlWwh5XXM1bO
	c1vGXrC8vhtJmVjjnbR8yFnOf6j6/owwUB/W1XWeGeguNUjiERpQ2hZZvuks/kJUu7Ec
	NvFL9C7V52ThT4XXP100z7HKuCt1aOu8r8P1e25/0d+d+PbI17rLiZFtqKGrEUkIy+pP
	QPL3YPQEbceAEr8JMN9JCRwGV0gakRRpqeRn+AoeRDpz3o0SU1ToX84JQvFRTVucUdBr
	EkbhQSsf8IaMaJ9UyVjt0HT0nqATsFmztwbtCLeAbyrumsmDjEGlkglrdPFReTGX/Nes
	Vxeg==
X-Gm-Message-State: AKaTC02QCjnL3OB6kJdoSwGRAYXKWtKbw+ijbIP2bTnjYSDo/5JvbI9g3MimUVhkRIZr+mTb0ixIUFAm0RFU2SSE
X-Received: by 10.176.83.12 with SMTP id x12mr80425558uax.131.1481632264933;
	Tue, 13 Dec 2016 04:31:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Tue, 13 Dec 2016 04:30:44 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Dec 2016 12:30:44 +0000
Message-ID: <CAFEAcA_D9wx=EZWE_ypAFPkQcYBhM+7NJaOt7rg=ed-0fExo8w@mail.gmail.com>
To: Andrew Gacek <andrew.gacek@gmail.com>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Laurent Vivier <lvivier@redhat.com>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.45
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] cadence_uart: Check if
 receiver timeout counter is disabled
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
X-List-Received-Date: Tue, 13 Dec 2016 12:32:13 -0000

On 8 December 2016 at 11:21, Andrew Gacek <andrew.gacek@gmail.com> wrote:
> When register Rcvr_timeout_reg0 (R_RTOR in cadence_uart.c) is set to
> 0, the receiver timeout counter should be disabled. See page 1801 of
> "Zynq-7000 AP SoC Technical Reference Manual". This commit adds a
> such a check before setting the receive timeout interrupt.
>
> Signed-off-by: Andrew Gacek <andrew.gacek@gmail.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  hw/char/cadence_uart.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Thanks; I've applied this to the target-arm.next queue for 2.9.

For future patches, if you send a revised version of a patch it's
best to send it as a standalone new thread (with a subject that
says "[PATCH v2]"), not as a reply to the thread that started with
the original patch. Otherwise our automated scripts and tooling
for handling patch emails tend not to notice it.

thanks
-- PMM

