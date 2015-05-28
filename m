Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yxxku-0001lp-MX
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 09:21:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52271)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Yxxkp-0001dd-0M
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 09:21:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Yxxkk-0004Mh-Sy
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 09:21:46 -0400
Received: from mail-ig0-f181.google.com ([209.85.213.181]:36295)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Yxxkk-0004Lv-OW
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 09:21:42 -0400
Received: by igbpi8 with SMTP id pi8so111350434igb.1
	for <qemu-trivial@nongnu.org>; Thu, 28 May 2015 06:21:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=5IW0/FpHYMHi8wOW0hc/8g1xPb97e8tGu+q+w+jF5zY=;
	b=LuWZEkEypI5bGSNh/pygsdT+J+RVNVDuevkV+D1xj75GoVLwxZMaN2nftEOl2/mIf7
	Scn92unzJiftoU1Y6V7GrLvyzfD0Rlyc/9sURLWxiCf7AnWdNyfyPuJ9sggHVrGYy+dE
	6TtkS9jjF7/entj5IYpfAJkFwduhoXQX9EYO6sNWs+W9VzfSMukbcU31QxsPXy62tK8f
	HDImjAXZFEbS0N9Y0dHrbti9yowpBrX5z34cixJyNxdwMe9qe1ctAgQaRLeUWBKbV9hJ
	cM6Mr37XNfv+Rv4gK9Qfajv6Af8KqnXUHRh7EM26xA/9QIZnQdi/9+zUuUmvA1K+nkBF
	uDBQ==
X-Gm-Message-State: ALoCoQmkTRLGO80pLMEJCLPqNhZz1y+mwhYeLo45mwGUt8C9Bi7UMtSIleQUZ6Ml8upZlBi4PkOE
X-Received: by 10.107.131.141 with SMTP id n13mr3352663ioi.74.1432819302252;
	Thu, 28 May 2015 06:21:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.181.6 with HTTP; Thu, 28 May 2015 06:21:21 -0700 (PDT)
In-Reply-To: <1432814932-12608-30-git-send-email-zhaoshenglong@huawei.com>
References: <1432814932-12608-1-git-send-email-zhaoshenglong@huawei.com>
	<1432814932-12608-30-git-send-email-zhaoshenglong@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 May 2015 14:21:21 +0100
Message-ID: <CAFEAcA8J7ZbuH-rzBToaSWLKM_3U1O9JzFqPjOAQ8Tx8ohOP2A@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.181
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>
Subject: Re: [Qemu-trivial] [PATCH 29/29] hw/s390x/sclpcpu.c: Fix memory
	leak spotted by valgrind
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
X-List-Received-Date: Thu, 28 May 2015 13:21:51 -0000

On 28 May 2015 at 13:08, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
> @@ -81,7 +81,10 @@ static void trigger_signal(void *opaque, int n, int level)
>
>  static int irq_cpu_hotplug_init(SCLPEvent *event)
>  {
> -    irq_cpu_hotplug = qemu_allocate_irqs(trigger_signal, event, 1);
> +    qemu_irq irq = qemu_allocate_irq(trigger_signal, event, 0);
> +
> +    irq_cpu_hotplug = irq;
> +    qemu_free_irq(irq);
>      return 0;

Huh? Surely we can't validly use the irq once you've
called qemu_free_irq() on it?

-- PMM

