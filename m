Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VGsxW-0002am-OY
	for mharc-qemu-trivial@gnu.org; Tue, 03 Sep 2013 11:56:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49302)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VGsxQ-0002ZE-Ne
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 11:56:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VGsxL-00039j-MR
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 11:55:56 -0400
Received: from mail-la0-f46.google.com ([209.85.215.46]:47214)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VGsxL-00039a-Ez
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 11:55:51 -0400
Received: by mail-la0-f46.google.com with SMTP id eh20so4810032lab.33
	for <qemu-trivial@nongnu.org>; Tue, 03 Sep 2013 08:55:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=GY7NWOl799r9oet7oWXO2codu/O/hgWovPW/AN082wI=;
	b=GsQmSmLVnXqoVu97euHkKtNLxGOAZV/fj47plQKiK5CUJP+aNwr+3UEjZA7bOGzcQr
	QuiJDPrykZb5vXOytPwzZGDXOVSCGsLgRIuE8PNYvg5aEztSJpj+tFh+EtTkIUjkfbes
	92RauP2ABv2+GuL9rJi1l8XPGdrW3gKsxuSLlwhKp7xxYBFbTVe9w9XfQ78hp38mi5H2
	rnweAeYNgyrXxvMHTdlP+PwI8CKHdHKInERTheR1MxV+zb/CAkWUyMjxaJ1N+2V4TcMY
	GP86MUgILkmDShmwGd9dhe8acaCsP8vFhYpPKsOE0Bp9Gi1LUShar3b0AXwdeKT1icN/
	wMNA==
X-Gm-Message-State: ALoCoQnSFrSVZWk0qW0JOSGT9U753uNrH3O/BytdI0uXguyn0NOtZe1D+kM2eZIxeEt+a3G9AAb8
X-Received: by 10.152.22.198 with SMTP id g6mr26764481laf.5.1378223750421;
	Tue, 03 Sep 2013 08:55:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.169.70 with HTTP; Tue, 3 Sep 2013 08:55:30 -0700 (PDT)
In-Reply-To: <5226048E.2090004@ozlabs.ru>
References: <1378196857-27541-1-git-send-email-aik@ozlabs.ru>
	<CAFEAcA8Jp=SQsC3RpxahF1RFRtX2nHOS2690XiT9Jnpn0jGk_g@mail.gmail.com>
	<5225AC9A.2090601@ozlabs.ru> <5225BD32.8030001@siemens.com>
	<52260025.3050704@ozlabs.ru>
	<CAFEAcA8b26fm17sUZ=aUeETVD9q2AahkXQDLQWuRJGM9JMMqkQ@mail.gmail.com>
	<5226048E.2090004@ozlabs.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Sep 2013 16:55:30 +0100
Message-ID: <CAFEAcA-pmmKL9Kq8TZkDaj2HxoRj+uhFLp_kHc3PjtmTNnO-fA@mail.gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.46
Cc: kvm-devel <kvm@vger.kernel.org>, Gleb Natapov <gleb@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Jan Kiszka <jan.kiszka@siemens.com>, Michael Tokarev <mjt@tls.msk.ru>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-headers: update to
	3.11
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
X-List-Received-Date: Tue, 03 Sep 2013 15:56:01 -0000

On 3 September 2013 16:47, Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
> On 09/04/2013 01:34 AM, Peter Maydell wrote:
>> The classic way for things to break is that a header
>> update accidentally reverts something (because a
>> previous update was from kvm-next and this one is
>> from mainline, for example). Accidental updates against
>> a kernel which is neither kvm-next nor mainline are
>> the other common "broken" version of a header update
>> patch.
>
> I can understand that but this update is a mainline kernel
> update and it is not an accidental one but very specific :-/

Nobody has been saying there is a problem with this
patch. We're just saying it should go via the kvm
tree rather than the trivial patches tree.

-- PMM

