Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UyinY-0005Jw-3H
	for mharc-qemu-trivial@gnu.org; Mon, 15 Jul 2013 09:26:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60518)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UyinU-0005FJ-FX
	for qemu-trivial@nongnu.org; Mon, 15 Jul 2013 09:26:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UyinT-0001DW-CA
	for qemu-trivial@nongnu.org; Mon, 15 Jul 2013 09:26:36 -0400
Received: from mail-la0-f50.google.com ([209.85.215.50]:65468)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UyinS-0001DL-Sd
	for qemu-trivial@nongnu.org; Mon, 15 Jul 2013 09:26:35 -0400
Received: by mail-la0-f50.google.com with SMTP id ep20so4999823lab.9
	for <qemu-trivial@nongnu.org>; Mon, 15 Jul 2013 06:26:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=2Q4DKun4Om4fYGLCfS/U7EqHEgXnBxuSI2r9HkVeuCM=;
	b=F3htjdirklBHHO+tBVMqFoXbAIYUFUvQSgZZgxTKcVQImTpMV8beKTzuRISwyFg+Rl
	eYVrLMPkY4Bt2pdbl32vYa3t39nsqu0aCQ4OiWqJTtLmdN2+EJB9H0TuHjCsY2o2O2aI
	GcMwwXuBB6KFn7FgaIWtesvg5dnVcHcp563vsEeU7hbWWXUix5tZMu8rdVzjL0wIQqbO
	8D3x6YFq7gE+hQEPjVHTR+RuEC3+WTp1CtwTm2cC7J63p1CDWP/IPROydiOuRgf50NmT
	BbkslCUjcuRfm3wVZ6vfQd0ObwTZLkIFBCFzoz2ECM4tJrXpa5POJtss1TtumHQrszYR
	Aa5g==
X-Received: by 10.152.4.163 with SMTP id l3mr24844651lal.60.1373894793924;
	Mon, 15 Jul 2013 06:26:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.97.146 with HTTP; Mon, 15 Jul 2013 06:26:13 -0700 (PDT)
In-Reply-To: <1373894260-57259-1-git-send-email-petar.jovanovic@rt-rk.com>
References: <1373894260-57259-1-git-send-email-petar.jovanovic@rt-rk.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jul 2013 14:26:13 +0100
Message-ID: <CAFEAcA-BKg4cge1k=7CvvXeNmF5jTn1-9hY5j6awTiAtTDgYQg@mail.gmail.com>
To: Petar Jovanovic <petar.jovanovic@rt-rk.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQlwUVi0zvPiukwG/z44RUf3R4/EQLraYgvuNmsuFeoilD3GXvhbkoKXoba97Sy6PH1KbI5E
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.50
Cc: qemu-trivial@nongnu.org, riku.voipio@linaro.org, qemu-devel@nongnu.org,
	petar.jovanovic@imgtec.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user: declare
	sys_futex to have 6 arguments
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
X-List-Received-Date: Mon, 15 Jul 2013 13:26:39 -0000

On 15 July 2013 14:17, Petar Jovanovic <petar.jovanovic@rt-rk.com> wrote:
> From: Petar Jovanovic <petar.jovanovic@imgtec.com>
>
> sys_futex has 6 arguments, and all of these need to be copied. Fix incorrect
> declaration in the mips_syscall_args array.
>
> This change fixes the cases where the 5th and 6th arguments have non-zero
> value and have importance. An example is a Linux implementation of
> pthread_cond_wait() function.
>
> Signed-off-by: Petar Jovanovic <petar.jovanovic@imgtec.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

This is the QEMU version of a bug fixed in the Linux kernel
by commit 90a67b590 in 2005...

thanks
-- PMM

