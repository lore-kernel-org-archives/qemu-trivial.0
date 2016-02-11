Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aTuk3-0002i0-81
	for mharc-qemu-trivial@gnu.org; Thu, 11 Feb 2016 12:09:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59306)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aTuk1-0002fP-5D
	for qemu-trivial@nongnu.org; Thu, 11 Feb 2016 12:09:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aTujz-0002xN-TG
	for qemu-trivial@nongnu.org; Thu, 11 Feb 2016 12:09:17 -0500
Received: from mail-vk0-x233.google.com ([2607:f8b0:400c:c05::233]:33602)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aTujz-0002wn-Ov
	for qemu-trivial@nongnu.org; Thu, 11 Feb 2016 12:09:15 -0500
Received: by mail-vk0-x233.google.com with SMTP id k196so41569170vka.0
	for <qemu-trivial@nongnu.org>; Thu, 11 Feb 2016 09:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=k4SOTIvKvhyhjeSfuWoJImsGvdJhNQBOfJKeMdkfW3Q=;
	b=Rhd5Q9ClTXzNWxQ4LjbAl6AQyxFVQdC9koLkEYsdu+yU3o3qgo3a05xy5A2+IZVJvl
	0znzhUO6OHDMjojqGevzeD5ZBkRIYkfa/fDUqyj3W5f33iSNk0UgBO22J+Ylz5FsyNjw
	QRsfnErZ2Ypwj//Ia36wmlwCI5rHoa8vHGe+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=k4SOTIvKvhyhjeSfuWoJImsGvdJhNQBOfJKeMdkfW3Q=;
	b=ZkIsQVfevR/Df55sAXhjtwoWLJtrnllUWSiNP5Jlg3/4iQxmKye/ri7hcQVSav2Tbu
	9V3dvmdu7yCRdpZe1Il/2YB9PUH0ydDtd8GbMnE5X4nQq900iXG64KThp0vdSdTBbFGl
	X7FW2NSjbGm/2PzLT7DtILAW/yYaQXezfYab+NqX1d/JLpAAosZLI+V2nugEIgI7LmpP
	GSktqWsHyY7tjkYYOid1QOf8s0r6Z3S3e1NVzVFlWr/JbvwV78bhq4mbglXBfYhUH4eW
	akPBbSM6BJAfTipJC27dk1WC7a4JhOt0g2g3cJjBpq1j8dmud9ygUKy7mdo9QD9fjNxl
	bB4Q==
X-Gm-Message-State: AG10YOQDomK/ecUfksxSagrk3rBfXC87Aars62gPnyaLnZDJK0uHD+kMfYyfAzLAqG/NZ0V8HGhJtoOQ/SZi0cC5
X-Received: by 10.31.1.6 with SMTP id 6mr31602407vkb.139.1455210555451; Thu,
	11 Feb 2016 09:09:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Thu, 11 Feb 2016 09:08:56 -0800 (PST)
In-Reply-To: <cover.1455192968.git.mjt@msgid.tls.msk.ru>
References: <cover.1455192968.git.mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Feb 2016 17:08:56 +0000
Message-ID: <CAFEAcA-Zekd2jFw=uAODVW1h1Y_1OOmUoeFzvs71xBUHyc2B2A@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::233
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/14] Trivial patches for
	2016-02-11
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
X-List-Received-Date: Thu, 11 Feb 2016 17:09:18 -0000

On 11 February 2016 at 12:18, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Here's yet another trivial-patches pull request.  There aren't many
> patches in there this time, even if the previous pull request was
> quite some time ago.
>
> Speaking of the pull requests.  Maybe it is better to use the
> same tag all the time, instead of separate tags for every pull?
>
> Thanks,
>
> /mjt
>
> The following changes since commit 88c73d16ad1b6c22a2ab082064d0d521f756296a:
>
>   memory: fix usage of find_next_bit and find_next_zero_bit (2016-02-10 22:38:24 +0000)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2016-02-11
>
> for you to fetch changes up to 1834ed3afc578b8dbf39838cfdf27d457771a334:
>
>   w32: include winsock2.h before windows.h (2016-02-11 15:15:47 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2016-02-11

Applied, thanks.

-- PMM

