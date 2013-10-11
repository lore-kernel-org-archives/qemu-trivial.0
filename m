Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VUi8m-00004v-9F
	for mharc-qemu-trivial@gnu.org; Fri, 11 Oct 2013 15:12:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49155)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VUi8g-0008Px-8U
	for qemu-trivial@nongnu.org; Fri, 11 Oct 2013 15:12:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VUi8V-00083y-I1
	for qemu-trivial@nongnu.org; Fri, 11 Oct 2013 15:12:42 -0400
Received: from mail-la0-f45.google.com ([209.85.215.45]:56465)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VUi8V-00083X-BP
	for qemu-trivial@nongnu.org; Fri, 11 Oct 2013 15:12:31 -0400
Received: by mail-la0-f45.google.com with SMTP id eh20so3814002lab.18
	for <qemu-trivial@nongnu.org>; Fri, 11 Oct 2013 12:12:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=h/xEOoLAnNxzENMruqfTrYaf6uxd5jRI6ej9YnusNyw=;
	b=mqsQ75pObumVnNbObK1IEKgQz4FfEbjQS1ot2EdyxHG5xxJp0kvdTJsRFNZe1yD/Mg
	bYHfjRNLy5gpIIMnVE/jyREE5QWcsBFhLzgIycd9Qily1Nc1WHv5yqM8+PPmJvioFjvt
	PjaNXiHGetDTTrsKrMhdaT/Y+1BuK7tYG1jbsH0ZdpE8IczTNy0MBvp93Oe8ii3pdoBX
	Jqd4eJl9SJXRcyQENThfD5Gd264+D/jOgPvl0VnAvkxbH+KI9Yq+lxhRGZUIptmYQxLl
	bZ8oGNsAF7lDU+TIRSNYn0X1bCl8jzjRKxdgC0NbqzKX6VDD5HT1h+bJfjD+6T8RZr64
	DCLg==
X-Gm-Message-State: ALoCoQlanSVpWHGQA29yPvoj/zDv2snWiaLzaU8Y3/Ki5H94G8SWRmOP2JwpQ8/ugHcRbGUOAgK/
X-Received: by 10.152.3.42 with SMTP id 10mr17806246laz.22.1381518750159; Fri,
	11 Oct 2013 12:12:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.161.232 with HTTP; Fri, 11 Oct 2013 12:12:10 -0700 (PDT)
In-Reply-To: <1381518382-6105-1-git-send-email-sw@weilnetz.de>
References: <1381518382-6105-1-git-send-email-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 12 Oct 2013 04:12:10 +0900
Message-ID: <CAFEAcA9Stuakd5tytT_65j4mUtKUyXtGQAG3Htvei0k3HU5WWA@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.45
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Jan Kiszka <jan.kiszka@siemens.com>,
	Alex Bligh <alex@alex.org.uk>, qemu-devel <qemu-devel@nongnu.org>,
	Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: [Qemu-trivial] [PATCH v2] misc: Spelling and other fixes in
	comments
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
X-List-Received-Date: Fri, 11 Oct 2013 19:12:46 -0000

On 12 October 2013 04:06, Stefan Weil <sw@weilnetz.de> wrote:
> * it's -> its
> * Grammar fix in ui/vnc-enc-zywrle.h. In the same context
>   a sentence with unclear meaning which could not be fixed was removed.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>
> This is an update of patch http://patchwork.ozlabs.org/patch/257416/
> (Spelling fixes).
>
> v2: Don't try to fix a strange sentence in ui/vnc-enc-zywrle.h - remove it.

What? I thought you meant "remove that part of the change from
the patch", not "remove the sentence altogether". Please leave
it in place so that anybody in future who needs to try to understand
this code has the maximum available amount of clues.

-- PMM

