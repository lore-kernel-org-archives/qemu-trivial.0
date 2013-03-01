Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UBV2f-00076N-Tz
	for mharc-qemu-trivial@gnu.org; Fri, 01 Mar 2013 13:50:50 -0500
Received: from eggs.gnu.org ([208.118.235.92]:32960)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UBV2d-00075e-Dz
	for qemu-trivial@nongnu.org; Fri, 01 Mar 2013 13:50:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UBV2c-00017f-AI
	for qemu-trivial@nongnu.org; Fri, 01 Mar 2013 13:50:47 -0500
Received: from mail-lb0-f171.google.com ([209.85.217.171]:39251)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UBV2b-00015t-O6
	for qemu-trivial@nongnu.org; Fri, 01 Mar 2013 13:50:46 -0500
Received: by mail-lb0-f171.google.com with SMTP id gg13so2498280lbb.30
	for <qemu-trivial@nongnu.org>; Fri, 01 Mar 2013 10:50:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=rWUZPkmOJzXbDuujeqVg5n6cJ7UUGr7t0dTOkbqvK5U=;
	b=X/hPrNDVE8t/fZxMtO/WZszLE/jVS/XX/cHK0aPJoo8wMK1yYrKkuqWfdKn30hYH4C
	U66jvDN/S5y95UKCcVX+h+FwsJnwBhtwA8UpgvRAq67sOvff65wHjzAaT/HvAPmC5Kq3
	SORJVAwUWHvzTNLXx3QBr0ehMkxSBc5uoq87PEvmzYCRq6jTq5PlMpdLZzlVKQ9NAeef
	/hJQLLCtP7/7iBQB+z4AD6EPzOxDdjKyMpem5waHQsqEY5UAuVudETzqd8ZZcuLkUL0S
	ar7XtlrBxil2KjeT/MUBBJ5hUh0dE5PwuItUpEgOiJuhu4MbXC0AY+61L9VTNs5sANuv
	+nTA==
X-Received: by 10.152.109.112 with SMTP id hr16mr10077187lab.38.1362163844556; 
	Fri, 01 Mar 2013 10:50:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.37.74 with HTTP; Fri, 1 Mar 2013 10:50:24 -0800 (PST)
In-Reply-To: <5130F483.3090003@suse.de>
References: <1362157061-438-1-git-send-email-peter.maydell@linaro.org>
	<5130F483.3090003@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Mar 2013 18:50:24 +0000
Message-ID: <CAFEAcA8x0K5s5FVqaLg-kaoSvZoHQK08OANj7Ax4FcQksLHWVw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Gm-Message-State: ALoCoQkZjnufMS/LVU7OWHwHTNJAba+s2EdvoizqpVGZTIR1F4CqqDhsySy8aVoO6qzcFF8aGwVV
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.217.171
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] pci_host: Drop write-only address_space
	field
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
X-List-Received-Date: Fri, 01 Mar 2013 18:50:48 -0000

On 1 March 2013 18:33, Andreas F=C3=A4rber <afaerber@suse.de> wrote:
> Am 01.03.2013 17:57, schrieb Peter Maydell:
>> The address_space field of PCIHostState was only ever written, never use=
d.
>> Drop it completely.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>

Incidentally I suspect you could if you liked get rid of all
the uses of PCIHostState in prep.c (and the #include of pci_host.h),
since it's now only using &pcihost->busdev as an opaque way of
saying SYS_BUS_DEVICE(dev)).

-- PMM

