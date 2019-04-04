Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hC01T-0004OO-6N
	for mharc-qemu-trivial@gnu.org; Thu, 04 Apr 2019 06:55:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60818)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hC01Q-00047T-5F
	for qemu-trivial@nongnu.org; Thu, 04 Apr 2019 06:55:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hBzot-00020Q-Po
	for qemu-trivial@nongnu.org; Thu, 04 Apr 2019 06:42:08 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:37879)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hBzot-0001nW-Ja
	for qemu-trivial@nongnu.org; Thu, 04 Apr 2019 06:42:07 -0400
Received: by mail-oi1-x243.google.com with SMTP id v84so1473136oif.4
	for <qemu-trivial@nongnu.org>; Thu, 04 Apr 2019 03:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GgFOympQFWoqM4zM1WK4nEgnhwNcl8i+FG3MzGWSNR8=;
	b=oba0VFJY55h1h4ZxysX19GUXmDvdyJsh5oKx1mEwHXhwTpLuZUu9GL18jkoF5Q+6My
	lHOQTkXeI68nAjSGb5P/UHqKOXa/nLae6L7oajNlg64zrILIVD5nw6dSQvTSIX2a+DFj
	TGzZMssyzM1JBR9MLJsRiOCW2KfA+GuwPocDMYrW1ShbEPg6EVKrAZ2gOxUnKC6ECyrB
	Tzqs5pFj+I+R7ig4zR25/px98EDB1SpZv3HWRcR40naLPG4nIdtHgCu7UQ3ENDYUT401
	pZuIwt/c8dLRG8jMAm5YzCgNajIEM0YDxGdCDJNzxlSzlRCJPfN3SnrQiCBZI4mZC+R1
	mcOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GgFOympQFWoqM4zM1WK4nEgnhwNcl8i+FG3MzGWSNR8=;
	b=pZ/XHl3egiQwSgpLPzJ2wirTCoGYW/QEc2kFO3BukUUJfC61hWb8/BHVeZAyVkW7/0
	Pp9ltImB5DczXS9aXxdWJYkm2hG+CeBk5QwrXHpooi8rnK4y4v8k7Og4Oy8zBozKrkeF
	K7H75eoXIEtT8M3QXhFOS1fyFmEAdIWrp7nmbzfCsgEYs6lQU6D6HOx3Dwa6RQWiCBZL
	ZVQQV07S7bF1O1kkSLZ3RaxxCxIifm3w32Ndlrm5i3RpeD4vo4rCSntkW79It5hvZA9o
	IHd6qHfvGkP0/cExhrWjv3mzCclbIs3nlY3uzy1uAo8iErdydEkUq4eyh9dhDH8JHFxi
	2xkA==
X-Gm-Message-State: APjAAAU71bGXGSBrWHfBmfSc/ti2C3ZLABXULJ/dvpVHVIyQ6l/mhwaj
	1kxv7qrf22ETWn7NdHCAsxtKEPm3N3NaRYLJn0d8DA==
X-Google-Smtp-Source: APXvYqxupGZbJYOur2kFO1a2Pe345vHRPC7jPG2b0+FuExZJNqtBBygGRvAc611+wTU3v46XV/pGuMZhwYZc2n/1e1c=
X-Received: by 2002:aca:b3c2:: with SMTP id c185mr2995384oif.98.1554374525384; 
	Thu, 04 Apr 2019 03:42:05 -0700 (PDT)
MIME-Version: 1.0
References: <1554194900-22817-1-git-send-email-like.xu@linux.intel.com>
	<871s2kejg1.fsf@dusky.pond.sub.org>
	<e72befe5-c931-5c80-6769-12e1a8e7d4fa@linux.intel.com>
	<20190402174749.71da1efe@redhat.com>
	<871s2k8jxo.fsf@dusky.pond.sub.org>
	<CAFEAcA8ogWn50wWBttM2QpfQoZ8UYnXfG3NSkuSc8j8WOWt6FA@mail.gmail.com>
	<20190404120533.427a2beb@redhat.com>
In-Reply-To: <20190404120533.427a2beb@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Apr 2019 17:41:54 +0700
Message-ID: <CAFEAcA_Z5YDLW9HWx-FcL_qNefTsg6WSKayrNSDsEv2fZHgn3g@mail.gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	Eduardo Habkost <ehabkost@redhat.com>, Like Xu <like.xu@linux.intel.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
X-List-Received-Date: Thu, 04 Apr 2019 10:55:05 -0000

On Thu, 4 Apr 2019 at 17:05, Igor Mammedov <imammedo@redhat.com> wrote:
> On Tue, 2 Apr 2019 23:23:42 +0700
> Peter Maydell <peter.maydell@linaro.org> wrote:
> > One wrinkle to watch out for is code paths that are used in the
> > linux-user emulator, where there is no machine at all... For instance
> > cpu_common_realizefn() handles this case by explicitly checking
> > whether the thing it gets back from qdev_get_machine() is a
> > TYPE_MACHINE or not.
> this one can be solved by adding 'ignore_memory_transaction_failures'
> property to the CPU class where it applies (I'm not sure why it's
> in generic cpu code instead of ARM only) and then setting compat
> property in affected boards code.

It is not arm-specific, it just happens that all the current users
are arm boards. It is a generic thing that can apply to
any CPU for any target architecture, but only if the board
requests it. The current code seemed a reasonable way to
implement this that didn't involve having to write too much
invasive plumbing code to get the behaviour to apply in the
cases where it needed to be applied, but if there's a better
way to do this I'm happy to review/test patches.

thanks
-- PMM

