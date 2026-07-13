Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 758AFC43458
	for <qemu-trivial@archiver.kernel.org>; Mon, 13 Jul 2026 10:33:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wjDxg-00084h-Mc; Mon, 13 Jul 2026 06:32:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1wjDxb-00080f-4O
 for qemu-trivial@nongnu.org; Mon, 13 Jul 2026 06:32:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1wjDxZ-000161-Jq
 for qemu-trivial@nongnu.org; Mon, 13 Jul 2026 06:32:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1783938743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=u96zREFqVVRn1UxC/Vx7RwZuddfsts/PtT0uqtC2woQ=;
 b=OS5WwKdtE1VzjYY5ZfRAzLe2cUU3yyuGo+lVvflssdJk8kNb8lr+649XDtauWVjoaPik4S
 OwCVlJ2oawqPuX1+NXqFI6xlIaCMrjkaDVKjG8Iy+5J+0CWeG40vVYqIjJ3yvvxq3r6bmz
 cAJ4ps/iJuWV/XSqtPYphSNYTt+hjnY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-454-B2YU1nrsPVq4K9ngmiiz9g-1; Mon, 13 Jul 2026 06:32:22 -0400
X-MC-Unique: B2YU1nrsPVq4K9ngmiiz9g-1
X-Mimecast-MFC-AGG-ID: B2YU1nrsPVq4K9ngmiiz9g_1783938740
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-493b21b1fe8so21852865e9.0
 for <qemu-trivial@nongnu.org>; Mon, 13 Jul 2026 03:32:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783938740; x=1784543540;
 h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=u96zREFqVVRn1UxC/Vx7RwZuddfsts/PtT0uqtC2woQ=;
 b=SK5fMmHTnxfnFXo83JILmWUBk9lTi2XjhQ+0iwoYrSASxZjV5oPjnEHfmj+OU33TWi
 iYm+eIiIMv+34VUN0itq7+eh22i5TIRnh6Hi2Tx6Mg5WuG3DpTQ7fz0ry6+LS1AyIaob
 RX4SJzA1Z5wYBN8AAju8Bg1hNI/9wFnMlr+3Ze5uGz45GRlUFNIzTwkd/ibnLwXbY8mS
 OB49EBdW2rzD/uCOMBh8gRFhfX9mOzd5EUYPpMrYOvAwHpg7F6dLlFMXlcALYuy+JR0v
 0k298Qgn7ttfeWbCjhuxYud+iSONA7xzYNgJxTx4Buw+gAp+OvbvYK7mGE6MqEYj9jNC
 A43w==
X-Forwarded-Encrypted: i=1;
 AHgh+RqN44dLgkVttzkMeBYT/8NHv2NTk99uu9mosHbvsqlXtMxr8FDinkzg7bHosYjkK0/juEMoS44ESPsc+oc=@nongnu.org
X-Gm-Message-State: AOJu0Yw+wzG8pbTPyQLAOkhIw/oNeInZsArD/f7pcrZUCMt27j58B/pG
 jpDkxAy8MpbNP5nLU2PPMCfl312yjQWlJQPcf0yiwl7WPNny+aP6DnHbw/oI/WgvbbRb3uRngiS
 BxFfVikVsiCndtRKBqhTNVwaQo15pb0KpxO0bzyfPmUJXt6XHrNxwCLbJYSg=
X-Gm-Gg: AfdE7ck6x1QX1fauKrsZ9UzR1EhjiUT+HvDlbyxd/+VEKxqCj7wsgdnlrRFru9DZV6q
 k12pAqSxB6VqPvmMq/KwkVsTcRNPdgRK1x229VqmErVbBS5O5I5p3CaTIbBjxaBkE6naMYK4itl
 3E9I8hrna82yR2uv875rdpACfwmxpz8NSDbyK249S/3eIpIH/TppLZ0ApdM9Fql/jQVuiOUc9b1
 TX0bKeHgHOlcJm+oiuBHGaV/uJTN86OEEeJvp6vQosIL2hshlX1y5nGoeoIE718uTBgCSPNo2vw
 kzOC312Z1Ni8IPPF4gYxPFXc20BKX2TuvOUE4QWdwbrOzN0BSDW8vR/1I8E1cW1NHK7S2rqakJ1
 qfhMO2m+X
X-Received: by 2002:a05:600c:4e0b:b0:493:bc4a:c6b4 with SMTP id
 5b1f17b1804b1-493f8851d13mr82233735e9.38.1783938740308; 
 Mon, 13 Jul 2026 03:32:20 -0700 (PDT)
X-Received: by 2002:a05:600c:4e0b:b0:493:bc4a:c6b4 with SMTP id
 5b1f17b1804b1-493f8851d13mr82233405e9.38.1783938739856; 
 Mon, 13 Jul 2026 03:32:19 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.114.244])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb74835esm379865215e9.14.2026.07.13.03.32.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2026 03:32:19 -0700 (PDT)
Message-ID: <f91767d6-c78e-4a2e-b67e-fc74e07a0930@redhat.com>
Date: Mon, 13 Jul 2026 12:32:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] hw/usb/hcd-xhci: Remove the FIXME macro
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
References: <20260713100508.123623-1-thuth@redhat.com>
 <20260713100508.123623-3-thuth@redhat.com>
 <CAFEAcA-n-9YVVRr2G3wP0a7sp6arZS4Vmqt35TJY40iGM=DCSQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <CAFEAcA-n-9YVVRr2G3wP0a7sp6arZS4Vmqt35TJY40iGM=DCSQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1lPr-VWkgxux5wzchvtatyesxoHmVZyM3_RBTEK6fgs_1783938740
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: permerror client-ip=170.10.133.124;
 envelope-from=thuth@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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

On 13/07/2026 12.16, Peter Maydell wrote:
> On Mon, 13 Jul 2026 at 11:05, Thomas Huth <thuth@redhat.com> wrote:
>>
>> From: Thomas Huth <thuth@redhat.com>
>>
>> The FIXME macro is only used in one case, which should hopefully
>> never trigger: The containing function handles all the USB_RET_*
>> values except for USB_RET_ADD_TO_QUEUE and USB_RET_REMOVE_FROM_QUEUE,
>> which are both internal return values for when an async packet needs
>> to be queued or dequeued, and which shouldn't still be the status by
>> the time we get to this function. Thus let's simplify this spot
>> and use a g_assert_not_reached() instead.
>>
>> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   hw/usb/hcd-xhci.c | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> Not sure if some compilers/analyzers would complain about the
> DPRINTF followed by g_assert_not_reached().
I hope they don't complain since the macro is disabled by default...? Or 
shall we play save and remove the DPRINTF here, too?

  Thomas


