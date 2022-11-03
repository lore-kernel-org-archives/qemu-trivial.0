Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oqdvW-0003tY-L7
	for mharc-qemu-trivial@gnu.org; Thu, 03 Nov 2022 13:22:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqdvV-0003rm-Fx
 for qemu-trivial@nongnu.org; Thu, 03 Nov 2022 13:22:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqdvU-0002Nm-5M
 for qemu-trivial@nongnu.org; Thu, 03 Nov 2022 13:22:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667496167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EMtLscuM+GkhtCSMJR6gBFiXWZfzwaCGy/BE14Qb5hs=;
 b=AmdIyIEObmyXJdCE/qfuC9NJcMqktDeTQHTQTskIsZWhbYVsYkOkccnnIJsL43qIpTu9/+
 kBi4knGH95MTEUNZnk4shrfP9lLmnq4wRjbc6jHRCBsYzlKkSRYFrRMNiEJS/3rj26rQap
 YmU5I0BNL1Nlai20DDp9NbbJ5Bs+NIE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-446-S_LFk-dUNT2QoexjnLMEEg-1; Thu, 03 Nov 2022 13:22:45 -0400
X-MC-Unique: S_LFk-dUNT2QoexjnLMEEg-1
Received: by mail-ed1-f71.google.com with SMTP id
 z11-20020a056402274b00b00461dba91468so1819055edd.6
 for <qemu-trivial@nongnu.org>; Thu, 03 Nov 2022 10:22:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EMtLscuM+GkhtCSMJR6gBFiXWZfzwaCGy/BE14Qb5hs=;
 b=w9TR+WRaiBP7I1FcvGSQQBNiVluBPqzbzRbLkzZPsttW0llWQyUcrYqm5P+hhdimeZ
 NRIwAtGOCEs2BwgfOJVU2qAl2Cc27A/irZyZyfavEGTL6Dmhe5UZbefdUtgPLU+Ajp+k
 T7eABimW1TxL73VLj3flBw+6IVQCWvT0qBdcx3XKg9GCb4uyZ2BFh2Bnnpxzj0a/+ul5
 0dK0SEJ7lXpL4VkrDMA55aXJAYPFK6h3p33KbGIN2nUNEqPZVz1afMVfCLwNU4FdU8O0
 3iua+KSsOsymDW8tS7Tt73uqGqNH1l1yhr9P0AbuqlU9j53F+lFwrQY0kOUm4fgKpaKX
 R6Mg==
X-Gm-Message-State: ACrzQf0rqPRjYUTMimeJyAPo4kfPmQuxv1SK6dpFaxsec8qsmt/hhPoe
 +MDotfSAvsstdRTyRU4xOebrfSINIZWXt6jMum/RiizjmABrP8/GAFOvH7P3ylBnRTntg/Zu1Zp
 ODwzkF/KEIKLvv+UawA==
X-Received: by 2002:a17:906:6a8d:b0:741:6a3b:536e with SMTP id
 p13-20020a1709066a8d00b007416a3b536emr30756308ejr.11.1667496163850; 
 Thu, 03 Nov 2022 10:22:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6ZRZ4cw0H8szIxejDDMt3WKonsXorBEMr+lfN1kHangTCJRJTwO2xj6P6cKdNMt/6lFAKHRA==
X-Received: by 2002:a17:906:6a8d:b0:741:6a3b:536e with SMTP id
 p13-20020a1709066a8d00b007416a3b536emr30756299ejr.11.1667496163664; 
 Thu, 03 Nov 2022 10:22:43 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 qq18-20020a17090720d200b007aa9156f7e9sm732511ejb.32.2022.11.03.10.22.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 10:22:43 -0700 (PDT)
Message-ID: <2b1a92c2-c081-aacd-da05-aa434f50bbaa@redhat.com>
Date: Thu, 3 Nov 2022 18:22:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH for 7.2] Fix broken configure with -Wunused-parameter
To: Stefan Weil <sw@weilnetz.de>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org
References: <20221102202258.456359-1-sw@weilnetz.de>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221102202258.456359-1-sw@weilnetz.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Thu, 03 Nov 2022 17:22:49 -0000

On 11/2/22 21:22, Stefan Weil via wrote:
> != "no"; then
>     cat > $TMPC << EOF
>   int main(int argc, char *argv[])
>   {
> +    (void)argc;
>       char arr[64], *p = arr, *c = argv[0];

You could use argv[argc - 1] instead.

Paolo

>       while (*c) {
>           *p++ = *c++;


