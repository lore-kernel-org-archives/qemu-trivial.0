Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g8Qqv-0001SF-MM
	for mharc-qemu-trivial@gnu.org; Fri, 05 Oct 2018 10:13:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51161)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g8QJI-0005lW-Fo
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2018 09:38:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g8QJB-0004zK-10
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2018 09:38:24 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45521)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1g8QJ8-0004r8-II
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2018 09:38:19 -0400
Received: by mail-wr1-f68.google.com with SMTP id q5-v6so13579477wrw.12
	for <qemu-trivial@nongnu.org>; Fri, 05 Oct 2018 06:38:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=yMAhgwQLXB4CsnYiFvctLW4TnO1J1M/2QrKsL5HgcQ4=;
	b=lQMp7aW7kTSzTJEQhRQz8dBANuBVUrDIX2KNPyR6wKDKxIHj8BrlFIDxp7u6jCFvXN
	IGq664cY/DaWCHjlF5U0L+DlyqQO68J9CzDPzgkYvbfh70N1T5+/iOgnxU0uS/OKafzX
	nbdPYqfhY/kQIItQB9SShJHba7uxrh9i0pF2pYU7RWaQ3u48ZlemfioUujcw9znx3n5+
	QBo6g6OTWlnpSSebtbEUCJEKr6O78WV7VgsVyFSfTLNijIsrNWPsg0cek3jZLpC5Ra8f
	ztqskBJxd+M0jABgETQqfVkuc88vH4yPWcdM/7CsEFNvJYX0ZDXLxMGfM9HWRy7UmZOr
	oinQ==
X-Gm-Message-State: ABuFfoipRIib3PqgU40SMn0E0m+eiKn4cES0TudN3gH1Du5NGLWRzLYK
	UHHN6Lfl9SstpFpdX+1JptfiPg==
X-Google-Smtp-Source: ACcGV61kuSQvCoIt3HTnBbg7h3oG7xecUxblnXcmn7RadVRhHdxEIvMFn6M9TjQrCxd9CWNVto3Nzw==
X-Received: by 2002:adf:9021:: with SMTP id
	h30-v6mr8717027wrh.248.1538746696140; 
	Fri, 05 Oct 2018 06:38:16 -0700 (PDT)
Received: from [192.168.2.33] (26.red-83-32-208.dynamicip.rima-tde.net.
	[83.32.208.26]) by smtp.gmail.com with ESMTPSA id
	a18sm6076627wrx.55.2018.10.05.06.38.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Oct 2018 06:38:15 -0700 (PDT)
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-block@nongnu.org, qemu-trivial@nongnu.org,
	Riku Voipio <riku.voipio@iki.fi>, Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>
References: <20181004161852.11673-1-crosa@redhat.com>
	<20181004161852.11673-5-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <23326c24-24cf-cf7b-fca7-c702765600c2@redhat.com>
Date: Fri, 5 Oct 2018 15:38:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181004161852.11673-5-crosa@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
X-Mailman-Approved-At: Fri, 05 Oct 2018 10:13:08 -0400
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 04/10] qemu-iotests: fix
 filename containing checks
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
X-List-Received-Date: Fri, 05 Oct 2018 13:38:31 -0000

On 04/10/2018 18:18, Cleber Rosa wrote:
> Commit cce293a2945 moved some functions from common.config to
> common.rc, but the error messages still reference the old file
> location.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  tests/qemu-iotests/common.rc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
> index 44bee16a5e..70ca65b49b 100644
> --- a/tests/qemu-iotests/common.rc
> +++ b/tests/qemu-iotests/common.rc
> @@ -170,7 +170,7 @@ if [ ! -e "$TEST_DIR" ]; then
>  fi
>  
>  if [ ! -d "$TEST_DIR" ]; then
> -    echo "common.config: Error: \$TEST_DIR ($TEST_DIR) is not a directory"
> +    echo "common.rc: Error: \$TEST_DIR ($TEST_DIR) is not a directory"
>      exit 1
>  fi
>  
> @@ -179,7 +179,7 @@ if [ -z "$REMOTE_TEST_DIR" ]; then
>  fi
>  
>  if [ ! -d "$SAMPLE_IMG_DIR" ]; then
> -    echo "common.config: Error: \$SAMPLE_IMG_DIR ($SAMPLE_IMG_DIR) is not a directory"
> +    echo "common.rc: Error: \$SAMPLE_IMG_DIR ($SAMPLE_IMG_DIR) is not a directory"
>      exit 1
>  fi
>  
> 

