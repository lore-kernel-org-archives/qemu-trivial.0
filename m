Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1r1Nuh-0006Mu-5w
	for mharc-qemu-trivial@gnu.org; Fri, 10 Nov 2023 04:34:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1r1Nug-0006M9-Kw
 for qemu-trivial@nongnu.org; Fri, 10 Nov 2023 04:34:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1r1Nuf-0005w1-6v
 for qemu-trivial@nongnu.org; Fri, 10 Nov 2023 04:34:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699608892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=NTsnJdGxjDhEztAzuwhMU9JIn1bpNpwf04ZyYJ9l+1w=;
 b=N1cCdATOHICQxTquEQhctxRhWEV8QlLMW6oxO92W2c6zgNVtx8/11QSOGZXuvl3wB47eUy
 gk9DKI0/yU7GYHYPf9j41zM8aK5AP7CjcdzZrl63ejjLjasJLf/yRx7cEndwTRfRoKwMSL
 tXNoGMZ/GM/8b7oVRNhrH/zXFhX1bJg=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-172-gkdanMa6Mx62LA-ufOpXtg-1; Fri, 10 Nov 2023 04:34:48 -0500
X-MC-Unique: gkdanMa6Mx62LA-ufOpXtg-1
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-66fe14725aeso24000146d6.2
 for <qemu-trivial@nongnu.org>; Fri, 10 Nov 2023 01:34:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699608888; x=1700213688;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NTsnJdGxjDhEztAzuwhMU9JIn1bpNpwf04ZyYJ9l+1w=;
 b=tm0f6r88ctzhfpQIVNbL1cO/VtJ3zbfoFCFOEWOficGsvSnFOi1OMT1GoAXQf5Kwvu
 Do+EHcbuNCrSvYRw1uKAHOlUaFVbolPf/QCx4rsiJLqa06zT38BRmwLJzgxF59z+wMf1
 mk5PCgTeOqdlTYp7WMEQ8IldYPIfg+oNbuRWpI86rrBwlWMsj+iHYwc5EUbnHoRuPZJM
 zGhTxNr7fi3cAYX+UPsgTf63V4i9ap8JMCxlHZrf2rXj49Lr+28LQa4nRczSa5UDOfXL
 auPI7mW3IOKGUJtkeyTRCcrsrUkpF86PY9KuNACx6Aze5nOBqaBTbYrOYvYZnJ6Xfs2S
 AIqg==
X-Gm-Message-State: AOJu0Yw9OIobZ93+PN4brnYCmOEFYNXWhoGJy2WyAGnkSoR/JH2e+jfh
 oMhow47+drbu0qA2AousAwxuL6bhQUZLbo+nazKMVvgVYZJQ3NH37wXg4gMDegqKfjBrafn4XZe
 IFd83PTsOvpUODAdLCg==
X-Received: by 2002:a05:6214:d0a:b0:649:384f:ed4 with SMTP id
 10-20020a0562140d0a00b00649384f0ed4mr7770073qvh.19.1699608888502; 
 Fri, 10 Nov 2023 01:34:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJLKg/dvgvKTN/DZXV+SdBghD+/OdrnZF612WtjGvCnfTt3oU2Kv4nG/OszrlY8jSPg7U6cw==
X-Received: by 2002:a05:6214:d0a:b0:649:384f:ed4 with SMTP id
 10-20020a0562140d0a00b00649384f0ed4mr7770066qvh.19.1699608888278; 
 Fri, 10 Nov 2023 01:34:48 -0800 (PST)
Received: from [192.168.0.6] (ip-109-43-177-79.web.vodafone.de.
 [109.43.177.79]) by smtp.gmail.com with ESMTPSA id
 c10-20020a05621401ea00b0065b11053445sm2811472qvu.54.2023.11.10.01.34.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Nov 2023 01:34:48 -0800 (PST)
Message-ID: <0795d03d-602d-4064-a3da-c019e4d12189@redhat.com>
Date: Fri, 10 Nov 2023 10:34:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] include/hw/xen: Use more inclusive language in comment
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, qemu-trivial@nongnu.org,
 Anthony Perard <anthony.perard@citrix.com>, qemu-devel@nongnu.org,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>
References: <20231109174034.375392-1-thuth@redhat.com>
 <2ae66eda-3560-2930-4bbb-87345a719f32@suse.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <2ae66eda-3560-2930-4bbb-87345a719f32@suse.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 10 Nov 2023 09:34:54 -0000

On 10/11/2023 10.30, Jan Beulich wrote:
> On 09.11.2023 18:40, Thomas Huth wrote:
>> --- a/include/hw/xen/interface/hvm/params.h
>> +++ b/include/hw/xen/interface/hvm/params.h
>> @@ -255,7 +255,7 @@
>>    * Note that 'mixed' mode has not been evaluated for safety from a
>>    * security perspective.  Before using this mode in a
>>    * security-critical environment, each subop should be evaluated for
>> - * safety, with unsafe subops blacklisted in XSM.
>> + * safety, with unsafe subops blocked in XSM.
> 
> To avoid another round trip when you send the patch against xen.git, as
> already asked for by others, I'd like to point out that the wording
> change isn't describing things sufficiently similarly: "blocked" reads
> as if XSM would do so all by itself, whereas "blacklisted" has an
> indication that something needs to be done for XSM to behave in the
> intended way. Minimally I'd suggest "suitably blocked via", but perhaps
> yet better wording can be thought of.

Ok, could then please someone from you Xen guys get this fixed with 
appropriate wording in the xen.git repo? I never checked out that repo 
before and before I now spend hours and hours to figure out how to 
contribute a patch to Xen, just to replace a single word, it's way easier if 
someone with pre-existing Xen experience is taking care of this.

  Thanks,
   Thomas



