Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qZZRp-0000HT-DK
	for mharc-qemu-trivial@gnu.org; Fri, 25 Aug 2023 12:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qZZRm-0000Az-6a
 for qemu-trivial@nongnu.org; Fri, 25 Aug 2023 12:14:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qZZRi-0007XM-R0
 for qemu-trivial@nongnu.org; Fri, 25 Aug 2023 12:14:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692980041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XsOOUFAnpZF8VlU2nxxredNfBuPurRki8fXFH46a8J4=;
 b=B7qr6eATKu9uu9yIOc2lQ6xk/euBe2EIzhvFX255BKp6rVPhZN0m8+gfe+9+XFumEAEmnn
 EOmNKSonQph5lStAYwIQCChw+AN+ezD4GR2IQe/rPx1kJdezbLOywnvtcu84mdyU5C2BR1
 7zwhUBwLKGVIJtQyQZ6YJNnjX5sSWsg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-an3ImTkDMHGvEZhywJbrMg-1; Fri, 25 Aug 2023 12:13:58 -0400
X-MC-Unique: an3ImTkDMHGvEZhywJbrMg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-31c4096874bso752657f8f.2
 for <qemu-trivial@nongnu.org>; Fri, 25 Aug 2023 09:13:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692980037; x=1693584837;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XsOOUFAnpZF8VlU2nxxredNfBuPurRki8fXFH46a8J4=;
 b=RpjVlO5mZsyVW5Iyv8k4VarWV0AQW0CTn9jKpDnaAkYs+A9WsYqoplFizeKhAG9ev2
 0oKnCq8iyIfpdP2fGaV/CdJVdYwdnHQVNCqUF1fP8ohKyc6oif93sVyJbCPVQYdO2/CP
 4thUBCM/5cOVKYY3Sfz8yJcqHygRoSbW1wTV6tOS/k6w6gRPfvZDwNIwDyPn6pUCXk89
 Uhr+U2hwRY/quSt0nzt6qekhayogFaWeMuwoHR8wPeFxuLIlgRthAR7r0x28tEMPTLF8
 +te1UYoS1J79FDpGr/pl4ojOemO/EToc4lMKJt4Y9R1wFK9VmcHzo6aio84jypiH44a8
 LrkQ==
X-Gm-Message-State: AOJu0YwHqI5MkqmfYJZsOSersnIRECxKFFpp0KLl/oYcNf0PQHaPCtCk
 t7k+D7DDZL2Y39SiVofSy7KvPLFm12c/xrmREiIBBm4GBi3xQKFMXIhEuB7JU/zPHXXhv8SN0/A
 D5Zwu088njMLUpJKk1A==
X-Received: by 2002:adf:e802:0:b0:317:e68d:f862 with SMTP id
 o2-20020adfe802000000b00317e68df862mr15512856wrm.37.1692980037139; 
 Fri, 25 Aug 2023 09:13:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFasDfYHvjI4F9KH3rGvaslFBp2qPP2Go9A6jeLI/Nw/aAa8Kila9x/Nf7FTPEfCNMROuP4RA==
X-Received: by 2002:adf:e802:0:b0:317:e68d:f862 with SMTP id
 o2-20020adfe802000000b00317e68df862mr15512842wrm.37.1692980036842; 
 Fri, 25 Aug 2023 09:13:56 -0700 (PDT)
Received: from [192.168.8.103] (tmo-099-164.customers.d1-online.com.
 [80.187.99.164]) by smtp.gmail.com with ESMTPSA id
 x3-20020a5d6503000000b00317c742ca9asm2584179wru.43.2023.08.25.09.13.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Aug 2023 09:13:56 -0700 (PDT)
Message-ID: <2859aebf-f2a3-1c19-b5c3-efbd1ae14977@redhat.com>
Date: Fri, 25 Aug 2023 18:13:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] docs tests: Fix use of migrate_set_parameter
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, dave@treblig.org,
 qemu-block@nongnu.org, berrange@redhat.com, dgilbert@redhat.com,
 qemu-trivial@nongnu.org
References: <20230825155923.1983141-1-armbru@redhat.com>
 <20230825155923.1983141-2-armbru@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230825155923.1983141-2-armbru@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.57, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 25 Aug 2023 16:14:07 -0000

On 25/08/2023 17.59, Markus Armbruster wrote:
> docs/multi-thread-compression.txt uses parameter names with
> underscores instead of dashes.  Wrong since day one.
> 
> docs/rdma.txt, tests/qemu-iotests/181, and tests/qtest/test-hmp.c are
> wrong the same way since commit cbde7be900d2 (v6.0.0).  Hard to see,
> as test-hmp doesn't check whether the commands work, and iotest 181
> appears to be unaffected.
> 
> Fixes: 263170e679df (docs: Add a doc about multiple thread compression)
> Fixes: cbde7be900d2 (migrate: remove QMP/HMP commands for speed, downtime and cache size)
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---


Reviewed-by: Thomas Huth <thuth@redhat.com>


