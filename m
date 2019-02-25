Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gyHHU-0007AV-0U
	for mharc-qemu-trivial@gnu.org; Mon, 25 Feb 2019 09:30:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54941)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gyHHJ-00076Y-H2
	for qemu-trivial@nongnu.org; Mon, 25 Feb 2019 09:30:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gyHHI-0006sN-Pn
	for qemu-trivial@nongnu.org; Mon, 25 Feb 2019 09:30:45 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:43257)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gyHHH-0006cC-F8
	for qemu-trivial@nongnu.org; Mon, 25 Feb 2019 09:30:44 -0500
Received: by mail-ot1-x342.google.com with SMTP id n71so7945794ota.10
	for <qemu-trivial@nongnu.org>; Mon, 25 Feb 2019 06:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3tLPL+RDArLLOi+6onnfeL7AR0gVeczh8GwMBCpn1Is=;
	b=RT6aZL51+KCnHQ5EuH9wL1DmXEP5MpcG/OZkgCmJiJsXt0TuMp+NcsO7lX2OQa3zkP
	qlVovlqlnqsdJj6w0orvKSANMMId+efUgPy+RMZh91GdOBRpbex/GNIR/xVJ3N3ZeQ5C
	uHyLRtXXt6U1YpOVAyvhWrQScarboS+cn7pSkaf0m6jUJcCUNDPTgr+hHnYrUSkqYqm1
	sJ8p50Ry3eRj6th/a1vclXBBOAIDAVdYxs+H1seT+7tmQlagHCi7BwwfOXnwBk2AYLj8
	9OwsGj0OzgK+XlHGsioiqtpxBnzkAUdiS00HKLBkpMYP2PmHpFuYn9kFJkg0DEKckt9b
	wlbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3tLPL+RDArLLOi+6onnfeL7AR0gVeczh8GwMBCpn1Is=;
	b=BaDWFJebtxgLdMU+91O4gRBdO2yi098sk9gpezH5XH2MRgMDYjzmr+UhigTYkns41v
	lGo52jK7kV8IOjgSXcPX+dO2NPyNlNM9YBOnTfTUVp1bYD8znH8lNrIS3793Lgh/k/sL
	B5xOhiMPznyMCpQkXpjVii6VvI9m2KGXZwqvSbfUjBKe8qd1xayl46q8cvgM8hD8tCbX
	GuHwvNI0VsakH2wgwZ32y6DdwmuCO7SHR0PquGlnPFkJZEhZliBT9pHqt2s5cxnsQp31
	5QkRXZ2YLYB2yYlyg4SUMMD/Oq50KppWgua91xww+o/+4pFdbzexaZbqmfDF20W28tCP
	xK5g==
X-Gm-Message-State: AHQUAubs5d2yx4xKh2KP1Hm6D+a5LXWtTphElNMDJGmOu/W6YXepMWOu
	VxHntDPQvrUbc0uOFSC/DIb+cn+hbomcZsEH01VC0Q==
X-Google-Smtp-Source: AHgI3IZRIvTHRfWxZVA5/fer8wwRgZFkBJyYGCDlvA6kSPbxiSz+BkwMJSbGNlCMG/E4HB7Qdx1scuIa5K6j1onSbc0=
X-Received: by 2002:a9d:7d05:: with SMTP id v5mr12031324otn.201.1551105019361; 
	Mon, 25 Feb 2019 06:30:19 -0800 (PST)
MIME-Version: 1.0
References: <1551095970-14645-1-git-send-email-thuth@redhat.com>
	<20190225140935.GE6320@linux.fritz.box>
In-Reply-To: <20190225140935.GE6320@linux.fritz.box>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Feb 2019 14:30:08 +0000
Message-ID: <CAFEAcA9bbZKeM=-P7mh90-QH35Kn_oR-D0yTUbteKg8JEV+Tgw@mail.gmail.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Fam Zheng <fam@euphon.net>, Qemu-block <qemu-block@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Max Reitz <mreitz@redhat.com>,
	Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-trivial] [PATCH] block/nvme: Remove QEMU_PACKED from
 naturally aligned NVMeRegs struct
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
X-List-Received-Date: Mon, 25 Feb 2019 14:30:54 -0000

On Mon, 25 Feb 2019 at 14:09, Kevin Wolf <kwolf@redhat.com> wrote:
> Though I'm not sure why a compiler should warn if packed and non-packed
> result in the exact same layout anyway...

Packed implies "and any time you see a pointer to this struct
it might not be aligned". Non-packed implies "you can assume
that the base of the struct is aligned".

thanks
-- PMM

