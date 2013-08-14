Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V9i3p-0004J1-DN
	for mharc-qemu-trivial@gnu.org; Wed, 14 Aug 2013 16:52:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37351)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1V9i3j-00041U-4m
	for qemu-trivial@nongnu.org; Wed, 14 Aug 2013 16:52:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1V9i3a-00021B-O7
	for qemu-trivial@nongnu.org; Wed, 14 Aug 2013 16:52:47 -0400
Received: from mail-lb0-f173.google.com ([209.85.217.173]:50408)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1V9i3a-00020l-H4
	for qemu-trivial@nongnu.org; Wed, 14 Aug 2013 16:52:38 -0400
Received: by mail-lb0-f173.google.com with SMTP id 10so78949lbf.18
	for <qemu-trivial@nongnu.org>; Wed, 14 Aug 2013 13:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=pDSX+3Hn8AwSi/jDsgimkCmlzlLWjhdJhd2wav3nraE=;
	b=dyl1OernkAluWmIluNgbhnRexR2Tr+O1XaGv+ezmsxWcPUPkTX3j5AALo6IbOUgpys
	0BdKHYEQCWPiKJtHnSaY2+tKf/+cPhAt5kcASeOQehYcNrTHd7z0/wvj5TVihkMmmXxv
	7n2Olp5+hj6xDTGPntRN2fzPDR1MPGWn+pEBQR1UktbFQ8xgPU/8HZhxceXdlRv0e5PE
	b0NM5nKtj2pILFuuVWbebFH+jbla6Q5Cm6nbVJ+OGcvgB8ZVuUNlb9tT31Duy3quo8Nf
	nTJYxgVfexTnYEP2eIpCQo1BE6HYhcbv28skZrBK0be5aPUaRyZfpraUpBzoPDcmPwV3
	Xglg==
X-Gm-Message-State: ALoCoQl46bcXJBtHCKInSsNxPuzAMxjG6EwpbdOqww5tWF31jRYNAuxGbl8TA6A68yOm3XfLIpvl
X-Received: by 10.152.44.225 with SMTP id h1mr10263267lam.15.1376513556644;
	Wed, 14 Aug 2013 13:52:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.13.2 with HTTP; Wed, 14 Aug 2013 13:52:16 -0700 (PDT)
In-Reply-To: <CA+aC4kuJG0_uOYJRf21Kirp2pMxp-VG0ztXQESht=-1hh=zEqA@mail.gmail.com>
References: <CAKyx-3MMkqKw3GXxSR=NizeBHhE+pYyONUX+0mtOgu5h3kix9g@mail.gmail.com>
	<CAFEAcA8VPg-WDf+Xf3j=7Q--NJgc1+2n6zg6M=pX+idkA-zyEw@mail.gmail.com>
	<358B0F62-7043-432E-8B49-F95CD1B82443@gmail.com>
	<CAFEAcA8Gh+jys24Ejjp+6ccTxQFhmvdhmfvzEO_B04yzredL=A@mail.gmail.com>
	<9A748A2F-42CF-4600-AE57-5B013DBC02F2@gmail.com>
	<CAFEAcA81WMKSYnPWFrAF79qOxumtLRHEQjif1RSMO4yxvVc1-A@mail.gmail.com>
	<2A318D54-11AD-4C05-B5A3-54F35E906571@gmail.com>
	<BC63267D-24B2-4823-9AAB-71722C1DB9D8@suse.de>
	<CA+aC4kuJG0_uOYJRf21Kirp2pMxp-VG0ztXQESht=-1hh=zEqA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 14 Aug 2013 21:52:16 +0100
Message-ID: <CAFEAcA_m6Af5tRB=s0h0TiO6ghbKi+hVvtnB2f3CeAtY2S7UbQ@mail.gmail.com>
To: Anthony Liguori <anthony@codemonkey.ws>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	qemu-devel qemu-devel <qemu-devel@nongnu.org>,
	Alexander Graf <agraf@suse.de>, Programmingkid <programmingkidx@gmail.com>,
	"qemu-ppc@nongnu.org list:PowerPC" <qemu-ppc@nongnu.org>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [Qemu-ppc] [PATCH v2] Adds the
 ability to use the command key in the guest operating system.
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
X-List-Received-Date: Wed, 14 Aug 2013 20:52:52 -0000

On 14 August 2013 21:44, Anthony Liguori <anthony@codemonkey.ws> wrote:
> I'm confident there's a way to get hardware keycodes on OS X.  There
> is on every other UI platform that I know of.  That's the best way to
> solve this.

Sure, but that doesn't answer the fundamental question of "when
should the OS's window/menu accelerator operate the OS menu and
when should it be passed to the guest as a raw key". However you
get the keycodes you still have that choice.

-- PMM

