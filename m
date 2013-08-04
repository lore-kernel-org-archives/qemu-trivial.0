Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V5wxp-0001Cw-Mo
	for mharc-qemu-trivial@gnu.org; Sun, 04 Aug 2013 07:59:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47224)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1V5wxj-0001CP-P8
	for qemu-trivial@nongnu.org; Sun, 04 Aug 2013 07:59:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1V5wxf-0001PS-0I
	for qemu-trivial@nongnu.org; Sun, 04 Aug 2013 07:59:03 -0400
Received: from mail-oa0-f42.google.com ([209.85.219.42]:57801)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1V5wxe-0001PC-RQ
	for qemu-trivial@nongnu.org; Sun, 04 Aug 2013 07:58:58 -0400
Received: by mail-oa0-f42.google.com with SMTP id i18so4401834oag.1
	for <qemu-trivial@nongnu.org>; Sun, 04 Aug 2013 04:58:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=IX+S/5Qtp1C2ayo/RrzFy3ZWf8kZb9L1+YE2XD2SmyA=;
	b=isCrJnQno8BiZ6CicOGSHJzm+cTK9I0yRh3y9SDRyYpBXyWZSE7gkVlHBMx4QBf16L
	hmuvDyRRte5/3uhT6NVQUPFaDZ0yoJ0CdYRWh0tmsxxPBeBAbiNc5JBcFD4hEkgEOBT4
	zkym/KAtakGUrnfEmyppO1a+PG/m7UpyC85TH4MkqAxw/FVhg50UAc5SLeLAjnkUJxR3
	XxdxFUjhD8yTU8lAkJsKvY0VgYzhUZvCDoj2AdaX6C/RqxWDNrdxQ89tqK7zI8bSJ6k4
	iXRejLDOTb+fhCv7R0b3AUd43lvZjn4Sosqc06rDAR6ML+qLIYqnJwaSlzSvmGveSnpg
	IxAg==
MIME-Version: 1.0
X-Received: by 10.182.56.232 with SMTP id d8mr11074527obq.96.1375617537971;
	Sun, 04 Aug 2013 04:58:57 -0700 (PDT)
Received: by 10.60.135.225 with HTTP; Sun, 4 Aug 2013 04:58:57 -0700 (PDT)
In-Reply-To: <CAFEAcA8Gh+jys24Ejjp+6ccTxQFhmvdhmfvzEO_B04yzredL=A@mail.gmail.com>
References: <CAKyx-3MMkqKw3GXxSR=NizeBHhE+pYyONUX+0mtOgu5h3kix9g@mail.gmail.com>
	<CAFEAcA8VPg-WDf+Xf3j=7Q--NJgc1+2n6zg6M=pX+idkA-zyEw@mail.gmail.com>
	<358B0F62-7043-432E-8B49-F95CD1B82443@gmail.com>
	<CAFEAcA8Gh+jys24Ejjp+6ccTxQFhmvdhmfvzEO_B04yzredL=A@mail.gmail.com>
Date: Sun, 4 Aug 2013 06:58:57 -0500
Message-ID: <CA+aC4ktgrnt__57o9uA+Er0Qe7HU5qy10n3XWUY6gy+q9D781Q@mail.gmail.com>
From: Anthony Liguori <anthony@codemonkey.ws>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
X-Gm-Message-State: ALoCoQnS+y17IHIcApDJVHrBTm6BwneW1OFAF3ghKt25njK3qeaEi9t6QtshskIdavIHKoix6drZ
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.219.42
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Programmingkid <programmingkidx@gmail.com>, qemu-ppc@nongnu.org,
	=?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] Adds the ability to use
 the command key in the guest operating system.
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
X-List-Received-Date: Sun, 04 Aug 2013 11:59:08 -0000

On Sun, Aug 4, 2013 at 4:39 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> "Should the QEMU UI use the menu-accelerator key for menus or
> should it pass it through to the guest" is a generic UI front-end
> problem; any solution should not be specific to a single UI,
> we should handle it the same way for all front-ends.

The right way to handle this would be to access the hardware keycode
and avoid the keymap table entirely.  I'm sure there is such an API in
Cocoa...

Regards,

Anthony Liguori

> -- PMM
>

