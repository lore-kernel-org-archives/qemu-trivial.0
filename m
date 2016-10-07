Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bsWUk-0003Cz-Om
	for mharc-qemu-trivial@gnu.org; Fri, 07 Oct 2016 10:51:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57067)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bsWUi-00038v-8H
	for qemu-trivial@nongnu.org; Fri, 07 Oct 2016 10:51:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bsWUg-0007wE-4d
	for qemu-trivial@nongnu.org; Fri, 07 Oct 2016 10:51:27 -0400
Received: from mail-ua0-x233.google.com ([2607:f8b0:400c:c08::233]:34035)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bsWUf-0007vh-UY
	for qemu-trivial@nongnu.org; Fri, 07 Oct 2016 10:51:26 -0400
Received: by mail-ua0-x233.google.com with SMTP id p25so46874290uaa.1
	for <qemu-trivial@nongnu.org>; Fri, 07 Oct 2016 07:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=c9ojlfF8gBJbD20jq7E8GoyDyTjMjhyxQPeWxVGpwjY=;
	b=XY2oYv4dVdaIzFsT0m/xjjPCQeQ/3fANFms31vl0sGTJo9if9SeQrOmIvsnRYaDYvm
	87NfPWjOeB45kmvZjEPgVEl25EM1PRV1kzNGA3ksA24wC8wcZSu/N3oyBjGbzI0eJnau
	689iz/Avts1mYFE94vKNYN8mLxE7d9oxSiVV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=c9ojlfF8gBJbD20jq7E8GoyDyTjMjhyxQPeWxVGpwjY=;
	b=bE+Jw/olqIcQVvzw8vFyx50Buxf3FKwpajPR4GrCxqFREmPN0T1nAzgA9CSPopXE61
	//+g+wFINPj+AV7IEu53A868cfUQ2HkKhFA2Y1nwqI1zbZjgIaxiVB/4adxv4O1tJ8J3
	AYpLCyDxOsHWchdiA5K6/ShSB0b16KMuCnWJoO/hAwftcyt25H1VOA5s781eQzNJ62Az
	nDDghOtnQevPmuRcRfcLdHpJQXi5zalx++r/I2TEc0OEDcxHRbTc8qcSOAj8J2S0FFG0
	PfHsqH+MNO86OIChJKM+GobSbdA1mzeS6XscaC/arttXfPTYIW1xuhpYoOHCrb/d7aTP
	pPNA==
X-Gm-Message-State: AA6/9RkYnbXdJ3DILFe2CzAIZnwchvYTWQUa6BRUhulkU0/MxOyCoXegSgyBfwH0hwtNsqkxNeiyaZ2xuD/9XD6T
X-Received: by 10.159.55.169 with SMTP id q38mr5943037uaq.131.1475851885281;
	Fri, 07 Oct 2016 07:51:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Fri, 7 Oct 2016 07:51:04 -0700 (PDT)
In-Reply-To: <1475611369-74971-1-git-send-email-emaste@freebsd.org>
References: <1475611369-74971-1-git-send-email-emaste@freebsd.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Oct 2016 15:51:04 +0100
Message-ID: <CAFEAcA_o6buZ8gq8f1Akqa_V0ugOe0-_=YVhCuFXSobCf3534w@mail.gmail.com>
To: Ed Maste <emaste@freebsd.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::233
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] bsd-user: fix FreeBSD build
 after d148d90e
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
X-List-Received-Date: Fri, 07 Oct 2016 14:51:29 -0000

On 4 October 2016 at 21:02, Ed Maste <emaste@freebsd.org> wrote:
> Signed-off-by: Ed Maste <emaste@freebsd.org>
> ---
>  bsd-user/main.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>

Applied, thanks.

-- PMM

