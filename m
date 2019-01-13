Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gihsT-0002rG-JB
	for mharc-qemu-trivial@gnu.org; Sun, 13 Jan 2019 10:40:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54020)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1gihsR-0002qv-MB
	for qemu-trivial@nongnu.org; Sun, 13 Jan 2019 10:40:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1gihsQ-00016U-Hd
	for qemu-trivial@nongnu.org; Sun, 13 Jan 2019 10:40:43 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37909)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1gihsQ-00015D-AC
	for qemu-trivial@nongnu.org; Sun, 13 Jan 2019 10:40:42 -0500
Received: by mail-wm1-f68.google.com with SMTP id m22so6572182wml.3
	for <qemu-trivial@nongnu.org>; Sun, 13 Jan 2019 07:40:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=WRtvjYw0QV46nvL0DWRd7+BBNKBdX7kyKkjCv9V48vs=;
	b=LAk1M53LwebpbGJ611JTVUKKI0+depi5X6xuG1suFzxcz3mMDFpAc33scDT+vjRrL9
	8kUyeAtfgVlo+TNgjw6YcsccRyGRD3AQxhnUL07/Dthi5qV+MgP6/gWMilGng7Uqidhn
	/Jr8mM9vDR34KTEsJMA5vUojY15feEzlXMg1BOG9DmXKTaCiHUWwXghZX4apTULdMDaH
	jqsZrDpCRfvnjVon9uiCP3ykwy3hdRG7cZNZStrY8YfJr9I/3mQl+1VNO0ND9knmdT1C
	BmKZ3w8BuK+5vmz2IRJcr+PX557Ret2tpITGlAyCnoJsOcm/sca7r7GhMMUB+MrzSbzp
	UpTA==
X-Gm-Message-State: AJcUukdakUsTDxUeLSMsDH6gsxFS5Eku7ce5jVPW86+vHaAoLrjl6mZY
	HHrPjimgGEB+rhMIDAndN5AqMA==
X-Google-Smtp-Source: ALg8bN4rgFLtYZ92xPeXi0/dZcfq5GOAcQV3Veml/V83jabUg7Jx/2sZoC+GuAids3FnkZPjyZ9jkg==
X-Received: by 2002:a1c:414:: with SMTP id 20mr8888590wme.67.1547394038857;
	Sun, 13 Jan 2019 07:40:38 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:f495:32e1:bdf:4edb?
	([2001:b07:6468:f312:f495:32e1:bdf:4edb])
	by smtp.gmail.com with ESMTPSA id
	t70sm39790468wmd.36.2019.01.13.07.40.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 13 Jan 2019 07:40:38 -0800 (PST)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>, fam@euphon.net
Cc: qemu-trivial@nongnu.org, alex.bennee@linaro.org, qemu-devel@nongnu.org
References: <154724210898.37.4367801081630939892@2d170d368aaa>
	<834ad86b-27d1-ce01-91dc-a5c939061ce9@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <14d1bd7f-caa5-ded6-21f4-b9fa6c0e03a7@redhat.com>
Date: Sun, 13 Jan 2019 16:40:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <834ad86b-27d1-ce01-91dc-a5c939061ce9@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
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
X-List-Received-Date: Sun, 13 Jan 2019 15:40:45 -0000

On 11/01/19 23:39, Philippe Mathieu-Daudé wrote:
> On 1/11/19 10:28 PM, no-reply@patchew.org wrote:
>> Patchew URL: https://patchew.org/QEMU/20190111155555.8270-1-philmd@redhat.com/
>>
>> Hi,
>>
>> This series seems to have some coding style problems. See output below for
>> more information:
>>
>> Message-id: 20190111155555.8270-1-philmd@redhat.com
>> Type: series
>> Subject: [Qemu-devel] [PATCH] contrib/gitdm: Fix a typo
>>
>> === TEST SCRIPT BEGIN ===
>> #!/bin/bash
>> git config --local diff.renamelimit 0
>> git config --local diff.renames True
>> git config --local diff.algorithm histogram
>> ./scripts/checkpatch.pl --mailback --color=always base..
> I suppose Paolo expected his PR to land to upgrade patchew, and patchew
> is still processing from an old queue?
> 

Yeah, patchew was still processing tags that didn't have my PR applied.

Anyhow, I'll hijack this to note that now:

1) The test script for checkpatch is now much simple, compare
https://patchew.org/QEMU/20190103085638.17600-1-philmd@redhat.com/ (old)
to https://patchew.org/QEMU/20190109110144.18633-1-stefanha@redhat.com/
(new).  Improvement of "cut and paste" ability was a nice side effect of
the new TAP-based "make check", and this goes in the same direction.

2) Patchew is showing colored output---for now only for checkpatch. :)
More precisely, output is captured from a PTY, via script(1).  This
turned out to be a bit more tricky than I expected (script doesn't like
having its stdin redirected from /dev/null), but it's fixed now.

3) I bumped the tester from -j8 to -j14, hoping that the queue will be
smaller, and temporarily deployed a second tester on my own workstation.
 This in turn caused some issues because pulling a git repo with 12000
tags is not for the faint of heart, but everything should be running
normally now and future deployments will optimize this (check
https://patchew.org/Patchew/ to see the issues).

Paolo

