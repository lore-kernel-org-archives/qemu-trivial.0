Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hVeOR-0008Eu-4J
	for mharc-qemu-trivial@gnu.org; Tue, 28 May 2019 11:52:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38132)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hVeOO-0008Da-Mh
	for qemu-trivial@nongnu.org; Tue, 28 May 2019 11:52:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hVeOE-0005ST-7O
	for qemu-trivial@nongnu.org; Tue, 28 May 2019 11:51:52 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54993)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hVeOC-0005Aq-7z
	for qemu-trivial@nongnu.org; Tue, 28 May 2019 11:51:50 -0400
Received: by mail-wm1-f67.google.com with SMTP id i3so3520880wml.4
	for <qemu-trivial@nongnu.org>; Tue, 28 May 2019 08:51:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=iWgxgtGHgIxIk9YYgTAWk8eP0xu0aRMTM93yvADB+uE=;
	b=oQLGc73GWskr6zRZxTT2vmJS6vOJUAWezRkfZ5wW7XIbDZLIO4bRqgvPV3wMbCYcvS
	GC/lqQVJQUmscFqAHOjHMUS0XVoRuk/dAQVGEYnsA1P6iZwm4VulsJvLUl/EJVDRCSQI
	QO0eEbsNeD5obsnjAGHVaL6q0CHWlqD9RiegwAemF4RKc9l1FBL2p1EAbiLqRRytMVQb
	0z+AqIZAOx216OcnUwl/OTDkSx/t5MnECwZrONAdAKH/4tr4yDTTTQiQXGX7JPVJQppq
	fKxA2CdAACy3H92iTxZXNRWtuH9b5xcS2gI4CWbeF7IN9nUFkZa7zWzCGOZTP0MMfCKR
	3Q7w==
X-Gm-Message-State: APjAAAU9pAU6bEAEWjWb+WezJYzVnrnHydSevM7mSCXeCCzbSKjSjzvP
	/xF/JQNSANJyHOcpl5i4+ddC1Q==
X-Google-Smtp-Source: APXvYqw1tftMTN6rFLHyJgvUjuzFRuMuB991QBiFkCph2EXICo7CDLuf/BEyydTyVZQYKkG8hsI+Dw==
X-Received: by 2002:a7b:ce87:: with SMTP id q7mr3451713wmj.22.1559058701118;
	Tue, 28 May 2019 08:51:41 -0700 (PDT)
Received: from [192.168.1.38] (228.red-83-52-173.dynamicip.rima-tde.net.
	[83.52.173.228])
	by smtp.gmail.com with ESMTPSA id y8sm4611251wmi.8.2019.05.28.08.51.40
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 May 2019 08:51:40 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
	Markus Armbruster <armbru@redhat.com>
References: <20190528140750.28036-1-philmd@redhat.com>
	<CAFEAcA8PmF-y8-RH6gC2mZQpUdOUEfHWp0aW_hwEDFHK7+QxwA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <e51f26b7-7f81-8904-1a77-8a4bbbaf0f03@redhat.com>
Date: Tue, 28 May 2019 17:51:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8PmF-y8-RH6gC2mZQpUdOUEfHWp0aW_hwEDFHK7+QxwA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-trivial] [PATCH] hw/scsi/vmw_pvscsi: Use qbus_reset_all()
 directly
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
X-List-Received-Date: Tue, 28 May 2019 15:52:01 -0000

On 5/28/19 4:12 PM, Peter Maydell wrote:
> On Tue, 28 May 2019 at 15:08, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> Since the BusState is accesible from the SCSIBus object,
>> it is pointless to use qbus_reset_all_fn.
>> Use qbus_reset_all() directly.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> One step toward removing qbus_reset_all_fn()
>> ---
>>  hw/scsi/vmw_pvscsi.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/scsi/vmw_pvscsi.c b/hw/scsi/vmw_pvscsi.c
>> index 584b4be07e..6f571d0d19 100644
>> --- a/hw/scsi/vmw_pvscsi.c
>> +++ b/hw/scsi/vmw_pvscsi.c
>> @@ -440,7 +440,7 @@ static void
>>  pvscsi_reset_adapter(PVSCSIState *s)
>>  {
>>      s->resetting++;
>> -    qbus_reset_all_fn(&s->bus);
>> +    qbus_reset_all(&s->bus.qbus);
> 
> I thought our QOM style prefers using "BUS(&s->bus)"
> rather than looking inside the definition of the
> SCSIBus struct with "s->bus.qbus" ? (Compare preferring
> "DEVICE(s)" to "s->qdev".)

This is not explicit in HACKING/CODING_STYLE, but I agree this is
cleaner and better to treat the generic QOM objects as opaque, and use
the macros to check for the QOM type.

I'll respin.

