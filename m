Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 210D8CFD376
	for <qemu-trivial@archiver.kernel.org>; Tue,  2 Dec 2025 07:48:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vQL6y-0003Pw-Lp; Tue, 02 Dec 2025 02:47:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vQL6w-0003PJ-JR
 for qemu-trivial@nongnu.org; Tue, 02 Dec 2025 02:47:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vQL6u-0008Kx-O2
 for qemu-trivial@nongnu.org; Tue, 02 Dec 2025 02:47:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764661663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=lhGI90u3lG0jQ/lk1uJEavBnJNz6fBbLoVOWHiZIh18=;
 b=hqdJcthSHh27EWgFMwAGIgvC8EMqggIngyKXFoiGKTbElnfgZK3aOB2LAGp414ikBquibZ
 sTGG430S9bBBHE+xcPW/67QEqEVaBaR0l5v5XH1RpjwotigE0nkoIKPXNiFXU+hfRrRp0h
 LBE5wG/LBLn8+dZePh2wjgDWMJ9/cHQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-687-HLl1ZEQzMk6cPZCwHNUgIQ-1; Tue, 02 Dec 2025 02:47:42 -0500
X-MC-Unique: HLl1ZEQzMk6cPZCwHNUgIQ-1
X-Mimecast-MFC-AGG-ID: HLl1ZEQzMk6cPZCwHNUgIQ_1764661661
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-6411fc67650so7130201a12.0
 for <qemu-trivial@nongnu.org>; Mon, 01 Dec 2025 23:47:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764661661; x=1765266461;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lhGI90u3lG0jQ/lk1uJEavBnJNz6fBbLoVOWHiZIh18=;
 b=KThbEc5Mn0gI9Inm3O586VkflzdaAgqTz+sgdxyr/SJlf0Ka62y4UYt77sbRx0JQSN
 JOtNvgMVWsq//55usDafQ7jlPHc342PuiFHB4HrSziV3hkY/crOeeSH1EgSbqZlDp5LM
 X/yHph958WyyUqDMMSzY2K3MZshLTPohjs7EQlC9hcVpzIQ3fDjVjDW0pAMOIemNYqcJ
 tqH6+r5ooJGdNhhBv7diVciiRDB7+U+Icr2PRBwefoOUNstwhvpP/P+V/cpX0C/dK6fF
 GuexCUu8ph70RX2K+H0KUNQib+4mADDyS2pawGQSnbvmvBMbUVtCjkh1YIEYWDCXL1Z7
 yCXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVahMQw8bIDFd/+zcR3VycbGtAAJ5Vdrvsiut2AizhTPiUGs2ldzEb1FlMJzOIJ1FF8mfH4CY1mQQkhUkg=@nongnu.org
X-Gm-Message-State: AOJu0Yz3swZuJUcZFeoVgyVhkgj3o1+iyed+othXbG2EBfI2QsMquk3z
 1VzYZPY99OHHlB4mGPWh0QnZruBpTYx5108iFSwEfy1IBz0WkKsjd0jbBSuQ84lLpFYePgfvKs/
 hjcx0eogo2aLiNgv3PfjVAKCyfEzj8BpGnU+K9bfnproZBHGUtMekvtHsSK4=
X-Gm-Gg: ASbGnct23DRu694Z8Cr1oGSxyiqLGEaU1Sq0twbakkLy9XYDVOf8ZoigtQpP4LZRvUw
 BmqhiDIqVSwoxRX1e39ICD7rkhPghnC2GslabNkXNkU0salxN7y1CtnLHL/uXteTgVn7b5VHAyy
 hdcJ/PFr2S+/9FTxSnrQU/9k3ylcZZtCjQhoQ8p7OWotyG1IXfqcYtGibiKAQNPqsVrJYVuATNb
 /RqIOeaWBcpXHqpMDGZ42cuiOkj9Buw5fGbSees9nDaQT9jkJujOU46BZz8VgZAaCjPFPVP2K6Y
 mdTc6J07+F7dtGjS30swdafo9qzkn+RQUAFyK66J2l+mzLqThMCLQa9AgYrQftkBdww0/oLstEd
 wO5gXOQJlRnIHODkkZ00s8YMnX0nYYtGLeWaGygzyySUxCZEuthrEMSoI/HI97sU1Bmb0AewV3l
 jdpAt98cDFL5mv+5w=
X-Received: by 2002:a17:906:fd83:b0:b73:8e7d:4f87 with SMTP id
 a640c23a62f3a-b767184be2bmr4453489466b.45.1764661660729; 
 Mon, 01 Dec 2025 23:47:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEjue/uKltBmasT3UsCNePSvEOjTgh74Wqwen5w2FIDL2ghjp/F6RLeoy8BWszospbj8gKMw==
X-Received: by 2002:a17:906:fd83:b0:b73:8e7d:4f87 with SMTP id
 a640c23a62f3a-b767184be2bmr4453486266b.45.1764661660255; 
 Mon, 01 Dec 2025 23:47:40 -0800 (PST)
Received: from [192.168.10.48] ([176.206.119.13])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b76f51c8393sm1448431466b.31.2025.12.01.23.47.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Dec 2025 23:47:39 -0800 (PST)
Message-ID: <c6b78af8-7da6-4ac0-9e74-dc67e2b4d4d7@redhat.com>
Date: Tue, 2 Dec 2025 08:47:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] qemu-options.hx: Replace deprecated -M example
To: Thomas Huth <thuth@redhat.com>, dave@treblig.org,
 qemu-trivial@nongnu.org, mjt@tls.msk.ru, laurent@vivier.eu
Cc: jak@jak-linux.org, qemu-devel@nongnu.org
References: <20251202005740.299524-1-dave@treblig.org>
 <95dd7914-8e58-42e7-9988-cd7822f17bca@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <95dd7914-8e58-42e7-9988-cd7822f17bca@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NLvKJhtVswzXxPZ2sKyfL8P_I7jAtwhos0Y4jVlT6y4_1764661661
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

On 12/2/25 08:14, Thomas Huth wrote:
> On 02/12/2025 01.57, dave@treblig.org wrote:
>> From: "Dr. David Alan Gilbert" <dave@treblig.org>
>>
>> The -M option was deprecated by -machine in 2011 by 80f52a669
>> and isn't actually documented in the manpage, but is still used in
>> one of the examples.  Replace it by -machine.
>> -M still gets used all over the place in other docs, and I'm
>> not sure I realised it was deprecated until Julian pointed out it
>> wasn't actually documented.
> 
> -M is not mentioned in docs/about/deprecated.rst, so no, it's not 
> officially deprecated. And I think it's a nice short hand feature for an 
> option that is used very often, so I also don't think that we should 
> ever remove it. Thus I think it would be better to simply add it back to 
> qemu-options.hx instead.

Yes, its status as a synonym of -machine started only in 2015, in a 
commit that didn't even mention that effect:

     commit 364c3e6b8dd7912e01d19122d791b8c8f6df4f6c
     Author: Marcel Apfelbaum <marcel@redhat.com>
     Date:   Wed Jan 7 14:11:38 2015 +0200

     vl.c: fix regression when reading machine type from config file

     After 'Machine as QOM' series the machine type input triggers
     the creation of the machine class.
     If the machine type is set in the configuration file, the machine
     class is not updated accordingly and remains the default.

     Fixed that by querying the machine options after the configuration
     file is loaded.

     Cc: qemu-stable@nongnu.org
     Reported-by: William Dauchy <william@gandi.net>
     Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
     Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

(I wonder who's the guy that committed it).  But it was a good idea, and 
there's no need to change this.

Paolo


