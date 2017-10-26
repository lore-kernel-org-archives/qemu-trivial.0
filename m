Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e7l9F-0004bY-6H
	for mharc-qemu-trivial@gnu.org; Thu, 26 Oct 2017 12:36:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57474)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Jason@zx2c4.com>) id 1e7l9D-0004aZ-45
	for qemu-trivial@nongnu.org; Thu, 26 Oct 2017 12:36:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Jason@zx2c4.com>) id 1e7l9C-0007Ru-FH
	for qemu-trivial@nongnu.org; Thu, 26 Oct 2017 12:36:47 -0400
Received: from frisell.zx2c4.com ([192.95.5.64]:43071)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Jason@zx2c4.com>)
	id 1e7l97-0007Q0-6O; Thu, 26 Oct 2017 12:36:41 -0400
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2ded56cd;
	Thu, 26 Oct 2017 16:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
	:in-reply-to:references:from:date:message-id:subject:to:cc
	:content-type; s=mail; bh=E/PmwxGJ4LQg2SRv+hmexafrDG0=; b=HronU7
	wzg2QW8FYVZMxGr0QU2fIF1DuWh7GZYIfyGn4wBOcPxMPT717UTtieu4mAa366++
	HkNtVMJfuid6oCx7+imiNuQXmJQoXDtH0gl68MkNC0ZHeYNg83YxhnQqBpfOacc6
	cs7w5G59X0jMyMdJ8TWmy2coQFXZRzN5kbIQSSM3vG5Ekdz0+oTle1ZCOg/hDF/C
	YcmzhweixlApY2Cjg7gnd27MGduXa8n/yqciYJh67UAjEFmg30UKvGA9YAXIeg3g
	OCjhP/ho5DObBP/UIbYXYGniiKZpyBNXBHQeBmzo4WAOazSRlelwldiHYkqq2rq/
	acAl55/p3y5NEbJQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7c2e57a1
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO); 
	Thu, 26 Oct 2017 16:34:53 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id c77so6686780oig.0;
	Thu, 26 Oct 2017 09:36:38 -0700 (PDT)
X-Gm-Message-State: AMCzsaVUcfQXXyRgIqTweGebXWImPr75Vc2X6Ku1h/sr/ULGl7uaJnww
	Iv3nrcD7tYiwvhby/gBh/vDpU353QFromkAB0qg=
X-Google-Smtp-Source: ABhQp+T7wxQCYilJCvFSR6t704K0l2z18aRP4WWwRny4ceG/PIN79FhrhCAD+VgM7lMYMjN9XQ6tqv1Qspq3uvq7q6s=
X-Received: by 10.157.47.163 with SMTP id r32mr3173491otb.108.1509035797568;
	Thu, 26 Oct 2017 09:36:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.74.41.205 with HTTP; Thu, 26 Oct 2017 09:36:37 -0700 (PDT)
In-Reply-To: <CAFEAcA9XoeXDCQCmRBehntWSo0WGRBsaMDmC8QCqgU1K8jAF_A@mail.gmail.com>
References: <20171023122719.17199-1-Jason@zx2c4.com>
	<CAFEAcA_PM5Fjx2Pk58h75p9vaZwFcusQdXuwy9tbDtc=EaoOJg@mail.gmail.com>
	<10e16ca3-175b-9f34-65e7-031b883b7201@amsat.org>
	<CAHmME9qtBiuAEnkCeuMd7EdeZveTVa4UOf+AQhMCFye0SYJY=Q@mail.gmail.com>
	<20171026133445.kemzfgvpbmtcogsl@kamzik.brq.redhat.com>
	<CAHmME9oyBvAV8FF9QMHyF46n8Ct6KZqThQVih2ipQmivD94Cag@mail.gmail.com>
	<CAFEAcA8O6YyS1tSzaydckFpsqpb8HXgW5PJe-VTWud_5YGdW5A@mail.gmail.com>
	<CAHmME9pE79krWx-zD=VGiScT4c=4TZ1wVxYFiF3m+8wsx9Fqeg@mail.gmail.com>
	<CAFEAcA9XoeXDCQCmRBehntWSo0WGRBsaMDmC8QCqgU1K8jAF_A@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 26 Oct 2017 18:36:37 +0200
X-Gmail-Original-Message-ID: <CAHmME9qSJSPjANce_cWN6nm=qJsncfczgk7PoPa0xkOHmZjLUA@mail.gmail.com>
Message-ID: <CAHmME9qSJSPjANce_cWN6nm=qJsncfczgk7PoPa0xkOHmZjLUA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Andrew Jones <drjones@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 192.95.5.64
Subject: Re: [Qemu-trivial] [Qemu-devel] [Qemu-arm] [PATCH] hw/arm/virt:
 support 4 serial ports
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
X-List-Received-Date: Thu, 26 Oct 2017 16:36:48 -0000

On Thu, Oct 26, 2017 at 6:34 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> Reordering it would break existing users of the trustzone uart,
> whose command lines would stop working.

I thought this was the reason for all of those virt26, virt28,etc
types -- people who want stability code the revision into their
scripts. Everybody else then gets the latest.

