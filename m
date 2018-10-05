Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g8Qqv-0001Sw-Px
	for mharc-qemu-trivial@gnu.org; Fri, 05 Oct 2018 10:13:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51897)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g8QLC-0006vB-Fp
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2018 09:40:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g8QL9-0007ka-8O
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2018 09:40:26 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35390)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1g8QL9-0007kF-0G
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2018 09:40:23 -0400
Received: by mail-wm1-f67.google.com with SMTP id e187-v6so2001186wmf.0
	for <qemu-trivial@nongnu.org>; Fri, 05 Oct 2018 06:40:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=vuFtRa+gowuoHwJJww/uS2hTfR+ePzUZ3GMBoAVQxLs=;
	b=sSbQ13PlZvfQ4lIDJtCZ4bpg50bf3+WJckgFmG1g72XnN8SM5tta3mkZeDjZbCvkXd
	Ow2ec6p78o5UujMGVwjbE8r4Lv6zTFIGMbhwQhwsDSMf4t3sZkHMj7bsi0D0Xv3U/ZXQ
	RVHgt3/Ibo9F6ksRMRaF7kHF+oWv5fvTo1Lt/7nAwl4ux5l9xGOCHkKR4/dcmZVdof3t
	TtdyO28pv29yj/HBRqIWbYPOCbZ2umO4iqveTlk/fQwOYkEz+JxgvTLNWWij6QbD3d5h
	Tut0ZyM5Xgcq6FQSQOUKJIAn1/fCONilRbfBwPzsyr5jZRsaChUZUhdBj8fL+H9B56R0
	j6Yg==
X-Gm-Message-State: ABuFfohmxg6NhrpnYSP+Ph9uJVwMiU1Oj/zGCdHWw/zVjC/SsaZf95pe
	QsFX2zkMGq7f/SXNEOzf1d6KGg==
X-Google-Smtp-Source: ACcGV62dFEgj0KsmrESwbmeYlAQOVxS/JQkFph6WIOh3ZvhDbqWel7VbtZ5ieV6BZPWz8/l6pgvHMA==
X-Received: by 2002:a1c:6:: with SMTP id 6-v6mr7662718wma.126.1538746821899;
	Fri, 05 Oct 2018 06:40:21 -0700 (PDT)
Received: from [192.168.2.33] (26.red-83-32-208.dynamicip.rima-tde.net.
	[83.32.208.26]) by smtp.gmail.com with ESMTPSA id
	b143-v6sm3468902wma.28.2018.10.05.06.40.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Oct 2018 06:40:21 -0700 (PDT)
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-block@nongnu.org, qemu-trivial@nongnu.org,
	Riku Voipio <riku.voipio@iki.fi>, Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>
References: <20181004161852.11673-1-crosa@redhat.com>
	<20181004161852.11673-9-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <26ba5275-20bb-ba04-180c-7edbe0d0dbe4@redhat.com>
Date: Fri, 5 Oct 2018 15:40:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181004161852.11673-9-crosa@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
X-Mailman-Approved-At: Fri, 05 Oct 2018 10:13:08 -0400
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 08/10]
 scripts/decodetree.py: fix reference to attributes
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
X-List-Received-Date: Fri, 05 Oct 2018 13:40:27 -0000

On 04/10/2018 18:18, Cleber Rosa wrote:
> Signed-off-by: Cleber Rosa <crosa@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  scripts/decodetree.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/decodetree.py b/scripts/decodetree.py
> index 457cffea90..37c76b5507 100755
> --- a/scripts/decodetree.py
> +++ b/scripts/decodetree.py
> @@ -298,7 +298,7 @@ class Field:
>              s = 's'
>          else:
>              s = ''
> -        return str(pos) + ':' + s + str(len)
> +        return str(self.pos) + ':' + s + str(self.len)
>  
>      def str_extract(self):
>          if self.sign:
> 

