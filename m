Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1riJNn-0001yE-LO
	for mharc-qemu-trivial@gnu.org; Thu, 07 Mar 2024 14:26:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1riJNl-0001xu-62
 for qemu-trivial@nongnu.org; Thu, 07 Mar 2024 14:26:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1riJNW-0008LR-5H
 for qemu-trivial@nongnu.org; Thu, 07 Mar 2024 14:26:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709839564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=YDkgwdaxInvc7gvn2rkK6xaqbRC8CM1PVSdNoqffaTw=;
 b=Y74q0CLQcAchdTksLDG5Q689FiGVxhhmrWIH+QnN5IqtlNa284je+9VSMacwfEdxcI3NvG
 za4Eq7rRtf8vo6Wb9ImaEgjbOVcuzmxVX4wP+HJr9vC5RYo71dEgbxhjIL1UNPlJPllSwN
 qUAO1pQTNDjPCUC9JKihRL6WRu+5eak=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-LZXYzG36PEquCPwH8aNjIQ-1; Thu, 07 Mar 2024 14:26:03 -0500
X-MC-Unique: LZXYzG36PEquCPwH8aNjIQ-1
Received: by mail-oo1-f71.google.com with SMTP id
 006d021491bc7-59fe01fbe7bso1281679eaf.2
 for <qemu-trivial@nongnu.org>; Thu, 07 Mar 2024 11:26:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709839563; x=1710444363;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YDkgwdaxInvc7gvn2rkK6xaqbRC8CM1PVSdNoqffaTw=;
 b=dvr1MJzLqoQCHoSuU16+3r0rlVVuGJwPsNDAPdW9aXgFwIRbAjbngNvXPtp9a2BR0U
 0b2wHfqbwjZpmwMoDvxSE4bdzKREQvx7MDY9nQAv9s71kVg6jMKJ4EaCi9AmRSz9t4lB
 j4BtFkIcxjtm028uQNaW3P1XSG/6C6Ng8xUmMdcgvsQULhkOT7rlXLWr9rpDBNOD/K5b
 U98g5S5vp8Dkhl8lC4yyfPAQxUrhk97nhrg5yABJubWIrZHSAhraJbusmkapwrLnXqI1
 xh6d4+/36LddMxvb6WNOVW9fzWl/wdyrBJJRsKvHwobVScGof++RbgJmbSYHFE/2cqlC
 KIMg==
X-Gm-Message-State: AOJu0Yzhsz9dxaM5baywV66c89xSvd8gttMRhghJVipJ2LakIrUcUeAV
 MkhzqrsG3btkbKUF14YbeOSS6K36EKT+Oj5fFQdqyj2/ssWgltmQfq4PQ9cpYWycrLWy8KpAT7k
 d8rBpTrK+HiPtsHu2mjkUiZcfPwwwNCRKI3i50cJmmNn7iXNhm5A86AE=
X-Received: by 2002:a05:6358:998b:b0:17c:2214:6537 with SMTP id
 j11-20020a056358998b00b0017c22146537mr9956461rwb.30.1709839562633; 
 Thu, 07 Mar 2024 11:26:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHSrfGS1RpZQBZo7DKPwAqQutlaCtOv0ZIUQpgC+YOizU9xOcU2FGpqjMLeEnWdgXwYOeOa7Q==
X-Received: by 2002:a05:6358:998b:b0:17c:2214:6537 with SMTP id
 j11-20020a056358998b00b0017c22146537mr9956386rwb.30.1709839561019; 
 Thu, 07 Mar 2024 11:26:01 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-178-151.web.vodafone.de.
 [109.43.178.151]) by smtp.gmail.com with ESMTPSA id
 om13-20020a0562143d8d00b0069049135a69sm8873169qvb.118.2024.03.07.11.25.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Mar 2024 11:26:00 -0800 (PST)
Message-ID: <3a7a9d7e-3639-4adc-84a5-1126f7a13a0c@redhat.com>
Date: Thu, 7 Mar 2024 20:25:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/17] hw/vfio/ap: Fix missing ERRP_GUARD() for
 error_prepend()
