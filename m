Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e6p2H-0005Si-Ti
	for mharc-qemu-trivial@gnu.org; Mon, 23 Oct 2017 22:33:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60268)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e6p2G-0005SW-De
	for qemu-trivial@nongnu.org; Mon, 23 Oct 2017 22:33:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e6p2C-0006Aw-HV
	for qemu-trivial@nongnu.org; Mon, 23 Oct 2017 22:33:44 -0400
Received: from mail-qt0-x229.google.com ([2607:f8b0:400d:c0d::229]:49128)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e6p2C-0006Ad-CH; Mon, 23 Oct 2017 22:33:40 -0400
Received: by mail-qt0-x229.google.com with SMTP id f8so28704249qta.5;
	Mon, 23 Oct 2017 19:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=3SjsktrZW3X8tlD6i99Vasvfv+hUQe6IvNl7aUi5LGw=;
	b=hVEcKD17yt8BVHtJC0mfQ0gC3pDDY4J7+LH1CvJttOIyvHz5NuWRplJR8OhuiNBApT
	fTUkHZfiaITX66JuwLDdbq09TAeb7RlRbElxohd3H6OZjTt/ZuWsku77/n3OBt/PNklX
	ktCFCCcIFSiHLakbQX3zGV05hm8XlA6DYkhC1JGB/5qG2UBzepNq2xXCape8r9AKlWAJ
	jVgXOqm1isHLv6SZ/XVPfg6blYT2wa2WwKLynJu2PQMc7DKfyUENHGmhczj13wfvzTeZ
	BXv7k1Za1Qq0gCBCOv3QG0Sh9nLoMpbZ2QsNdJYrXoBsrtjwBWeyp76GE5+QXfaJu4Wd
	pdRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=3SjsktrZW3X8tlD6i99Vasvfv+hUQe6IvNl7aUi5LGw=;
	b=cxCBMyDdMusVqV6CUc/AFCktCdh3HoyS7YPaigjR7pfDTpgrJjzsdIzhcgeK9Phfrv
	m+R3rfAwqcO7TQCKEdD50lfHXHMEbZJrfvK3Y7mrXyNqWk62PI3cyCmhq6Fk0yNKWLad
	RaKkK3VQVzAHII8b6RIAUyeJVXZX20i92m0RgGU7mjj7+AzP2sz03k7Xzy6ZFlLjpRip
	kXvLYyvwQYOvNkWwruWLkH984A1jkqZ+NaBVIwxw6ruOxUdHdXGrYDsue0jI2qedsgvp
	sCnnaXxObYXr0Gb6tJMPqztNVabcNgUHys2CVnr6U6m60Vf99aeJCjDbLb839ijxDgsY
	skpQ==
X-Gm-Message-State: AMCzsaVlXZTLBlcTdcVS4pgDY78aHW25spiWCgHE/qYbiANXQKCfe2HQ
	H8hw64wgb1mQEtYBeXIbMCQ=
X-Google-Smtp-Source: ABhQp+SS9LVQaIXEsld+5D6/eeOtJiXQCqSCnig7DtJ2n2SJ5TtG0fdGJg7/EE7LCMJUm1z558lw0Q==
X-Received: by 10.200.8.53 with SMTP id u50mr23021289qth.106.1508812419862;
	Mon, 23 Oct 2017 19:33:39 -0700 (PDT)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id k7sm5541001qkf.45.2017.10.23.19.33.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Oct 2017 19:33:39 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: BALATON Zoltan <balaton@eik.bme.hu>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
	<marcandre.lureau@gmail.com>
References: <20171023213359.23025-1-f4bug@amsat.org>
	<20171023213359.23025-4-f4bug@amsat.org>
	<20171023213732.GX18285@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <4a8ab2c3-0576-9c8e-d6c7-8353337fdbe1@amsat.org>
Date: Mon, 23 Oct 2017 23:33:31 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171023213732.GX18285@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::229
Subject: Re: [Qemu-trivial] [PATCH 3/3] vl: remove unnecessary #ifdef
 CONFIG_TPM
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
X-List-Received-Date: Tue, 24 Oct 2017 02:33:45 -0000

Hi Richard,

On 10/23/2017 06:37 PM, Richard W.M. Jones wrote:
> The series fixes the build for me, thanks :-)

Good, does this mean I can add your Tested-by: tag?

Regards,

Phil.

