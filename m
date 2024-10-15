Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1t0fjC-0004kh-KE
	for mharc-qemu-trivial@gnu.org; Tue, 15 Oct 2024 07:28:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1t0fjB-0004kT-2O
 for qemu-trivial@nongnu.org; Tue, 15 Oct 2024 07:28:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1t0fj9-0003vS-PI
 for qemu-trivial@nongnu.org; Tue, 15 Oct 2024 07:28:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1728991715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=2BZXiC9emiDdbWKfKCaDXT1pEmajdIS8zoornlJLf1U=;
 b=WpNtDWlewhiuSZ3ERsdk8sp0a7w4H+9WhFv3og4j9jLuaHTSDoduqx2AFvikels14Id3fe
 6Y7haI0SLgFnacS+Dx1BophixMr6c6u0F/i7CQhYVBvFdH7iW8dwUgVHzvkZYeZ/0DlG7i
 6rexbYzgUYECq55zY2vxWIHDe4sibvc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-ZzkGlznTPwSHDLq6wRhu5A-1; Tue, 15 Oct 2024 07:28:33 -0400
X-MC-Unique: ZzkGlznTPwSHDLq6wRhu5A-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43124676f8aso20638295e9.0
 for <qemu-trivial@nongnu.org>; Tue, 15 Oct 2024 04:28:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728991712; x=1729596512;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2BZXiC9emiDdbWKfKCaDXT1pEmajdIS8zoornlJLf1U=;
 b=HfZyXQR20Dhl1ykewo3XzdePPTglYqYJJTfmbpn7fOe2pxc+KSEzYnUrvMQxSHfpfl
 GUxx4nV3BR+hXMv2IPfhx56FiZ7aM3qYsDDmifkbugplVVOsA9sX9roRCdMyE1bcpF9+
 ShBobUM23c3mq4pNFEeuTbJ3ccmSumWiPYPnZwMPU3unG0q1CN9py7oHyGsB5W7F9tZu
 aqvXcZ4/owY1C/wQVDu3B0lWyiRxTLeYEKpLX8PnPSOuEGslROA5aWQ6Z2wBN7C7UON+
 S7MDGRK3lZuRWi6l9FwxMtwpXcDRPU4RZ9PQ6mIXO+/Mild3umCiwWqfXa8Og4LEcCY0
 6lEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhZc0Rj5rFC5+Zffl0DKSVGGZCv6HrAPsw2brzAJH0X/i1uw1V1c52DaveE6Me5tm8wOvi4N9hpkGE0jY=@nongnu.org
X-Gm-Message-State: AOJu0YziPgOI5sUo1iVDDbH7JFPwW5Xm64yY2lMSGZShZDZG7PwjpMXa
 /LjqTEzG2h8yaxgnI/CtKnVxsXUBEXoYvGl1xRn3K7rYNH4kcmlc3Acm0dqgbQZ/l3Uh4THxXZp
 75yzmUoIZq7SEKSRSYl8dwceEfug8N30TiSnXrWxaS0aThwQ6IoI9wOM=
X-Received: by 2002:a05:600c:4f83:b0:42f:8515:e4a8 with SMTP id
 5b1f17b1804b1-4314a283b45mr1664085e9.6.1728991711845; 
 Tue, 15 Oct 2024 04:28:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtilqNpM5OcVDyv8UBdVdAXOFMdzjQnfzdwGVboLN/jBBsQLVDR8+ZF72UZYM478zk+lQcCA==
X-Received: by 2002:a05:600c:4f83:b0:42f:8515:e4a8 with SMTP id
 5b1f17b1804b1-4314a283b45mr1663965e9.6.1728991711360; 
 Tue, 15 Oct 2024 04:28:31 -0700 (PDT)
Received: from [192.168.0.7] (ip-109-42-48-109.web.vodafone.de.
 [109.42.48.109]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4313f55df1csm15449215e9.1.2024.10.15.04.28.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Oct 2024 04:28:30 -0700 (PDT)
Message-ID: <6cdcc744-1d01-4da3-ba8e-a89fa87b402e@redhat.com>
Date: Tue, 15 Oct 2024 13:28:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ui/console-vc: Silence warning about sprintf() on OpenBSD
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, Brad Smith <brad@comstyle.com>,
 qemu-trivial@nongnu.org
References: <20241014151023.85698-1-thuth@redhat.com>
 <Zw01n0A6xCG9mCm-@redhat.com>
 <67e2cb19-8de6-4ebf-ab4f-ae13b3de134d@tls.msk.ru>
 <Zw4kaDIn97RXZKht@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <Zw4kaDIn97RXZKht@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.063,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 15 Oct 2024 11:28:37 -0000

On 15/10/2024 10.14, Daniel P. Berrangé wrote:
> On Mon, Oct 14, 2024 at 10:50:44PM +0300, Michael Tokarev wrote:
>> On 14.10.2024 18:15, Daniel P. Berrangé wrote:
>>
>>> These two lines are the only place in the code that uses the
>>>
>>>      char response[40];
>>>
>>> so even better than switching to snprintf, how about just taking
>>> buffer size out of the picture:
>>>
>>>     g_autofree *response =
>>>         g_strdup_printf("\033[%d;%dR",
>>>                         (s->y_base + s->y) % s->total_height + 1,
>>>                         s->x + 1);
>>>     vc_respond_str(vc, response);
>>
>> What's the reason to perform memory allocation in trivial places
>> like this?  If we're worrying about possible buffer size issue,
>> maybe asprintf() is a better alternative for such small things?
>> Fragmenting heap memory for no reason seems too much overkill.
>> But I'm old-scool, so.. :)
> 
> This is not a performance sensitive path, and using g_strdup_printf
> makes it robust against any futher changes in the future. In the
> context of all the memory allocation QEMU does, I can't see this
> making any difference to heap fragmentation whatsoever.
> 
> snprintf with fixed buffers should only be used where there's a
> demonstratable performance win, and the return value actually
> checked with an assert() to prove we're not overflowing.

While I'm obviously old-schooled, too (since I used snprintf here in the 
first place), I agree with Daniel that the few cycles of improved 
performance likely aren't justified in this case here, so g_strdup_printf() 
is a better choice here indeed. I just sent a v2 with that change.

  Thomas


