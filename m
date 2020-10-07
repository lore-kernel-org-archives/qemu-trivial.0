Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kQ40u-0006gb-Hr
	for mharc-qemu-trivial@gnu.org; Wed, 07 Oct 2020 03:37:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kQ40t-0006et-65
 for qemu-trivial@nongnu.org; Wed, 07 Oct 2020 03:37:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kQ40q-000372-Lg
 for qemu-trivial@nongnu.org; Wed, 07 Oct 2020 03:37:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602056243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YzrSgfxp6vjMPRr6JpN6S3U5ikBim9yiDhRmMSDSY0Y=;
 b=MEDCjhyONex9dUuUJDcsKEjFJsE6gs6mSI6HtxJftPQtjjmM+ZmsKw/xZyMgLfIldSPk+n
 0N/7L7cIiK/R1FM8I7Mem+E8taYGdUMVuRoO5+MXQJVRsHan0se3PKkqbamSUgpUHUTTj+
 ww6ATY8tJBvZbNsZMXntYXvSscK2+HM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-15jIoNHENBimQXmKG97Ihg-1; Wed, 07 Oct 2020 03:37:22 -0400
X-MC-Unique: 15jIoNHENBimQXmKG97Ihg-1
Received: by mail-wm1-f71.google.com with SMTP id z7so218480wmi.3
 for <qemu-trivial@nongnu.org>; Wed, 07 Oct 2020 00:37:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YzrSgfxp6vjMPRr6JpN6S3U5ikBim9yiDhRmMSDSY0Y=;
 b=pwQnr6vDDJ9fyjv0hTZ0pF2ZAiF1efudRnXW/UUBWr/YxYWyxNXccd/Ixj6m+l47nO
 RlkTCCobuEAKFYKcLkUb0Uyy+sumMgrLGx0TBc8Xn+DTXzkBDkyxNlX2xmOJWozxVkQ4
 cU/qogncys/rMpMV9c3DRLGAcCPGgy3r5jQ45uXArwSh2Ddax/BGu6Gfa/jALiEDZPWe
 gDR/4Pfcy4OxZlWjoRtZF3nfk5/E2bIIxBoa5VAFkjkwVGTc1wBqJQwXBvtt1DDqdyTF
 Q6sVZShKP9cQEBjK1B+hkWVUSaZ9uTFVyDkuPLsFeFlEkqfh0Aa/+L8186M06aIjcJ3r
 27rw==
X-Gm-Message-State: AOAM530SIXRGR1MGDTfgY4ko0zYcKojB/sptHKTe96AJNsvp4Je4lZi9
 WcFIR5waz3XXWkbXYkr1OVQV6d7Pk/PN4jMxx026ysjgouNPw6Sfms0p78mqlJP7517qqM/46KT
 H/HADj8myHf5y3qBsHA==
X-Received: by 2002:a1c:238e:: with SMTP id j136mr1769702wmj.176.1602056240802; 
 Wed, 07 Oct 2020 00:37:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+uGzaUWTBuL4/lSb+EYrjjLPG9W8AJY7asTIMQJcltmutM9SllGYyLkKozAAmcKGS/lEc+Q==
X-Received: by 2002:a1c:238e:: with SMTP id j136mr1769687wmj.176.1602056240541; 
 Wed, 07 Oct 2020 00:37:20 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:d2f4:5943:190c:39ff?
 ([2001:b07:6468:f312:d2f4:5943:190c:39ff])
 by smtp.gmail.com with ESMTPSA id c14sm1582704wrv.12.2020.10.07.00.37.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2020 00:37:19 -0700 (PDT)
Subject: Re: [PATCH] qom: fix objects with improper parent type
To: snizovtsev@gmail.com, "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <CAHOaf96qxm6_qigD+DuoJ5GpS9rOqXe4Gv=2UnujiiwcfN0HHQ@mail.gmail.com>
 <20201006015528-mutt-send-email-mst@kernel.org>
 <ea2f637545fb0dbc21cb7d6ff2b7839307d06b3f.camel@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <95d7f1cd-168e-3fa7-c7fd-fc476377a427@redhat.com>
Date: Wed, 7 Oct 2020 09:37:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <ea2f637545fb0dbc21cb7d6ff2b7839307d06b3f.camel@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/07 00:44:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 07 Oct 2020 07:37:27 -0000

On 06/10/20 21:20, snizovtsev@gmail.com wrote:
> On Tue, 2020-10-06 at 01:55 -0400, Michael S. Tsirkin wrote:
>> On Tue, Sep 29, 2020 at 04:47:14PM -0700, Sergey Nizovtsev wrote:
>>> Some objects accidentally inherit ObjectClass instead of Object.
>>> They compile silently but may crash after downcasting.
>>>
>>> In this patch, we introduce a coccinelle script to find broken
>>> declarations and fix them manually with proper base type.
>>>
>>> Signed-off-by: Sergey Nizovtsev <snizovtsev@gmail.com>
>>
>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>>
>> which tree should this go in through?
> 
> Well, since this may only affect some generic QOM walking code, i
> suggest it goes in QOM/QObject/QMP related tree.
> 
> So, `scripts/get_maintainer.pl -f qom/object.c`:
> 
> +CC Paolo Bonzini <pbonzini@redhat.com>
> -CC Ben Warren <ben@skyportsystems.com>

