Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b19c9-0007BE-GN
	for mharc-qemu-trivial@gnu.org; Fri, 13 May 2016 05:42:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34741)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b19c6-00077e-TY
	for qemu-trivial@nongnu.org; Fri, 13 May 2016 05:42:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b19c5-0003mi-Mx
	for qemu-trivial@nongnu.org; Fri, 13 May 2016 05:42:30 -0400
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:33115)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b19c4-0003mP-FJ
	for qemu-trivial@nongnu.org; Fri, 13 May 2016 05:42:29 -0400
Received: by mail-vk0-x22c.google.com with SMTP id o133so130573333vka.0
	for <qemu-trivial@nongnu.org>; Fri, 13 May 2016 02:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=x8LW4t8hicDEVL6HdmtB17sT1TdalrnePlqjgZeRAVI=;
	b=RMyN5pCNjOsS0YXY+C6MKmm7VwlV1Dnb9ONbqu61Kg6v4G6RFrPkJHQIZI23F4wc1l
	Xojyarkkv3BVtGUrGOmqrcRAe88M/ZvcVeYdPhAmHbAynjO5knMX1KgL532XOFUB03+K
	Mx2zjXjhbU2KvFNeqISU8ggJNnsBh9fi1VaEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=x8LW4t8hicDEVL6HdmtB17sT1TdalrnePlqjgZeRAVI=;
	b=M+ufce9hPqA2PNTew0gl54fo7gsbiVK5fCZHFuDgELmHseRAu3Ydkg0PI1pGpZTosO
	QxT29TAxVvjx7vBrkjEyFqnk9DXH2FjX3bHpYe6gtE/ouyXJs665o1TjtG/JlVcwyRmP
	6ELrqR2PCHk8vNfDZDtH8YqWpcvAtXDQOu7jFd0SLEAjltEFO8PTfy8xyrqifGixvBtj
	YRVV7YQ21Njc4ZW1PQkFCzWVcYtotciNOMsdll2ZPkZQCk+wR6rwXN/E6MoKCsYDeilR
	n/kq+2J23njKNEAYPh0g+r1tNMj0E3xr3sd0qZWxVl891ISaEs5N+Ff4vpsxr6KvLx1Y
	978g==
X-Gm-Message-State: AOPr4FWdm7FzPhg+Enq5laVcZQ/SrE3gRD7NcsciTZ4qMphBwMDRNPYJBF+LMekdR9SCCJPHPPXx13U963tIIeVp
X-Received: by 10.159.54.232 with SMTP id p95mr6364356uap.107.1463132547736;
	Fri, 13 May 2016 02:42:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Fri, 13 May 2016 02:42:08 -0700 (PDT)
In-Reply-To: <1463123072-30603-1-git-send-email-thuth@redhat.com>
References: <1463123072-30603-1-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 May 2016 10:42:08 +0100
Message-ID: <CAFEAcA83_ZHLf_j7fHxwFvjQXARq1HgX-ELTfnD3QDRJGwFJ+Q@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	QEMU Developers <qemu-devel@nongnu.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, Jan Kiszka <jan.kiszka@siemens.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22c
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/4] slirp: Spring-cleaning
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
X-List-Received-Date: Fri, 13 May 2016 09:42:32 -0000

On 13 May 2016 at 08:04, Thomas Huth <thuth@redhat.com> wrote:
> QEMU 2.6.0 has been released ... time for some spring-cleaning
> in the slirp code: These patches remove some old and unused
> code, and clean up osdep.h related header inclusions.
>
> Thomas Huth (4):
>   slirp: Clean up slirp_config.h
>   slirp: Remove obsolete backward-compatibility cruft
>   slirp: Remove some unused code from slirp.h
>   slirp: Clean up osdep.h related header inclusions

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Nice cleanups...

thanks
-- PMM

