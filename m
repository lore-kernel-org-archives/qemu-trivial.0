Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e2vAd-00065d-O2
	for mharc-qemu-trivial@gnu.org; Fri, 13 Oct 2017 04:18:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53847)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <atar4qemu@gmail.com>) id 1e2vAb-00063Z-Id
	for qemu-trivial@nongnu.org; Fri, 13 Oct 2017 04:18:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <atar4qemu@gmail.com>) id 1e2vAa-0006WK-JO
	for qemu-trivial@nongnu.org; Fri, 13 Oct 2017 04:18:13 -0400
Received: from mail-it0-x241.google.com ([2607:f8b0:4001:c0b::241]:46372)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <atar4qemu@gmail.com>)
	id 1e2vAY-0006R7-14; Fri, 13 Oct 2017 04:18:10 -0400
Received: by mail-it0-x241.google.com with SMTP id f187so10396985itb.1;
	Fri, 13 Oct 2017 01:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DVSiRkL96Bbu96Mi1j0jeuwfJUV0D4pxHlONkfR0wpo=;
	b=jYSETpwhtwxyBxwqzD1hLNtiNTsC0j+0JvwB/ag4jmmXsVN6wYrbZkrwJvxz0zZEIR
	4xm4sYkqDQzX02fE3NaWQ5OMZ7NmAcYuaeeY1WpJtiOib+skLbyYJVZymDMlIa/mdnbl
	q8vYQgYYltgMBTIZm9ydoZMAi9uu0hRwcsmG5C8q0uzJf80ZLVS5RsW9qrTxBA8M7JCy
	rpjEdoHgI+d+yfqS4UnhdVG9O3m1D9hLl6wvGt/30VdeOjmtfbUtfO8P7/FO5tbpv2Sm
	HohcI6lr6+109KAuLhWqakGxLN8k8Iby9smXW2qdG9Mfm5Isefm9WD4NA7yNOKz8mrhA
	pC7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DVSiRkL96Bbu96Mi1j0jeuwfJUV0D4pxHlONkfR0wpo=;
	b=Xu3imPeQLT+Cnw4uR8Q+H7bn1PG9QRsf6EWpphJatagoocmHqWg3BeFmb0lFOccn8M
	RmgV4AXikB0JRenbRHxPRhbmP0LHC4CiLEGdJImuF4CYmgbIzQiP2ESvTRbvNaBkdlq6
	82j1oKj7PU1Et3Jxf/RrU1G03E8pihj/9Z516QFW/rQ7ZBizPnWkEAwLCXb+s0DhpXK4
	hl4sNjibgVVLpj+pK38m4DCW1EIDAJ5JsrWj6swMfoyXFF95tg9DnQVBFAm+kmZefdea
	+GEP0Forok55rjEf+hNI/M5Dg3J7kEUBCMFdO8CSKHcXorQlajw85mTHNY2OAHd2ptDu
	KaXQ==
X-Gm-Message-State: AMCzsaW3TiehYtDObAV4Yx0Q7AefJ5j5iiz9zQL/XajmP9daD0Sobr/Y
	biA4YUgRmI5WnZHy5732wU+A8w7kfcCDcQRarc4=
X-Google-Smtp-Source: ABhQp+SdoI52s9XoTeZvvqxGWAgZPBeQb8+wDgfzJYnrOSoSJ3WSxG9zMAaiNVfrvS4vfImntzdA0+TFNdVfAbAFya0=
X-Received: by 10.36.88.137 with SMTP id f131mr1359674itb.4.1507882688042;
	Fri, 13 Oct 2017 01:18:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.2.5.73 with HTTP; Fri, 13 Oct 2017 01:17:47 -0700 (PDT)
In-Reply-To: <7e611573-e25e-65cc-2222-f7d2429bf924@redhat.com>
References: <20171013012455.10737-1-famz@redhat.com>
	<20171013012455.10737-3-famz@redhat.com>
	<7e611573-e25e-65cc-2222-f7d2429bf924@redhat.com>
From: Artyom Tarasenko <atar4qemu@gmail.com>
Date: Fri, 13 Oct 2017 10:17:47 +0200
Message-ID: <CACXAS8ArkNy7J_gtT0A8pwLWfnr6EM467Y9VzPZRM3WnXYAxjw@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Fam Zheng <famz@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
	qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c0b::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] MAINTAINERS: Drop Sun4v
 nonexistent file
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
X-List-Received-Date: Fri, 13 Oct 2017 08:18:14 -0000

On Fri, Oct 13, 2017 at 10:08 AM, Thomas Huth <thuth@redhat.com> wrote:
> On 13.10.2017 03:24, Fam Zheng wrote:
>> Signed-off-by: Fam Zheng <famz@redhat.com>
>> ---
>>  MAINTAINERS | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index da3c78df47..731c5c7ec2 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -778,7 +778,6 @@ F: pc-bios/openbios-sparc64
>>  Sun4v
>>  M: Artyom Tarasenko <atar4qemu@gmail.com>
>>  S: Maintained
>> -F: hw/sparc64/sun4v.c
>
> I guess you should rather replace that one with:
>
> hw/sparc64/niagara.c
>
> Artyom, is that right?

Yes, please.

Thanks!


-- 
Regards,
Artyom Tarasenko

SPARC and PPC PReP under qemu blog: http://tyom.blogspot.com/search/label/qemu

