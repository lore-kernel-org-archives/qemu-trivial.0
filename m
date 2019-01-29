Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1goNKN-0004Ts-Fg
	for mharc-qemu-trivial@gnu.org; Tue, 29 Jan 2019 01:56:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41572)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1goNKL-0004Tg-U4
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2019 01:56:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1goNKL-00072h-8C
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2019 01:56:57 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34063)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1goNKL-00072D-24
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2019 01:56:57 -0500
Received: by mail-wr1-f66.google.com with SMTP id f7so20805778wrp.1
	for <qemu-trivial@nongnu.org>; Mon, 28 Jan 2019 22:56:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=jFXQomLrFs1V1ypC9QQRWzSmpbr6wuuHbppcxN5fkoQ=;
	b=MhPk7bYMt4EF9oZuUP2w7NkOUFDKKcsbbfH6VnMrtHYxHejA9JXvwu4a+w3uEeqcX5
	Avw+KPUBKK8mOpTTTfQIQv8CAdOQ2ral+2aw5te75anlFGiCmIC9btE+u/4JUlSIiY9M
	+RA4XnTUJWJVAbXpuwJA8P09bWCBUe5gczs53PdB25J6OJ6KQH+7nIOd7wWd/9YWl7m+
	K2jPh+Jnc41SUh/7eZy6CATR9HIo9ahAljNRdL8KUH7DQTuz885jhyHJFJnL2ISfR7hL
	8dEj/sFeorwIsoO+xFG4o16BevGgCo5hvWxhBqPPnBoSJkRWvBSZH/FIeGJjaPtpl/Fp
	2hHA==
X-Gm-Message-State: AJcUukcWQhAjk1YJUI7bmfYekHrHHQNHxUmPUVmGnSG59ez1CfVSaeeI
	Nt9hxnRbgWLLwUTmCAsbhyv9RQ==
X-Google-Smtp-Source: ALg8bN4s/5CcDUGNa07+31E4lKnTVuD6EqAULADmoRDidwz8DE8M6ChgHYxY95uiKMDlMzSgLoRZhQ==
X-Received: by 2002:adf:9f10:: with SMTP id l16mr25611012wrf.206.1548745016030;
	Mon, 28 Jan 2019 22:56:56 -0800 (PST)
Received: from [192.168.1.33] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	x15sm158141320wrs.27.2019.01.28.22.56.55
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 22:56:55 -0800 (PST)
To: Wei Yang <richardw.yang@linux.intel.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: imammedo@redhat.com, laurent@vivier.eu, mst@redhat.com
References: <20190125060157.29935-1-richardw.yang@linux.intel.com>
	<20190129000820.31190-1-richardw.yang@linux.intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <feb8687e-0d0c-a20a-9b37-c8284aaae9f5@redhat.com>
Date: Tue, 29 Jan 2019 07:56:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190129000820.31190-1-richardw.yang@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 0/3] Trivial cleanup in
 hw/acpi
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
X-List-Received-Date: Tue, 29 Jan 2019 06:56:58 -0000

Hi Wei,

On 1/29/19 1:08 AM, Wei Yang wrote:
> There are several functions/variable which are not used anymore.
> 
> This serials just remove those without functional change.
> 
> Wei Yang (3):
>   hw/i386/pc.c: remove unused function pc_acpi_init()
>   hw/acpi: remove unused function acpi_table_add_builtin()
>   hw/acpi: remove unnecessary variable acpi_table_builtin
> 
>  hw/acpi/core.c         | 10 +---------
>  hw/i386/pc.c           | 27 ---------------------------
>  include/hw/acpi/acpi.h |  1 -
>  include/hw/i386/pc.h   |  1 -
>  4 files changed, 1 insertion(+), 38 deletions(-)
> 

Please do not post iterated series in reply to previous version, but as
new thread:
- patches are parsed by scripts
- some email clients can tag a thread as "reviewed, skip" and replies to
this thread will be masked.

Regards,

Phil.