To: Anthony Krowiak <akrowiak@linux.ibm.com>,
 Zhao Liu <zhao1.liu@linux.intel.com>, Markus Armbruster <armbru@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>
References: <20240229143914.1977550-1-zhao1.liu@linux.intel.com>
 <20240229143914.1977550-6-zhao1.liu@linux.intel.com>
 <7dadf54c-5a6f-4fe4-8dd3-1137e43c1756@redhat.com>
 <0fa974fe-6be5-4468-8581-85bccd4b720b@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <0fa974fe-6be5-4468-8581-85bccd4b720b@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.583,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Thu, 07 Mar 2024 19:26:22 -0000

On 04/03/2024 16.12, Anthony Krowiak wrote:
> 
> On 2/29/24 12:30 PM, Thomas Huth wrote:
>> On 29/02/2024 15.39, Zhao Liu wrote:
>>> From: Zhao Liu <zhao1.liu@intel.com>
>>>
>>> As the comment in qapi/error, passing @errp to error_prepend() requires
>>> ERRP_GUARD():
>>>
>>> * = Why, when and how to use ERRP_GUARD() =
>>> *
>>> * Without ERRP_GUARD(), use of the @errp parameter is restricted:
>>> ...
>>> * - It should not be passed to error_prepend(), error_vprepend() or
>>> *   error_append_hint(), because that doesn't work with &error_fatal.
>>> * ERRP_GUARD() lifts these restrictions.
>>> *
>>> * To use ERRP_GUARD(), add it right at the beginning of the function.
>>> * @errp can then be used without worrying about the argument being
>>> * NULL or &error_fatal.
>>>
>>> ERRP_GUARD() could avoid the case when @errp is the pointer of
>>> error_fatal, the user can't see this additional information, because
>>> exit() happens in error_setg earlier than information is added [1].
>>>
>>> The vfio_ap_realize() passes @errp to error_prepend(), and as a
>>> DeviceClass.realize method, its @errp is so widely sourced that it is
>>> necessary to protect it with ERRP_GUARD().
>>>
>>> To avoid the issue like [1] said, add missing ERRP_GUARD() at the
>>> beginning of this function.
>>>
>>> [1]: Issue description in the commit message of commit ae7c80a7bd73
>>>       ("error: New macro ERRP_GUARD()").
>>>
>>> Cc: Alex Williamson <alex.williamson@redhat.com>
>>> Cc: "Cédric Le Goater" <clg@redhat.com>
>>> Cc: Thomas Huth <thuth@redhat.com>
>>> Cc: Tony Krowiak <akrowiak@linux.ibm.com>
>>> Cc: Halil Pasic <pasic@linux.ibm.com>
>>> Cc: Jason Herne <jjherne@linux.ibm.com>
>>> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
>>> ---
>>>   hw/vfio/ap.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/hw/vfio/ap.c b/hw/vfio/ap.c
>>> index e157aa1ff79c..7c4caa593863 100644
>>> --- a/hw/vfio/ap.c
>>> +++ b/hw/vfio/ap.c
>>> @@ -155,6 +155,7 @@ static void 
>>> vfio_ap_unregister_irq_notifier(VFIOAPDevice *vapdev,
>>>     static void vfio_ap_realize(DeviceState *dev, Error **errp)
>>>   {
>>> +    ERRP_GUARD();
>>>       int ret;
>>>       Error *err = NULL;
>>
>> Now this function looks like we need both, ERRP_GUARD and the local "err" 
>> variable? ... patch looks ok to me, but maybe Markus has an idea how this 
>> could be done in a nicer way?
> 
> 
> Correct me if I'm wrong, but my understanding from reading the prologue in 
> error.h is that errp is used to pass errors back to the caller. The 'err' 
> variable is used to report errors set by a call to the 
> vfio_ap_register_irq_notification function after which this function returns 
> cleanly.

Right, no objections, that's what I meant with "this function looks like we 
need both" ...
But having both, "err" and "errp" in one function also looks somewhat 
confusing at a first glance. No clue how this could be done much better 
though, maybe rename "err" to "local_err" to make it clear that the two 
variables are used independently?

  Thomas


