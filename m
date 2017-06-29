Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dQcKv-0007GU-9j
	for mharc-qemu-trivial@gnu.org; Thu, 29 Jun 2017 12:30:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34125)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dQcKt-0007FR-PS
	for qemu-trivial@nongnu.org; Thu, 29 Jun 2017 12:30:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dQcKo-0000ml-QC
	for qemu-trivial@nongnu.org; Thu, 29 Jun 2017 12:30:31 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:36241)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dQcKo-0000md-M3; Thu, 29 Jun 2017 12:30:26 -0400
Received: by mail-qt0-x242.google.com with SMTP id v31so11919749qtb.3;
	Thu, 29 Jun 2017 09:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=L+ia9/2RW9BMLZv+r/Sx+QHDrWC5sX3F7lJ6+lGlC3Q=;
	b=bgqFAYncGYnP05yfUF9o2vsFVJRGGHxhHYpA3JsjzETcOmT+C4R7/gVySYiUi8m5gD
	285nhlL83h4KkYjD0E+Pey3Rq7jHVRnM2rRroCuMJNzoQ8LjTT2yrXviSpEQkGOUUtB4
	gD6zhcrFZEbcavGGo5nC9eI4qg4GpzChqvrFvH+79u3Svnqz5KNvtXTAfXmozIOmwxq2
	briHRHUZicRKmxPI9X3SszZ6V9f+k+MMK9U1qH+xJRJ8u+ZMW5Nl0ugbul2NTcd7fL7B
	blAgcDhWok1Nic5dvsBTut+AKya00+1olHrFmSIyfN6f4+gJQNF9VjTN+O/O52aaf1ic
	zpUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=L+ia9/2RW9BMLZv+r/Sx+QHDrWC5sX3F7lJ6+lGlC3Q=;
	b=KVYRzJrI7GGjMWHYn/IrHijTJoGTAtzAU1g5itgNPIcZpFGKJQVCCITIA7SkSug3L1
	9+XgZInmEtX2Sad4zJfLnNZJo+MZmPKEG4UskxzORhj+KQL4rPRacjuPdXgkRjxgf8ds
	nPa8gSCfRBV73Doo0TkiJDJceGf8g+uaCtlMggQBJM7Tg72OHybSebyywPoUHTOvt/5+
	rZ2Na34CVun56Ih81ItLy5Ov2/jirE1WkMC9qMhs1MbCaB+BuHYYO6+jG8jto9cBpeaW
	89J1wdkhJMUx5jHGKQR6AULWJj7yig1dTBidRiDauVhthH53n3OYTU5v5gELzYoobPFC
	PtIQ==
X-Gm-Message-State: AKS2vOw01BjTooz8obQ0JdnE+VWtg5t7UGqR9/OTdI9ui62zYEptoDR9
	tZrjo4xyK9K7frguRerOyA==
X-Received: by 10.200.54.108 with SMTP id n41mr22162965qtb.219.1498753825754; 
	Thu, 29 Jun 2017 09:30:25 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	l32sm4451832qkh.15.2017.06.29.09.30.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Jun 2017 09:30:24 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
	<marcandre.lureau@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20170629162046.4135-1-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <56329b7b-c81d-791a-1605-6ba1017a61a4@amsat.org>
Date: Thu, 29 Jun 2017 13:30:21 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20170629162046.4135-1-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-trivial] [PATCH] backends: remove empty trace-events file
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
X-List-Received-Date: Thu, 29 Jun 2017 16:30:32 -0000

On 06/29/2017 01:20 PM, Daniel P. Berrange wrote:
> The content of the backends/trace-events file was entirely
> removed in
> 
>    commit 6b10e573d15ef82dbc5c5b3726028e6642e134f6
>    Author: Marc-André Lureau <marcandre.lureau@redhat.com>
>    Date:   Mon May 29 12:39:42 2017 +0400
> 
>      char: move char devices to chardev/
> 
> Leaving the empty file around, causes tracetool to generate
> an empty .dtrace file which makes the dtrace compiler throw
> a syntax error.
> 
> Signed-off-by: Daniel P. Berrange <berrange@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>   Makefile.objs         | 1 -
>   backends/trace-events | 0
>   2 files changed, 1 deletion(-)
>   delete mode 100644 backends/trace-events
> 
> diff --git a/Makefile.objs b/Makefile.objs
> index b2e6322..8004d6d 100644
> --- a/Makefile.objs
> +++ b/Makefile.objs
> @@ -122,7 +122,6 @@ trace-events-subdirs += crypto
>   trace-events-subdirs += io
>   trace-events-subdirs += migration
>   trace-events-subdirs += block
> -trace-events-subdirs += backends
>   trace-events-subdirs += chardev
>   trace-events-subdirs += hw/block
>   trace-events-subdirs += hw/block/dataplane
> diff --git a/backends/trace-events b/backends/trace-events
> deleted file mode 100644
> index e69de29..0000000
> 

