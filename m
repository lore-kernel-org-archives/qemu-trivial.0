Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dnGZu-0002yo-AQ
	for mharc-qemu-trivial@gnu.org; Wed, 30 Aug 2017 23:55:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56152)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnGZp-0002wI-GT
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 23:55:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnGZo-0007L3-LS
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 23:55:33 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:33380)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnGZj-0007GM-WD; Wed, 30 Aug 2017 23:55:28 -0400
Received: by mail-qt0-x242.google.com with SMTP id q53so6766009qtq.0;
	Wed, 30 Aug 2017 20:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=/r6g26nD4ste3bDHMllPNep7/Ak47GLorMpffuXghlY=;
	b=bLj1ME7BaFefJ/xjFgLPu8PH26884P3UoqKstQ+ew1M8iN04MrO3Fd+jfgMWf1T59X
	wOiwwClyK5rzmf8QmGFWhQ7tCqXV8/INodlRm4Nr6Tfo+FEEdpwo+cTCgKYFeZ3Yvh6w
	H2sC+B/rVuYAOQngN/yuOo9youiW/XaeqidO2q45pC0NxKpYdLd3+24AX7w5Qhil192Q
	z+3HRPaSc7lfjHBcpqCMZEh58x2+xaizP32tcI9su2Gnsg7fN6F7iSY0GZmsBpXi2mRq
	jiyARMBt2KzBcH49KLtM6hIEx+GjmeIpWVRmmSmHhHA/rHmIw/PsSRnv84BHc998tcDl
	oz9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=/r6g26nD4ste3bDHMllPNep7/Ak47GLorMpffuXghlY=;
	b=gN29w5DcJN9DPQvSk16Ql8gAhztSQy/PK4okEC0F9QeJDSyXT6npUxHIwHVnKh6jhE
	Yk3q90vUZ2xZnOMAGEZjmaSXsaigdYEyc9PzH2fC8tKtVR7x8DhZo665s4zJld/fumVO
	KnqEgpfu8Tvp/wzTED4+mgl1yJWssF+QljCVQSoNDlNLy2ntBWr9rT7y3FXpo9nXT8pE
	sZpfTzHo8hGLUVSBUaXn9bV20O/RzJBfFc8O71cW87Mug4arTIbHfObZXKOsy5IvVOta
	awlNG2ZHRnvj3mlzWvm951nBsb9R26UpdDKdr3vb5k0u3OIfaqiLRZUFz27QEVn77/0S
	lD7A==
X-Gm-Message-State: AHYfb5hmlzeTfoyf70ZpQGN2IRv4GZgKWRTa32T0uZDzxEZhLMUfVbUc
	NA6A+R+GZLVDeujGWCssJg==
X-Received: by 10.200.46.28 with SMTP id r28mr5230208qta.315.1504151727235;
	Wed, 30 Aug 2017 20:55:27 -0700 (PDT)
Received: from [192.168.1.10] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	j61sm4704024qte.30.2017.08.30.20.55.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Aug 2017 20:55:26 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20170830215523.25278-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8208132b-26de-3c38-1d60-faeea0e2f768@amsat.org>
Date: Thu, 31 Aug 2017 00:55:24 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170830215523.25278-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-trivial] [PATCH v2 00/17] add missing entries in
 MAINTAINERS
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
X-List-Received-Date: Thu, 31 Aug 2017 03:55:34 -0000

Cc'ing Markus since I forgot to include him.

On 08/30/2017 06:55 PM, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> I tried to have a more helpful ./scripts/get_maintainer.pl output, filling
> missing entries in MAINTAINERS.
> 
> Regards,
> 
> Phil.
> 
> v2:
> - add R-b & A-b
> - clean ARM entries (Thomas Huth)
> - moved files: comment since which commit (Eric Blake)
> - drop inconsistent patches (default-configs.mak related to hw/machine, no CPU)
> - drop unhappy patches (include/standard-headers/linux/*)
> - drop unreplied patches
> 
> Philippe Mathieu-Daudé (17):
>    MAINTAINERS: add missing ARM entries
>    MAINTAINERS: add missing Versatile PB entry
>    MAINTAINERS: add missing STM32 entry
>    MAINTAINERS: add missing entry for vhost
>    MAINTAINERS: add missing VMWare entry
>    MAINTAINERS: add missing Guest Agent entries
>    MAINTAINERS: add missing qcow2 entry
>    MAINTAINERS: add missing USB entry
>    MAINTAINERS: add missing PCI entries
>    MAINTAINERS: add missing SSI entries
>    MAINTAINERS: add missing entries for throttling infra
>    MAINTAINERS: add missing megasas test entry
>    MAINTAINERS: add missing AIO entry
>    MAINTAINERS: add missing entry for Generic Loader
>    MAINTAINERS: add missing Cryptography entry
>    MAINTAINERS: update docs/devel/ entries
>    MAINTAINERS: update docs/interop/ entries
> 
>   MAINTAINERS | 44 ++++++++++++++++++++++++++++++++++----------
>   1 file changed, 34 insertions(+), 10 deletions(-)
> 

