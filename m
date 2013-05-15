Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UcX00-0005Wi-CU
	for mharc-qemu-trivial@gnu.org; Wed, 15 May 2013 04:23:48 -0400
Received: from eggs.gnu.org ([208.118.235.92]:52624)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UcWzx-0005Up-Gr
	for qemu-trivial@nongnu.org; Wed, 15 May 2013 04:23:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UcWzu-0005ML-Ms
	for qemu-trivial@nongnu.org; Wed, 15 May 2013 04:23:45 -0400
Received: from mail-pb0-x22f.google.com ([2607:f8b0:400e:c01::22f]:54018)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UcWzu-0005Ly-Gi
	for qemu-trivial@nongnu.org; Wed, 15 May 2013 04:23:42 -0400
Received: by mail-pb0-f47.google.com with SMTP id rr4so1159170pbb.6
	for <qemu-trivial@nongnu.org>; Wed, 15 May 2013 01:23:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=R20/T+12bS5AIZ3nYri15EjCodQVEgO6+vA7WttQ0tk=;
	b=WzeABgumDogcFHQlBZahjJ9dEZdZReacmQHPBQVosmvEWzAudlfLAldlScKpcKQsYN
	DW5lsk/P8r87XkPA1jSEUo5WjxCagxLySqHug2JSRjnaCG1yW5vHGI6x8MzaF/LwVljs
	bf+p6i9HPooUxbTFGvq171tLonWqebo7zuqQugZBfjdmLE5pmiZpQDNCoPbt6hHZtrpY
	lEvZEs+abzXgCzq9/Kxh2Dj15kZrxqjnaIpTNV1tUXzLPf7Jtxyu9sQ8qZDrPsuCNBnJ
	570orkJGeWdvR+9roCiv1iuDvdT6CVOqUzNAzyvphDVmfHUMvIebyc0ITqm0pPPmn1zh
	GX7w==
X-Received: by 10.66.222.69 with SMTP id qk5mr4249006pac.71.1368606221339;
	Wed, 15 May 2013 01:23:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.70.25.69 with HTTP; Wed, 15 May 2013 01:23:21 -0700 (PDT)
In-Reply-To: <1368597869-30405-1-git-send-email-hutao@cn.fujitsu.com>
References: <1368597869-30405-1-git-send-email-hutao@cn.fujitsu.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 15 May 2013 09:23:21 +0100
Message-ID: <CAFEAcA-vp5bPwmAZj3a6HH71XkZJizQNSSTbFdrSOU60QWZRGw@mail.gmail.com>
To: Hu Tao <hutao@cn.fujitsu.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQnUpnOfeJ/YYXG3EKQHm+kZaXmxMTAUV8/lcrGl4FpC2szL4pgpZR0+FvGRJ1xFfgi5NO3t
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c01::22f
Cc: qemu-trivial@nongnu.org, Anthony Green <green@moxielogic.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-moxie: replace
 target_phys_addr_t with hwaddr
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
X-List-Received-Date: Wed, 15 May 2013 08:23:46 -0000

On 15 May 2013 07:04, Hu Tao <hutao@cn.fujitsu.com> wrote:
> target_phys_addr_t has been already replaced by hwaddr, but this
> one is introduced after.
>
> Signed-off-by: Hu Tao <hutao@cn.fujitsu.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

This doesn't cause compile errors because it's in a bit
of code that can never get compiled (it's inside a
CONFIG_USER_ONLY block but there is no moxie-linux-user
target in configure).

thanks
-- PMM

