Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4Fce-000472-UP
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 20:20:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36382)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4Fcc-00044w-K9
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:20:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4Fcb-0000Be-Va
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:20:38 -0400
Received: from mail-qk0-x232.google.com ([2607:f8b0:400d:c09::232]:51586)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4Fcb-0000BD-RX; Mon, 16 Oct 2017 20:20:37 -0400
Received: by mail-qk0-x232.google.com with SMTP id 17so32117qkq.8;
	Mon, 16 Oct 2017 17:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=m+DCLf8mcS5YfDQ8P9zF9QucDDWYxEoogdHdy+g0ckA=;
	b=CoFwz1E20FT3wr2kH8u5Xmy/gksD4RDBgWOSuIqKIb1lp1RWxECKzNPoQ1sQg5X5iA
	aIMHICtTf6vqHpVnsa+GgUqQwW74vYx0Ym8DEhOu1yZSBGJyRK7fAPhwhzMf5uwAxFlS
	p213fEET/5NBbQvKwaFf/IzSDCU6UMi4G7+4vZ0ZyqZVTMr4FPptNgL62r8yT0FQ1k1Q
	eUe3UmPlA4orSlY7CNAqrkGGw66wfu7DS0E1kfH/arWCX6YXtCSoB+RMK24AtUiOrC/r
	9koa1y98oGAXL0fjz/ycb+wfcPmLxbsiDW0PXSxQGUTVbSncxHQQ/LBVvWWiCianJI18
	Y4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=m+DCLf8mcS5YfDQ8P9zF9QucDDWYxEoogdHdy+g0ckA=;
	b=IXb78l7LO7ZIuwYsVji6nqGkiUAV6Qp1hraNvzNMFCU+rCpNFL2h90vlxknyWHxQyJ
	GMH0huWClS19Yequ5Rl5PTZlJYO/MFjeYT+qhq/HPgUHtbPcJ9+fN6p7T/KBa5DHCy7g
	wu6qIO+WiegW45VU17j8FjLmu3veyGx95WS4KDqzauByMhJ6xYrW2X5YnRo+abRPSeY0
	stcEllf5B91PoLRU0gULmbeWrcr16NaENzczmRwF2HBWaXti8H3umPFBtLSl+z3Syzwv
	BYdZhgibkjGD6/Mp3nqzi/qOrj2KEEwGiqJxrtdUuRaof3IMTwb8KFTt8KoHe+fqLZ5C
	PvmQ==
X-Gm-Message-State: AMCzsaX+Xq/lfxEGZGX2LQPKCVBl+ZS0KA/IdTYx/EAQ6DmNuAnep+hT
	k6OgqnzYxBUuNq8G5oQJCYk06UnA
X-Google-Smtp-Source: AOwi7QCFY+uclw6+yEnnYfztDcGnw+tGULcikz4miMAt+0EuRfBjwR2ayhywtH1eEvXAqUOYGMz4Sg==
X-Received: by 10.55.26.138 with SMTP id l10mr17246013qkh.71.1508199637176;
	Mon, 16 Oct 2017 17:20:37 -0700 (PDT)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	c52sm5720712qtc.24.2017.10.16.17.20.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Oct 2017 17:20:36 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-trivial@nongnu.org
References: <20171017001209.32276-1-f4bug@amsat.org>
	<20171017001209.32276-34-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <6b73ec2e-8941-d12f-da08-9e7b2e04f80d@amsat.org>
Date: Mon, 16 Oct 2017 21:20:34 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171017001209.32276-34-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::232
Subject: Re: [Qemu-trivial] [PATCH v2 33/39] hw/net/ne2000: extract ne2k-isa
 code from i386/pc to ne2000-isa.c
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
X-List-Received-Date: Tue, 17 Oct 2017 00:20:39 -0000

>  hw/net/ne2000.h             |  3 +++
>  include/hw/net/ne2000-isa.h | 33 +++++++++++++++++++++++++++++++++

I used "ne2000-isa.h" to match the source file, but the TYPE name is
"ne2k-isa", I'm not sure we care which one is better.

>  hw/net/ne2000-isa.c         |  6 ++----
>  hw/net/ne2000.c             |  2 --

