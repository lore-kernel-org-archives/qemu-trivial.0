Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hBTNr-00032G-5Z
	for mharc-qemu-trivial@gnu.org; Tue, 02 Apr 2019 20:04:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42431)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hBTNp-00031w-5O
	for qemu-trivial@nongnu.org; Tue, 02 Apr 2019 20:04:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hBTNo-0004FO-9K
	for qemu-trivial@nongnu.org; Tue, 02 Apr 2019 20:04:01 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:32983)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hBTNn-0004FA-QJ
	for qemu-trivial@nongnu.org; Tue, 02 Apr 2019 20:04:00 -0400
Received: by mail-ot1-x342.google.com with SMTP id j10so13859306otq.0
	for <qemu-trivial@nongnu.org>; Tue, 02 Apr 2019 17:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wJ/7RtCSVaJ1h/ehWHV3oGHpDK0g9WZGK0WBprOQ5F8=;
	b=NV7hR9oXNYaSLfvMTV19zP1Vm2aqFFSzGYFISjqBHfA+I0vJOQQ7UEQIOBsNrR8Nt1
	BG5xjdYXCD9SicY8axDC9Z7mMMQgEfGUN8Z5hOsmLVMeBNVEtRkkxzFBdpmaoxe6hEjI
	rDzMB81mvU1HK0gspQ3dP3hQog6t9Bh+jlCc9Qi5qo8Nw7bQlsbsQqrCuhHhYAKzf+F8
	Q97lvkuY90SihR7rO5fm+3mOoNvpDi4rty6ekTZ5Pde2ElUzow5P79M0iCLQIEeJQy3R
	RfoGVgX1uwKKLBhWFDUOZ3QFoEDe8dRSO9CFEw9QbzfToijln+6wN4MwlsqeRzM8EHee
	ouVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wJ/7RtCSVaJ1h/ehWHV3oGHpDK0g9WZGK0WBprOQ5F8=;
	b=BBPUVts2vIaQ8AT2CK47lH0ocx6YwtPPgk0Tc5uPhHxuYTZ0leCMNDWU0Gs6PSMQYb
	UrG0hkJQk1cJtxl+0H2AD+Wk0r+mo1s8VAmBJjVSiPZUIe0/BFJe/WHrkMtb+N6dLK8H
	RJpSmvakQcPuR5JU6HinZMppn36fP8O3RIXHCrUQ8IfJ1PCTEf1F4CtW+WqnygPtMuJY
	fozJ+X8N6jIE0BYJn+G48glkKU0NcRfmpFXGbOkQ2ZSeiYteoZFsuDtdHDV9MNxV2bOV
	tsHsHxQ0sSC+LK83LWaLe5rtrC0BlRCfuFRW2fJfR31EP/zYmTb+DCTRR9Me1W4mGogw
	Pqfg==
X-Gm-Message-State: APjAAAWijJwBmwNFFHv1Sm/qzxpbondpxIeIRkeCQZ9mK+MzDjD1+cFP
	m/jqDhH2XfBnqsmiIa9yiNl7Amtdigib3jMYmBTlxA==
X-Google-Smtp-Source: APXvYqwsdkMgIXUf5R7BIDyEV0oKWn8EMg1RHCFN0C2avBfprtfjPgFNR+5/7OvZpp3J2pMLGTnglFZuJaIIQ2bjnDE=
X-Received: by 2002:a05:6830:1497:: with SMTP id
	s23mr51267513otq.236.1554249838735; 
	Tue, 02 Apr 2019 17:03:58 -0700 (PDT)
MIME-Version: 1.0
References: <1554194900-22817-1-git-send-email-like.xu@linux.intel.com>
	<871s2kejg1.fsf@dusky.pond.sub.org>
	<e72befe5-c931-5c80-6769-12e1a8e7d4fa@linux.intel.com>
	<20190402174749.71da1efe@redhat.com>
	<871s2k8jxo.fsf@dusky.pond.sub.org>
	<CAFEAcA8ogWn50wWBttM2QpfQoZ8UYnXfG3NSkuSc8j8WOWt6FA@mail.gmail.com>
	<20190402191602.GE22884@habkost.net>
In-Reply-To: <20190402191602.GE22884@habkost.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 3 Apr 2019 07:03:47 +0700
Message-ID: <CAFEAcA_qtqE_N-JOZn=M-NqHg4GjohU44R7A6hOXTxbOCqjrtA@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Like Xu <like.xu@linux.intel.com>, Thomas Huth <thuth@redhat.com>, 
	QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] vl.c: make
 current_machine as non-global variable
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
X-List-Received-Date: Wed, 03 Apr 2019 00:04:02 -0000

On Wed, 3 Apr 2019 at 02:16, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> On Tue, Apr 02, 2019 at 11:23:42PM +0700, Peter Maydell wrote:
> > One wrinkle to watch out for is code paths that are used in the
> > linux-user emulator, where there is no machine at all... For instance
> > cpu_common_realizefn() handles this case by explicitly checking
> > whether the thing it gets back from qdev_get_machine() is a
> > TYPE_MACHINE or not.
>
> Is there a real use case for calling qdev_get_machine() in user
> mode?

In this case it's "I'm in a function which is in obj-common (so shared
between user-only and system-emulation) and I need to do something
if we're in system emulation mode". It could probably be restructured
somehow.

thanks
-- PMM

