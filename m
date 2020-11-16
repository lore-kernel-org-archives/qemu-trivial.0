Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kecuq-0007js-G4
	for mharc-qemu-trivial@gnu.org; Mon, 16 Nov 2020 06:43:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kecup-0007jj-Aa
 for qemu-trivial@nongnu.org; Mon, 16 Nov 2020 06:43:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kecun-0005NN-Gv
 for qemu-trivial@nongnu.org; Mon, 16 Nov 2020 06:43:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605527000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8TxbNsxDba/PpkOpadrLl3SFBEeq3y4TuCfmJNDGjyE=;
 b=edUa4ialezFWd2RB2EKt2A/B08GbR/Qjtq16afZX3lfuOgBmFhjoXqJRVjTfUG7DtJlOmS
 +INwnxsGeRiaUr2uL69SNjOkIxBninjKLbu6xDSzjdpRdxwjNsPOAwUFHSbFV/AKJQ8p2t
 I/MvI9VcZHJLwWu5paw3KZAdqmwtImg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-itNT4ktkO565TS5hwmkCXg-1; Mon, 16 Nov 2020 06:43:19 -0500
X-MC-Unique: itNT4ktkO565TS5hwmkCXg-1
Received: by mail-wr1-f71.google.com with SMTP id f4so11011969wru.21
 for <qemu-trivial@nongnu.org>; Mon, 16 Nov 2020 03:43:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8TxbNsxDba/PpkOpadrLl3SFBEeq3y4TuCfmJNDGjyE=;
 b=oGPhT5J0Fn92+OtVOeMlVEQrFAFcrj17EnCeTCD2wxVIO5tDoiVPKMKo6VPMJWjq7b
 oMzoRsP6vBF24I9+XVDGyFIw/eycMYFmOxcJWR7zPKIdmVQVKEXxgbVtDCWEwswYKDpJ
 fjiUMtjbgmpzgfrkTLeHtWI4IFNComhs5NPyXFmhDs1/ewMYoUp/vZkyPrrDZktTz1mp
 G3GoCAGq6cUicyTu/olaMh4nwQhtUw3703y/boMNDYF8+H2NQypYol/BUfwdHrM10T6a
 gkr87jYInrLhP4fTSZs+BGmwaIVC2qnwGUkruqN986aq/0ZkokqFHSXxYCNSfxHkni9A
 dgpg==
X-Gm-Message-State: AOAM532nOgD5YrbZsqU2ArjAaEH1bX6GB5qgcavNUsjwDoSmYTvnraOq
 VneRnZOLUe9DdPCdtxL2w3AdRHqyslVvFM0ZZl3+SItWEZaSeftaOqTyPuF4TCIRVBHrJvfTeSD
 Jz+jD1NqYH9ZFnKydOQ==
X-Received: by 2002:a5d:44cf:: with SMTP id z15mr18608236wrr.353.1605526997909; 
 Mon, 16 Nov 2020 03:43:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxufs6WxW9VKFdEXS/pzY2fYpoPOOCqP0eC9RwXsS1BNmnO4tWw2dKblBmTq30js/11RdDK7A==
X-Received: by 2002:a5d:44cf:: with SMTP id z15mr18608214wrr.353.1605526997725; 
 Mon, 16 Nov 2020 03:43:17 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id t11sm16097571wrm.8.2020.11.16.03.43.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 03:43:17 -0800 (PST)
Subject: Re: [PATCH v2] json: Fix a memleak in parse_pair()
To: Markus Armbruster <armbru@redhat.com>,
 "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>
Cc: "Chenzhendong (alex)" <alex.chen@huawei.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20201113145525.85151-1-alex.chen@huawei.com>
 <7412CDE03601674DA8197E2EBD8937E83BA6762C@dggemm511-mbs.china.huawei.com>
 <87eektkdjw.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <895daa42-e241-ff9c-6f55-a369ccfe9eb9@redhat.com>
Date: Mon, 16 Nov 2020 12:43:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <87eektkdjw.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 16 Nov 2020 11:43:23 -0000

