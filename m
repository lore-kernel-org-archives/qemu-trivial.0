Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvQzB-0002Vj-Pz
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2017 12:39:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42323)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dvQz9-0002Tc-9r
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 12:39:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dvQz8-0002oe-6h
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 12:39:27 -0400
Received: from mail-wr0-x22b.google.com ([2a00:1450:400c:c0c::22b]:56480)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dvQz7-0002nq-Ts
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 12:39:26 -0400
Received: by mail-wr0-x22b.google.com with SMTP id r74so1342013wrb.13
	for <qemu-trivial@nongnu.org>; Fri, 22 Sep 2017 09:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=kSwD2P4cC30082U50oc01vpT3FpJnm4MP+54mbjbzgo=;
	b=KC2W9z3dkGg4JRLHyTFu1nBVEbGaSILPZHQW6HsA6v/3HQPbLt4Ivo6TP/77mHUpzf
	qR6+Wrvwon9rtJO7d9c98fbePLhfmeOP2X2CnAA+JHYmAG3c1UYdxnT6aoxg5hwoGsKW
	pHmFCaCPcmglYS3R5A8fYNN38/AKWRcyQlQZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=kSwD2P4cC30082U50oc01vpT3FpJnm4MP+54mbjbzgo=;
	b=Zr0+oyubqse4UH22FTaqlNfEPhoLdcDNVODacrKoSyCvsUJlMmkGqHMQJvEzrdPHVB
	4C49RtKbbP1EO+YVnv1u087gClPBxrEDhcXOK1vqezmiewtXEd53Nq6hz7ZZq4C2AIjJ
	djecYYbFGQJ7uLVlEcq6OQ5Sm73WHB3O4tRwvtw3jKXZbUEUaKMcjefsESLIQFp6zClc
	xdF4UW/HpmnPtN6bdNs5jglvvJ8DJLctUTWuB6YvycbSbW9CH/ZWcA/YJrjpR5+hdlER
	MENtqEiL9oNL14hc7r5/hA+Kmt+VxtLhnK5Ucb/9SJVqnYHINHGnbOUgtWsuJTbrEzTd
	9AWw==
X-Gm-Message-State: AHPjjUj/hPIh1hXKd/WxSinYyYIlpfHOOrV3cyJ2v421Gu0V2Sb1yfvp
	jQ/cnwApdCFj+czv/4gnx5Y/KCzFv2r2j/96Cs/tQQ==
X-Google-Smtp-Source: AOwi7QAXaffyVnYuoXo/B1kmRthoMlmfQUylQtssYsRO2r84YKVFzlW3qoV1dZWRZA6YgxusqH4dlHJdB/mtyMxBF3A=
X-Received: by 10.223.147.166 with SMTP id 35mr5874037wrp.90.1506098364858;
	Fri, 22 Sep 2017 09:39:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.215 with HTTP; Fri, 22 Sep 2017 09:39:04 -0700 (PDT)
In-Reply-To: <20170922154014.29350-6-f4bug@amsat.org>
References: <20170922154014.29350-1-f4bug@amsat.org>
	<20170922154014.29350-6-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Sep 2017 17:39:04 +0100
Message-ID: <CAFEAcA-9KOvwzhiSFj8xMUypMnsXmPeoCSMuhPTgrwi-SnyKBA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <rth@twiddle.net>, 
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>, 
	Eduardo Habkost <ehabkost@redhat.com>,
	Marcel Apfelbaum <marcel@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>, 
	Alexander Graf <agraf@suse.de>, Stafford Horne <shorne@gmail.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	"Daniel P. Berrange" <berrange@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22b
Subject: Re: [Qemu-trivial] [PATCH 05/34] misc: remove duplicated includes
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
X-List-Received-Date: Fri, 22 Sep 2017 16:39:28 -0000

On 22 September 2017 at 16:39, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
> exec: housekeeping (funny since 02d0e095031)
>
> applied using ./scripts/clean-includes
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  accel/tcg/translate-all.c          | 1 -
>  exec.c                             | 3 ---
>  hw/arm/spitz.c                     | 1 -
>  hw/char/xen_console.c              | 1 -
>  hw/core/machine.c                  | 1 -
>  hw/s390x/css.c                     | 1 -
>  target/openrisc/exception_helper.c | 1 -
>  tests/vhost-user-test.c            | 1 -
>  util/qemu-sockets.c                | 1 -
>  vl.c                               | 1 -
>  10 files changed, 12 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

