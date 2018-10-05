Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g8Qqr-0001QB-Rt
	for mharc-qemu-trivial@gnu.org; Fri, 05 Oct 2018 10:13:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51619)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g8QKO-0006PY-OS
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2018 09:39:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g8QKL-0006Lr-Hj
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2018 09:39:36 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:45644)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1g8QKL-0006I5-9V
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2018 09:39:33 -0400
Received: by mail-wr1-f66.google.com with SMTP id q5-v6so13583711wrw.12
	for <qemu-trivial@nongnu.org>; Fri, 05 Oct 2018 06:39:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=/vAlDa3HYhV5mytWiC5CeXMNS+LE/4FTX8UuMiBbnFQ=;
	b=p2ijScIm/T0P4X2AbKc+CBhfY2IKuuGxK7mitKg7s3DgVlPAIabHBlzPXbVYyNoZPV
	AdJ1EkPXnFL5JwVXQ1HJKxo9uo8MQp5zktI0ZmVU0s3Rf0eZ2bwfve+rQDaKDH/VYayl
	BNJYItoRnz1EVW7/TaQcQQZvzwtGObYPDlr5BmD5WOMX6HWSRWshyVe/t25aUxoQKPjy
	hGpVM6gvHQkhkl8/KIXGMEikSCF+smIC9uLgaBOuZj1Ih77Vd0+dtS159cteKuAKSQG9
	SYCko+/B34lUq75uim6gz1kd7RUciAzUvFZ/4MoXTHS5vhU/0Tnc6/zBETOEMczh6KdP
	flvQ==
X-Gm-Message-State: ABuFfoit8YWzwhV5HLzW5/c3BQdkM3TkBUaXSn825t5RyI8AXJ6X2z+4
	PsULA5CvtShUE7olaLWB0WDl9g==
X-Google-Smtp-Source: ACcGV61VjisOmqp2J411tFGc2151rOUr1hF+0MVFIpaWYuiO0j2FczCH6NYqQrb1wosqzNq+0SgvYQ==
X-Received: by 2002:adf:9367:: with SMTP id
	94-v6mr8733216wro.211.1538746770716; 
	Fri, 05 Oct 2018 06:39:30 -0700 (PDT)
Received: from [192.168.2.33] (26.red-83-32-208.dynamicip.rima-tde.net.
	[83.32.208.26]) by smtp.gmail.com with ESMTPSA id
	r8-v6sm9992859wrm.14.2018.10.05.06.39.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Oct 2018 06:39:29 -0700 (PDT)
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-block@nongnu.org, qemu-trivial@nongnu.org,
	Riku Voipio <riku.voipio@iki.fi>, Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>
References: <20181004161852.11673-1-crosa@redhat.com>
	<20181004161852.11673-8-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <874d2488-771a-3f17-4838-c38f76e80dec@redhat.com>
Date: Fri, 5 Oct 2018 15:39:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181004161852.11673-8-crosa@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
X-Mailman-Approved-At: Fri, 05 Oct 2018 10:13:08 -0400
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 07/10]
 scripts/decodetree.py: remove unused imports
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
X-List-Received-Date: Fri, 05 Oct 2018 13:39:37 -0000

On 04/10/2018 18:18, Cleber Rosa wrote:
> Signed-off-by: Cleber Rosa <crosa@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  scripts/decodetree.py | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/scripts/decodetree.py b/scripts/decodetree.py
> index 277f9a9bba..457cffea90 100755
> --- a/scripts/decodetree.py
> +++ b/scripts/decodetree.py
> @@ -149,12 +149,10 @@
>  #   trans_addl_i(ctx, &arg_opi, insn)
>  #
>  
> -import io
>  import os
>  import re
>  import sys
>  import getopt
> -import pdb
>  
>  insnwidth = 32
>  insnmask = 0xffffffff
> 

