Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gkABN-0006xq-Kc
	for mharc-qemu-trivial@gnu.org; Thu, 17 Jan 2019 11:06:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49117)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gkABK-0006vB-HS
	for qemu-trivial@nongnu.org; Thu, 17 Jan 2019 11:06:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gkABJ-0003Zb-E6
	for qemu-trivial@nongnu.org; Thu, 17 Jan 2019 11:06:14 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35855)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gkABJ-0003X0-6W
	for qemu-trivial@nongnu.org; Thu, 17 Jan 2019 11:06:13 -0500
Received: by mail-wr1-f65.google.com with SMTP id u4so11634370wrp.3
	for <qemu-trivial@nongnu.org>; Thu, 17 Jan 2019 08:06:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=zHXRicr41Ul3iAR2iGa2Iz+hCdFz4qRKE89xocrB/yA=;
	b=L0tXcwYuBvUrbwWjp2zlSYc8+kSP8z87oq87JC0bQmMrMxVgjaw5P5wP0YVrkITfkM
	nnZ1VTPbh8j0z63agJSvTU3qGDJIgbxbkkzIUYuoJ3b+cCcimKgFDRfJ795EkLHVvbUd
	XaShC4hFLi3XRiIGHdI4iFeD5JLX8HqQnpHEi3TVPUwrEnubpDnjEq1YNLcx0tVwQMs3
	uNO7Ikhhb30ugZRg7ShRWEp0l8K+478mz13uTN193XlQUwS0j/AK1ES82uT7akgMFMUC
	8m5uT+L1vLkHzsDQVNRwvjfwGTjqMOEoTZKLfEEvKkRlou/HVdXqMAAwjUWHZH8mRuj+
	YXUw==
X-Gm-Message-State: AJcUukfrE3okSoWRdt3IV9tJNkieWbIIXG7c87x6OCpy8IfvmT5nQBQv
	8kVT569qCAlfRk5675aZBsM2BA==
X-Google-Smtp-Source: ALg8bN6hH63OKv5Udu1tMUg1M5aQPnK4xouRJiyIPY0hcfLJUoaehiDD1sN8Psb2F5YbJ+N1V1D7ng==
X-Received: by 2002:a5d:4ccb:: with SMTP id c11mr13309745wrt.241.1547741172063;
	Thu, 17 Jan 2019 08:06:12 -0800 (PST)
Received: from [192.168.1.39] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	l14sm166375492wrp.55.2019.01.17.08.06.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Jan 2019 08:06:11 -0800 (PST)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
	qemu-trivial@nongnu.org
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>,
	Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
References: <20190117153338.11820-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <c451b6fa-b692-378f-13a4-b22c5c06f461@redhat.com>
Date: Thu, 17 Jan 2019 17:06:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190117153338.11820-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] scripts/replay-dump.py: fix
 utf-8 mangling
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
X-List-Received-Date: Thu, 17 Jan 2019 16:06:16 -0000

On 1/17/19 4:33 PM, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  scripts/replay-dump.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/replay-dump.py b/scripts/replay-dump.py
> index 5ae77c8a92..ee7fda2638 100755
> --- a/scripts/replay-dump.py
> +++ b/scripts/replay-dump.py
> @@ -3,7 +3,7 @@
>  #
>  # Dump the contents of a recorded execution stream
>  #
> -#  Copyright (c) 2017 Alex BennÃ©e <alex.bennee@linaro.org>
> +#  Copyright (c) 2017 Alex Bennée <alex.bennee@linaro.org>
>  #
>  # This library is free software; you can redistribute it and/or
>  # modify it under the terms of the GNU Lesser General Public
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

