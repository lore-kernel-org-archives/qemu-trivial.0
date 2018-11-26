Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRL1Y-0003JL-3U
	for mharc-qemu-trivial@gnu.org; Mon, 26 Nov 2018 12:50:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36734)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gRL1T-0003J7-9u
	for qemu-trivial@nongnu.org; Mon, 26 Nov 2018 12:50:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gRL1Q-0003iz-6U
	for qemu-trivial@nongnu.org; Mon, 26 Nov 2018 12:50:15 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:34389)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gRL1Q-0003iK-0x
	for qemu-trivial@nongnu.org; Mon, 26 Nov 2018 12:50:12 -0500
Received: by mail-wm1-f65.google.com with SMTP id y185so13075984wmd.1
	for <qemu-trivial@nongnu.org>; Mon, 26 Nov 2018 09:50:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=12c8da+w1/HmKURotRyCNKYc0RsXRgEbN8iz5sNhDCo=;
	b=gT74VKRfZ7yf6Ao0D+YAfW/gsprigGWPKXgERxHIQkHGXpB3JkYhPh9uddURB1GIjU
	MaW+AdNzXX7owj8lnpeQaIdsBZzLMHVZCDt9irwTXI2yxskbVkbKeUwSqAUYZZLD2BvC
	IkX8JvFGtIYeaKorCIAQX7VN+8/BOjv2b9S0jinwl1nbpLTPi3Mh4owXjPS+RGiV752o
	WZUBc8di5sYutT0/v1X8DYrW+D6v7LJFmXbWjBAbs4WbyrywYZt0nplJW259IrASE0Uq
	2jelD0nT5a6/2r1ezj+I5qvR0chXRbBxCkmqg6/3iZdqRsEFfwXFXpYPTxbGcWdW4dIM
	kEtQ==
X-Gm-Message-State: AGRZ1gLgvG370XRgJoBh2wIKfdsdG0FDuomp4Q1WhO5ED5UYjdDllRV2
	0fxZBpRENVDk+CywJ3uJLbWSdA==
X-Google-Smtp-Source: AJdET5f+Xo35kTBfJ47bSJrlHnFrDsaNdd0JvG+jM/3G0bOJUx59tWpJooUMYXW8OR1Mda1NIzvvYw==
X-Received: by 2002:a7b:c0d2:: with SMTP id s18mr26455307wmh.66.1543254610974; 
	Mon, 26 Nov 2018 09:50:10 -0800 (PST)
Received: from ?IPv6:2a01:e35:8a1f:dc10:bc9e:f614:2d6b:7cc9?
	([2a01:e35:8a1f:dc10:bc9e:f614:2d6b:7cc9])
	by smtp.gmail.com with ESMTPSA id
	a17sm1304923wrs.58.2018.11.26.09.49.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Nov 2018 09:49:50 -0800 (PST)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Thomas Huth <thuth@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20181125205000.10324-1-philmd@redhat.com>
	<20181125205000.10324-11-philmd@redhat.com>
	<40c0e94b-687c-aaba-9d29-9ecdcbad937d@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <2a9cf123-f677-3bdd-efeb-08c895a6243c@redhat.com>
Date: Mon, 26 Nov 2018 18:49:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <40c0e94b-687c-aaba-9d29-9ecdcbad937d@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-3.1 10/25] MAINTAINERS:
 Add missing entries for the sun4u machines
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
X-List-Received-Date: Mon, 26 Nov 2018 17:50:16 -0000

On 26/11/18 18:05, Mark Cave-Ayland wrote:
> On 25/11/2018 20:49, Philippe Mathieu-Daudé wrote:
> 
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  MAINTAINERS | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index ba9cd9ac2b..d9cddb0cc8 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1019,6 +1019,10 @@ Sun4u
>>  M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>  S: Maintained
>>  F: hw/sparc64/sun4u.c
>> +F: hw/sparc64/sun4u_iommu.c
>> +F: include/hw/sparc/sun4u_iommu.h
>> +F: hw/pci-host/sabre.c
>> +F: include/hw/pci-host/sabre.h
>>  F: pc-bios/openbios-sparc64
> 
> These are correct, however you also want to add the simba PCI bridges i.e.
> 
> F: hw/pci-bridge/simba.c
> F: include/hw/pci-bridge/simba.h

OK, will update.

> 
> So with that:
> 
> Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Thanks!

Phil.

