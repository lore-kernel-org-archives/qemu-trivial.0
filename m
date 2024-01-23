Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rS9sN-00043w-Td
	for mharc-qemu-trivial@gnu.org; Tue, 23 Jan 2024 01:03:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rS9sM-00043W-82
 for qemu-trivial@nongnu.org; Tue, 23 Jan 2024 01:03:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rS9sK-000286-LG
 for qemu-trivial@nongnu.org; Tue, 23 Jan 2024 01:03:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705989787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=8WS41xF2DVcaaNjp7X0CT5IdEVatjAVnvYyfHAkiwLI=;
 b=MIRYk5ZC0zXPM70eKKAqZDKMp9R1DzkHMo1gGx/BN33ZD0kZp5BPfHNaDL+G9NmoK5wsV+
 jXqVAcUgQGSmS/fMRzxXk32vEggNe9095vYykAp4/vZm2WCL4gXLSIvZJXhgiai3wkSd6n
 9/E4CizHfLDwd1KQx9SPkymRZDz9J4I=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-1-BoTnUhC8OVifwAsk4ecNXw-1; Tue, 23 Jan 2024 01:03:05 -0500
X-MC-Unique: BoTnUhC8OVifwAsk4ecNXw-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-50e411af4e6so2784529e87.2
 for <qemu-trivial@nongnu.org>; Mon, 22 Jan 2024 22:03:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705989784; x=1706594584;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8WS41xF2DVcaaNjp7X0CT5IdEVatjAVnvYyfHAkiwLI=;
 b=cBCoKuH5wwaD0+Dq96q6mCR+XJQ6mwMfzFVheVRp+Awd2zWXfuTvHsqgiIMtRCgA+x
 eeen+Ds8iCnsDB0wGlyLR7jyEsd5utW19jilyZdZeJaBsHRhpdJwo4VkE7xUwCH/BCsk
 22XhUpSQL4VSbi2JAmSZ1+bLs9+9yaEL/YiteJN0iUcoQ8m0LKzSjAZg5RZTZvf6R/L6
 0qf78K+YH4y69vkxMjl0IwARm97w9z8g9Q14BOo5iy/Xun3VrX0J07VJMotwyBmHIZ4h
 7FxqH2/VC68WbPo7QSBWmmpHTg3zm7i5YStEg11O9L2Gu8NCI072jwoBUWsfLfpy6Dwv
 Cp/Q==
X-Gm-Message-State: AOJu0YxAFFTwqP0qq+sc0yAnHfqHEgwfzjpERKzRG0ff0VfYXCzn5H50
 k0etygNLT9HWpn8fWfQaOZbZpXXp/mg1pKi+VATxB2H+b4IE+4zX7itMT0XHHI3NpZ/jaznpjI9
 cMlj6llt+qhJckmxbs2w6kmqSZq4aMhN/4lrMN8VHl0BT6aJ3U1JWyPizHdiiDxI=
X-Received: by 2002:a05:6512:1115:b0:50e:f4c0:52b3 with SMTP id
 l21-20020a056512111500b0050ef4c052b3mr3298761lfg.44.1705989784456; 
 Mon, 22 Jan 2024 22:03:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJXe2xlw2oJenmqnpKfN2bh0zhPA3mcq/C3Vt9803+cTjRiVwi9E2KzBtJunpT4zEMNNNi5Q==
X-Received: by 2002:a05:6512:1115:b0:50e:f4c0:52b3 with SMTP id
 l21-20020a056512111500b0050ef4c052b3mr3298752lfg.44.1705989784168; 
 Mon, 22 Jan 2024 22:03:04 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-177-121.web.vodafone.de.
 [109.43.177.121]) by smtp.gmail.com with ESMTPSA id
 th7-20020a1709078e0700b00a2fd84bc421sm3232512ejc.83.2024.01.22.22.03.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jan 2024 22:03:03 -0800 (PST)
Message-ID: <b60d2855-8275-41d0-b5eb-e9912749b4f1@redhat.com>
Date: Tue, 23 Jan 2024 07:03:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] util/uri: Remove the uri_string_escape() function
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org
References: <20240122191753.103118-1-thuth@redhat.com>
 <20240122191753.103118-4-thuth@redhat.com>
 <343c59db-8004-4461-9c9e-976ca2f1a357@weilnetz.de>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <343c59db-8004-4461-9c9e-976ca2f1a357@weilnetz.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.289,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 23 Jan 2024 06:03:11 -0000

On 22/01/2024 21.59, Stefan Weil wrote:
> Am 22.01.24 um 20:17 schrieb Thomas Huth:
> 
>> It is not used in QEMU - and if somebody needs this functionality,
>> they can simply use g_uri_escape_string() from the glib instead.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   include/qemu/uri.h |  1 -
>>   util/uri.c         | 64 ----------------------------------------------
>>   2 files changed, 65 deletions(-)
> 
> 
> The removed function is used in util/uri.c, so this patch breaks the 
> compilation.
> 
> That can be fixed by applying patch 4 before this one.
> 
> With that re-ordering you may add my signature:
> 
> Reviewed-by: Stefan Weil <sw@weilnetz.de>

D'oh, I originally developed the patches the other way round indeed, but 
then thought it would be nicer for review this way and swapped the order 
without checking :-( ... I'll swap it back again.

Thanks!

  Thomas


