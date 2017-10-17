Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4Oiq-0002of-T7
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 06:03:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34115)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4Oio-0002oW-Lw
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 06:03:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4Oij-0007QO-0o
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 06:03:38 -0400
Received: from mail-qt0-x232.google.com ([2607:f8b0:400d:c0d::232]:51370)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4Oii-0007Q5-TI; Tue, 17 Oct 2017 06:03:32 -0400
Received: by mail-qt0-x232.google.com with SMTP id h4so2230259qtk.8;
	Tue, 17 Oct 2017 03:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=NIu67or8bOoMPArtyrCV1UAofXDNCZZmAJQ/1e8yMqA=;
	b=NT/tyh7UAauA1TYJET/pCxjq7cSMmn2fdQLalldDhrPVz4ui8mk0Vi16sTIGdlj6Qw
	ISXPiuXZZnKiSJMAylWH4HAPo8aGqvky0ZC1otZGi4ptcGwXO57y0D/v41HFtR96D/rI
	rL0Vnpwqem9Qp9KYkSv7c2jE+YzgF4iaTlJgaFbciKXY8V4UR3t2qC5/BkigwBTj1SAP
	fi5rmjsh7vKkndSq0DztlR7yX7UfDZetIyTQjcBNf9qDh0aslsp3/CDz6l2sOek6uCzn
	gkWGLhfRgCuqZCgRN4na6V5OkL9iKEOuCnaLduKunXnY2xONIQmnkmGD58XiATslOrXz
	n2eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=NIu67or8bOoMPArtyrCV1UAofXDNCZZmAJQ/1e8yMqA=;
	b=W4nmw8lwF7i6hg9FycmGYXmpttrKZZ4F/+K1uTq86osTZU+ZbwTReR7lXJJC8ZytLA
	DqP/JZB6bmNEoGyaPBtaRhkgEXPBSHl82Hk8LJsMLCS8WlktRf8ua2ZhH3AE3d+/uGGj
	IJEVPKWiLKRxy9lIZoif8B/HpUYdCFCYJbVDGDnr9dAVI3B6eKWTw+zHdrWBw2ZawUMy
	s7PJq8lRAunIw5d5RUnyI9etntCBtJ8HwwSNb7342qf001TG0KMugILKoEDnDFb7fF8N
	NLnm8Dju3Yv2SHKIrxPhSi01AkZVr+wIBKZpQGJVTQzZo/SEO2ODeElEZaMyCkDNe+YO
	VyPw==
X-Gm-Message-State: AMCzsaUmZraInPeqvxm2Kd2UV2ldzrt54lq5+F/TJf5kVGmrvSPGK4JB
	3rpaKURloaQrxEsa1MNBnZIzig/w
X-Google-Smtp-Source: AOwi7QCUaJYLNVuFgHUIUua7WGJlrrYZaX5GESvtlToIoepcpZE/TNz1ri9LxFcLjUy2fV4wYLPv0Q==
X-Received: by 10.200.23.85 with SMTP id u21mr16885579qtk.200.1508234612141;
	Tue, 17 Oct 2017 03:03:32 -0700 (PDT)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	r22sm6112728qtj.70.2017.10.17.03.03.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 03:03:31 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>, 
	Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin"
	<mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20171017001209.32276-1-f4bug@amsat.org>
	<20171017001209.32276-38-f4bug@amsat.org>
	<0f7d83c7-b814-0e07-a043-f4cd957136c6@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <7f55b220-d80b-2f0d-b77d-be9bafea6734@amsat.org>
Date: Tue, 17 Oct 2017 07:03:27 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <0f7d83c7-b814-0e07-a043-f4cd957136c6@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::232
Subject: Re: [Qemu-trivial] [PATCH v2 37/39] i386/pc: extract port92 from
 pc.c
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
X-List-Received-Date: Tue, 17 Oct 2017 10:03:39 -0000

> Why are you doing this? I really fail to see the rationale here. Please
> add proper patch descriptions!

Oops sorry :/

Mostly because while moving things around I read this comment laying
around since commit 4b78a802ffa:

    /* port 92 stuff: could be split off */

No further rational (except it eases static analysis) so I won't change
this code and drop this patch.

Regards,

Phil.

