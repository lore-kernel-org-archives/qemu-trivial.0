Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4nJ5-0007rS-Hb
	for mharc-qemu-trivial@gnu.org; Wed, 18 Oct 2017 08:18:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54238)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4nJ4-0007qd-7X
	for qemu-trivial@nongnu.org; Wed, 18 Oct 2017 08:18:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4nJ1-0004kM-2y
	for qemu-trivial@nongnu.org; Wed, 18 Oct 2017 08:18:42 -0400
Received: from mail-qt0-x236.google.com ([2607:f8b0:400d:c0d::236]:50593)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4nJ0-0004k7-Uz; Wed, 18 Oct 2017 08:18:39 -0400
Received: by mail-qt0-x236.google.com with SMTP id d9so3103326qtd.7;
	Wed, 18 Oct 2017 05:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=21Y4bXwcQdb3MNefglNTOytRenQFmz6PefSCkk8H3/M=;
	b=Sh65lWMAsGjDQ8UzoeeEn57055TaR5moPqBeHnu40yiDiERCFHELplMugGJ+JwtJ9B
	UbXAgvnozGARaYXaZm+Cx2TC8Jl9M/r3yvlZWX3iGvddgJ1DqNFpR+NY+wHn2+wBF93B
	49YZ1srcAfC8ik+8E8UOLA+EIEcmeswVVWT+f9Pm1Sv5i5+ycBj0uXOMOyk/118RSW6E
	vn8D0/pMvE1TOPK7Fu2AhF6BMdMW1sFaFt4fas1sDao1CBsjaaYTXPKWJej5/aX2SSXZ
	X8NnfP4r241V5RuVApfKTaWCfvdmacDnow5aG7FTcoNaBHMy+D3gH7Cj0O4Jwdrq6KeE
	2eXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=21Y4bXwcQdb3MNefglNTOytRenQFmz6PefSCkk8H3/M=;
	b=ml71OU9Knc18fiz9vXPVltS+ZcHF25b4rQZAMkFU/HkwCgAmq05OW0RyDlIft3pRsP
	tyXqCsw/GRFzBMnP8GbLwQebVkQxwSGxTJjND/TTZ4ir8iCbRfYRST2n2zBmeLFpMBsn
	eEUDSbzdlbLyNID1ktdWWuW9Pi2oda+FneBwY5SjoP2DX0zCLo6nSlwlkrzd5xdWos8p
	tza77csnMfUf9UondlHbT8NORfuUhbpRhiHovE5DSg9zW0YurJCS6kvggeFwgiDRMI7g
	tKyLBXmIBSM6lRXAHflQAeb1Xd0IgFaMs+lR6D9IZal0vxvik/Bt3mPGkVc7xdMUG+Ja
	ngkg==
X-Gm-Message-State: AMCzsaWY6y48nQ++HDAdN7yxyvYsw1vgDbda8NJdtExE+YwZSDE/fYm4
	WUzPAo3Tt8vSgT8xzsC+lTlp3tabkFM=
X-Google-Smtp-Source: ABhQp+SvHM5mOlzyouyVGgbL6raZJQGQWdhv9svz0TLuXw6G8HsILdSWykk4bujd8kzmn3sYW+Jufw==
X-Received: by 10.237.60.46 with SMTP id t43mr2662393qte.294.1508329118230;
	Wed, 18 Oct 2017 05:18:38 -0700 (PDT)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	i27sm4690397qtc.91.2017.10.18.05.18.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Oct 2017 05:18:37 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Thomas Huth <thuth@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>, 
	Eduardo Habkost <ehabkost@redhat.com>, Yu Ning <yu.ning@linux.intel.com>, 
	Vincent Palatin <vpalatin@chromium.org>, Corey Minyard
	<cminyard@mvista.com>, qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20171017164426.25277-1-f4bug@amsat.org>
	<20171017164426.25277-17-f4bug@amsat.org>
	<2466fbb7-ab33-26bf-9605-e5fa339abdf5@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <cd81b523-1241-83fd-e060-1b5694a64ff0@amsat.org>
Date: Wed, 18 Oct 2017 09:18:33 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <2466fbb7-ab33-26bf-9605-e5fa339abdf5@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::236
Subject: Re: [Qemu-trivial] [PATCH v3 16/42] i386/hax: remove duplicated
 include
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
X-List-Received-Date: Wed, 18 Oct 2017 12:18:43 -0000

On 10/18/2017 09:12 AM, Thomas Huth wrote:
> On 17.10.2017 18:44, Philippe Mathieu-Daudé wrote:
>> this file in include in "target/i386/hax-i386.h":
>>
>>     #ifdef CONFIG_WIN32
>>     #include "target/i386/hax-windows.h"
>>     #endif
>>
>> which guaranty than sysemu/os-win32.h is previously included (CONFIG_WIN32)
> 
> which guaranties that ... ?

Oh :(
Michael if you take the whole series, do you mind changing this
description or do you want me to respin it? (if there is no further
functional change asked).

Regards,

Phil.

