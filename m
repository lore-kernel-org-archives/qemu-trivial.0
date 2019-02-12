Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtX0t-0002qG-Dw
	for mharc-qemu-trivial@gnu.org; Tue, 12 Feb 2019 07:18:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34300)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gtX0q-0002q6-UM
	for qemu-trivial@nongnu.org; Tue, 12 Feb 2019 07:18:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gtX0n-00010d-3G
	for qemu-trivial@nongnu.org; Tue, 12 Feb 2019 07:18:06 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37582)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gtX0k-0000w1-W7
	for qemu-trivial@nongnu.org; Tue, 12 Feb 2019 07:18:03 -0500
Received: by mail-wm1-f68.google.com with SMTP id x10so2768591wmg.2
	for <qemu-trivial@nongnu.org>; Tue, 12 Feb 2019 04:18:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=94FMUhROVSL7ss+VoBQ5p7HqGvhZfzS2s68kaBwpprk=;
	b=TtYlhTVuuoDir8YiF4cPO0R2W6n22YA+J2GAzXe4IWnXEzkKQ5K1YGBRcmcAZ0NSnG
	iUuw+nCBjIZyuaKNa/X3qbgtqkVD2nHE2ic8DUCs63hASLP7UB0AkEBZnlS6KB75iemn
	xw0A/jOXzk9+Jl1MTRumtCVaK/qcx0RGIfMEW0o8HYh1iWth6Dn7dQ2cZ4xTngrDw3j7
	DndzGxBZt7YZ9GKMG0t2IxZsIWg50h/txbZPAzIhweAHliJs7V9lXLQNQFJ0M8CWuyBa
	nAZsXLGd4ZfMrOEjdSPqYnoctyvs6SQ01R93LKDJZRoGTbz9QYbWNacHekMA5vIXgPXn
	6F6g==
X-Gm-Message-State: AHQUAuY8MUMyTIlmNJ3ro8f6jHakBJl3bX/1XBhyX7ViumSD/1p4aFPj
	xUo2P/2G6zYk9CqQW75Qm9fQrQ==
X-Google-Smtp-Source: AHgI3IbLkIEgWrmu3NbLSOW/rsJ3HvFf6W/oPw0h/pKzelOFhRDJ/wRtITKmnpbch+ysvXEAeGT+Ig==
X-Received: by 2002:a1c:9cce:: with SMTP id f197mr2699420wme.135.1549973881405;
	Tue, 12 Feb 2019 04:18:01 -0800 (PST)
Received: from [192.168.1.103] (10.red-83-35-153.dynamicip.rima-tde.net.
	[83.35.153.10])
	by smtp.gmail.com with ESMTPSA id o2sm4233449wmo.33.2019.02.12.04.17.59
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Feb 2019 04:18:00 -0800 (PST)
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <rth@twiddle.net>, Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Jan Kiszka <jan.kiszka@web.de>, Igor Mitsyanko <i.mitsyanko@gmail.com>, 
	Michael Walle <michael@walle.cc>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
	<f4bug@amsat.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	qemu-ppc@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
	Beniamino Galvani <b.galvani@gmail.com>, BALATON Zoltan
	<balaton@eik.bme.hu>, Magnus Damm <magnus.damm@gmail.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Joel Stanley <joel@jms.id.au>, Andrzej Zaborowski <balrogg@gmail.com>, 
	David Gibson <david@gibson.dropbear.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-arm@nongnu.org,
	Jason Wang <jasowang@redhat.com>, Rob Herring <robh@kernel.org>
References: <20190204231815.29661-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <e3dc8b86-6f4e-97e9-3ae2-81d996850fbe@redhat.com>
Date: Tue, 12 Feb 2019 13:17:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190204231815.29661-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-trivial] [PATCH v2 00/11] hw: Remove "hw/devices.h"
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
X-List-Received-Date: Tue, 12 Feb 2019 12:18:10 -0000

On 2/5/19 12:18 AM, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> As his first comment describes itself, the "hw/devices.h" contains
> declarations for "Devices that have nowhere better to go."
> This series remove it, creating new headers for devices covered there.
> MAINTAINERS is updated.
> I also included 2 cleanups while working on this, in "qemu/typedefs.h"
> and "hw/net/ne2000-isa.h" header guard.
> 
> v2:
> - added R-b, T-b tags
> - addressed many review comments from Thomas
> 
> v1: https://lists.gnu.org/archive/html/qemu-devel/2019-01/msg00611.html

ping?

Since it is mostly touch (old) ARM boards, Peter can you do a quick
review and give your Ack-by, so it can go via the Trivial/Misc tree?
Half of the series is already reviewed by Thomas.

Thanks,

Phil.

