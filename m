Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VURcw-0005wi-K1
	for mharc-qemu-trivial@gnu.org; Thu, 10 Oct 2013 21:34:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53972)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VURcq-0005w0-Vn
	for qemu-trivial@nongnu.org; Thu, 10 Oct 2013 21:34:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VURcm-00051c-Jk
	for qemu-trivial@nongnu.org; Thu, 10 Oct 2013 21:34:44 -0400
Received: from mail-la0-f53.google.com ([209.85.215.53]:60154)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VURcm-00051S-Cx
	for qemu-trivial@nongnu.org; Thu, 10 Oct 2013 21:34:40 -0400
Received: by mail-la0-f53.google.com with SMTP id el20so2742416lab.26
	for <qemu-trivial@nongnu.org>; Thu, 10 Oct 2013 18:34:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ndCSmaumidf6dVc7dA7r5EOszLjbT0I4fJYmJGki/No=;
	b=azFd5+PMVg3WpC4IP2IZkZcR7X4j4KcBQVhKLbQHzCzFVU0BgERjwgyoqaQjzbBDHE
	ownuKBr58msZ52hnzWIOtvvlruomSxCAGmHv4UA+kt8kmFHUUSQA7Q1d7tRrBFDO2IW/
	nBuL89mvKCgXm3tTLJrEwXJRknTT0mvE77wnVdjcjdAh61WPrWg2Jn4T14HJQ7qC5wXj
	+5iRpDKuKZj/viRIjRyGi6Ds+effFOdDXQpUfp779hhxwbXEPjTx0LyuM4+e30z9V4Uh
	gJ16ru08CzRpAcvg4qrCRZ2D3BB2kzwMJc4tm4nh5fAvDUCDoTmZrM8MmcZ77LSIS/bw
	c+Wg==
X-Gm-Message-State: ALoCoQnpmCQFJ2CPTUsrO39kVOZsHiWe//PfPjskSJcPZ0aXYSex/lcW/mTFK0ZrP5PDCADe7f0C
X-Received: by 10.152.3.201 with SMTP id e9mr14110184lae.24.1381455279330;
	Thu, 10 Oct 2013 18:34:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.161.232 with HTTP; Thu, 10 Oct 2013 18:34:18 -0700 (PDT)
In-Reply-To: <5256FBE7.80207@weilnetz.de>
References: <1373228703-26226-1-git-send-email-sw@weilnetz.de>
	<037D60EF2A5746E468BF0A04@nimrod.local>
	<CAFEAcA9V_THiPwVwv-gYH14h2kujDnWpGAOSBd95C9W56p3AuQ@mail.gmail.com>
	<51DA438A.8060903@weilnetz.de>
	<CAHR064g-jOt7XaY4G9a7MZRs_qd9REnyyGn8D=mrRoY+J-bXUA@mail.gmail.com>
	<5256FBE7.80207@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Oct 2013 10:34:18 +0900
Message-ID: <CAFEAcA_KEnRRUCp87K55RanQWHXr2gPBvtk2uQc7hCwjo6S94g@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.53
Cc: Alex Bligh <alex@alex.org.uk>, Corentin Chary <corentincj@iksaif.net>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Qemu-development List <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Spelling fixes
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
X-List-Received-Date: Fri, 11 Oct 2013 01:34:49 -0000

On 11 October 2013 04:11, Stefan Weil <sw@weilnetz.de> wrote:
> Am 08.07.2013 17:14, schrieb Corentin Chary:
>> The comments (and most of the code) are from libvncserver (and,
>> earlier, from "THE 'ZYWRLE' VNC CODEC SOURCE CODE. " as described in
>> the header):
>>
>> http://fastdroid-vnc.googlecode.com/svn-history/r3/trunk/LibVNCServer-0.9.7/libvncserver/zywrletemplate.c
>>
>
> Then I suggest to apply my patch as it is. It fixes two locations and
> improves a third one a little bit.

Disagree. If we don't understand the intention of the original
author we should leave the text as is rather than changing it
in a way which might be incorrect.

-- PMM

