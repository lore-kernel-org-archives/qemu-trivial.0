Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g9RWx-0006jB-8n
	for mharc-qemu-trivial@gnu.org; Mon, 08 Oct 2018 05:08:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35884)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g9RWv-0006ih-IO
	for qemu-trivial@nongnu.org; Mon, 08 Oct 2018 05:08:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g9RWu-0001cT-UT
	for qemu-trivial@nongnu.org; Mon, 08 Oct 2018 05:08:45 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:38167)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g9RWu-0001c2-Fg
	for qemu-trivial@nongnu.org; Mon, 08 Oct 2018 05:08:44 -0400
Received: by mail-oi1-x241.google.com with SMTP id u197-v6so15203502oif.5
	for <qemu-trivial@nongnu.org>; Mon, 08 Oct 2018 02:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=L1gWymVfzMUf7hiBdWibGExojM4jejhfn/++3gsJZUo=;
	b=NtZcIIaG9uB5Uw4OEy5w/e+LFsvk02X/+j8vLo8pIe41enU1aFoh5OXhZhhKksxfGF
	FApr9GfUBNgQ2JJ3IcLaR424y6F3K+tbzIUWMbFilFeeCnklCSPkwi9OjFamajUVgm2Z
	iZRHKr1Dt6GOaZXQ1ppr4q5shNBd9FVMprcdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=L1gWymVfzMUf7hiBdWibGExojM4jejhfn/++3gsJZUo=;
	b=K4gzoEzZ3Ac6HW6SmmKMOjMUXF59W3pw/dL6EJ9SaTV5XUH9nLa4v3NIEqWBgXIZFA
	glTBCcmsOwcixi3hMjAS25O7AXXO9pAB5djFq2NkS6CBZ4J9tH0kadEQzmesn8iV1pOG
	Bi77rcqZjDf6b0VC4CouPEsKBYtyyqJmpvOkIgql1/4n505fGO/E1/n3mWt7VE2l2YuZ
	W9QWAGFiMbS4GAWI6syxrkoHTPVGVIDeBEHxQOSMAqHlnfQ7qDf9jMQQxBpkOOBtn2uX
	7N0VJsfFZN3tf50VnedkResb2TDVp8egybqwjxe9I72FwvqnJaui3SldP71X7grAjw/n
	WEag==
X-Gm-Message-State: ABuFfogBiL/bjS7AXRxaPUIlWew4B+pt47//l9JEpGFQ5GRkdMq1waGO
	TYgqzMpGgKrj8l8OGaJiQQ9EohwoKnS50FeJDOoVQg==
X-Google-Smtp-Source: ACcGV63Bhxrv+61dNcHFe5DBXlvoZWfqkG4iK4iOpWQ6LrZdzhqUCI1cP/0Fu1qVszKHAr8fWS8nzcwxjzD/YQG1mpM=
X-Received: by 2002:aca:b5c6:: with SMTP id
	e189-v6mr4251661oif.51.1538989723760; 
	Mon, 08 Oct 2018 02:08:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP;
	Mon, 8 Oct 2018 02:08:23 -0700 (PDT)
In-Reply-To: <1659f740-a536-eff8-c58e-a11fc0f9b9b1@redhat.com>
References: <1538732546-2284-1-git-send-email-thuth@redhat.com>
	<CAFEAcA_W9ioV5qDFV6jNY6t-W3MfEkuUXZeZCAST8_tOe=k9wg@mail.gmail.com>
	<1659f740-a536-eff8-c58e-a11fc0f9b9b1@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Oct 2018 10:08:23 +0100
Message-ID: <CAFEAcA9_E+YNPnx=00UJN-YUoeW81EsQwoq5bKup=46yq7Bh=Q@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Alistair Francis <alistair@alistair23.me>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/core/generic-loader: Set
 a category for the generic-loader device
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
X-List-Received-Date: Mon, 08 Oct 2018 09:08:46 -0000

On 8 October 2018 at 07:14, Thomas Huth <thuth@redhat.com> wrote:
> On 2018-10-05 18:32, Peter Maydell wrote:
>> On 5 October 2018 at 10:42, Thomas Huth <thuth@redhat.com> wrote:
>>> Each device that is instantiatable by the users should be marked with
>>> a category.
>>
>> Presumably we could assert() this somewhere (at which
>> point we'd find that we have dozens of devices that
>> fail to set a category bit, I imagine) ?
>
> You bet ... alone in qemu-system-aarch64, "-device help" shows more than
> 120 devices without a category...
>
> So if we'd want to enforce this, there is a lot of clean-up work needed
> first. Once we're in a good shape, I think a "make check" test would be
> the right thing to enforce that future devices are always provided with
> a category.

Asserting in something like the device base class realize seems
to me like a good approach -- that way it gets automatically
covered by the existing test that tries to create every
user creatable device (we do have one of those, right?), and
developers of new devices will spot their error immediately
even if they don't happen to run 'make check'.

thanks
-- PMM

