Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gi5Sp-0006xx-7B
	for mharc-qemu-trivial@gnu.org; Fri, 11 Jan 2019 17:39:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43016)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gi5Sn-0006xm-J5
	for qemu-trivial@nongnu.org; Fri, 11 Jan 2019 17:39:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gi5Sm-0004it-AJ
	for qemu-trivial@nongnu.org; Fri, 11 Jan 2019 17:39:41 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35943)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gi5Sm-0004hl-2p
	for qemu-trivial@nongnu.org; Fri, 11 Jan 2019 17:39:40 -0500
Received: by mail-wr1-f67.google.com with SMTP id u4so16834617wrp.3
	for <qemu-trivial@nongnu.org>; Fri, 11 Jan 2019 14:39:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=5lG4puu6UttF7USBSXtlycyOQNdN4Ot2nzMKoAhXmMs=;
	b=aZqVG86QgQsJojpdQ4XIBEtpX24K2JxVmLt/kb6GZibw2ZU3dvZ2Js3l6tUK5BMOt0
	hRdD/OqpGUaC8jNAY1yQOiDuZUeNvRSVC1iR7+JTXrin33rzasVDAdTJttz1TQGSYkp1
	7IpytMthFZC2H6aXV3JnJBWK0733JBfhWDaUtP5lsAE+Y1ZvtI/AzlpeXiuYvSLLeY8d
	e7qu9Hvtd3XueAbmS07L9GX6X/7axpy51Ui89mlyajahr2PupEaFTbEQ1PHp5nYq0xf+
	0YwF+cKOvIqoVTZkxSXmtoku6JGiRuZev0zKf8M9mRwqeKn8HmPQUfe+zYYXb6vnGmw4
	4UdQ==
X-Gm-Message-State: AJcUukeDC6Z2YE/twPWYNNE/VcaRFZMGEerau1cZ10fl1c8t4lKlL1b2
	HQ97TwfE6UUU6CGF0F3S0LOcIw==
X-Google-Smtp-Source: ALg8bN7CGtSzr1sWCuEfud9oON99n70WMS90L7UBDjoKgBwHdidWprrjAFUU+IEwtk9bqypxr1uNBA==
X-Received: by 2002:a05:6000:1c8:: with SMTP id
	t8mr15570113wrx.146.1547246375867; 
	Fri, 11 Jan 2019 14:39:35 -0800 (PST)
Received: from [192.168.1.33] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	p139sm39652126wmd.31.2019.01.11.14.39.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Jan 2019 14:39:35 -0800 (PST)
To: fam@euphon.net, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, alex.bennee@linaro.org
References: <154724210898.37.4367801081630939892@2d170d368aaa>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <834ad86b-27d1-ce01-91dc-a5c939061ce9@redhat.com>
Date: Fri, 11 Jan 2019 23:39:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <154724210898.37.4367801081630939892@2d170d368aaa>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] contrib/gitdm: Fix a typo
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
X-List-Received-Date: Fri, 11 Jan 2019 22:39:42 -0000

On 1/11/19 10:28 PM, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/20190111155555.8270-1-philmd@redhat.com/
> 
> Hi,
> 
> This series seems to have some coding style problems. See output below for
> more information:
> 
> Message-id: 20190111155555.8270-1-philmd@redhat.com
> Type: series
> Subject: [Qemu-devel] [PATCH] contrib/gitdm: Fix a typo
> 
> === TEST SCRIPT BEGIN ===
> #!/bin/bash
> git config --local diff.renamelimit 0
> git config --local diff.renames True
> git config --local diff.algorithm histogram
> ./scripts/checkpatch.pl --mailback --color=always base..

I suppose Paolo expected his PR to land to upgrade patchew, and patchew
is still processing from an old queue?

> === TEST SCRIPT END ===
> 
> Updating 3c8cf5a9c21ff8782164d1def7f44bd888713384
> Switched to a new branch 'test'
> c995f5f contrib/gitdm: Fix a typo
> 
> === OUTPUT BEGIN ===
> Unknown option: color
> Usage:
> 
>     checkpatch.pl [OPTION]... [FILE]...
>     checkpatch.pl [OPTION]... [GIT-REV-LIST]
> 
> Version: 0.31
> 
> Options:
>   -q, --quiet                quiet
>   --no-tree                  run without a kernel tree
>   --no-signoff               do not check for 'Signed-off-by' line
>   --patch                    treat FILE as patchfile
>   --branch                   treat args as GIT revision list
>   --emacs                    emacs compile window format
>   --terse                    one line per report
>   -f, --file                 treat FILE as regular source file
>   --strict                   fail if only warnings are found
>   --root=PATH                PATH to the kernel tree root
>   --no-summary               suppress the per-file summary
>   --mailback                 only produce a report in case of warnings/errors
>   --summary-file             include the filename in summary
>   --debug KEY=[0|1]          turn on/off debugging of KEY, where KEY is one of
>                              'values', 'possible', 'type', and 'attr' (default
>                              is all off)
>   --test-only=WORD           report only warnings/errors containing WORD
>                              literally
>   -h, --help, --version      display this help and exit
> 
> When FILE is - read standard input.
> === OUTPUT END ===
> 
> Test command exited with code: 1
> 
> 
> The full log is available at
> http://patchew.org/logs/20190111155555.8270-1-philmd@redhat.com/testing.checkpatch/?type=message.
> ---
> Email generated automatically by Patchew [http://patchew.org/].
> Please send your feedback to patchew-devel@redhat.com
> 

