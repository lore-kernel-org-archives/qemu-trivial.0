Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QLwYD-0008Sk-TV
	for mharc-qemu-trivial@gnu.org; Mon, 16 May 2011 08:05:29 -0400
Received: from eggs.gnu.org ([140.186.70.92]:34907)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QLwYC-0008Pn-5a
	for qemu-trivial@nongnu.org; Mon, 16 May 2011 08:05:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QLwYB-0006Gt-7h
	for qemu-trivial@nongnu.org; Mon, 16 May 2011 08:05:28 -0400
Received: from mail-yi0-f45.google.com ([209.85.218.45]:43872)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QLwY8-0006Fd-IC; Mon, 16 May 2011 08:05:24 -0400
Received: by yib19 with SMTP id 19so1661692yib.4
	for <multiple recipients>; Mon, 16 May 2011 05:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=aUgrEUTlS3RrK5xIXmgIlhjLELtebJ4N47XDb3p6Yg0=;
	b=kbtVRzYOOgtTiqd8xHrIpGpbtOU6sccJp1drOXKE+/5iIIYJiON+VQBmtUr4/4pV/b
	tT79VFIOM/mPN74hPOV6KIgt2wRsJQr6irP5QQHuGEUmLcB79yDVew5nSgwClPnBf7lg
	Ai4KpUbC1ISVydjXNo+hiHhGoVWv6KJmmC+L8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=tlgveZpamnUaODrEIymFkn/CPf6LwrR2dMCdw1HCPGj66O6RSTuBG6x1HdbXxe1hle
	53Ow3wsWTRQC5qBz2m/EEnllLceJ6N1jHv6iBxo5+oYAQClAkuj0PXAQG/mZDZ1XQvOG
	CPOfRqgfO4r/5VYN/2Vr0vJpvstGSoD2k2LJI=
MIME-Version: 1.0
Received: by 10.236.192.228 with SMTP id i64mr4207340yhn.111.1305547520976;
	Mon, 16 May 2011 05:05:20 -0700 (PDT)
Received: by 10.147.32.3 with HTTP; Mon, 16 May 2011 05:05:20 -0700 (PDT)
In-Reply-To: <BANLkTimVJAJL=2Jxe+qDMKPtS8CLagYhBA@mail.gmail.com>
References: <BANLkTimVJAJL=2Jxe+qDMKPtS8CLagYhBA@mail.gmail.com>
Date: Mon, 16 May 2011 13:05:20 +0100
Message-ID: <BANLkTi=Rv+UyqLgDyAQiM_kep0uJZvZE1w@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: TeLeMan <geleman@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.218.45
Cc: qemu-trivial@nongnu.org, Isaku Yamahata <yamahata@valinux.co.jp>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] piix_pci: fix piix3_set_irq_pic()
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
X-List-Received-Date: Mon, 16 May 2011 12:05:29 -0000

On Mon, May 16, 2011 at 12:50 PM, TeLeMan <geleman@gmail.com> wrote:
> If pic_irq is greater than 7, the irq level is always 0 on 32bits.
>
> Signed-off-by: TeLeMan <geleman@gmail.com>
> ---
> =A0hw/piix_pci.c | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied to the trivial-patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Your patch is line-wrapped.  I have manually applied it, please make
sure future submissions are not line-wrapped.  GMail's web interface
always line wraps, you must use their SMTP server directly (e.g. with
git-send-email(1)).

Stefan

