Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jblx4-0008UZ-7f
	for mharc-qemu-trivial@gnu.org; Thu, 21 May 2020 10:13:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jblx2-0008Sb-Rq
 for qemu-trivial@nongnu.org; Thu, 21 May 2020 10:13:36 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:54881
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jblx2-0004mr-5x
 for qemu-trivial@nongnu.org; Thu, 21 May 2020 10:13:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590070415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C5yv7MTDr84AsxE38fa5gtDCBjScVB7vEOFo83X48Rg=;
 b=N+LnN6/6oSFDj1he0TI1gGUP9xJ+h6Ro9GIQFoOfnTdPYQcwdOtssYqbLwAYtPbr6xq1zj
 65cVTKSKQ1aVW2Brdo+Lf1dYgJzOaH+EN0XYzJ/qKuswNr4RqLePxlIXQ50SUO/1gxWG5b
 H4r0+SE3DG34nSflMC9ETRgLuPZyzcY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-ZLt2K7NnPk2_eamFIKw0DA-1; Thu, 21 May 2020 10:13:31 -0400
X-MC-Unique: ZLt2K7NnPk2_eamFIKw0DA-1
Received: by mail-wr1-f70.google.com with SMTP id e14so2958352wrv.11
 for <qemu-trivial@nongnu.org>; Thu, 21 May 2020 07:13:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C5yv7MTDr84AsxE38fa5gtDCBjScVB7vEOFo83X48Rg=;
 b=X4u/4bUBCln7Y6Nc7850TxXIDWDlAy009q5CEQsSJIIR3xge6/u8lJSm8QLq2lmJeF
 tN9PqNSi0wspxe1Bm+MT71MmFTT/1nCTawMF5rI4c0Orr08EDHzSQZxYpFNDB+lc795x
 a8KDPjTZQHblIXqfSVY4Rbz5srTWUzy4ZSlpTOqNVeKjTbZs+xtV+ZhtrHfR1CcQHIKg
 K2WtBDRALTdG13rg4vzNaUMLMQwbA/JVQ2xd+DOdNgZYz5TAStYJDuvDg08gCGTdn3i2
 UyCp2j6LVegNyYFa9Xa2ZF1zbjXTm9dvoX1lo+UT1OGXZheWarlWWOTvyE8PhtkeAHmR
 TKVg==
X-Gm-Message-State: AOAM533bsLJ6QyvktKmjCjFg3tFjbmM2M6NGTYTI/y1JenumF6YYLn5h
 2Cbcb7Eza2DnhzUPB5nj4lV22T9nBt4GxxGviaE50pxK5ApXf63aornF7wx3FcNPsX9ufNrKVpj
 57UcWYD3i9VI54uRmeA==
X-Received: by 2002:a7b:c3da:: with SMTP id t26mr8533539wmj.146.1590070410076; 
 Thu, 21 May 2020 07:13:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgnluUCn7TsekzVgu25Z44qLNjC75uK18sZVsQGRi3dZn6ZDo3xcsfEqOW2UM7+m4pdjxE/A==
X-Received: by 2002:a7b:c3da:: with SMTP id t26mr8533520wmj.146.1590070409839; 
 Thu, 21 May 2020 07:13:29 -0700 (PDT)
Received: from [192.168.178.58] ([151.30.94.134])
 by smtp.gmail.com with ESMTPSA id w18sm6530110wro.33.2020.05.21.07.13.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2020 07:13:29 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] qom/object: Move Object typedef to
 'qemu/typedefs.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, QEMU Trivial
 <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
References: <20200504115656.6045-1-f4bug@amsat.org>
 <20200504115656.6045-2-f4bug@amsat.org> <87wo5drasi.fsf@dusky.pond.sub.org>
 <CAAdtpL4wpqv8vMOFgRubghr53fJyoXJ+DcGwi84wp0PiczyUpg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <bbbe4a93-a990-01ef-6316-1ce31dccd582@redhat.com>
