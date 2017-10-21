Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e5lQt-0003t5-52
	for mharc-qemu-trivial@gnu.org; Sat, 21 Oct 2017 00:30:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53847)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e5lQq-0003rE-77
	for qemu-trivial@nongnu.org; Sat, 21 Oct 2017 00:30:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e5lQn-00086W-2Q
	for qemu-trivial@nongnu.org; Sat, 21 Oct 2017 00:30:44 -0400
Received: from mail-qk0-x22b.google.com ([2607:f8b0:400d:c09::22b]:49059)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e5lQm-00086J-Q9; Sat, 21 Oct 2017 00:30:40 -0400
Received: by mail-qk0-x22b.google.com with SMTP id d67so16622799qkg.5;
	Fri, 20 Oct 2017 21:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=IpSTxA1Ku1QxGNKnM6IhwgkO/cxKPt6ukVKwT5Wo8aA=;
	b=BvagIb8c5SVFjrag6HRaxbTqYeDsRUD4IyNiBpkjUHp3mfbSh/K1PCWJbsLLt6vdeF
	hWrZvFo3IEgzMOIId65nNKqnYQ6+PwMMQcm/+2y6GIKhflcqCy30ff66eAvSAYun0GU2
	XGPZZnVwbgmHENObgeSh1glTHvrrniDUP2rPRr5zzYru73nhiqyDnhNfxgLxwsrkG5gG
	H9TohL42ZGFGIqS2169wSij3v+H0mS4zMnv+g66f6YHVfSvOK6esOF8PtjuoycjHKseX
	Agd9J9IjKA/GOaaSSfKo5Z2g6KE94jnfS+su/AdnwOo8a9AZpSyaZC+5m/bVDcZv+vEd
	sNUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=IpSTxA1Ku1QxGNKnM6IhwgkO/cxKPt6ukVKwT5Wo8aA=;
	b=W5RURxjCosYMDpJ6R4INgGQQczEXW+f1gsUw1anH22x99dZItUZ8jSPX6urbF/qlr8
	SSZ1vsN8+R8N1ObguHC/o5IwlsRz3BXJLmW9bM/+V9af++vfHQi9oYKPSI3ML7tzyczL
	Q8/KAQ/eSdiCLbKAojeZNJJuXV8qLRs7l/lk5v+ARLA8rS0ctr3vME8K38Ijco4A6kBJ
	y8nxXJQtHF21Cgm1Yuf6zZ99AaWwm2CVe1F4RWpRKtu8UWCoGwDRcxempm1DdL795tUJ
	0zrRPgJ4zRr4FEPWLmSAXlJ5YPvyIPAuVQriuBylGs3BpmZRnyP0LDXPgIhE065MeSIi
	w99g==
X-Gm-Message-State: AMCzsaUOfm83F8Gugf6ne4PzFjUOSMJoApcIlKALGIDRcp4gK0iKhhN8
	9BAHeal+pyJCnKyj4ijmlg4=
X-Google-Smtp-Source: ABhQp+RPvZDYEYNFqpxAqoDLG1ZXmc7GI2SJEsTfR39HggE4eqIs59ZFoebJFWHyamwmvmrbB6ePFg==
X-Received: by 10.55.139.70 with SMTP id n67mr10083410qkd.275.1508560240132;
	Fri, 20 Oct 2017 21:30:40 -0700 (PDT)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	u48sm1623936qtk.77.2017.10.20.21.30.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Oct 2017 21:30:39 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org, paul.burton@mips.com
Cc: famz@redhat.com, paul.burton@imgtec.com, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, laurent@vivier.eu, yongbok.kim@imgtec.com,
	yongbok.kim@mips.com
References: <150855120694.473.13335991458621172469@b58463cdfd5f>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <d32486cc-434a-d6f6-4b1b-b023ad2f4f06@amsat.org>
Date: Sat, 21 Oct 2017 01:30:34 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <150855120694.473.13335991458621172469@b58463cdfd5f>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22b
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Update Paul Burton's email
 address
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
X-List-Received-Date: Sat, 21 Oct 2017 04:30:45 -0000

On 10/20/2017 11:00 PM, no-reply@patchew.org wrote:
> 
> This series failed build test on s390x host. Please find the details below.
> 
> Message-id: 20171020232114.5475-1-paul.burton@mips.com
> Subject: [Qemu-devel] [PATCH] Update Paul Burton's email address
[...]
> === OUTPUT BEGIN ===
[...]
>   CC      mips64-softmmu/memory.o
>   CC      mips64-softmmu/memory_mapping.o
>   CC      mips64el-softmmu/dump.o
> /var/tmp/patchew-tester-tmp-rj_bg3a1/src/rules.mak:66: recipe for target 'memory_mapping.o' failed
> make[1]: *** [memory_mapping.o] Error 1
> make[1]: *** Waiting for unfinished jobs....
>   CC      microblaze-softmmu/accel/tcg/cpu-exec-common.o
> /var/tmp/patchew-tester-tmp-rj_bg3a1/src/rules.mak:66: recipe for target 'accel/tcg/cpu-exec-common.o' failed
> make[1]: *** [accel/tcg/cpu-exec-common.o] Error 1
> make[1]: *** Waiting for unfinished jobs....
>   CC      mips64el-softmmu/migration/ram.o
>   CC      mips64el-softmmu/accel/accel.o
> /var/tmp/patchew-tester-tmp-rj_bg3a1/src/rules.mak:66: recipe for target 'dump.o' failed
> make[1]: *** [dump.o] Error 1
> make[1]: *** Waiting for unfinished jobs....
> /var/tmp/patchew-tester-tmp-rj_bg3a1/src/rules.mak:66: recipe for target 'memory.o' failed
> make[1]: *** [memory.o] Error 1
> Makefile:374: recipe for target 'subdir-mips64-softmmu' failed
> make: *** [subdir-mips64-softmmu] Error 2
> Makefile:374: recipe for target 'subdir-mips64el-softmmu' failed
> make: *** [subdir-mips64el-softmmu] Error 2

Your patch broke the MIPS build !#@$ :D :D :D :P

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

