Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mwkV0-0006VP-Uu
	for mharc-qemu-trivial@gnu.org; Mon, 13 Dec 2021 07:32:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mwkV0-0006V8-0j
 for qemu-trivial@nongnu.org; Mon, 13 Dec 2021 07:32:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mwkUx-0003mt-MK
 for qemu-trivial@nongnu.org; Mon, 13 Dec 2021 07:32:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639398726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8iSkI/RqpaM6zm0BQ+1s6DC9YFouhPAlAVjjFNYP8cI=;
 b=ALduRhWqX/jLGjRVb7WUIixyGXdT0Vhk+3XvxQSMDF4aeZAPVebcaVeyTnei1ygl5Ryp/m
 nPfGXci4kd55Ju+hBFWLooqd/Jw2mGlbLbOCUGMKO8J1U0LL3xz25dX+6eSg3Uqj1nnzbz
 g2ap7e+9aOk18KXRU/Wow4QhhdenoS4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-344-xWd4BR3yNwyQftOvk7QERQ-1; Mon, 13 Dec 2021 07:32:05 -0500
X-MC-Unique: xWd4BR3yNwyQftOvk7QERQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 j193-20020a1c23ca000000b003306ae8bfb7so9551658wmj.7
 for <qemu-trivial@nongnu.org>; Mon, 13 Dec 2021 04:32:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8iSkI/RqpaM6zm0BQ+1s6DC9YFouhPAlAVjjFNYP8cI=;
 b=4t2XwN5Bezcc1WT4sE0YsAdXPhu+YCpFusglwF9KBFwtKE/YRBq/wXll/VqK9s3Pko
 mWLXnowGXWTM9wdm/0CAwYvvci5/cMTrvUQlWfgm09yXWke1fdZmPgPjEpWEIceV6uCo
 926PxTSSW4Q037TjIahZK/x+KJKfELSZfFHK0QrmyYtNGWG3XR6M+74wzeiy4k0JbPR8
 djxJXDUuXkGvpAj8GtMBtOCUZcFU8e6DNPIFo6aXNNrGllK/13mNUdsREAjzxDxTziPn
 0cfy+JuwNilS0j6VbEFSAlI3iEhEkU5ae7GLQEWKi09A+6G+PgbotiQKvsD3Vnh6S3fi
 QwpA==
X-Gm-Message-State: AOAM533PA1Hx3z8IapXZkZibRFnrEG6elftx1sFMfXuTIA9Ge2PnB9zL
 nEf8ab9rq1YZnx/D/SaALKCMBikbAINgMkQOiqI9vOIN/36NoLfUfpTUmK2broMLmUHwtzVs99d
 SXHkvyYtu6t60XQvKcQ==
X-Received: by 2002:a5d:45c4:: with SMTP id b4mr31228783wrs.222.1639398723943; 
 Mon, 13 Dec 2021 04:32:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxpBiLMEuOIFG5Vw8c6vkjmqoxXccGu1ATa4uR82V3Tc154RZgOrP0rAz4QwDTCywf/WhFPDg==
X-Received: by 2002:a5d:45c4:: with SMTP id b4mr31228752wrs.222.1639398723775; 
 Mon, 13 Dec 2021 04:32:03 -0800 (PST)
Received: from [192.168.50.34] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180])
 by smtp.gmail.com with ESMTPSA id l9sm9183765wrs.101.2021.12.13.04.32.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 04:32:03 -0800 (PST)
Message-ID: <32c7c66b-304e-6dd7-d1c8-785ea86c1dee@redhat.com>
Date: Mon, 13 Dec 2021 13:32:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH-for-6.2 0/2] hw/scsi/megasas: Avoid overflowing the SGL
 buffer
To: qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
Cc: Bandan Das <bsd@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Fam Zheng <fam@euphon.net>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, qemu-block@nongnu.org,
 Hannes Reinecke <hare@suse.com>
References: <20211119201141.532377-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211119201141.532377-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.093, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Mon, 13 Dec 2021 12:32:10 -0000

Too late for 6.2 now, so Cc'ing qemu-trivial (series reviewed).

On 11/19/21 21:11, Philippe Mathieu-Daudé wrote:
> Fix issue #521 reported by Alex some months ago:
> https://gitlab.com/qemu-project/qemu/-/issues/521
> 
> Philippe Mathieu-Daudé (2):
>   hw/scsi/megasas: Fails command if SGL buffer overflows
>   tests/qtest/fuzz-megasas-test: Add test for GitLab issue #521


