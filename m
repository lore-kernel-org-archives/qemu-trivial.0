Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1geyvj-00015t-I9
	for mharc-qemu-trivial@gnu.org; Thu, 03 Jan 2019 04:04:43 -0500
Received: from eggs.gnu.org ([208.118.235.92]:50098)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1geyvh-00015H-Nc
	for qemu-trivial@nongnu.org; Thu, 03 Jan 2019 04:04:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1geyvd-0008N2-Hs
	for qemu-trivial@nongnu.org; Thu, 03 Jan 2019 04:04:41 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38105)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1geyvd-0008MT-BE
	for qemu-trivial@nongnu.org; Thu, 03 Jan 2019 04:04:37 -0500
Received: by mail-wm1-f68.google.com with SMTP id m22so29775295wml.3
	for <qemu-trivial@nongnu.org>; Thu, 03 Jan 2019 01:04:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=KvakvV+2+VDXuW/vxtMj2uIVOm3FdQUNWpKh6SxSf8Y=;
	b=CY1xiC5KQIX1r5a09R9jgJR3nigp8b4FTtHE3nPBwg2i7sBR0HE95v5oe0ssBgXSty
	5Sy+ECZsGvUiW966UYXIrsqfwQSRG8W6J8CPqLlzw9Z5NxkpQ4H1miQyOtvUOMXSKDpY
	pPNT6xHT91i/F4k4NnwSb/WXf90I4QuhOzEZEKIVOV3K0JFx9jYQQsDwNotdv0/EJyN8
	mdTlbpKg7H4C1C3MxnaYU6QTaL+xnNHkeyhsoA7DmhQreChS5UQlEYsC3Yyyq0CoSNeT
	BGMM2n+1Ori3c+NDlv5B3vg1Bsc+o237OuxboT4Chms7yR20zCXMYwsjQzSKmKRTb83R
	oGNA==
X-Gm-Message-State: AA+aEWZbYDmFJzgVX6AL+WZ9tSdCZO3P2RVsWeTOQc491vL+5rGM6Q4m
	bgy5WUTikVxhzZq9EK5h9E7yfw==
X-Google-Smtp-Source: AFSGD/X2QBwCYI5CCDpiei/fIX+hgC3OO63DNPk6UFa6p1T023b68LUjWvs+CDHsay8Emnwy35ad9w==
X-Received: by 2002:a1c:6707:: with SMTP id b7mr37161858wmc.138.1546506276274; 
	Thu, 03 Jan 2019 01:04:36 -0800 (PST)
Received: from [192.168.1.33] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	t12sm50717943wrr.65.2019.01.03.01.04.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Jan 2019 01:04:35 -0800 (PST)
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Cc: fam@euphon.net, david@redhat.com, qemu-trivial@nongnu.org,
	cohuck@redhat.com, armbru@redhat.com, mdroth@linux.vnet.ibm.com,
	kraxel@redhat.com, pbonzini@redhat.com
References: <154645087925.9907.8533035759502851896@02a1dbf831e2>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <e122954c-760c-47ac-3858-1c25e0b2f9ff@redhat.com>
Date: Thu, 3 Jan 2019 10:04:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <154645087925.9907.8533035759502851896@02a1dbf831e2>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/3] cutils: Cleanup,
 improve documentation
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
X-List-Received-Date: Thu, 03 Jan 2019 09:04:42 -0000

On 1/2/19 6:41 PM, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/20181226171538.21984-1-philmd@redhat.com/
[...]> === OUTPUT BEGIN ===
> Checking PATCH 1/3: util/cutils: Move size_to_str() from "qemu-common.h" to "cutils.h"...
> WARNING: Block comments use a leading /* on a separate line
> #42: FILE: include/qemu/cutils.h:160:
> +/**

I believe this warning is incorrect, since we use the /** marking for
Doxygen generated documentation. The offending comment is:

  /**
   * size_to_str:
   *
   * Return human readable string for size @val.
   * Use IEC binary units like KiB, MiB, and so forth.
   *
   * @val: The value to format.
   *       Can be anything that uint64_t allows (no more than "16 EiB").
   *
   * Caller is responsible for passing it to g_free().
   */
   char *size_to_str(uint64_t val);

Am I missing something?

> Checking PATCH 2/3: util/cutils: Move ctype macros to "cutils.h"...
> WARNING: Block comments use a leading /* on a separate line
> #100: FILE: include/qemu/cutils.h:6:
> +/** unsigned ctype macros:
> 
> ERROR: code indent should never use tabs
> #108: FILE: include/qemu/cutils.h:14:
> +#define qemu_isalnum(c)^I^Iisalnum((unsigned char)(c))$

OK, this is code movement I forgot to fix :/

> Checking PATCH 3/3: util/cutils: Move function documentations to the header...
> WARNING: Block comments use a leading /* on a separate line
> #73: FILE: include/qemu/cutils.h:156:
> +/**
> 
> WARNING: Block comments use a leading /* on a separate line
> #95: FILE: include/qemu/cutils.h:179:
> +/**
> 
> WARNING: Block comments use a leading /* on a separate line
> #124: FILE: include/qemu/cutils.h:208:
> +/**
> 
> WARNING: Block comments use a leading /* on a separate line
> #154: FILE: include/qemu/cutils.h:238:
> +/**
> 
> WARNING: Block comments use a leading /* on a separate line
> #183: FILE: include/qemu/cutils.h:267:
> +/**
> 
> WARNING: Block comments use a leading /* on a separate line
> #214: FILE: include/qemu/cutils.h:298:
> +/**
> 
> WARNING: Block comments use a leading /* on a separate line
> #225: FILE: include/qemu/cutils.h:309:
> +/**
> 
> WARNING: Block comments use a leading /* on a separate line
> #235: FILE: include/qemu/cutils.h:319:
> +/**
> 
> WARNING: Block comments use a leading /* on a separate line
> #263: FILE: include/qemu/cutils.h:347:
> +/**
> 
> WARNING: Block comments use a leading /* on a separate line
> #273: FILE: include/qemu/cutils.h:357:
> +/**
> 
> WARNING: Block comments use a leading /* on a separate line
> #304: FILE: include/qemu/cutils.h:388:
> +/**

