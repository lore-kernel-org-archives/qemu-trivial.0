Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j6XC6-0007T0-CF
	for mharc-qemu-trivial@gnu.org; Tue, 25 Feb 2020 05:12:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59798)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6XC3-0007RK-5v
 for qemu-trivial@nongnu.org; Tue, 25 Feb 2020 05:12:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6XC1-0008Po-TE
 for qemu-trivial@nongnu.org; Tue, 25 Feb 2020 05:11:59 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:52831
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6XC1-0008Pd-Pa
 for qemu-trivial@nongnu.org; Tue, 25 Feb 2020 05:11:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582625517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z89AUevcBbbfepqU8ufYMjCxbl3BVjLSlW4FTRV6e6A=;
 b=hHamp8caFGOb6lzHLxj4A/cUnh5bm6Zsait4YTQipfLYbzc/Lc/+roz+SBcHsWSCQ3Fpu4
 Qj+tew+I8HNqHxL+kjnRkLSfUjuUmQkWjKy6CKdZbtyDJM/pxN8eUsWtVU61cQtTv+wg7v
 Isw5gUlPNEK/ErDbEDxllgYcuQ7+f2c=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-mwNjaPcBOs2CMqZWy352ag-1; Tue, 25 Feb 2020 05:11:55 -0500
X-MC-Unique: mwNjaPcBOs2CMqZWy352ag-1
Received: by mail-wr1-f71.google.com with SMTP id u18so7035474wrn.11
 for <qemu-trivial@nongnu.org>; Tue, 25 Feb 2020 02:11:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2hg7Hfx7/td+/CIjmQYClbMLavqUkQGymLApvhUP9ZI=;
 b=LoNo40LMra7QsXAMcgg5B6/ROFr1nkOqxdchWWKNjbPVCkQEXQPqQH3Pq8/u6KRaUw
 kaGIA/9cy3UQQER4M8T0UMOwkAHsrcvay+kMgIbgo7+KWCozSlRsTJ0+ibcK9PNBwyCh
 Trj/cBrRSHQ9IkfpXMRdvOOxWdtAPT421wEX+UO41czkvFqmoLUI/DEB4yvkskE8YADf
 CVb+amkErJe2QX5yVJDi14pTIKOmwxwHhzeoYi66YVVCXhg7hySzO7X/eo0wOPW5V9J/
 /wd9klGUb+oaDCq2d5KwNkZeHOlqBgOC0lWTrIL63JZG/seLMNxeQUdatEJiB1N37omR
 5K9g==
X-Gm-Message-State: APjAAAW1OueKSW6O71vEvL/cpoW8siYEvhXsufALpfL3hB+OYe3SCXsN
 v/F7XYX1eyJpDNWUITTkgyS5pCDy35DFcnNYqUwrDGFrOiRwBNmmtWMXsi53adFcOZTXcwGdEan
 pwmIgdiKFmewYLVn1jw==
X-Received: by 2002:a1c:7205:: with SMTP id n5mr4649414wmc.9.1582625514445;
 Tue, 25 Feb 2020 02:11:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqztiO19ISSyiZpjOC1h9Ae3L4OQj6GFtJyt1yCzZqFJ7FlD3WtdrTK8lU8NUduLrKwEvWzNdg==
X-Received: by 2002:a1c:7205:: with SMTP id n5mr4649392wmc.9.1582625514178;
 Tue, 25 Feb 2020 02:11:54 -0800 (PST)
