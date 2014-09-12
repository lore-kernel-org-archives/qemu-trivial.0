Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XSMGQ-0004UE-6C
	for mharc-qemu-trivial@gnu.org; Fri, 12 Sep 2014 04:31:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54355)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XSMGI-0004U3-M6
	for qemu-trivial@nongnu.org; Fri, 12 Sep 2014 04:31:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XSMGC-00083s-IB
	for qemu-trivial@nongnu.org; Fri, 12 Sep 2014 04:31:22 -0400
Received: from mail-lb0-f182.google.com ([209.85.217.182]:49353)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XSMGC-00083i-C1
	for qemu-trivial@nongnu.org; Fri, 12 Sep 2014 04:31:16 -0400
Received: by mail-lb0-f182.google.com with SMTP id v6so460238lbi.13
	for <qemu-trivial@nongnu.org>; Fri, 12 Sep 2014 01:31:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=GBSWLm9V4bMbLrPNy6xyMuTkrcoHJLmXE/rHya4V8mo=;
	b=dPn/zFsvBuKAFd7aHkxK9q1luIl7PpR3y7kcMIa0FForzoiHnJX5XM+rSJXPhJuXKk
	N3dcqXJ7H2PoJHFY50WeODmL8uA0qtpXGIoRKYDQqLseKQo299kMgXm07CnJYQoYTWnj
	nJSJL/2XwRSraWMMnGLoji1wNoaBEtpagq3bXPzOGovkwSH1KMMm0pHvTfgf7BxPpB+t
	WeRog3fiGFB+eEUMgtNK1cvd40XujTR70xlyuKnWtx25JIOEaKhYUIe9Yjx3mpl3kApk
	Ylfg7SLI4XpZDqHLoWAjtFjbWrPgXYTJ3ysPiJmUtkN34p+ocYz7H5hMYWcZgIokNnUW
	9rkA==
X-Gm-Message-State: ALoCoQnbHUMYOWpKv7SkZlW/xUZZt5LGlMR2S8WuUIknQcSXvSiPK8fwKELBl5qTLTQeCb6xvH76
X-Received: by 10.152.2.41 with SMTP id 9mr1285863lar.79.1410510675295; Fri,
	12 Sep 2014 01:31:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.130.161 with HTTP; Fri, 12 Sep 2014 01:30:55 -0700 (PDT)
In-Reply-To: <20140912082756.GB1614@stefanha-thinkpad.redhat.com>
References: <1410428416-5046-1-git-send-email-marc.mari.barcelo@gmail.com>
	<20140912082756.GB1614@stefanha-thinkpad.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Sep 2014 09:30:55 +0100
Message-ID: <CAFEAcA9haYpJ4Rsd8W=Cjq44kL079=L7ByRP=HcecS9jW87v6w@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.182
Cc: =?UTF-8?Q?Marc_Mar=C3=AD?= <marc.mari.barcelo@gmail.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [TRIVIAL][PATCH v2] libqos virtio: Increase ISR
	timeout
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
X-List-Received-Date: Fri, 12 Sep 2014 08:31:29 -0000

On 12 September 2014 09:27, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> On Thu, Sep 11, 2014 at 11:40:16AM +0200, Marc Mar=C3=AD wrote:
>> Increase the clock step to avoid Travis failure in some builds due to
>> overagressive timeout.
>>
>> Signed-off-by: Marc Mar=C3=AD <marc.mari.barcelo@gmail.com>
>> ---
>>  tests/libqos/virtio.c |    4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

Do you mind if I apply this directly to master to stop
travis grumbling at us on irc?

thanks
-- PMM

