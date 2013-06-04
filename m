Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UjySy-0008SY-E8
	for mharc-qemu-trivial@gnu.org; Tue, 04 Jun 2013 17:08:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33854)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UjySw-0008SB-9r
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 17:08:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UjySv-0003jQ-BT
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 17:08:26 -0400
Received: from mail-la0-x234.google.com ([2a00:1450:4010:c03::234]:44239)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UjySv-0003he-4Y
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 17:08:25 -0400
Received: by mail-la0-f52.google.com with SMTP id fo13so725685lab.39
	for <qemu-trivial@nongnu.org>; Tue, 04 Jun 2013 14:08:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=ovNAikjk1iWp0Xq4XkbQY5j1ty8voWTLn7TNAOA3XDk=;
	b=TmMtCG9lmBdj2twnq/zjje5xQ6loEOorbnphq+zgkNg4ge7CRwXCAjyMjIvbwtcdBx
	7wVHW+FipaaMun1GXrs4+dSuhBbCjm5rm5CgdJJ0yyhcV4RPxrqJ/IDowH3GkCitYjMA
	lify2oi3dQHAc1ZhNiZbtaXEeQKVFxFn15sqK6MSA1d/L9InvLHHpm0743RMwG/vzyg2
	29K9CSyw8xdssIM3fI3cmUgztdFtW4wHnNc3lvJqQlRdHDKd35qshEgDjj/JLWmTEk6b
	g4ZLSoTh94lWpnPqt0o9C0Kosb46n9QQDE443jkmf+sh3qOB58VmgrQEZ9ypJCZ1AFiT
	KJqg==
X-Received: by 10.112.60.233 with SMTP id k9mr13664789lbr.61.1370380104130;
	Tue, 04 Jun 2013 14:08:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.2.39 with HTTP; Tue, 4 Jun 2013 14:08:02 -0700 (PDT)
In-Reply-To: <1906731494.14304293.1370379574347.JavaMail.root@redhat.com>
References: <1370377419-31788-1-git-send-email-alevy@redhat.com>
	<1370377419-31788-2-git-send-email-alevy@redhat.com>
	<51AE5249.3060401@redhat.com>
	<1906731494.14304293.1370379574347.JavaMail.root@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Jun 2013 22:08:02 +0100
Message-ID: <CAFEAcA9-PzxBEVGT0V1CYet_9wOZ4jsZ92hSX=SibwuC+2=whA@mail.gmail.com>
To: Alon Levy <alevy@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQnHQVbsqBBS3AGSAkKGeUF0x6K0MO/lBqQYSTfzCS119mcn2NRhK/dbB7Vz8PmSthyWR6ln
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c03::234
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/5] use qemu_pipe_non_block
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
X-List-Received-Date: Tue, 04 Jun 2013 21:08:27 -0000

On 4 June 2013 21:59, Alon Levy <alevy@redhat.com> wrote:
> shouldn't we be looping if EINTR?

Don't open that can of worms if you value your sanity ;-)

-- PMM

