Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YFMTG-0001gU-Cp
	for mharc-qemu-trivial@gnu.org; Sun, 25 Jan 2015 07:39:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59858)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YFMTC-0001bD-18
	for qemu-trivial@nongnu.org; Sun, 25 Jan 2015 07:39:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YFMT3-0003Ul-7H
	for qemu-trivial@nongnu.org; Sun, 25 Jan 2015 07:39:13 -0500
Received: from mail-la0-f50.google.com ([209.85.215.50]:55453)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YFMT2-0003UR-WA
	for qemu-trivial@nongnu.org; Sun, 25 Jan 2015 07:39:05 -0500
Received: by mail-la0-f50.google.com with SMTP id hs14so3952989lab.9
	for <qemu-trivial@nongnu.org>; Sun, 25 Jan 2015 04:39:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=0DJJy3/YERACebutN357qs6wXkiReXaUCnR1FGTANfo=;
	b=N36tZd2BJHrhDuXcuy7vkRIBsW8ZMBz2KFjcg7mdXGpqZ5qz0N2vqKZBpzRUIiEUAO
	4kgUkTzke8/wyGyYQoPRIvZwIQmlGo1HhsF2+zTs0DmGwpeCVZc+m1Bxwx9Up7IdJD2Y
	waVtI1otKdgz7KSLNnMLJ9Zql9FPtIN/Y7G9KnX3j99+30A19q9VYQs8e1Trl6twxInr
	ZK6zAhG37Zf2N5Srd2FzKyxqqfvZWKzK1CpOllwENPDVG03B6BYIZOQTTW3/z4iw1LTk
	6TtAPXxJnjJIQd4pENhUB60tEH1Wi4tbaxYfhR53AkcD8IJi/V/45lf7k5ovrapV033K
	YyGw==
X-Gm-Message-State: ALoCoQlrmk4k7sieCODW1dy5HvQt3JmQb0UXrikUKlnK2GQh13Q2Q4KJaC86pAdCOPKF6w2QbCEM
X-Received: by 10.152.180.35 with SMTP id dl3mr76131lac.24.1422189543989; Sun,
	25 Jan 2015 04:39:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.21.34 with HTTP; Sun, 25 Jan 2015 04:38:43 -0800 (PST)
In-Reply-To: <54C4322A.3060704@sunrus.com.cn>
References: <54C4322A.3060704@sunrus.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 Jan 2015 12:38:43 +0000
Message-ID: <CAFEAcA_B+LsaNGNirrtLD_hNN83bX2kz6X+VrsNNrzFib+Ob9A@mail.gmail.com>
To: Chen Gang S <gang.chen@sunrus.com.cn>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.50
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Riku Voipio <riku.voipio@iki.fi>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH v2] linux-user/syscall.c: Need call
 unlock_user() before go to failure return in default case
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 25 Jan 2015 12:39:17 -0000

On 25 January 2015 at 00:00, Chen Gang S <gang.chen@sunrus.com.cn> wrote:
> In abi_long do_ioctl_dm(), after calls lock_user(), it does not call
> unlock_user() before go to failure return in default case.
>
> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
> ---
>  linux-user/syscall.c | 2 ++
>  1 file changed, 2 insertions(+)
-- 

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

