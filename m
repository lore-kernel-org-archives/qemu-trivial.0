Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ryowI-00012Q-Rw
	for mharc-qemu-trivial@gnu.org; Mon, 22 Apr 2024 04:22:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ryowH-00012C-LB
 for qemu-trivial@nongnu.org; Mon, 22 Apr 2024 04:22:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ryowF-0006Fq-GZ
 for qemu-trivial@nongnu.org; Mon, 22 Apr 2024 04:22:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713774130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=fN5cgOG5FVT5l4OdKc80KL6Jdx3gVXu2BqIhpQLvSEI=;
 b=TVfmoioDeAZcRuuI/Gkvs+hTaBXpmhvzZXvQ4SGZdQGJ+DYroEXTQSJBkN7HTx8/FygAn6
 m1671epmJnplOYAXj88oFoKlLtYaEdStPR15fXKgkAYcoTL7envTHJZxolaCKgglG/5XnD
 lBpLkLMvYmeL75+6nVgYDNQXwk5OI3U=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-JrF0grZPMjuZBTft8R3s5g-1; Mon, 22 Apr 2024 04:22:08 -0400
X-MC-Unique: JrF0grZPMjuZBTft8R3s5g-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-343ee356227so2678743f8f.2
 for <qemu-trivial@nongnu.org>; Mon, 22 Apr 2024 01:22:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713774127; x=1714378927;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fN5cgOG5FVT5l4OdKc80KL6Jdx3gVXu2BqIhpQLvSEI=;
 b=k+hcx91fV6QnImLzOCalAiRykROg8FbfqpDq0b3woRQFoaqivjVOGIc8HYnhmragMt
 Q+8GdchagFmkuRpCzXtApbYs1oYjvH9GdLg5fQp3Y4nnVtLlTSmq7aNZ46lDVEYe2iNI
 YwYVUDoC8DHCZ2bKkRzuIGMBCIRiB5Jva23o9SlGCn3gF2ZRbwgh6iiMvFRi9KcL1ixs
 /nm/Oqt18K9jIeJZ9tzK1VJJqo/ANbmk77dH7Ppir/OsVGh28jhK1w+TWck7mI2PKXXE
 oFVX/S5C3tJyPm4xwyVe/Y5xiQGcjRvKwwvxY/KfekO14PYUayFMXAy4szYVrzDfNHVO
 XnSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFQpjHWRnsbgqDsSWbHXKXU2JMktXr2dU4y6AlJwecA7+mN57fycMpK0soTTEZi0aJkw8WXjVLCO9QEb82XhPH5FpRXvSa1Q==
X-Gm-Message-State: AOJu0YzqLjeYoM48wBnvE/R/fg2wOkztF1fIshRPZADKtKzAN5VEw+u9
 hELARik3GBWE/kg5qi0rj5MHWcZylfaKgOKrMGCmeCEf/qsYE7x/ZmZG/DathvNIey59bO4nMmw
 cIx6Ht1W/rC2oz9UjW84GmFbHQNqC2IqNbOjjtK7lponx388excxKivo=
X-Received: by 2002:a5d:5548:0:b0:343:9feb:25af with SMTP id
 g8-20020a5d5548000000b003439feb25afmr6660810wrw.56.1713774127179; 
 Mon, 22 Apr 2024 01:22:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYqxJQGh4DHNc2oEgo4tgHQBT7ec24zdwyDqsuPURKCwKUhZ5y9blAOjz4RLxBvTb0aXV55Q==
X-Received: by 2002:a5d:5548:0:b0:343:9feb:25af with SMTP id
 g8-20020a5d5548000000b003439feb25afmr6660795wrw.56.1713774126848; 
 Mon, 22 Apr 2024 01:22:06 -0700 (PDT)
Received: from [192.168.0.9] (ip-109-43-177-172.web.vodafone.de.
 [109.43.177.172]) by smtp.gmail.com with ESMTPSA id
 s15-20020adfe00f000000b0034b03d0b94csm2688869wrh.74.2024.04.22.01.22.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Apr 2024 01:22:06 -0700 (PDT)
Message-ID: <d2786e99-ae33-43a0-8040-8a218bb485f1@redhat.com>
Date: Mon, 22 Apr 2024 10:22:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Remove useless architecture prefix from the CPU list
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-trivial@nongnu.org
References: <20240420054606.13353-1-thuth@redhat.com>
 <ZiYZyOqeM2tYPcCs@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <ZiYZyOqeM2tYPcCs@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.42,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 22 Apr 2024 08:22:13 -0000

On 22/04/2024 10.03, Daniel P. Berrangé wrote:
> On Sat, Apr 20, 2024 at 07:46:03AM +0200, Thomas Huth wrote:
>> Printing an architecture prefix in front of each CPU name is not helpful
>> at all: It is confusing for the users since they don't know whether they
>> have to specify these letters for the "-cpu" parameter, too, and it also
>> takes some precious space in the dense output of the CPU entries. Let's
>> simply remove those now.
> 
> Could it be said that this arch prefix is about to finally become useful
> with Philippe's patches to add a 'qemu-system-any' command covering
> multiple arches ?

I don't think so: In that case we'd rather print it once at the beginning of 
a list ("Available x86 CPUs:") instead of printing it in each and every line.

  Thomas



