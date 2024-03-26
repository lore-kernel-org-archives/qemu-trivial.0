Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rp6zy-0005Gu-Kd
	for mharc-qemu-trivial@gnu.org; Tue, 26 Mar 2024 09:37:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rp6zw-0005Fv-Ej
 for qemu-trivial@nongnu.org; Tue, 26 Mar 2024 09:37:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rp6zu-0004j7-MX
 for qemu-trivial@nongnu.org; Tue, 26 Mar 2024 09:37:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711460270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=QKR8ttZU4JjPH7rWlPZkV+CksXO0+0MOEdG/2chS4jE=;
 b=ZGtRKEMYWYuNIPvEsE+FxTIzdm/+k7a786iLZlJq1EOcSsK7HwMrw/35nGQu1pnZXgCMN5
 +zdZH8vNIPmhBU1rTH1+RqZPTaHU7uSAZrT+48vSyhsbX00GBQnsA/1I1giSpAiX6yGh39
 uryRyunVr4V89DJSRDDJrBtSe1vXA+M=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-57-gNy9P7zSOUS-BoXFBqa2ng-1; Tue, 26 Mar 2024 09:37:46 -0400
X-MC-Unique: gNy9P7zSOUS-BoXFBqa2ng-1
Received: by mail-oo1-f71.google.com with SMTP id
 006d021491bc7-5a553b2f756so2079520eaf.1
 for <qemu-trivial@nongnu.org>; Tue, 26 Mar 2024 06:37:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711460265; x=1712065065;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QKR8ttZU4JjPH7rWlPZkV+CksXO0+0MOEdG/2chS4jE=;
 b=pxsgaDfwRU1XekSOlLWe8ufGUukvYb5xDU2V+aCSkzfweQlKF+Ur55JBmLS3+D3XQ4
 Y5b6ad0ul9UPz+MO8QB0rKyjSM1Xg7FnpXTcwH/SW6m4vGyGbd8TZh0LFYrdr8KgZfT0
 GmUY5E+MMivnEtd7vQIOweOq+pRsPUFbWPUPiOge+sN7l+BpwZhdzQYSEXE63wS2HLn/
 dF3EzUyuhQbGFpOdBiSr0HW0uZrG5cYgoj3MwJtJpemYCPjC86uVBTcpz6urZ20KSHHs
 EckO+nWzPUfLOmd02vE+MwkUxMlLwxPbHyl1FsY1Y5tPnKLvuHPo9o4dIZ07gUEak1Rt
 EmQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqyc1MJ2LuC0wGOizGWsuqnYSo5eqzcbMIMceYhxdG75yH1HpQtbIo/WhPEZaiqoakxlBr4CYZNg5zcb9698SJ4pyZWT9MNQ==
X-Gm-Message-State: AOJu0YxYWfSlI4W3nmvDddLXzcTzIQob74DaM0w2l3uZe3mvaHNbgXw3
 dRerAX9jUQ/L7UFmT4GjZVAu7WH15b/9OGCSu65UyA9DxITSLdLINMouhn/5+X1I5OCkbw6caNx
 JJcG2vsAlWn8tnd378mRfK7E2OdOqg/0/MPScRvhf/razT6Xl3JoV7Lc=
X-Received: by 2002:a05:6358:480d:b0:17f:5657:8d57 with SMTP id
 k13-20020a056358480d00b0017f56578d57mr10743200rwn.9.1711460265464; 
 Tue, 26 Mar 2024 06:37:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1q+fjJ5GjD+7CinUcLOnXaXxy6U3GhiNS5sBnlWHagQxfjO7EJ7QrqzpJ3nWzPrFz69xDqQ==
X-Received: by 2002:a05:6358:480d:b0:17f:5657:8d57 with SMTP id
 k13-20020a056358480d00b0017f56578d57mr10743189rwn.9.1711460265189; 
 Tue, 26 Mar 2024 06:37:45 -0700 (PDT)
Received: from [192.168.0.9] (ip-109-43-177-37.web.vodafone.de.
 [109.43.177.37]) by smtp.gmail.com with ESMTPSA id
 r10-20020a056214212a00b00690c9256676sm5236370qvc.49.2024.03.26.06.37.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Mar 2024 06:37:44 -0700 (PDT)
Message-ID: <306fd62e-50d4-4871-ae62-ea554a0fb388@redhat.com>
Date: Tue, 26 Mar 2024 14:37:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.0] docs/about: Mark the iaspc machine type as
 deprecated
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
Cc: pbonzini@redhat.com, devel@lists.libvirt.org,
 richard.henderson@linaro.org, mst@redhat.com, qemu-trivial@nongnu.org
References: <20240326125104.90103-1-imammedo@redhat.com>
 <a4a0bb13-d6a0-4665-810d-ecd9a9fb89b1@redhat.com>
 <8dbba6ae-5910-4a62-9a08-a56e20dfb480@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <8dbba6ae-5910-4a62-9a08-a56e20dfb480@linaro.org>
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
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Tue, 26 Mar 2024 13:37:52 -0000

On 26/03/2024 14.29, Philippe Mathieu-Daudé wrote:
> Hi Igor,
> 
> On 26/3/24 14:08, Thomas Huth wrote:
>>
>> s/iaspc/isapc/ in the subject
>>
>> On 26/03/2024 13.51, Igor Mammedov wrote:
>>> ISAPC machine was introduced 25 years ago and it's a lot of time since
>>> such machine was around with real ISA only PC hardware practically defunct.
>>> Also it's slowly bit-rots (for example: I was able to boot RHEL6 on RHEL9 
>>> host
>>> in only TCG mode, while in KVM mode it hung in the middle of boot)
> 
> I'm quite opposed to this patch. QEMU models various very-old /
> defunct hardware. I'm pretty sure Bernhard and myself are OK to
> keep maintaining it, besides we are working in separating it from
> the i440fx+piix machine. Also, this machine is particularly
> interesting for my single-binary experiments.
> 
> Where I agree is we should stop reporting "KVM on ISA/PC machine"
> as supported.

+1

See also:

https://lists.gnu.org/archive/html/qemu-devel/2017-11/msg01367.html

  Thomas


