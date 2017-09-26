Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwveZ-00043q-T7
	for mharc-qemu-trivial@gnu.org; Tue, 26 Sep 2017 15:36:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35589)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dwveY-00043T-61
	for qemu-trivial@nongnu.org; Tue, 26 Sep 2017 15:36:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dwveX-0007kW-Dc
	for qemu-trivial@nongnu.org; Tue, 26 Sep 2017 15:36:22 -0400
Received: from mail-wr0-x232.google.com ([2a00:1450:400c:c0c::232]:46541)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dwveX-0007jz-7m
	for qemu-trivial@nongnu.org; Tue, 26 Sep 2017 15:36:21 -0400
Received: by mail-wr0-x232.google.com with SMTP id o42so14085354wrb.3
	for <qemu-trivial@nongnu.org>; Tue, 26 Sep 2017 12:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gTrrcSHOn9Y1/+bdpGFxbJ1fTHyFMxSaBqQzsi3JBAM=;
	b=kTCdjwJ399Sx6hIXgHw/VQ+vrENGMU+z+fp1ol+j7KjTL4jvK3cIA9/JecvTle1d8W
	Qa4gAsmbQQizYI/ShhySR/XuXlNL5fRWx9r9eYE+YrsJJkzFDSP7rK5i8PnKH1gqVQWc
	T4aw3vNUEHfFhdNU4XDehCTZG7GBQyltrEU+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gTrrcSHOn9Y1/+bdpGFxbJ1fTHyFMxSaBqQzsi3JBAM=;
	b=nBSc5HObZSMSmHxxK2wM7eSLReLLePS4tmocc0D+KCOxclmBCcJU3qltgus2nVmX3m
	9F7fLjsrPH3se24DgckZFiejhSqJzdNmrXYTLH3wLbgiaHsV9LLlw1XgyJRgU6dRvmRk
	KJGSrnRmXnOeglDRioYj0firf9gziIj7UqemL8wL215bwFQykYO9fMNf6xeWyZw5lwWE
	XQXQWe02wgK4mmN1y7xipHZ8yQ15+8/j1gzQpkyJRQoziffHbzVabmJA0gJFLoZeuidY
	/NzhKsZUQk0hNaX8SBwtl185C7h4ayir+y1eJr5Kg/l+L9SuqKSKSmBtRrYShpC/FSwG
	PZ3Q==
X-Gm-Message-State: AHPjjUjFaUOh77FRwn6xxU42XDh/cjWXbleK/XbWa7A30052Ao4Ajtnc
	8ecQsOvwOAjeILqH3gOAAJYDLontYwLzFvsDQ2cUYQ==
X-Google-Smtp-Source: AOwi7QBtjfgsLY5oU6GxhiYny9fTj/aAdSHtxux95VUNj5lncX6ie7ZvFXR6mufh/SZNQC4EiouWb8/vZzsz3t9Jcis=
X-Received: by 10.223.142.82 with SMTP id n76mr11273283wrb.272.1506454579762; 
	Tue, 26 Sep 2017 12:36:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.215 with HTTP; Tue, 26 Sep 2017 12:35:59 -0700 (PDT)
In-Reply-To: <20170926223046-mutt-send-email-mst@kernel.org>
References: <1506049617-25716-1-git-send-email-thuth@redhat.com>
	<513bbb2d-280b-92f8-b45f-89963f7118e2@msgid.tls.msk.ru>
	<20170926223046-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Sep 2017 20:35:59 +0100
Message-ID: <CAFEAcA-dWVfX2i7ZYdHVg3G_kSSM6Gos8TRk=dfYYML4Jrn9HQ@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Michael Tokarev <mjt@tls.msk.ru>, Thomas Huth <thuth@redhat.com>, 
	Victor Kaplansky <victork@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Stefan Weil <sw@weilnetz.de>, Jason Wang <jasowang@redhat.com>, 
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::232
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tests/boot-sector: Increase
 timeout to 600 seconds
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
X-List-Received-Date: Tue, 26 Sep 2017 19:36:23 -0000

On 26 September 2017 at 20:31, Michael S. Tsirkin <mst@redhat.com> wrote:
> On Mon, Sep 25, 2017 at 12:06:40AM +0300, Michael Tokarev wrote:
>> 22.09.2017 06:06, Thomas Huth wrote:
>> > If QEMU has been compiled with the flags --enable-tcg-interpreter and
>> > --enable-debug, the guest is running incredibly slow. The pxe boot test
>> > can take up to 400 seconds when testing the pseries ppc64 machine. While
>> > we should still look for ways to speed up the test on the pseries machine,
>> > it's better to increase the timeout in this test to 600 seconds anyway to
>> > allow the test to pass successfully now with this unusal configuration
>> > already.
>>
>> Applied to -trivial, thanks!
>>
>> /mjt
>
> Please do not apply this, trivial is not appropriate for functional
> changes like this.

It's not a functional change, it's just bumping a test timeout.
If you think we should be doing something else that's fine (as
with any other patch), but in principle I think this is totally
fine as a -trivial patch.

thanks
-- PMM

