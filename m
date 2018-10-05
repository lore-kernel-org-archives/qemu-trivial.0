Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g8Qqs-0001QV-1s
	for mharc-qemu-trivial@gnu.org; Fri, 05 Oct 2018 10:13:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52107)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g8QLz-0007Um-T6
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2018 09:41:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g8QLt-0008Ui-4A
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2018 09:41:13 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51391)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1g8QLr-0008SO-OE
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2018 09:41:08 -0400
Received: by mail-wm1-f65.google.com with SMTP id 143-v6so1918750wmf.1
	for <qemu-trivial@nongnu.org>; Fri, 05 Oct 2018 06:41:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=yMFoT2r+98BieUpffSPWLG5YlUjKH2sVlmG/LElcqfg=;
	b=sTSrKqOf2o4ALN2F1UloLTPdWLR4i9PlUSYAlqQPWqsJNh1EDfJM7jFGZkPPYlaFpt
	QBlYTbGnE8wXFSLhz6Ch3hRDCX6lj0+PJIqyQlmZlySVWucqzO/vSGPEitLvTdyuq8R5
	uaL2SZHwPV8s9Nla6lD1iSxZWu2SG0ojj4Yrz0zFnBKxm1GrQPZ7b6hgncNJCSZ1Z9QD
	webB03YaDOLqQ4yxe5jQSax3CjP6jGIVB+zd+tFU9S6/cT9JyMupgEzz2jrQIfs+ldAA
	mhmJI6OrwG+lGMCoXE7DlGM41Oz7B4f82xCjMiYU44SkRXjUzAFqYdQWQ6hEnPv4IY8f
	uUFg==
X-Gm-Message-State: ABuFfogIqYSIPSA2M7NZfwILaQUbeGqYgjwmO9mfQysq5Nn3OdiytBP3
	0vTOfR471eiawdHW6NdGo3qeYQ==
X-Google-Smtp-Source: ACcGV60i/aT3qwzKKI1pM9O/QOdar/XBhS06s/DD8juMFv2Cis5diiz7XmYJhgSJhJ3ICThFepcJYQ==
X-Received: by 2002:a1c:48d:: with SMTP id
	135-v6mr7681036wme.102.1538746864913; 
	Fri, 05 Oct 2018 06:41:04 -0700 (PDT)
Received: from [192.168.2.33] (26.red-83-32-208.dynamicip.rima-tde.net.
	[83.32.208.26]) by smtp.gmail.com with ESMTPSA id
	a18sm6084904wrx.55.2018.10.05.06.41.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Oct 2018 06:41:04 -0700 (PDT)
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-block@nongnu.org, qemu-trivial@nongnu.org,
	Riku Voipio <riku.voipio@iki.fi>, Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>
References: <20181004161852.11673-1-crosa@redhat.com>
	<20181004161852.11673-11-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ddd4724b-5987-b80a-7bd4-18fceb6b1fd5@redhat.com>
Date: Fri, 5 Oct 2018 15:41:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181004161852.11673-11-crosa@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.65
X-Mailman-Approved-At: Fri, 05 Oct 2018 10:13:08 -0400
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 10/10] scripts/qemu.py:
 remove trailing quotes on docstring
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
X-List-Received-Date: Fri, 05 Oct 2018 13:41:16 -0000

On 04/10/2018 18:18, Cleber Rosa wrote:
> Signed-off-by: Cleber Rosa <crosa@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  scripts/qemu.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/qemu.py b/scripts/qemu.py
> index 7abe26de69..676eb9709a 100644
> --- a/scripts/qemu.py
> +++ b/scripts/qemu.py
> @@ -88,7 +88,7 @@ class QEMUMachine(object):
>          @param name: prefix for socket and log file names (default: qemu-PID)
>          @param test_dir: where to create socket and log file
>          @param monitor_address: address for QMP monitor
> -        @param socket_scm_helper: helper program, required for send_fd_scm()"
> +        @param socket_scm_helper: helper program, required for send_fd_scm()
>          @note: Qemu process is not started until launch() is used.
>          '''
>          if args is None:
> 

