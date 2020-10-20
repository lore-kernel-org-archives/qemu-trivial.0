Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kUlPk-0006B4-Rq
	for mharc-qemu-trivial@gnu.org; Tue, 20 Oct 2020 02:46:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kUlPj-000685-Ch
 for qemu-trivial@nongnu.org; Tue, 20 Oct 2020 02:46:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kUlPg-0004a2-7P
 for qemu-trivial@nongnu.org; Tue, 20 Oct 2020 02:46:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603176387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ItSIOAeSevC9+dcqC8cuO03qo4FwB5Pr3nw54jA+Okg=;
 b=Bf3Qi64bnCIz7mQeeOuTVbcNxaCi/WkM2T+SHqtBniSCuNElHv960c/NPoey6O/mIMkZFc
 qSJ6xmrsca9Ris3Lu/sT4NU1DQwqjJPHFsv3Pttvf8hyGRlI6n/Gt+ZLlOpCtA7nB904bx
 BDRlx0y5QFq/swalicBY9SYCwNJqPqY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-dkBKjbhUM_OA4hq8o0B9OQ-1; Tue, 20 Oct 2020 02:46:25 -0400
X-MC-Unique: dkBKjbhUM_OA4hq8o0B9OQ-1
Received: by mail-wr1-f72.google.com with SMTP id u15so400929wrn.4
 for <qemu-trivial@nongnu.org>; Mon, 19 Oct 2020 23:46:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ItSIOAeSevC9+dcqC8cuO03qo4FwB5Pr3nw54jA+Okg=;
 b=CKazT6y4ZEUYNYJg6NXVE9spq81+hJeGw5Gb7QuIRTxLuqXGjSWdI2pUZfi1ZJ1P/Y
 KsBTMf9YohmjyOUnbvTlaGQimnD8Zd7clcmsa3sH6zKnJ0NtSBhXBoIN0irDmCLCZVUg
 NR0MPaN++j8+FpwRfIVtMw/njRtSKM5AX7xTU8VfxFBLEHqUlQRygYc+d+bSfkSGF4Xw
 Grpr6KVdKIaCe1XwngxLVPLJ5aRylf9iYeE7OAWoFkMzYpvQxtseAVhTQ76/EWlDcuyN
 WMHjeRvaYngF9VIUqgAtUjlprdRKaqeGxWmWLEorAMpyltWhwa70W5tktzEooDu7UL33
 OCgw==
X-Gm-Message-State: AOAM5338dcxjlgpDwnRIGVwT/tRnfk1HjHmglX2LmTfOFls/M3v2lk0k
 2kGdioxYT+gDIy+I5d2eI8xDbyyXGcM2VHJSTVwvbFcZ6rzj1fVam6jEbBnBDFpb9LPgMxhIpG+
 BQLEse8UN4s09WRrjZA==
X-Received: by 2002:a1c:4d14:: with SMTP id o20mr1193065wmh.72.1603176384191; 
 Mon, 19 Oct 2020 23:46:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2SFeVNC0mQDkgaFFUaOV7h9jEiqQO7xH1uIZ7SpPz4kbxDXULNTZp9CW7qoT4FJTJVIcoJg==
X-Received: by 2002:a1c:4d14:: with SMTP id o20mr1193047wmh.72.1603176384012; 
 Mon, 19 Oct 2020 23:46:24 -0700 (PDT)
Received: from [192.168.1.36] (237.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.237])
 by smtp.gmail.com with ESMTPSA id c18sm1312971wrt.10.2020.10.19.23.46.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Oct 2020 23:46:23 -0700 (PDT)
Subject: Re: [PATCH v2 2/8] migration: Don't use '#' flag of printf format
To: Bihong Yu <yubihong@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: zhengchuan@huawei.com, quintela@redhat.com, dgilbert@redhat.com,
 alex.chen@huawei.com, wanghao232@huawei.com
References: <1602508140-11372-1-git-send-email-yubihong@huawei.com>
 <1602508140-11372-3-git-send-email-yubihong@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <55125c02-ebc5-2360-54e4-ef8035f58841@redhat.com>
Date: Tue, 20 Oct 2020 08:46:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <1602508140-11372-3-git-send-email-yubihong@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 01:16:16
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 20 Oct 2020 06:46:31 -0000

On 10/12/20 3:08 PM, Bihong Yu wrote:
> Signed-off-by: Bihong Yu <yubihong@huawei.com>
> Reviewed-by: Chuan Zheng <zhengchuan@huawei.com>
> ---
>   migration/block.c | 2 +-
>   migration/ram.c   | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


