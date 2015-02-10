Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL8Hc-0005ya-Tk
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 05:43:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58781)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YL8HX-0005o4-Fk
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 05:43:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YL8HM-00023S-Mt
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 05:43:03 -0500
Received: from mail-lb0-f179.google.com ([209.85.217.179]:55314)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YL8HM-000235-Fv
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 05:42:52 -0500
Received: by mail-lb0-f179.google.com with SMTP id w7so11172580lbi.10
	for <qemu-trivial@nongnu.org>; Tue, 10 Feb 2015 02:42:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=nTDZSQEWz/QQe8O5J9VXs+a6xxmFiOqGdOagb6cYm8A=;
	b=Dc9whSYoAB1tIOZ/ZJit9EdVsMzx/RQuTXtPrDw7Ks0BJciD8LdFK0i+x3wgDbIMUH
	z4H1DLeO1sQ/YjBbVztVcDubAbO0KkjM/DHWQ61Xdhtc1jtvfsFi5ys8JwL0eGo3KbbN
	LEptysUu0CSo92zPXLSjD4fmNkOlnXB9Iz/2A+JlUlVhYLJLjNbTqZ0GdZI2nf1i/3dZ
	4QeZ0I/9eNYqbSElqhEoiqotqxUbiUeC9ZDb1q0UjVhGXGHsXjZdiT/LlStqKaj8D6ey
	0YiQWLCCf5+MctY69AhK72feNOy5bhwm/123j6jXQrvmdSr69Dfks8N6a90lHgViOwzr
	eclw==
X-Gm-Message-State: ALoCoQmU4J0KawmJ8JtsC1n5YWrZIBuZzsjwxaC/+bwIeZDCdM+eEG+pXIO7U4onI9gz2VS+iHaH
X-Received: by 10.112.41.171 with SMTP id g11mr15655259lbl.107.1423564971633; 
	Tue, 10 Feb 2015 02:42:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.141.97 with HTTP; Tue, 10 Feb 2015 02:42:31 -0800 (PST)
In-Reply-To: <54D9B36C.1000405@msgid.tls.msk.ru>
References: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
	<CAFEAcA-nR3zspLZ42W7Ey4EV1UM-RgiXkggmgfBWWDwRqYFqHA@mail.gmail.com>
	<54D9B36C.1000405@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Feb 2015 10:42:31 +0000
Message-ID: <CAFEAcA_ZrzhBa842+EaqaM90DA5VuTPMOU4sPE1VTsW7-7X_0w@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.179
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/46] Trivial patches for
	2015-02-10
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
X-List-Received-Date: Tue, 10 Feb 2015 10:43:06 -0000

On 10 February 2015 at 07:29, Michael Tokarev <mjt@tls.msk.ru> wrote:
> The following changes since commit 89db21771782fd6050335e73542064f1187c9ced:
>
>   qmp: unbreak build for non-vnc configuration (2015-02-09 22:36:04 +0000)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2015-02-10
>
> for you to fetch changes up to 43d735547b2a29cafd7d9529ac38734950b235f7:
>
>   virtio: Fix warning caused by missing 'static' attribute (2015-02-10 10:26:05 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2015-02-10
>
> ----------------------------------------------------------------

Applied, thanks.

-- PMM

