Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Sr9gk-0000vw-9N
	for mharc-qemu-trivial@gnu.org; Tue, 17 Jul 2012 11:27:50 -0400
Received: from eggs.gnu.org ([208.118.235.92]:55714)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Sr9gc-0000oe-Gy
	for qemu-trivial@nongnu.org; Tue, 17 Jul 2012 11:27:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Sr9gV-0003Xb-Rv
	for qemu-trivial@nongnu.org; Tue, 17 Jul 2012 11:27:42 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:34370)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Sr9gV-0003XF-Kk
	for qemu-trivial@nongnu.org; Tue, 17 Jul 2012 11:27:35 -0400
Received: by bkcji1 with SMTP id ji1so447882bkc.4
	for <qemu-trivial@nongnu.org>; Tue, 17 Jul 2012 08:27:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=iTZdIn3d55gp8gS9zM36RjVAaX4uel3hQGHk+4vIUGE=;
	b=pOk88M4J/WslIZpdoUOV+44cNbc9vHGjkqzgJmC5SUeTprGMPgxCacNnYJB5ErqQv+
	BiBqQlhh+PmUPLCsg3pGTyor/C7pMzK5+1ZwAI1Hn+xZVCLtzr6mNhRjJJzHgm1Q1R8U
	LCXyJObZ0X3ExGzWQRsjomMAuZpMXWbv2FdiCg1yZYQA2sl5yU6zKl1GYI4z4103ELBX
	mrazWhOIml05BqFCOvpSktlSvhZ2I3couqaH3mALBRkfuHG+92msIVN8l9zZAvquAPaH
	LQFA4jNKhDOqePpkqDkbFgC/N/5vlBJTuoX2ONxDA1GJaI7WwW+ekXm1nfiX9UCntSOi
	9QYg==
MIME-Version: 1.0
Received: by 10.205.126.14 with SMTP id gu14mr1532050bkc.137.1342538854421;
	Tue, 17 Jul 2012 08:27:34 -0700 (PDT)
Received: by 10.204.102.14 with HTTP; Tue, 17 Jul 2012 08:27:34 -0700 (PDT)
In-Reply-To: <50058375.5080009@siemens.com>
References: <50058375.5080009@siemens.com>
Date: Tue, 17 Jul 2012 16:27:34 +0100
Message-ID: <CAFEAcA_j=4N5M5uH5-+KamBb-7pf5Qzk_m_C+NqeTn1303TTmA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Jan Kiszka <jan.kiszka@siemens.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQn7fl7i7zQ59Ay9oc6KPck6BX4z2YJ/sMXPQi+53w/mBmNf2vJ6E4FQneteIzFRfbtwyjF2
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Stop saving/restoring
	cpu_single_env
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
X-List-Received-Date: Tue, 17 Jul 2012 15:27:49 -0000

On 17 July 2012 16:23, Jan Kiszka <jan.kiszka@siemens.com> wrote:
> This variable is now thread-local, so cannot change anymore while
> dropping the global mutex.

This isn't true on any host except Linux, and run_on_cpu() isn't
inside a !_WIN32 ifdef as far as I can tell.

-- PMM

