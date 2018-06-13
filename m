Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fTBz2-0001qn-UF
	for mharc-qemu-trivial@gnu.org; Wed, 13 Jun 2018 16:03:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46796)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fTBz0-0001pq-Pe
	for qemu-trivial@nongnu.org; Wed, 13 Jun 2018 16:03:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fTBz0-0006dv-2A
	for qemu-trivial@nongnu.org; Wed, 13 Jun 2018 16:03:06 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:43374)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fTByv-0006ZE-SI; Wed, 13 Jun 2018 16:03:01 -0400
Received: by mail-qt0-x243.google.com with SMTP id y89-v6so3611752qtd.10;
	Wed, 13 Jun 2018 13:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=5PRqe21KrF+WChOPItFuanEL+ef+6gU14G0uqvhzTBQ=;
	b=Scd6HvfPsOu1N7GQLiR770yHg5Y5qkAnuYcpnGDqY0RqJGV+7UhMnUyYxHzPQkGMmE
	+glqJRSF9DOF9jlHh92ByQKngz9UTPLyeS9N2IStVloW9/EAIckX//aoJTygffc1QT3l
	+4x3XHoVoDybKIuGgn9rZTCgV+cBbyAJ0re2zVYTvA4GUp/XKIBzqwEUEOa7bXX2G8Uz
	Cx0tYvXgAAselsb7fU5psiRK6jCt45+AHgrSjEaovLZzU51Hq2ctodNMMkJ7CbqUS57g
	brofpGpBc749u4KvhDQDZwf962g9bBtSZYyvSThScxYT1REemG0FOuFun8Ts+YNXsrCK
	gBqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=5PRqe21KrF+WChOPItFuanEL+ef+6gU14G0uqvhzTBQ=;
	b=Jg9H2VoqAY65w8X60/668X99CsgSRSx/t7COhTd6PhgiGqgcv32QQKRHCi27iuxpfE
	gJjP/OKeNRkPa60xJVkBAVr1pDTK5ooaAmrQBqCZrNwSbj8Wg2kW2essHR8uITRll9Vk
	in9Tx+b4PUpiot5WLM9UlF6+4VzFN+7CEx7lNid9ov5ELeVrgSABfGyBkAccMCiAGAXn
	nAiJKPBHYZSatxSr8kW1f5nl6cd5pDwQ9faJAnyZf327xofe3ojCH9lpWt5IQjCGtPqw
	OeXaExaU4ecciMpFtIs105Gh9o1NTYnLFlCG7kCM8Tz+tZwI5BKhEvYCfWKznVhufWMn
	GUMQ==
X-Gm-Message-State: APt69E29d+a0bHigqYN/F5Mv8ZhSGbHz8dR/7fVupDOQoXJbxfgiY2pV
	PwaGOJZ6UujxXxYFrG9PXMc=
X-Google-Smtp-Source: ADUXVKJX0pafXYRaMYoUJkGm5tZdGewVqjglEujFKI5qRgx0rOq5ZHiVfBZ/B15wQd4felRE9WiSEw==
X-Received: by 2002:ac8:2e41:: with SMTP id
	s1-v6mr6095459qta.193.1528920181294; 
	Wed, 13 Jun 2018 13:03:01 -0700 (PDT)
Received: from [192.168.1.124] ([190.177.133.49])
	by smtp.gmail.com with ESMTPSA id
	j16-v6sm2097398qtn.29.2018.06.13.13.02.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Jun 2018 13:03:00 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	Eric Blake <eblake@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
	Kevin Wolf <kwolf@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>, 
	Eduardo Habkost <ehabkost@redhat.com>,
	"open list:Block layer core" <qemu-block@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Richard Henderson <rth@twiddle.net>
References: <20180611011501.10235-1-f4bug@amsat.org>
	<20180611011501.10235-12-f4bug@amsat.org>
	<15d222dd-d2e9-4855-62c6-f89f2ee59c52@linaro.org>
	<76aa5170-1d18-8799-6ff1-a7c0dba0b489@redhat.com>
	<8537ca07-2645-6c2c-5945-a91da035b474@linaro.org>
	<a856ef80-fcab-0003-2bdd-89a1849fe857@redhat.com>
	<7c27cd3e-124c-1c03-46de-1b016b37edf1@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <72cb44fc-fb48-49a6-3aa7-3e63762d9586@amsat.org>
Date: Wed, 13 Jun 2018 17:02:53 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <7c27cd3e-124c-1c03-46de-1b016b37edf1@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v4 11/40] hw/xen: Use the
 IEC binary prefix definitions
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
X-List-Received-Date: Wed, 13 Jun 2018 20:03:07 -0000

On 06/13/2018 04:31 PM, Richard Henderson wrote:
> On 06/13/2018 02:13 AM, Eric Blake wrote:
>> Or spell it UINT64_C(1) if you don't want a cast.
> 
> Not unsigned is what I want most.

I used both of your suggestions, but now new format string errors
appeared due to ram_addr_t being unsigned, so code cleaned using
MachineState->ram_size now complains.

include/exec/cpu-common.h:53:typedef uintptr_t ram_addr_t;
include/hw/boards.h:259:    ram_addr_t ram_size;

Is the following snippet OK?

     /* allocate RAM */
-    if (ram_size > (2048u << 20)) {
-        error_report("Too much memory for this machine: %dMB, maximum
2048MB",
-                     ((unsigned int)ram_size / (1 << 20)));
+    if (ram_size > 2 * GiB) {
+        error_report("Too much memory for this machine: %luMB, maximum
2048MB",
+                     ram_size / MiB);
         exit(1);
     }

