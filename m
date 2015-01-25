Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YFMdh-0005sf-GI
	for mharc-qemu-trivial@gnu.org; Sun, 25 Jan 2015 07:50:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32826)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YFMdf-0005qj-Gk
	for qemu-trivial@nongnu.org; Sun, 25 Jan 2015 07:50:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YFMdX-0007ZN-CW
	for qemu-trivial@nongnu.org; Sun, 25 Jan 2015 07:50:03 -0500
Received: from mail-lb0-f169.google.com ([209.85.217.169]:50352)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YFMdX-0007Z2-5K
	for qemu-trivial@nongnu.org; Sun, 25 Jan 2015 07:49:55 -0500
Received: by mail-lb0-f169.google.com with SMTP id f15so4017060lbj.0
	for <qemu-trivial@nongnu.org>; Sun, 25 Jan 2015 04:49:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=utG3XNnJtPsNoryphIopA7YxZgWNebxsj/NVusWGHIc=;
	b=WKfL1UGTd4KEsoJOWlTSyfcORgChOPfJqum+JchlNbf7NYr0GGC7hcrbtDPIknw/mo
	rZ8oEOfnknWWESq4iX+tAvdqwzKcfNe/NZyA1my3wUU9lfngrrNXQlxLmHQYpOXhdSUo
	SFg6IhvDf+1xppbZxQyT1vfWdQWbtwXoarODmXZ5LPwByLKFwA019g6eLsI/EMLr3/9P
	9O29fbXyG25znyZB6ljv89URxgNzNgTc1knVYG5x7mZUX2cpM9z+BaY/Z7bSNHb5SPzT
	oKhFuUoTm9OZbSS27uipkhdu1pBz3ST5hplW77POUb6wxsJ0DPm8y3Ea+Trven3KKndS
	F1UQ==
X-Gm-Message-State: ALoCoQmxFC5ayUFP5B3ykDJRcqOlz1M+UodFqcXFLlEs3ZZx9KgbY5EMfVMiQDG8kmDo9+iWdyC3
X-Received: by 10.152.21.228 with SMTP id y4mr16645315lae.72.1422190194229;
	Sun, 25 Jan 2015 04:49:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.21.34 with HTTP; Sun, 25 Jan 2015 04:49:34 -0800 (PST)
In-Reply-To: <54C4DC4E.3080306@sunrus.com.cn>
References: <54C4DC4E.3080306@sunrus.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 Jan 2015 12:49:34 +0000
Message-ID: <CAFEAcA_hGO-R85yYXDU7eoC7FHF_v96y7Oh54SX9HXBAss6Vpg@mail.gmail.com>
To: Chen Gang S <gang.chen@sunrus.com.cn>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.169
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Riku Voipio <riku.voipio@iki.fi>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] linux-user/syscall.c: Let all
 lock_user_struct() and unlock_user_struct() paired with each other
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
X-List-Received-Date: Sun, 25 Jan 2015 12:50:04 -0000

On 25 January 2015 at 12:06, Chen Gang S <gang.chen@sunrus.com.cn> wrote:
> lock_user_struct() and unlock_user_struct() need always be paired with
> each other, or will cause resource leak.
>
> Also remove redundant check for 'target_mb' in abi_long do_msgrcv().
>
> Also match the coding styles found by "./scripts/checkpatch.pl".
>
> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Are you claiming that you've reviewed *all* the code in this
file for mismatched lock/unlock calls? If so, it would be nice
to say so explicitly in the commit message. If not, it would be
nice if the commit message was clearer about what areas of the
code it applied to. The code changes are correct, though.

thanks
-- PMM