Date: Thu, 21 May 2020 16:13:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAAdtpL4wpqv8vMOFgRubghr53fJyoXJ+DcGwi84wp0PiczyUpg@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/21 04:44:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
X-List-Received-Date: Thu, 21 May 2020 14:13:37 -0000

On 15/05/20 09:00, Philippe Mathieu-Daudé wrote:
> On Fri, May 15, 2020 at 8:07 AM Markus Armbruster <armbru@redhat.com> wrote:
>>
>> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
>>
>>> We use the Object type all over the place.
>>> Forward declare it in "qemu/typedefs.h".
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>>  include/qemu/typedefs.h   | 1 +
>>>  include/qom/object.h      | 2 --
>>>  include/qom/qom-qobject.h | 2 --
>>>  include/sysemu/sysemu.h   | 1 -
>>>  4 files changed, 1 insertion(+), 5 deletions(-)
>>>
>>> diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
>>> index 375770a80f..b03ec9f40a 100644
>>> --- a/include/qemu/typedefs.h
>>> +++ b/include/qemu/typedefs.h
>>> @@ -75,6 +75,7 @@ typedef struct NetFilterState NetFilterState;
>>>  typedef struct NICInfo NICInfo;
>>>  typedef struct NodeInfo NodeInfo;
>>>  typedef struct NumaNodeMem NumaNodeMem;
>>> +typedef struct Object Object;
>>>  typedef struct ObjectClass ObjectClass;
>>>  typedef struct PCIBridge PCIBridge;
>>>  typedef struct PCIBus PCIBus;
>>> diff --git a/include/qom/object.h b/include/qom/object.h
>>> index 784c97c0e1..1edc12e64c 100644
>>> --- a/include/qom/object.h
>>> +++ b/include/qom/object.h
>>> @@ -20,8 +20,6 @@
>>>  struct TypeImpl;
>>>  typedef struct TypeImpl *Type;
>>>
>>> -typedef struct Object Object;
>>> -
>>>  typedef struct TypeInfo TypeInfo;
>>>
>>>  typedef struct InterfaceClass InterfaceClass;
>>> diff --git a/include/qom/qom-qobject.h b/include/qom/qom-qobject.h
>>> index 77cd717e3f..82136e6e80 100644
>>> --- a/include/qom/qom-qobject.h
>>> +++ b/include/qom/qom-qobject.h
>>> @@ -13,8 +13,6 @@
>>>  #ifndef QEMU_QOM_QOBJECT_H
>>>  #define QEMU_QOM_QOBJECT_H
>>>
>>> -#include "qom/object.h"
>>> -
>>>  /*
>>>   * object_property_get_qobject:
>>>   * @obj: the object
>>> diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
>>> index ef81302e1a..ca4458e451 100644
>>> --- a/include/sysemu/sysemu.h
>>> +++ b/include/sysemu/sysemu.h
>>> @@ -5,7 +5,6 @@
>>>  #include "qemu/timer.h"
>>>  #include "qemu/notify.h"
>>>  #include "qemu/uuid.h"
>>> -#include "qom/object.h"
>>>
>>>  /* vl.c */
>>
>> How did you identify the inclusions to drop?
> 
> Nothing very strict I'm afraid. I suppose I had the files opened in my editor.

Looks like all of these are affected:

 accel/accel.c             | 1 -
 block/throttle-groups.c   | 1 -
 hw/audio/soundhw.c        | 1 -
 hw/block/vhost-user-blk.c | 1 -
 hw/pci-host/pam.c         | 1 -
 hw/ppc/spapr_drc.c        | 1 -
 hw/scsi/vhost-user-scsi.c | 1 -
 include/hw/display/edid.h | 1 -
 include/hw/misc/pvpanic.h | 1 -
 include/hw/timer/hpet.h   | 1 -
 io/task.c                 | 1 -
 memory.c                  | 1 -
 stubs/qmp_memory_device.c | 1 -
 target/arm/kvm.c          | 1 -
 tests/test-io-task.c      | 1 -

Patch 3 doesn't apply anymore, I queued the first two.

Paolo


