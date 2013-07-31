Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V4UDn-0008RE-8l
	for mharc-qemu-trivial@gnu.org; Wed, 31 Jul 2013 07:05:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35443)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1V4UDh-0008R1-Cr
	for qemu-trivial@nongnu.org; Wed, 31 Jul 2013 07:05:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1V4UDc-0004ZF-Fb
	for qemu-trivial@nongnu.org; Wed, 31 Jul 2013 07:05:29 -0400
Received: from mail-lb0-f175.google.com ([209.85.217.175]:42754)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1V4UDc-0004Z3-8H
	for qemu-trivial@nongnu.org; Wed, 31 Jul 2013 07:05:24 -0400
Received: by mail-lb0-f175.google.com with SMTP id 13so467480lba.6
	for <qemu-trivial@nongnu.org>; Wed, 31 Jul 2013 04:05:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=YuRQYmympLrlAEel7xUnf7faIvVjnyNoII8YRrA/38Q=;
	b=SF/V3ugBZY0LWgOwVdikg1pVsByWZW0uplScjbULHkf/nxl20RWIPmW/2rTK9ufh/m
	kZ9cxqM0T+Rju1I9W64AoByBUM76hMPd0ghQTCVK/bjiJGjqg0JBteaDPC7VsIlGvTtK
	LiGx6IBtzsLvpsQE25FJJdQ2I1RTsvylnLS7QNEiiXym5FW7EvAqOK/WYPicmRGM9h90
	CcWXl4zP8RVvrd1PXPoJEz1kQGAaAF8nM6xkrdICT1WMhM0N55ML2lpKGfjOYQUpHAgR
	TlpbdHOTuRL2hsbn/y/ldk8+Vr3U5Gfj3jr3WXI7bPZ71gvb2v9eBlGglwpt/koWmSub
	s+lw==
X-Received: by 10.112.51.240 with SMTP id n16mr14191417lbo.10.1375268723329;
	Wed, 31 Jul 2013 04:05:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.13.2 with HTTP; Wed, 31 Jul 2013 04:05:03 -0700 (PDT)
In-Reply-To: <51F8E68F.4030006@msgid.tls.msk.ru>
References: <1375266255-22207-1-git-send-email-mjt@msgid.tls.msk.ru>
	<51F8E68F.4030006@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 31 Jul 2013 12:05:03 +0100
Message-ID: <CAFEAcA8UZRQAv9NLRcyvUffXMKMM01FauUDvmxiGRwHJzmUM1g@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQmY2VNIVupSbaA6JB4Tlcsng7rtptbMDMpx7pR0cuJMRp1UohAAKif6CkqFYYp/N5Xtr5F+
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.175
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-ga: build it even if
	!system
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
X-List-Received-Date: Wed, 31 Jul 2013 11:05:34 -0000

On 31 July 2013 11:27, Michael Tokarev <mjt@tls.msk.ru> wrote:
> 31.07.2013 14:24, Michael Tokarev wrote:
>> Move qemu-ga build check out of if softmmu.. into if tools section.
>> We want to build qemu-ga for _guest_ even if system build isn't
>> done.  It is controlled separately using --enable-guest-agent.
>
> Actually the more I think about it... Maybe it shouldn't depend
> on --enable-tools either, but should be an independent option.
> Because it isn't really a tool.

This seems to me to be unnecessarily breaking things down
into very finely divided categories. I think putting it
in --enable-tools is fine.

-- PMM

