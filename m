Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QNQxi-0002Kx-Kr
	for mharc-qemu-trivial@gnu.org; Fri, 20 May 2011 10:45:58 -0400
Received: from eggs.gnu.org ([140.186.70.92]:49207)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QNQxf-00025R-Uz
	for qemu-trivial@nongnu.org; Fri, 20 May 2011 10:45:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QNQxf-0008MJ-17
	for qemu-trivial@nongnu.org; Fri, 20 May 2011 10:45:55 -0400
Received: from mail-gw0-f45.google.com ([74.125.83.45]:48861)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QNQxc-0008M1-Ix; Fri, 20 May 2011 10:45:52 -0400
Received: by gwb19 with SMTP id 19so1534079gwb.4
	for <multiple recipients>; Fri, 20 May 2011 07:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=0tevTLNVkCJUd/gueWeLp1KOEzPwAQNz8NXVx3U7U/8=;
	b=EiK8jR2tKEMuQGlmTTKkEWgZoOu4edJu/mTFe4AZUfAKkXsQUYts7OothpAwxn11tV
	Tdm3T7kVOc7b9fOO91Gf/YIyY+xSZcV2aS3G86Fx7nzr/Cku0PBa3LqpObODN7V8YPRm
	mcqv6E2pBq6mSvgGVuvWnkK3edECdlDi1SAv0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=ly+dFE06RXvWIZ36znv8HE7XEy3ELtvX6v0qy73PiftCSmQQyyUGb49CBXkc4uUbz3
	A7s0M6DM19N32666mxSeQ9zjB2Jz90G6pwmkF1yBaIJfO6xhfOK/or/vOmqzraNXUjAk
	EfJcgEeA8ixXjpnX0D50REf3qtk8nLWyg0VN4=
MIME-Version: 1.0
Received: by 10.236.109.130 with SMTP id s2mr4689007yhg.245.1305902751539;
	Fri, 20 May 2011 07:45:51 -0700 (PDT)
Received: by 10.147.32.3 with HTTP; Fri, 20 May 2011 07:45:51 -0700 (PDT)
In-Reply-To: <1305818517-23371-1-git-send-email-peter.maydell@linaro.org>
References: <1305818517-23371-1-git-send-email-peter.maydell@linaro.org>
Date: Fri, 20 May 2011 15:45:51 +0100
Message-ID: <BANLkTi=FVd6qG0Nj-suugkdxzz0x+S5v0A@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.83.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/realview.c: Remove
	duplicate #include line
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
X-List-Received-Date: Fri, 20 May 2011 14:45:56 -0000

On Thu, May 19, 2011 at 4:21 PM, Peter Maydell <peter.maydell@linaro.org> w=
rote:
> Remove a duplicate #include of sysbus.h.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> =A0hw/realview.c | =A0 =A01 -
> =A01 files changed, 0 insertions(+), 1 deletions(-)

Thanks, added to the trivial-patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

