Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ovfCH-0006PQ-S7
	for mharc-qemu-trivial@gnu.org; Thu, 17 Nov 2022 08:44:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ovfCG-0006Od-46
 for qemu-trivial@nongnu.org; Thu, 17 Nov 2022 08:44:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ovfCE-0002Vg-78
 for qemu-trivial@nongnu.org; Thu, 17 Nov 2022 08:44:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668692689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DtwWcIYPo6ErocRTIyZStk58GcacysT+X8X8h8hdbok=;
 b=IlJctA19/oIUMsWEGvf+mYV5gqfgCXJ29Xw4Sny2samPPrgdjY6FdOrvwoJHpXMJ8CAKhR
 H6JDNppRGpTrgijy1OnhmoZXfHjBtnhAOUaGf6HniMZtBwIAvQDYV7jeQjumuQkvdFxxX/
 Y36WV1R7ltLQi6rOjAMcdfc+MjKbwy8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-424-nfHGfPhdPoKL4j4zYauLVg-1; Thu, 17 Nov 2022 08:44:47 -0500
X-MC-Unique: nfHGfPhdPoKL4j4zYauLVg-1
Received: by mail-wm1-f70.google.com with SMTP id
 bi19-20020a05600c3d9300b003cf9d6c4016so2797278wmb.8
 for <qemu-trivial@nongnu.org>; Thu, 17 Nov 2022 05:44:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DtwWcIYPo6ErocRTIyZStk58GcacysT+X8X8h8hdbok=;
 b=cpchf1jl6kM1BURatDk9E2XH1OqaKHOxowtg3+Cik/77Hvxyb9AMUaq1XcXHywPr1P
 i0YEx9p6sT1NqyntI82auWyNrDSY846qtobLtD31gOehwgeu+bGnJFIsRW+dbwOdFS25
 7uuP17/AJagSc1AEyDc50oV+IGov6194U6s+spkjl5HFry0/gXyUcNG9fl0BxvEd/5za
 29oQbZTGHb27cGiHWs5efeq9vK7zRzaE5PE/xxq6wdSyFZU2drEY8N3Xg5kA4Mgl4AcN
 L9DXXdqNlKEE5xGUOdth4XSYjzcTUU9CW7Bmb5KXq8GMP9aqdgkHb7uhhQsrDMzmaWiL
 Qdig==
X-Gm-Message-State: ANoB5pl6DIY9msd3sWjeg8fpx4LDMlFwFH0YCQtEsHtKSHW6GrBkzGB3
 FYQAt6XhjE5wYaQJxRrFUy+T/FucWSSWCLT6ZcQwJBrSRbO8r/avlBApm2tasA7R5RIvIbu6c4s
 L+oC75mElAnDcghazKw==
X-Received: by 2002:a7b:c852:0:b0:3c6:a8c7:755e with SMTP id
 c18-20020a7bc852000000b003c6a8c7755emr1701747wml.167.1668692686509; 
 Thu, 17 Nov 2022 05:44:46 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6ol33xMADEQQmc0h1ZDbWFq0oTi+62O5GJOtU4CRY6yLLFaf0EWzNsIe5H17RT3rMY8otVRg==
X-Received: by 2002:a7b:c852:0:b0:3c6:a8c7:755e with SMTP id
 c18-20020a7bc852000000b003c6a8c7755emr1701731wml.167.1668692686300; 
 Thu, 17 Nov 2022 05:44:46 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-177-4.web.vodafone.de. [109.43.177.4])
 by smtp.gmail.com with ESMTPSA id
 w17-20020adfcd11000000b0022e653f5abbsm1065339wrm.69.2022.11.17.05.44.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 05:44:45 -0800 (PST)
Message-ID: <324b78bd-39ee-4f24-6b7c-c80b89a483f6@redhat.com>
Date: Thu, 17 Nov 2022 14:44:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH for-7.2] tests/avocado/boot_linux: Increase the timeout of
 the ppc64 test
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-trivial@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Greg Kurz <groug@kaod.org>
References: <20221117124634.574180-1-thuth@redhat.com>
 <CAFEAcA8i5GXNKEK+75drx-YqqRxFTFiuwQFvX1sNPjFE0Ckp0g@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAFEAcA8i5GXNKEK+75drx-YqqRxFTFiuwQFvX1sNPjFE0Ckp0g@mail.gmail.com>
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
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Thu, 17 Nov 2022 13:44:52 -0000

On 17/11/2022 13.55, Peter Maydell wrote:
> On Thu, 17 Nov 2022 at 12:46, Thomas Huth <thuth@redhat.com> wrote:
>>
>> The BootLinuxPPC64.test_pseries_tcg test currently times out in
>> the gitlab-CI or when building QEMU with --enable-debug. It takes
>> way more than 300 seconds to finish the test in such environments,
>> so let's bump the timeout to a more appropriate value.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
> 
> I sent a patch for this one last week:
> https://patchew.org/QEMU/20221110142901.3832318-1-peter.maydell@linaro.org/
> (although it only pushes the timeout up to 360, not 420).

Ah, great, and Alex also already queued it? Then let's go with your patch. 
360 seconds should hopefully be enough, too.

  Thomas


