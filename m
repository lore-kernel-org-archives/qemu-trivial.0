Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bpliB-00057A-9E
	for mharc-qemu-trivial@gnu.org; Thu, 29 Sep 2016 20:29:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43235)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bpli9-00054t-2i
	for qemu-trivial@nongnu.org; Thu, 29 Sep 2016 20:29:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bpli7-00051C-58
	for qemu-trivial@nongnu.org; Thu, 29 Sep 2016 20:29:56 -0400
Received: from mail-ua0-x230.google.com ([2607:f8b0:400c:c08::230]:35714)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bpli7-00050z-0o
	for qemu-trivial@nongnu.org; Thu, 29 Sep 2016 20:29:55 -0400
Received: by mail-ua0-x230.google.com with SMTP id q42so80939311uaq.2
	for <qemu-trivial@nongnu.org>; Thu, 29 Sep 2016 17:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=gV0DT0mUhkxSxVERGI1bQC8cjvCGnASWIuifECxZzMY=;
	b=NJLghORyj7cpMUXD0a6NjlvJppaaICNvCStm12No/ghWcA/18BfboebYsLU4x3jh3Z
	G0xsyEwtdXRraIyiNTS4p95KSuBQJ4xfYZFXLiKcqVXFQulpwr9e4L5FXr2LhsJXD3Q6
	lS5ftuwi2kSK64GQRBljGM5guersyagamUBXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=gV0DT0mUhkxSxVERGI1bQC8cjvCGnASWIuifECxZzMY=;
	b=L7Z1rE8/I2k03uJIommldNiHy+4/q7mgKLOoe/spw0a9rYD9fK8kp4OytKEn4eWp+Y
	ejEwxINw7apRr9kDnv2NsCjLdNZpYDrcrMUXDj+yQZY/2QwZoxOIRQ9Jd8H7LZygPNMI
	WDW/n+uiJzqMgwmjl0AFTg+WAcnEmsqpBWc/wXZq8ULAIftmXINzCd5II1S5t8h1as1s
	OBSX7QB5QfpNcpbOoslZ28tS6zgDaHta5jlX1wV/nOu7lX4FASWpHSgRxeq2SwPLRGhv
	vHjd1Bt82BdvhbYtPK+8Tumq2w9JxwyIv/D2M5qgOI4y/CvW20VGmX7tIokFU6nQ/Ugj
	806A==
X-Gm-Message-State: AA6/9RkkvFdfz9z3x5BPVHNaRlrw+PzRpnBxU6WvRk6kxX2C6cA4HvcZQf/PlLe38cc3PLu4IYC9grPhLhowF6s9
X-Received: by 10.176.86.23 with SMTP id y23mr3413870uaa.8.1475195394651; Thu,
	29 Sep 2016 17:29:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.16.98 with HTTP; Thu, 29 Sep 2016 17:29:34 -0700 (PDT)
In-Reply-To: <20160930000428.22382-1-j.neuschaefer@gmx.net>
References: <20160929233847.n5xe7gmdb5ys5ujv@latitude>
	<20160930000428.22382-1-j.neuschaefer@gmx.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Sep 2016 17:29:34 -0700
Message-ID: <CAFEAcA_CkrTSB_Ru0k_5etp85BCPomSbq93JK22R5aPqfGjEvA@mail.gmail.com>
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::230
Subject: Re: [Qemu-trivial] [PATCH v2] CODING_STYLE: Fix a typo ("have" vs.
 "has")
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
X-List-Received-Date: Fri, 30 Sep 2016 00:29:58 -0000

On 29 September 2016 at 17:04, Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
>
> ---
> v2:
> - Preserve the poetic sound of "Many a flamewar", which Peter Maydell
>   pointed out.
> ---
>  CODING_STYLE | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/CODING_STYLE b/CODING_STYLE
> index e7fde15..f53180b 100644
> --- a/CODING_STYLE
> +++ b/CODING_STYLE
> @@ -9,7 +9,7 @@ patches before submitting.
>  Of course, the most important aspect in any coding style is whitespace.
>  Crusty old coders who have trouble spotting the glasses on their noses
>  can tell the difference between a tab and eight spaces from a distance
> -of approximately fifteen parsecs.  Many a flamewar have been fought and
> +of approximately fifteen parsecs.  Many a flamewar has been fought and
>  lost on this issue.
>
>  QEMU indents are four spaces.  Tabs are never used, except in Makefiles

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

