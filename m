Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gf7mI-00006c-Ik
	for mharc-qemu-trivial@gnu.org; Thu, 03 Jan 2019 13:31:34 -0500
Received: from eggs.gnu.org ([208.118.235.92]:36186)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gf7mE-0008Vj-2d
	for qemu-trivial@nongnu.org; Thu, 03 Jan 2019 13:31:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gf7mC-0007LT-A3
	for qemu-trivial@nongnu.org; Thu, 03 Jan 2019 13:31:29 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:37151)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gf7mC-0007Hj-15
	for qemu-trivial@nongnu.org; Thu, 03 Jan 2019 13:31:28 -0500
Received: by mail-ot1-x341.google.com with SMTP id 40so30122678oth.4
	for <qemu-trivial@nongnu.org>; Thu, 03 Jan 2019 10:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gTjlVCifx06q4oHQ9YFVXzgLrIuhUcFTQKS7YSRmVzE=;
	b=Z00H3Srr8TElWiZmj3wnO6HGT/xsptzAMUywl9bsNPgmzg4/fsBngxvfu6+GuvJjv0
	gyVTF/gkNp3PSDoHgbZGnQfN7Tdcta4SJGAW6SH8qNQ04+etYUDv3WNvuT+pY9bN1Ki2
	eI+DYfANlg8VEY8/CYU7mEEcdrRs/13yQEC5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gTjlVCifx06q4oHQ9YFVXzgLrIuhUcFTQKS7YSRmVzE=;
	b=RpYXIDUAkQl5NBKEkxqjp+KthlbHFK9iGEZQkMY0KjrsrSG7zGQ7pg26lSC+P2B3F+
	hGC5xZOtwZ8Ydm48K8PIttLLWMD3A81yuwav5PUCxdKsBHeNwvBPdTOvrD6NnLXdXscu
	8Bcf3/tH+IQJchfkUnzWfaL6kM2rctS/muBcuxdjr+h40u4ppmbO7mypQ6eQFDerRSk8
	mdNLFVPjDuz9kc5Qv48OSlR0T4IKoBxMlm7A4TcCU7ImOKiHXHfde2YYtNshnraq0I0t
	Foyo85pJTN+R97NBpy/oxlZD4/CQnJgDkE/vxaHwviQD1NOg78x20UTzEICgsSGYFNd4
	BmoQ==
X-Gm-Message-State: AJcUukclNlHF0xEU+1Vm3KhSIiXzJLcz46ijOlhqAevqvzoSRiPdz2TJ
	5o9lKgEtawmXEfgoENPTNaIYqmdfI8t1n6qKCBmXIA==
X-Google-Smtp-Source: ALg8bN6+5oTu9Jp0IwYbKIAUxGCbXFQLsSpUox8Xu86ThY33HaubQ0K1b8T88UQCw2aC/WQfl0HYGfXEicaJwtjBUCM=
X-Received: by 2002:a9d:3786:: with SMTP id x6mr34322852otb.238.1546540285023; 
	Thu, 03 Jan 2019 10:31:25 -0800 (PST)
MIME-Version: 1.0
References: <20180908182205.GB409@mornington.dcs.gla.ac.uk>
In-Reply-To: <20180908182205.GB409@mornington.dcs.gla.ac.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jan 2019 18:31:13 +0000
Message-ID: <CAFEAcA83dVVyQLsADoNBN7feFxnWcVr5r0SPA8PffaG2140yPw@mail.gmail.com>
To: Tony Garnock-Jones <tony.garnock-jones@glasgow.ac.uk>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Riku Voipio <riku.voipio@iki.fi>, qemu-stable <qemu-stable@nongnu.org>, 
	Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user: write(fd, NULL,
 0) parity with linux's treatment of same
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
X-List-Received-Date: Thu, 03 Jan 2019 18:31:31 -0000

On Sat, 8 Sep 2018 at 22:04, Tony Garnock-Jones
<tony.garnock-jones@glasgow.ac.uk> wrote:
>
> Bring linux-user write(2) handling into line with linux for the case
> of a 0-byte write with a NULL buffer. Based on a patch originally
> written by Zhuowei Zhang.
>
> Addresses https://bugs.launchpad.net/qemu/+bug/1716292.
>
> From Zhuowei Zhang's patch (https://lists.gnu.org/archive/html/qemu-devel/2017-09/msg08073.html):
>
>     Linux returns success for the special case of calling write with a
>     zero-length NULL buffer: compiling and running
>
>     int main() {
>        ssize_t ret = write(STDOUT_FILENO, NULL, 0);
>        fprintf(stderr, "write returned %ld\n", ret);
>        return 0;
>     }
>
>     gives "write returned 0" when run directly, but "write returned
>     -1" in QEMU.
>
>     This commit checks for this situation and returns success if
>     found.
>
> Subsequent discussion raised the following questions (and my answers):
>
>  - Q. Should TARGET_NR_read pass through to safe_read in this
>       situation too?
>    A. I'm wary of changing unrelated code to the specific problem I'm
>       addressing. TARGET_NR_read is already consistent with Linux for
>       this case.
>
>  - Q. Do pread64/pwrite64 need to be changed similarly?
>    A. Experiment suggests not: both linux and linux-user yield -1 for
>       NULL 0-length reads/writes.

Hi; following up on this, we've just had
https://bugs.launchpad.net/qemu/+bug/1810433 which is
a report of the same NULL/0 bug for pwrite64. Looking at the
kernel code I see that both the write and pwrite64 syscalls
go through the same vfs_write() common function, so their
behaviour for NULL/0 should be identical. Experimentally,
stracing the 1810433 test program gives
 pwrite64(3, NULL, 0, 0)                 = 0
so we do indeed need to special case NULL/0 there as well
as in write().

The extra fix should be straightforward -- does anybody
feel like writing up a patch for it?

thanks
-- PMM

