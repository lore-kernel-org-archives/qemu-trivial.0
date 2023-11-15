Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1r39fO-0002pd-8t
	for mharc-qemu-trivial@gnu.org; Wed, 15 Nov 2023 01:46:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1r39fJ-0002p4-Io
 for qemu-trivial@nongnu.org; Wed, 15 Nov 2023 01:46:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1r39fG-0008IH-MF
 for qemu-trivial@nongnu.org; Wed, 15 Nov 2023 01:46:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700030777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ZapwmIlebruvgXiDo8uWbxWWecXJ+NJ4Glz+d9aLojc=;
 b=BceDB77qvD1ZwQFvamiFJAzGEVcHAp6zZipplcVhvzdB0gqhZa4NVI/gqwzLOKJPXmE6bu
 sMXnP7mpzm6peAd6vavGT9geYcosBDu+fCYARiryHetNUx1TeDDzpRpwvPtR0xKQdtJnE2
 wBvTHaq9oaya5wlXyEOfEpRGAD1VyBI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-14-UtEBGmn3MLSrEGOxMd_aUA-1; Wed, 15 Nov 2023 01:46:16 -0500
X-MC-Unique: UtEBGmn3MLSrEGOxMd_aUA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-408508aa81cso41517235e9.3
 for <qemu-trivial@nongnu.org>; Tue, 14 Nov 2023 22:46:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700030775; x=1700635575;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZapwmIlebruvgXiDo8uWbxWWecXJ+NJ4Glz+d9aLojc=;
 b=idHAIi72S6VtpD4nKlutatDFwZGkXJmYd5HqtCPZNswvkQq/uOBnL7mKkjnGnl/9ZL
 rszj2FATYyP9RvGmwStS34MqxgVeqK3hNDOwe+FePV1rSMr73sreJQve7dRZ85DDR24y
 eo6oCNp2ZWnOU4vlquNTnGN339TtSr+8QCVPYZ5mJg7SCh2VZfQj5DyRnIfV09d2koY4
 H2JQGQ/xokxcUEOGOW64wbbe0H1t7Afm/jr/SrrGEyAuCia7CqJ1cEoIADRX6Ho+r3aX
 qAsR+IzAc/4o/ODd67vP+rOVbtA9T9WxOGOVNQfNdJ2EiU4/Km+Kyr5WQuvXWFUcqkvx
 JdMw==
X-Gm-Message-State: AOJu0YzHEvICDqpUdejavsLur4bV5XfHarxisQmKHAIXkgHwEiZzRelP
 YJguA5uejKIpRjs4YQPKXrNnvoscLPwNAx12Hk88NY4NbCJ5axa7DgKZdMsk6lt11GouAuacXjR
 xdv0HZjmhNGQx9+8uug==
X-Received: by 2002:a05:600c:1c82:b0:40a:4a5c:3af0 with SMTP id
 k2-20020a05600c1c8200b0040a4a5c3af0mr9609727wms.24.1700030774864; 
 Tue, 14 Nov 2023 22:46:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLShATsi7T9cVbiP1Tn3JNWBol+woyqBS/WbyR9Szmpf++oNm/eT6wE0E25V4DLJbaI7/zsQ==
X-Received: by 2002:a05:600c:1c82:b0:40a:4a5c:3af0 with SMTP id
 k2-20020a05600c1c8200b0040a4a5c3af0mr9609712wms.24.1700030774544; 
 Tue, 14 Nov 2023 22:46:14 -0800 (PST)
Received: from [192.168.0.6] (ip-109-43-176-122.web.vodafone.de.
 [109.43.176.122]) by smtp.gmail.com with ESMTPSA id
 o20-20020a05600c511400b004042dbb8925sm19823165wms.38.2023.11.14.22.46.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Nov 2023 22:46:14 -0800 (PST)
Message-ID: <dcd5e473-7598-478e-8597-9efec38a4ba8@redhat.com>
Date: Wed, 15 Nov 2023 07:46:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH trivial 06/21] docs/devel/migration.rst: spelling fix:
 doen't
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Juan Quintela <quintela@redhat.com>
References: <20231114165834.2949011-1-mjt@tls.msk.ru>
 <20231114165834.2949011-7-mjt@tls.msk.ru>
 <f2bfef4a-3a2c-4d32-adf6-52317f85a045@redhat.com>
 <7259b384-cc7f-4400-9891-83e656765ce2@tls.msk.ru>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <7259b384-cc7f-4400-9891-83e656765ce2@tls.msk.ru>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Nov 2023 06:46:21 -0000

On 15/11/2023 07.41, Michael Tokarev wrote:
> 14.11.2023 22:05, Thomas Huth wrote:
>> On 14/11/2023 17.58, Michael Tokarev wrote:
>>> Fixes: 1aefe2ca1423 "migration/doc: Add documentation for backwards 
>>> compatiblity"
>>> Cc: Juan Quintela <quintela@redhat.com>
>>> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
>>> ---
>>>   docs/devel/migration.rst | 8 ++++----
>>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/docs/devel/migration.rst b/docs/devel/migration.rst
>>> index 5adf4f12f7..51b1f61f5e 100644
>>> --- a/docs/devel/migration.rst
>>> +++ b/docs/devel/migration.rst
>>> @@ -1061,7 +1061,7 @@ QEMU version, in this case pc-5.1.
>>>   4 - qemu-5.1 -M pc-5.2  -> migrates to -> qemu-5.1 -M pc-5.2
>>> -  This combination is not possible as the qemu-5.1 doen't understand
>>> +  This combination is not possible as the qemu-5.1 does't understand
>>
>> You replaced one typo with another one :-)
> 
> Heh. Lovely! :)
> 
> The "really-really-fixed" one (without resending):
> 
> -  This combination is not possible as the qemu-5.1 doen't understand
> +  This combination is not possible as the qemu-5.1 doesn't understand
>     pc-5.2 machine type.  So nothing to worry here.
> 
> ;)

With that fix:

Reviewed-by: Thomas Huth <thuth@redhat.com>



