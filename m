Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UrQvu-00039D-9A
	for mharc-qemu-trivial@gnu.org; Tue, 25 Jun 2013 06:57:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56994)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UrQvn-00033M-GU
	for qemu-trivial@nongnu.org; Tue, 25 Jun 2013 06:57:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UrQvm-00031n-8r
	for qemu-trivial@nongnu.org; Tue, 25 Jun 2013 06:57:03 -0400
Received: from mail-la0-x236.google.com ([2a00:1450:4010:c03::236]:43538)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UrQvm-00031M-1S
	for qemu-trivial@nongnu.org; Tue, 25 Jun 2013 06:57:02 -0400
Received: by mail-la0-f54.google.com with SMTP id ec20so12045451lab.27
	for <qemu-trivial@nongnu.org>; Tue, 25 Jun 2013 03:57:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=EUL5qjvPLlB5DFP1qN2Z7JeeKQ/NaeeuKwwrRPPC9Ls=;
	b=AhsUj7p6QZK3O78IvY2HV9II8ISNLW5TuB4sqWY0mSJj8VopX/GPvTMbqDjhCEuq5J
	cCP6aI1bgXR+/EFxRhqiz/C/+YNQ/lnqb6Zepq1QIPTEcEm6lBAqzFp4vmS4B5f85FDX
	hcsHj+8lOPsYCI2LER6PYFS7S6mUwd4khS4tg2rJYdpvmlALoyGcyxQnwLP8VztKvfD4
	kXXqxuksEy700UzCpaNQCFEh2t24xpHVSnWsNu7oq7m4VJT0DR1Dx9+/w3O8vJK+jrTu
	2rtM2xgSfG/0tms41szPR1/4pD4nIvN85WdB7PHUlaqUq8FpDbheHz/OtDrNY7/cQYik
	4Fcw==
X-Received: by 10.152.18.202 with SMTP id y10mr13117072lad.80.1372157820293;
	Tue, 25 Jun 2013 03:57:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.97.146 with HTTP; Tue, 25 Jun 2013 03:56:40 -0700 (PDT)
In-Reply-To: <51C8B6EF.5070108@redhat.com>
References: <1372101677-46175-1-git-send-email-emaste@freebsd.org>
	<51C8B6EF.5070108@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Jun 2013 11:56:40 +0100
Message-ID: <CAFEAcA-oOr_twUKhOg3j21dmpOkNpMZ-4KYmnxH=W6Qfi1X0vw@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQnJq4Zr58wIiKGEZh6Q6cyYXMO2QnhU8xmWuuVMKspU1BOztAEclsZDmAoZi1WNbbGpkI1W
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c03::236
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tls.h: Enable TLS on FreeBSD
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
X-List-Received-Date: Tue, 25 Jun 2013 10:57:09 -0000

On 24 June 2013 22:15, Paolo Bonzini <pbonzini@redhat.com> wrote:
> I and Stefan Hajnoczi have almost the same idea implemented in QEMU
> (except that get_foo() returns a pointer to the variable).  But
> pthread_get/setspecific would be too slow for cpu_single_env, so we're
> just switching to __thread for cpu_single_env (for Linux in our patches,
> but you can add FreeBSD too once it's needed).

By the way, what's the plan for Windows? Does that support
__thread too, or will there still need to be some windows
specific magic?

thanks
-- PMM

