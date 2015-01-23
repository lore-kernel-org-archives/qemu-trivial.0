Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YEeio-0004Lj-V8
	for mharc-qemu-trivial@gnu.org; Fri, 23 Jan 2015 08:56:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57138)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YEeim-0004Id-7z
	for qemu-trivial@nongnu.org; Fri, 23 Jan 2015 08:56:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YEeii-0003Ox-8r
	for qemu-trivial@nongnu.org; Fri, 23 Jan 2015 08:56:24 -0500
Received: from mail-la0-f52.google.com ([209.85.215.52]:35509)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YEeii-0003Ol-1z
	for qemu-trivial@nongnu.org; Fri, 23 Jan 2015 08:56:20 -0500
Received: by mail-la0-f52.google.com with SMTP id ge10so3231945lab.11
	for <qemu-trivial@nongnu.org>; Fri, 23 Jan 2015 05:56:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=KkPZBWt7jBqqclVkhLKIBlocIOb5T99+gJYcebe2MmU=;
	b=O2uAs4Pc4Pz1RntW+bLqHTNa0EdRRQTxbdnfNR9zo5l50ZC1JKLJLUk+HQkwuMriHG
	wJj5mgRF1KNXCNELrS6o3uhfUzG1zOnbUy8tX9diFMay54H2B12WHeWseUN99SrxhpSC
	+nG/jud1SCBz/E4tk91MSmmaN+8KZgf0PZcSaHEvUeqexVX2yqkMuJVe5Jhurj3LoRXd
	/r48uCP140rECAq56qL9XSoUdFJxkxXNkWug6AJe1wwSpZKnFv+Lir7ipFzIUG+5jck3
	BbUhc+XF+vgEMphWPTNpahW2ZGszjly5LKu4HCKuqkDLohngdsGaTS94nyTJjQQUNkS+
	4pFA==
X-Gm-Message-State: ALoCoQnIABD3ZwsCgFOLU+9JSEp7JQF/7Uijirz0rfAt+vTwH7uzGbdB6KtK+SvIAkHzcfc7Rgml
X-Received: by 10.152.18.135 with SMTP id w7mr7214550lad.47.1422021379151;
	Fri, 23 Jan 2015 05:56:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.21.34 with HTTP; Fri, 23 Jan 2015 05:55:56 -0800 (PST)
In-Reply-To: <54C25428.7030304@sunrus.com.cn>
References: <54C21D76.8050808@sunrus.com.cn>
	<CAFEAcA_NG4E5tc8nQ8EbVDqs=704cnXJZerVAVg-c74VQm5c+Q@mail.gmail.com>
	<54C22918.8040505@sunrus.com.cn>
	<CAFEAcA9WwAT4ft9Hk0Apoa1MG1PeGOZ660OtK+qvJYeJvVMCGg@mail.gmail.com>
	<54C25428.7030304@sunrus.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Jan 2015 13:55:56 +0000
Message-ID: <CAFEAcA_4GvLC30OAjxqyNjd=x5SUUosd6nqNjYG6gM=-EbSR9w@mail.gmail.com>
To: Chen Gang S <gang.chen@sunrus.com.cn>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.52
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Chris Metcalf <cmetcalf@ezchip.com>,
	Riku Voipio <riku.voipio@iki.fi>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user/syscall.c: Fix
 typo issue for using target_vec[i].iov_len instead of
 target_vec[i].iov_base
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
X-List-Received-Date: Fri, 23 Jan 2015 13:56:25 -0000

On 23 January 2015 at 14:01, Chen Gang S <gang.chen@sunrus.com.cn> wrote:
> What I shall do for tile qemu should obey the related license of qemu
> (all the related code should belong to qemu upstream). If necessary to
> follow some copyright working flow, please let me know, I shall follow.

We don't have a copyright assignment process. I recommend
reading http://wiki.qemu.org/Contribute/SubmitAPatch if you haven't
already.

thanks
-- PMM