Queued, thanks.

Paolo

> On Tue, 2020-10-06 at 00:06 +0400, Marc-André Lureau wrote:
>> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> On Mon, 2020-10-05 at 18:47 +0200, Igor Mammedov wrote:
>> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> 
>>
>>> ---
>>>  scripts/coccinelle/qobject-parent-type.cocci | 26
>>> ++++++++++++++++++++
>>>  include/hw/acpi/vmgenid.h                    |  2 +-
>>>  include/hw/misc/vmcoreinfo.h                 |  2 +-
>>>  include/net/can_host.h                       |  2 +-
>>>  MAINTAINERS                                  |  1 +
>>>  5 files changed, 30 insertions(+), 3 deletions(-)
>>>  create mode 100644 scripts/coccinelle/qobject-parent-type.cocci
>>>
>>> diff --git a/scripts/coccinelle/qobject-parent-type.cocci
>>> b/scripts/coccinelle/qobject-parent-type.cocci
>>> new file mode 100644
>>> index 0000000000..9afb3edd97
>>> --- /dev/null
>>> +++ b/scripts/coccinelle/qobject-parent-type.cocci
>>> @@ -0,0 +1,26 @@
>>> +// Highlight object declarations that don't look like object class
>>> but
>>> +// accidentally inherit from it.
>>> +
>>> +@match@
>>> +identifier obj_t, fld;
>>> +type parent_t =~ ".*Class$";
>>> +@@
>>> +struct obj_t {
>>> +    parent_t fld;
>>> +    ...
>>> +};
>>> +
>>> +@script:python filter depends on match@
>>> +obj_t << match.obj_t;
>>> +@@
>>> +is_class_obj = obj_t.endswith('Class')
>>> +cocci.include_match(not is_class_obj)
>>> +
>>> +@replacement depends on filter@
>>> +identifier match.obj_t, match.fld;
>>> +type match.parent_t;
>>> +@@
>>> +struct obj_t {
>>> +*   parent_t fld;
>>> +    ...
>>> +};
>>> diff --git a/include/hw/acpi/vmgenid.h b/include/hw/acpi/vmgenid.h
>>> index d50fbacb8e..cb4ad37fc5 100644
>>> --- a/include/hw/acpi/vmgenid.h
>>> +++ b/include/hw/acpi/vmgenid.h
>>> @@ -19,7 +19,7 @@
>>>  OBJECT_DECLARE_SIMPLE_TYPE(VmGenIdState, VMGENID)
>>>
>>>  struct VmGenIdState {
>>> -    DeviceClass parent_obj;
>>> +    DeviceState parent_obj;
>>>      QemuUUID guid;                /* The 128-bit GUID seen by the
>>> guest */
>>>      uint8_t vmgenid_addr_le[8];   /* Address of the GUID (little-
>>> endian) */
>>>  };
>>> diff --git a/include/hw/misc/vmcoreinfo.h
>>> b/include/hw/misc/vmcoreinfo.h
>>> index ebada6617a..0b7b55d400 100644
>>> --- a/include/hw/misc/vmcoreinfo.h
>>> +++ b/include/hw/misc/vmcoreinfo.h
>>> @@ -24,7 +24,7 @@ DECLARE_INSTANCE_CHECKER(VMCoreInfoState,
>>> VMCOREINFO,
>>>  typedef struct fw_cfg_vmcoreinfo FWCfgVMCoreInfo;
>>>
>>>  struct VMCoreInfoState {
>>> -    DeviceClass parent_obj;
>>> +    DeviceState parent_obj;
>>>
>>>      bool has_vmcoreinfo;
>>>      FWCfgVMCoreInfo vmcoreinfo;
>>> diff --git a/include/net/can_host.h b/include/net/can_host.h
>>> index 4e3ce3f954..caab71bdda 100644
>>> --- a/include/net/can_host.h
>>> +++ b/include/net/can_host.h
>>> @@ -35,7 +35,7 @@
>>>  OBJECT_DECLARE_TYPE(CanHostState, CanHostClass, CAN_HOST)
>>>
>>>  struct CanHostState {
>>> -    ObjectClass oc;
>>> +    Object oc;
>>>
>>>      CanBusState *bus;
>>>      CanBusClientState bus_client;
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 5eed1e692b..2160b8196a 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -2402,6 +2402,7 @@ F: qobject/
>>>  F: include/qapi/qmp/
>>>  X: include/qapi/qmp/dispatch.h
>>>  F: scripts/coccinelle/qobject.cocci
>>> +F: scripts/coccinelle/qobject-parent-type.cocci
>>>  F: tests/check-qdict.c
>>>  F: tests/check-qjson.c
>>>  F: tests/check-qlist.c
>>> -- 
>>> 2.28.0
> 