Received: from [192.168.1.35] (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id l6sm3325069wmg.42.2020.02.25.02.11.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2020 02:11:53 -0800 (PST)
Subject: Re: [PATCH 09/13] dma/xlnx-zdma: Remove redundant statement in
 zdma_write_dst()
To: "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
References: <20200225020937.25028-1-kuhn.chenqun@huawei.com>
 <20200225020937.25028-10-kuhn.chenqun@huawei.com>
 <6d31ac16-adc6-235e-8784-51bf86e33b72@redhat.com>
 <7412CDE03601674DA8197E2EBD8937E83B661BD7@dggemm531-mbx.china.huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8ceb7ecc-8edc-0ced-8171-6200ded0dd05@redhat.com>
Date: Tue, 25 Feb 2020 11:11:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <7412CDE03601674DA8197E2EBD8937E83B661BD7@dggemm531-mbx.china.huawei.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Tue, 25 Feb 2020 10:12:00 -0000

On 2/25/20 11:01 AM, Chenqun (kuhn) wrote:
>> -----Original Message-----
>> From: Philippe Mathieu-Daud=C3=A9 [mailto:philmd@redhat.com]
>> Sent: Tuesday, February 25, 2020 5:36 PM
>> To: Chenqun (kuhn) <kuhn.chenqun@huawei.com>; qemu-
>> devel@nongnu.org; qemu-trivial@nongnu.org
>> Cc: peter.maydell@linaro.org; Zhanghailiang
>> <zhang.zhanghailiang@huawei.com>; Alistair Francis <alistair@alistair23.=
me>;
>> qemu-arm@nongnu.org
>> Subject: Re: [PATCH 09/13] dma/xlnx-zdma: Remove redundant statement in
>> zdma_write_dst()
>>
>> On 2/25/20 3:09 AM, kuhn.chenqun@huawei.com wrote:
>>> From: Chen Qun <kuhn.chenqun@huawei.com>
>>>
>>> Clang static code analyzer show warning:
>>> hw/dma/xlnx-zdma.c:399:13: warning: Value stored to 'dst_type' is never
>> read
>>>               dst_type =3D FIELD_EX32(s->dsc_dst.words[3],
>> ZDMA_CH_DST_DSCR_WORD3,
>>>               ^
>> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>
>>> Reported-by: Euler Robot <euler.robot@huawei.com>
>>> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
>>> ---
>>> Cc: Alistair Francis <alistair@alistair23.me>
>>> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
>>> Cc: Peter Maydell <peter.maydell@linaro.org>
>>> Cc: qemu-arm@nongnu.org
>>> ---
>>>    hw/dma/xlnx-zdma.c | 2 --
>>>    1 file changed, 2 deletions(-)
>>>
>>> diff --git a/hw/dma/xlnx-zdma.c b/hw/dma/xlnx-zdma.c index
>>> 8fb83f5b07..45355c5d59 100644
>>> --- a/hw/dma/xlnx-zdma.c
>>> +++ b/hw/dma/xlnx-zdma.c
>>> @@ -396,8 +396,6 @@ static void zdma_write_dst(XlnxZDMA *s, uint8_t
>> *buf, uint32_t len)
>>>                zdma_load_descriptor(s, next, &s->dsc_dst);
>>>                dst_size =3D FIELD_EX32(s->dsc_dst.words[2],
>> ZDMA_CH_DST_DSCR_WORD2,
>>>                                      SIZE);
>>> -            dst_type =3D FIELD_EX32(s->dsc_dst.words[3],
>> ZDMA_CH_DST_DSCR_WORD3,
>>> -                                  TYPE);
>>
>> Maybe move dst_type to this if() statement now?
>>
> Sorry, I don't follow you.   I didn't find where I could move dst_type.
> Do you mean to move the first dst_type to the if().
> Modify it like this:
>      while (len) {
>          dst_size =3D FIELD_EX32(s->dsc_dst.words[2], ZDMA_CH_DST_DSCR_WO=
RD2,
>                                SIZE);
>          if (dst_size =3D=3D 0 && ptype =3D=3D PT_MEM) {
>              uint64_t next;
>              dst_type =3D FIELD_EX32(s->dsc_dst.words[3], ZDMA_CH_DST_DSC=
R_WORD3,
>                                TYPE);
>              next =3D zdma_update_descr_addr(s, dst_type,
>                                            R_ZDMA_CH_DST_CUR_DSCR_LSB);
>              zdma_load_descriptor(s, next, &s->dsc_dst);
>              dst_size =3D FIELD_EX32(s->dsc_dst.words[2], ZDMA_CH_DST_DSC=
R_WORD2,
>                                    SIZE);
>          }
>         ...
>     }

No, like this:

-- >8 --
@@ -373,7 +373,7 @@ static uint64_t zdma_update_descr_addr(XlnxZDMA *s,=20
bool type,
  static void zdma_write_dst(XlnxZDMA *s, uint8_t *buf, uint32_t len)
  {
      uint32_t dst_size, dlen;
-    bool dst_intr, dst_type;
+    bool dst_intr;
      unsigned int ptype =3D ARRAY_FIELD_EX32(s->regs, ZDMA_CH_CTRL0,=20
POINT_TYPE);
      unsigned int rw_mode =3D ARRAY_FIELD_EX32(s->regs, ZDMA_CH_CTRL0, MOD=
E);
      unsigned int burst_type =3D ARRAY_FIELD_EX32(s->regs, ZDMA_CH_DATA_AT=
TR,
@@ -387,17 +387,17 @@ static void zdma_write_dst(XlnxZDMA *s, uint8_t=20
*buf, uint32_t len)
      while (len) {
          dst_size =3D FIELD_EX32(s->dsc_dst.words[2], ZDMA_CH_DST_DSCR_WOR=
D2,
                                SIZE);
-        dst_type =3D FIELD_EX32(s->dsc_dst.words[3], ZDMA_CH_DST_DSCR_WORD=
3,
-                              TYPE);
          if (dst_size =3D=3D 0 && ptype =3D=3D PT_MEM) {
              uint64_t next;
+            bool dst_type;
+
+            dst_type =3D FIELD_EX32(s->dsc_dst.words[3],=20
ZDMA_CH_DST_DSCR_WORD3,
+                                  TYPE);
              next =3D zdma_update_descr_addr(s, dst_type,
                                            R_ZDMA_CH_DST_CUR_DSCR_LSB);
              zdma_load_descriptor(s, next, &s->dsc_dst);
              dst_size =3D FIELD_EX32(s->dsc_dst.words[2],=20
ZDMA_CH_DST_DSCR_WORD2,
                                    SIZE);
-            dst_type =3D FIELD_EX32(s->dsc_dst.words[3],=20
ZDMA_CH_DST_DSCR_WORD3,
-                                  TYPE);
          }
---


