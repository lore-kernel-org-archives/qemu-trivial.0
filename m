Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hBMPv-0006Zo-Q6
	for mharc-qemu-trivial@gnu.org; Tue, 02 Apr 2019 12:37:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39254)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hBMPt-0006Tk-M6
	for qemu-trivial@nongnu.org; Tue, 02 Apr 2019 12:37:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hBMCc-0006wB-Fy
	for qemu-trivial@nongnu.org; Tue, 02 Apr 2019 12:23:59 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:33461)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hBMCZ-0006nb-Ij
	for qemu-trivial@nongnu.org; Tue, 02 Apr 2019 12:23:57 -0400
Received: by mail-oi1-x242.google.com with SMTP id e5so11021611oii.0
	for <qemu-trivial@nongnu.org>; Tue, 02 Apr 2019 09:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rfHLC9dbsXIxqoU3Fd5K9XCxDKHkDDVWrneeKBg7xn0=;
	b=wywk5LkCCBae0Ipl+bJRAx5E/4K4p/xntsfEDtVf6bK/XqKgaf331EJaooNR0xWM36
	lvdis02MMeo4Nlu1wG+X3Pm4fnmXlCz10PqIr7bwREU5CHtTHs4r6maeVNxixuwgb4ez
	M+vput3YavOQ6OM+fdF9Eza386D5SwmtejyFZ7YJ4HYZUTR8Fmlm4J/K0rpF9d8zWlT+
	byvJQ5f1WLSdFuTy+yyyxCV8bqCL7f7SkHJp6UAqlWlM7M1Pz2rATMaPerKzb9LKxunp
	CLmKqXGpTI/HaqCwXdmA7rNn4wOqROWzAeDECFwq7K1597V/pkZLApv1lMrKjdqh+7Uj
	iCqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rfHLC9dbsXIxqoU3Fd5K9XCxDKHkDDVWrneeKBg7xn0=;
	b=lcKxdoK+GhWFSxbb+yAVrQIwiH48z8NwSeyvzOhDQNV4pSlbpxvf4u/5diBrrRQSSL
	0ggegKuJV+kcqe4kfl+m+Dwqyrgj9kWldhzEfwVNehDujPiiAiho+zC68I3OJ6CdLbDi
	AcFriRENu4qZtOo1jeQYDO/b1+EFVntM+9DqZUg90+z5782jqqhmbRV8/utnu3TvMNmA
	6kUkG634opjpKjjHcNBPZuQY1NcjzbSK+g4B5Zyu1P/j1jgU/n/72NREnnzrh8rP3QK8
	ZyS1P6/ePLyIc6Xnf+NAqKEjzp58NSlbEjZjbNLIdxhU22g9V6v1SXtW25XKPs+mLQbW
	yzCQ==
X-Gm-Message-State: APjAAAVJX3uGWyjEEj9kUOyu5fQkW8GitpyMo4gVs7bp2nJs1YpXEhsE
	MfvxE2pBWtJ41UHPbQwxh9DiOjTBKrT9MqTDRzwlGw==
X-Google-Smtp-Source: APXvYqycK092b/h1P1IUl8tQHy6fgtHYHoXKUTCKWMsREuA0uqi62KfP87YZEUEr/ap1IIijeYCTIqNE27t/Lq3sJAA=
X-Received: by 2002:aca:e84c:: with SMTP id f73mr17668313oih.163.1554222233911;
	Tue, 02 Apr 2019 09:23:53 -0700 (PDT)
MIME-Version: 1.0
References: <1554194900-22817-1-git-send-email-like.xu@linux.intel.com>
	<871s2kejg1.fsf@dusky.pond.sub.org>
	<e72befe5-c931-5c80-6769-12e1a8e7d4fa@linux.intel.com>
	<20190402174749.71da1efe@redhat.com>
	<871s2k8jxo.fsf@dusky.pond.sub.org>
In-Reply-To: <871s2k8jxo.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Apr 2019 23:23:42 +0700
Message-ID: <CAFEAcA8ogWn50wWBttM2QpfQoZ8UYnXfG3NSkuSc8j8WOWt6FA@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>, Like Xu <like.xu@linux.intel.com>, 
	Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>, 
	QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
X-List-Received-Date: Tue, 02 Apr 2019 16:37:42 -0000

On Tue, 2 Apr 2019 at 23:13, Markus Armbruster <armbru@redhat.com> wrote:
>
> Igor Mammedov <imammedo@redhat.com> writes:
> > maybe we can assert in qdev_get_machine() if machine hasn't been created yet?
> > with this at least it will be hard to misuse function or catch invalid users.
> > (but it still might miss some use cases/CLI options which are not tested)
>
> Good idea.  When my code created "/machine" as a container, debugging
> the resulting crash took me a bit of time.  The assertion you propose
> would've saved me some.

One wrinkle to watch out for is code paths that are used in the
linux-user emulator, where there is no machine at all... For instance
cpu_common_realizefn() handles this case by explicitly checking
whether the thing it gets back from qdev_get_machine() is a
TYPE_MACHINE or not.

thanks
-- PMM

