Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e9DIJ-0000xn-Ai
	for mharc-qemu-trivial@gnu.org; Mon, 30 Oct 2017 12:52:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49487)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e9DIH-0000w2-IK
	for qemu-trivial@nongnu.org; Mon, 30 Oct 2017 12:52:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e9DIG-0004NH-Qz
	for qemu-trivial@nongnu.org; Mon, 30 Oct 2017 12:52:09 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:55273)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e9DIC-0004Iv-Jf; Mon, 30 Oct 2017 12:52:04 -0400
Received: by mail-qk0-x241.google.com with SMTP id n5so16953287qke.11;
	Mon, 30 Oct 2017 09:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=gHfMlmk5fm2+IcBMoXI3Y3jVY6MgalCsPQgNAq8kMZQ=;
	b=QoTNXdDvbU7jTqBCQEQdkRKT4RrnF+C0HTnk895pl6NtCNZcMgixP3bgjSKmPobxB+
	Yrunq/dnPzkzOUrgTL0xtUEa6n0TtFWYitTCs+2iRIUP4dv+ukjqlVXmGkhO7VDL7FKx
	/3OpDxcJyWo+2dBxHa5t5aJwajm3qwTqMpFP+/WeRj1rQQNE49KVTRykUAftsOk1oQP5
	ryO+iMPH2hr+dDvRz4vFb1XvQRuZ1EAOddO7D3Qv5GZTFqMzWJll9mUi8kEloLQ7c/Mm
	5Mqc7VNAujYtbYBqEMXlzL78QPafd0OKxAQH+tq/9XW2aV3R9tr2q4umgqHhSzBArWlm
	tGyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=gHfMlmk5fm2+IcBMoXI3Y3jVY6MgalCsPQgNAq8kMZQ=;
	b=qs8bZtqpDT5aVrugg7w/HwsyxB3m9hL51opN9I70ESxVSK8D1uu4Py38mbi0hRJf7X
	jC5ugn+AcdYmVgDXmCR/Ny0EFM8TgpB3IYiUw1Cmk0q6lJdX7f7rMTlGqbYU+jToBKRM
	5i7Z7pTFK3CF5VPtvSj7zewLDOFz0DcCRFpXNMkAVBS0H8SKOwrTppNS1DNh2H8JhZfn
	zGe/E1s+FcKAgEQPjvwge94n4WabPDaszo4j2Jkmxul/yJpRGsSdpy0u5H4VylrmpQLU
	C2OFk6bL4EiQUSGbedHET6QkgmSWIUWG3JAmpDcb1fVrcmwMuaL729EmICdkAJwj0gEK
	6hUw==
X-Gm-Message-State: AMCzsaUNQlQCKjMPChBzeTmtXsy+0YGSf2Svho2iru2JX2YbtYAnycSh
	XK0I9D8W96sgRok9r6izuLc=
X-Google-Smtp-Source: ABhQp+QluzW9301bjX1ei5kGdLg6PS+pbzMouB4R+96J4wOM1jRHbQFSaGkjxHYRVrzca4ZqaQkgIw==
X-Received: by 10.233.232.8 with SMTP id a8mr14221723qkg.263.1509382323932;
	Mon, 30 Oct 2017 09:52:03 -0700 (PDT)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	d145sm5679053qkb.0.2017.10.30.09.51.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Oct 2017 09:52:03 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Doug Gale <doug16k@gmail.com>, qemu-devel <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Markus Armbruster <armbru@redhat.com>, mreitz@redhat.com,
	keith.busch@intel.com, pbonzini@redhat.com
References: <CAEfK_44JHKD9wdMWQGr7s=-Y8NrU4=Tr8kCqAJWm1f=zyFA2xg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <3fd5c433-e879-0ef0-d87a-061660ddf14d@amsat.org>
Date: Mon, 30 Oct 2017 13:51:53 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAEfK_44JHKD9wdMWQGr7s=-Y8NrU4=Tr8kCqAJWm1f=zyFA2xg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v4] nvme: Add tracing
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
X-List-Received-Date: Mon, 30 Oct 2017 16:52:10 -0000

Cc'ing Stefan and Trivial

On 10/30/2017 01:07 PM, Doug Gale wrote:
> From 0e27b5dca8f4f32a1b194e1b3544be77dd4f45d9 Mon Sep 17 00:00:00 2001
> From: Doug Gale <doug16k@gmail.com>
> Date: Mon, 30 Oct 2017 09:28:43 -0400
> Subject: [PATCH] nvme: Add tracing
> 

^ to remove from commit description, maybe maintainer taking this can
cleanup.
> Add trace output for commands, errors, and undefined behavior.
> Add guest error log output for undefined behavior.
> Report invalid undefined accesses to MMIO.
> Annotate unlikely error checks with unlikely.
> 
> Signed-off-by: Doug Gale <doug16k@gmail.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/block/nvme.c       | 349 ++++++++++++++++++++++++++++++++++++++++++--------
>  hw/block/trace-events |  93 ++++++++++++++
>  2 files changed, 390 insertions(+), 52 deletions(-)

