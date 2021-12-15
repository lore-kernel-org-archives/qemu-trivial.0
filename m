Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mxRYe-0000pe-Hr
	for mharc-qemu-trivial@gnu.org; Wed, 15 Dec 2021 05:30:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxRYW-0000lp-K3
 for qemu-trivial@nongnu.org; Wed, 15 Dec 2021 05:30:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxRYR-0006wh-Ty
 for qemu-trivial@nongnu.org; Wed, 15 Dec 2021 05:30:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639564234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jKQ+OeMlfGg92wQxaTuSfGSP91d1mpGx717OSXPoNJk=;
 b=QOSpMRMVBMikJZC3Rto58Cv5jT0geMLQNB7nUUgnkhzdItehdvbFeGyvbaqIVZyYRw5cd8
 JorherStvRqDuTfBnaca4n2fjF1bt8x+9zV0wlgYo70ZlXz+5QLfJ4ObhP5Z54R85WSiu9
 WhMcUvdykd8Xd7Z67MyVqMf/iYzzFYE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-91-gGjnUzyON0extYKIuftM7A-1; Wed, 15 Dec 2021 05:30:33 -0500
X-MC-Unique: gGjnUzyON0extYKIuftM7A-1
Received: by mail-wr1-f72.google.com with SMTP id
 f13-20020adfe90d000000b001a15c110077so992543wrm.8
 for <qemu-trivial@nongnu.org>; Wed, 15 Dec 2021 02:30:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=jKQ+OeMlfGg92wQxaTuSfGSP91d1mpGx717OSXPoNJk=;
 b=vSu66KNtglRZeMVzvss5ljBwXjvFgJBMzRo6vgHWxTayXd5OW22yVsYnivfevBjNdt
 lqsul6ss+6vxiOjs1/0CGk8/pnkp9QJCQIGZ+E9z9vI6oAlkpALtxOfbQ1xwhcEYmvxr
 qmOgv3IWyx2iNujKNJgdlywfPlRH9SJUll6vzzbwnLvnBE+EVo6meH9Iu7K1xpGbafT9
 kCRCzET3jvwOa1uJPuyq1GDgzEkFzjpTqaQTw9UY4XqKX8jeZYr7EgHXFTlRvnshAI9J
 X8iIMj6Bn88L2XPJNy9qMsMVUA0btzf3q87VxdKOroZqVYGWpG7Hcp4Na8+3poST3qFD
 UYcw==
X-Gm-Message-State: AOAM531781DtIZWW69QYO56EbIKrrMe9zAihcDF3Nhbosv9GQErZcH6Y
 Znxuaf4GcvLJ1qpMnpTLQW+RvwEy9CuPJlDzVf/P3g8Lr/C8lKBz7NzCydun+EsFAcHUZMMF3BA
 4Wr4CS9yc+lecZqYu5w==
X-Received: by 2002:a05:600c:3d94:: with SMTP id
 bi20mr3999167wmb.83.1639564232036; 
 Wed, 15 Dec 2021 02:30:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzIaTfb+eIRm0nQSKotF+yz4btqhVac7f1hQswsSJoJ/ZUJK0wsMDgXj2Jft+EBqAH1ndcPxw==
X-Received: by 2002:a05:600c:3d94:: with SMTP id
 bi20mr3999140wmb.83.1639564231832; 
 Wed, 15 Dec 2021 02:30:31 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id a1sm1548599wru.113.2021.12.15.02.30.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 02:30:31 -0800 (PST)
Message-ID: <50433e39-83ce-8307-1039-9e3224d4d436@redhat.com>
Date: Wed, 15 Dec 2021 11:30:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH-for-6.2 0/2] hw/scsi/megasas: Avoid overflowing the SGL
 buffer
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>,
 qemu-block@nongnu.org
Cc: Bandan Das <bsd@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Fam Zheng <fam@euphon.net>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Hannes Reinecke <hare@suse.com>
References: <20211119201141.532377-1-philmd@redhat.com>
 <32c7c66b-304e-6dd7-d1c8-785ea86c1dee@redhat.com>
In-Reply-To: <32c7c66b-304e-6dd7-d1c8-785ea86c1dee@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.64, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 15 Dec 2021 10:30:43 -0000

ping?

On 12/13/21 13:32, Philippe Mathieu-Daudé wrote:
> Too late for 6.2 now, so Cc'ing qemu-trivial (series reviewed).
> 
> On 11/19/21 21:11, Philippe Mathieu-Daudé wrote:
>> Fix issue #521 reported by Alex some months ago:
>> https://gitlab.com/qemu-project/qemu/-/issues/521
>>
>> Philippe Mathieu-Daudé (2):
>>   hw/scsi/megasas: Fails command if SGL buffer overflows
>>   tests/qtest/fuzz-megasas-test: Add test for GitLab issue #521