On 11/16/20 7:42 AM, Markus Armbruster wrote:
> "Chenqun (kuhn)" <kuhn.chenqun@huawei.com> writes:
> 
>>> -----Original Message-----
>>> From: Chenzhendong (alex)
>>> Sent: Friday, November 13, 2020 10:55 PM
>>> To: armbru@redhat.com
>>> Cc: Chenzhendong (alex) <alex.chen@huawei.com>; qemu-devel@nongnu.org;
>>> qemu-trivial@nongnu.org; Zhanghailiang <zhang.zhanghailiang@huawei.com>;
>>> Chenqun (kuhn) <kuhn.chenqun@huawei.com>
>>> Subject: [PATCH v2] json: Fix a memleak in parse_pair()
>>>
>>> In qobject_type(), NULL is returned when the 'QObject' returned from
>>> parse_value() is not of QString type, and this 'QObject' memory will leaked.
>>> So we need to first cache the 'QObject' returned from parse_value(), and finally
>>> free 'QObject' memory at the end of the function.
>>> Also, we add a testcast about invalid dict key.
>>>
>>> The memleak stack is as follows:
>>> Direct leak of 32 byte(s) in 1 object(s) allocated from:
>>>     #0 0xfffe4b3c34fb in __interceptor_malloc (/lib64/libasan.so.4+0xd34fb)
>>>     #1 0xfffe4ae48aa3 in g_malloc (/lib64/libglib-2.0.so.0+0x58aa3)
>>>     #2 0xaaab3557d9f7 in qnum_from_int
>>> /Images/source_org/qemu_master/qemu/qobject/qnum.c:25
>>>     #3 0xaaab35584d23 in parse_literal
>>> /Images/source_org/qemu_master/qemu/qobject/json-parser.c:511
>>>     #4 0xaaab35584d23 in parse_value
>>> /Images/source_org/qemu_master/qemu/qobject/json-parser.c:554
>>>     #5 0xaaab35583d77 in parse_pair
>>> /Images/source_org/qemu_master/qemu/qobject/json-parser.c:270
>>>     #6 0xaaab355845db in parse_object
>>> /Images/source_org/qemu_master/qemu/qobject/json-parser.c:327
>>>     #7 0xaaab355845db in parse_value
>>> /Images/source_org/qemu_master/qemu/qobject/json-parser.c:546
>>>     #8 0xaaab35585b1b in json_parser_parse
>>> /Images/source_org/qemu_master/qemu/qobject/json-parser.c:580
>>>     #9 0xaaab35583703 in json_message_process_token
>>> /Images/source_org/qemu_master/qemu/qobject/json-streamer.c:92
>>>     #10 0xaaab355ddccf in json_lexer_feed_char
>>> /Images/source_org/qemu_master/qemu/qobject/json-lexer.c:313
>>>     #11 0xaaab355de0eb in json_lexer_feed
>>> /Images/source_org/qemu_master/qemu/qobject/json-lexer.c:350
>>>     #12 0xaaab354aff67 in tcp_chr_read
>>> /Images/source_org/qemu_master/qemu/chardev/char-socket.c:525
>>>     #13 0xfffe4ae429db in g_main_context_dispatch
>>> (/lib64/libglib-2.0.so.0+0x529db)
>>>     #14 0xfffe4ae42d8f  (/lib64/libglib-2.0.so.0+0x52d8f)
>>>     #15 0xfffe4ae430df in g_main_loop_run (/lib64/libglib-2.0.so.0+0x530df)
>>>     #16 0xaaab34d70bff in iothread_run
>>> /Images/source_org/qemu_master/qemu/iothread.c:82
>>>     #17 0xaaab3559d71b in qemu_thread_start
>>> /Images/source_org/qemu_master/qemu/util/qemu-thread-posix.c:519
>>>
...
> 
> Queued, thanks!

If possible can you s%/Images/source_org/qemu_master/qemu/%% to make
description more readable...?

Thanks,

Phil.


