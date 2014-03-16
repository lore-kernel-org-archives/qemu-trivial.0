Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WPDB2-0001vP-5G
	for mharc-qemu-trivial@gnu.org; Sun, 16 Mar 2014 11:40:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45047)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WPDAw-0001tw-CD
	for qemu-trivial@nongnu.org; Sun, 16 Mar 2014 11:40:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WPDAp-0003w7-Ca
	for qemu-trivial@nongnu.org; Sun, 16 Mar 2014 11:40:34 -0400
Received: from mail-la0-f46.google.com ([209.85.215.46]:61441)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WPDAo-0003uv-VZ
	for qemu-trivial@nongnu.org; Sun, 16 Mar 2014 11:40:27 -0400
Received: by mail-la0-f46.google.com with SMTP id hr17so3015788lab.33
	for <qemu-trivial@nongnu.org>; Sun, 16 Mar 2014 08:40:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Z6VT7isXlxTuBGzyl2SycNlVfA4uhWwfShiRNRpsFec=;
	b=EKHqfYAjLsQMdsWd2K4HXtEH5nXpiMWYtiywbJemTrkhQLVdKg73O/NPYGfXsWAC4u
	3HS2mlWBdq2+KYAqja4yaBxDndlF3UQF59zlCGRJkypEEnbQQoZlhDYb2mA2Hf46p6uP
	UuZ+Hz3zIpSy9mein+KO5Gb/9KFFTnUyl0pcVtiyblI1UCnukUjlmAg4k7i/xVyHtRrv
	c+K/WGQlUQfzU5EdfBT6ddCLdlcSDwRB+6Jo3/sdGIj8WH82yHGEIuESi3bP+fibg/ol
	6S85j5fL6FRFoJBD0OqUpW4/ZI6KlAtP3qI+fsaOIqghjOrTw2bA+VUbJT7CSAT6qI4Y
	hXDg==
X-Gm-Message-State: ALoCoQmTSakVSyrCbuOPAnigMw18b7XHix6upw7X/sIouQLYeakIOOxiGwUqrZDDCY5O2XhlI7BG
X-Received: by 10.112.73.100 with SMTP id k4mr12784321lbv.25.1394984425651;
	Sun, 16 Mar 2014 08:40:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.180.233 with HTTP; Sun, 16 Mar 2014 08:40:04 -0700 (PDT)
In-Reply-To: <1394877419-19949-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1394877419-19949-1-git-send-email-mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 16 Mar 2014 15:40:04 +0000
Message-ID: <CAFEAcA8RSujZvy+J9ZafgZKeDnHCBaVckyqwaj3At8B-NWSjVg@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.46
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/13] Trivial patches for
	2014-03-15
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
X-List-Received-Date: Sun, 16 Mar 2014 15:40:39 -0000

On 15 March 2014 09:56, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Here's another pull request for the trivial-patches queue.
> This time it does not include Peter's shifts-to-sign-bit
> patchset, but I'd hope to get it included in the next
> few days.
>
> All the changes appears to be fine for 2.0 (including the
> shifts-to-sign-bit series actually).
>
> Please consider applying for 2.0.
>
> Thanks,
>
> /mjt
>
> The following changes since commit 03d51428e2da0188a0adea00cbd713cc1e967e7a:
>
>   Merge remote-tracking branch 'remotes/bonzini/scsi-next' into staging (2014-03-14 18:17:25 +0000)
>
> are available in the git repository at:
>
>
>   git://git.corpit.ru/qemu.git tags/trivial-patches-2014-03-15
>
> for you to fetch changes up to 9c749e4dbe65e61e159ad822a4110167c2c108fe:
>
>   FSL eTSEC: Fix typo in rx ring (2014-03-15 13:54:18 +0400)

Applied, thanks.

-- PMM

