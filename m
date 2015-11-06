Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZuiQB-0004EL-1X
	for mharc-qemu-trivial@gnu.org; Fri, 06 Nov 2015 09:55:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38270)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZuiQ5-0004Bw-Ku
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 09:55:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZuiQ4-00064F-QL
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 09:55:13 -0500
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:36759)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZuiQ4-000641-Ma
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 09:55:12 -0500
Received: by vkex70 with SMTP id x70so15504640vke.3
	for <qemu-trivial@nongnu.org>; Fri, 06 Nov 2015 06:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=aggxHrytrCg4/+tNt64uS0Q9boi0/WZ7cZr8gJweK84=;
	b=ljHDpVjSqk4rr89VjSBqU5SVxNyyLdYiGBbVrePex3Tyg2H0TZSgPQW3j48KAyTs71
	OgUOH4tWZJhaYY7FnLRgKi3yZ5k4bjLULX9uWZfmnOrR0+loJI6IVxie44RGhMn9H6HL
	m3hIycygoFWiEzGE9d8ZbJIDSFoX6vHKLNp0dWq2eHk4S7mfu/fYKkrNTwHWFmEY25EG
	BZeV8n+ER3W159su7CGaHsiD1NRXGwQDJbQhqRz0Dwmar3Y1sv7jV6XpS5mwzihgDmEE
	I9eJtBvNyl/OIkG8aGVbYMvSk+bGQal/bpupP48HOUs1pCMDdPAXK4bmskB1Gv9KYCS8
	+C9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=aggxHrytrCg4/+tNt64uS0Q9boi0/WZ7cZr8gJweK84=;
	b=LIJYTO3JnnKY6mTPCaDpf3h7GjgioM9gAR02fXDkwBYTxzq5uLo856z3wP9nxRHbL/
	dlDLb2wdU1PV5/COEY/yjMb+AfQXLr+qLoCk9dD5mVBsZiETUiWGdwD4IFNSytbiqxhu
	Rlv49GEhORD8mNQEUCnUIkeyCE5DXrLVYrXSrDDpkC1oRa7sDp3OsfRADu088LK/WiJf
	gja7iuqKIIfO/54cj0rWFliT7rZjniTdojeCMCuvgmEItiBWtZh8h7rUE6pO6YnLKlba
	IlpUagYCuvQyo/Z6ZuwG0MBGPWzH9hA8slqA5ov8FgW15+P0/iQILAnQysi0/Y4OeJae
	QZ/Q==
X-Gm-Message-State: ALoCoQmiAbbVpLw9WRbps0uh6E0cliriRkV2jIfQ+rFynbQoolFoMVYBtZYW/zyMKjP7lC6BFJtI
X-Received: by 10.31.161.146 with SMTP id k140mr13864987vke.90.1446821712294; 
	Fri, 06 Nov 2015 06:55:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 6 Nov 2015 06:54:52 -0800 (PST)
In-Reply-To: <1446744293-32365-1-git-send-email-wei@redhat.com>
References: <1446744293-32365-1-git-send-email-wei@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Nov 2015 14:54:52 +0000
Message-ID: <CAFEAcA8FiEj=h_Z3NafSvnWv3aOvbLW3OTGAWYAUwZuDxWh6CA@mail.gmail.com>
To: Wei Huang <wei@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400c:c05::229
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm@nongnu.org,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH Trivial V2] hw/intc/arm_gic: Remove the
	definition of NUM_CPU
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
X-List-Received-Date: Fri, 06 Nov 2015 14:55:17 -0000

On 5 November 2015 at 17:24, Wei Huang <wei@redhat.com> wrote:
> arm_gic.c retrieves CPU number using either NUM_CPU(s) or s->num_cpu.
> Such mixed-uses make source code inconsistent. This patch removes
> NUM_CPU(s), which was defined for MPCore tweak long ago, and instead
> favors s->num_cpu. The source is more consistent after this small tweak.
>
> Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
> Signed-off-by: Wei Huang <wei@redhat.com>

Thanks, applied to target-arm.next.

-- PMM

