Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kZlxi-0004t0-Fo
	for mharc-qemu-trivial@gnu.org; Mon, 02 Nov 2020 21:22:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZlxh-0004pg-BC
 for qemu-trivial@nongnu.org; Mon, 02 Nov 2020 21:22:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZlxe-0005LN-Uh
 for qemu-trivial@nongnu.org; Mon, 02 Nov 2020 21:22:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604370134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SWiw7zaw2eb0SGYngU9UL3pFUdknkWkNFfZqseY3VAA=;
 b=RSwxztDNojzubskDYsk2PGXRZwjADZUx4L4xwWBbn3f/5at5On114CCM4MSxJtaIw0j0Mo
 2LGNOswsRh+1wsovUd3TQgHRAkCYad2rex7GQaZtOtyHoT2KHhmFLOKKas2hWBCPPOM7LG
 vbfWLTgrZiw5BtEvAEdo405B3mMJLsY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-P9L6xTpkNJizBg1M-BN8Hg-1; Mon, 02 Nov 2020 21:22:12 -0500
X-MC-Unique: P9L6xTpkNJizBg1M-BN8Hg-1
Received: by mail-wr1-f69.google.com with SMTP id 2so7250779wrd.14
 for <qemu-trivial@nongnu.org>; Mon, 02 Nov 2020 18:22:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SWiw7zaw2eb0SGYngU9UL3pFUdknkWkNFfZqseY3VAA=;
 b=lIh0GyMWOE8HtDMa3R1fmeZ+3xhH4YrtfXG9RDIGcdfyMIS12nDYHgOEEBVuNAQ/qa
 0QN1pYvTWNSh4iEnSbODQTVjqUMEMO4SJM+rqcZ+11V8rHW9uo+XLlCLdse2TDAAXaV8
 CseZi+ga+qAqGEK2CceyNznlSk2uqokY8Mo4bbsy2+YgHcxLUdrPgZ0zNosrx4LoRqOk
 gZdCYT1Da5vnMMcYM1Zck45riIwF/K91zJMcH1kNYD9KVQnNHMQUwiDX29RsU9315aJU
 gV+CBqdAw+Q1P7rPTZO64klyDgdasJaQ8AeYLXWoWXk9900N2KbWlcrSfrE0rhoW3v1v
 KWmQ==
X-Gm-Message-State: AOAM531/I0arKADwkOUTNE/8FTOhMPJiOmQp16rk+swdRf6HV+pwd0Iw
 cY3Af4YoxwcOgt1oqDIPdu8rQDR77vstFpvcM1gHcFg3RfhguQvELwuOWMcvJS6GRzvp/LcUa3I
 UhCyhRDNGCjhLqtG3gg==
X-Received: by 2002:adf:e9cc:: with SMTP id l12mr17683775wrn.248.1604370131524; 
 Mon, 02 Nov 2020 18:22:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw8nNIS66EHHhMzL0zz/1hBcWF+KW/wzA6xHjs1l9F+6WbagkdH0r7nPhO8grMZA0ZqZPePfQ==
X-Received: by 2002:adf:e9cc:: with SMTP id l12mr17683755wrn.248.1604370131291; 
 Mon, 02 Nov 2020 18:22:11 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id o3sm23512461wru.15.2020.11.02.18.22.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Nov 2020 18:22:10 -0800 (PST)
Subject: Re: [PATCH 6/6] migration: fix uninitialized variable warning in
 migrate_send_rp_req_pages()
To: Chen Qun <kuhn.chenqun@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: zhang.zhanghailiang@huawei.com, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, ganqixin@huawei.com,
 Euler Robot <euler.robot@huawei.com>
References: <20201103015228.2250547-1-kuhn.chenqun@huawei.com>
 <20201103015228.2250547-7-kuhn.chenqun@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e259270f-14c6-7033-faad-6406e5de930c@redhat.com>
Date: Tue, 3 Nov 2020 03:22:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201103015228.2250547-7-kuhn.chenqun@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 20:52:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Nov 2020 02:22:17 -0000

On 11/3/20 2:52 AM, Chen Qun wrote:
> After the WITH_QEMU_LOCK_GUARD macro is added, the compiler cannot identify
>  that the statements in the macro must be executed. As a result, some variables
>  assignment statements in the macro may be considered as unexecuted by the compiler.
> 
> The compiler showed warning:
> migration/migration.c: In function ‘migrate_send_rp_req_pages’:
> migration/migration.c:384:8: warning: ‘received’ may be used uninitialized in this function [-Wmaybe-uninitialized]
>  384 |     if (received) {
>      |        ^
> 
> Add a default value for 'received' to prevented the warning.
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> ---
>  migration/migration.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 9bb4fee5ac..de90486a61 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -361,7 +361,7 @@ int migrate_send_rp_req_pages(MigrationIncomingState *mis,
>                                RAMBlock *rb, ram_addr_t start, uint64_t haddr)
>  {
>      void *aligned = (void *)(uintptr_t)(haddr & (-qemu_ram_pagesize(rb)));
> -    bool received;
> +    bool received = false;
>  
>      WITH_QEMU_LOCK_GUARD(&mis->page_request_mutex) {
>          received = ramblock_recv_bitmap_test_byte_offset(rb, start);
> 

Since this helps static analyzer:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


