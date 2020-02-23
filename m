Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j5nCJ-0000vY-G9
	for mharc-qemu-trivial@gnu.org; Sun, 23 Feb 2020 04:05:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49111)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1j5nCH-0000s5-6n
 for qemu-trivial@nongnu.org; Sun, 23 Feb 2020 04:05:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1j5nCG-0000U8-Bc
 for qemu-trivial@nongnu.org; Sun, 23 Feb 2020 04:05:09 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:21935
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1j5nCG-0000Tm-8H
 for qemu-trivial@nongnu.org; Sun, 23 Feb 2020 04:05:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582448707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9+qfRDJ631+3BrpIbQmZINXk2gQQnyP0CW4SShz+z8s=;
 b=LfySfidLHfJ0fBl48Hqbn34lTGJWUw7y19PRxgLAOiVPQ7fPm2ibBh3L78cxg/uavG9YIc
 7k4R87okHcZl+myXlSwXjTIJj5fTAHybDZBjHP2D7uZ9q3cPRwwOZHY10+bA21BE/AVI8D
 dU24LzuAPNrGyedv5RFZOx1icnjCDcE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-8o4tmaVQMIaDVsOdEPfMXg-1; Sun, 23 Feb 2020 04:05:04 -0500
X-MC-Unique: 8o4tmaVQMIaDVsOdEPfMXg-1
Received: by mail-wr1-f72.google.com with SMTP id d15so3720010wru.1
 for <qemu-trivial@nongnu.org>; Sun, 23 Feb 2020 01:05:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9+qfRDJ631+3BrpIbQmZINXk2gQQnyP0CW4SShz+z8s=;
 b=tscrsp3yaR/kxR9T5xt9DVdtGTCJCEn8QX1Rg+a0sct9Jrr8G7/w/fW2Mr2TuHJbz2
 qD7sU8jMAGmtwlM6qr4nzVR/oyxXxndZAeC7HJm13vehvTihI71wou1HeY3E2/uAS7rN
 WwxzMq8Kc9jYd09nzS9EUYYiQtwYusZZyYXJbs78MIdzD0Kk5RR9bflsBMAxbBZSVCbE
 FzyUH3o6RjU4cxnbhXOOUKxmgcon9GpA2ZoC2rG5CMnv5Guai7rFyRd49HBydUDDLE4l
 3dmztft7xBdybHnVxnvssHejOYgbh66rWWmNzoHyVFI18mBwUYeUw8i1tH0GISRL8BZS
 BHDQ==
X-Gm-Message-State: APjAAAVmyJOIt1HDF7LSpI2wDlV6Fo8U5eT/s8+Vdesc9e9EFgpkCOSw
 zgGpuDhw4ADXhB4ueYm/8OKvg8TPS/4WCBxXnXzp9v2wjljHmRkoUbDZkvapoPZ9gFB7uXiPH77
 ui6cIQfJjT3ubZ9XXBw==
X-Received: by 2002:a7b:c416:: with SMTP id k22mr15868211wmi.10.1582448703172; 
 Sun, 23 Feb 2020 01:05:03 -0800 (PST)
X-Google-Smtp-Source: APXvYqyITY7Qxt5lA0/QWLVp60oNQOPXzXfoCcVMOHbTs40SM+MbNUVweR2hRsFcxTU3r5XAUUkhWg==
X-Received: by 2002:a7b:c416:: with SMTP id k22mr15868151wmi.10.1582448702893; 
 Sun, 23 Feb 2020 01:05:02 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:ec41:5e57:ff4d:8e51?
 ([2001:b07:6468:f312:ec41:5e57:ff4d:8e51])
 by smtp.gmail.com with ESMTPSA id o2sm12051784wmh.46.2020.02.23.01.04.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Feb 2020 01:05:02 -0800 (PST)
Subject: Re: [PATCH v3 2/3] hw: Make MachineClass::is_default a boolean type
To: "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Anthony Green <green@moxielogic.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <rth@twiddle.net>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Michael Walle <michael@walle.cc>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Chris Wulff <crwulff@gmail.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, Marek Vasut <marex@denx.de>,
 Jia Liu <proljc@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Thomas Huth <huth@tuxfamily.org>, Magnus Damm <magnus.damm@gmail.com>
References: <20200207130453.16666-1-philmd@redhat.com>
 <20200207130453.16666-3-philmd@redhat.com>
 <20200207091138-mutt-send-email-mst@kernel.org>
 <16ec9b38-94e4-bd2d-a47f-83a27289ab47@vivier.eu>
 <20200207092450-mutt-send-email-mst@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9dfd96b4-e924-5803-2d8b-182458fc936b@redhat.com>
Date: Sun, 23 Feb 2020 10:04:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20200207092450-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 23 Feb 2020 09:05:10 -0000

On 07/02/20 15:25, Michael S. Tsirkin wrote:
>>>> @@ -841,7 +841,7 @@ static void sun4v_class_init(ObjectClass *oc, void *data)
>>>>      mc->desc = "Sun4v platform";
>>>>      mc->init = sun4v_init;
>>>>      mc->block_default_type = IF_IDE;
>>>> -    mc->max_cpus = 1; /* XXX for now */
>>>> +    mc->max_cpus = true; /* XXX for now */
>>
>> and here ^^
>>
>> Thanks,
>> Laurent
> 
> Ooh good catch. Which probably means we don't have a unit test for these

"= true" just becomes "= 1".

Paolo


