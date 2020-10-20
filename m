Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kUlTn-0001qO-QD
	for mharc-qemu-trivial@gnu.org; Tue, 20 Oct 2020 02:50:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kUlTm-0001on-DZ
 for qemu-trivial@nongnu.org; Tue, 20 Oct 2020 02:50:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kUlTk-000646-Pm
 for qemu-trivial@nongnu.org; Tue, 20 Oct 2020 02:50:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603176640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kebR4L1qhoE6f0CRqhCiqc9zsqxXEcNi7ESHYi6RmUQ=;
 b=a8ZfXJln0ez1rbZbR+DZO/79NkSU5abmp9sDD5kLfHQ84HZlaZZC7nk+3r/LgnGYj7uBaa
 L/5sreAMrOpL3DwULtjl/fcEhAnsHL+Fwj1pW7L17ahAibwZqxuFhsOSxCYJvAxM342ZOR
 /jRsvj8/wgpgDGCfiz4iMDEukyQhZzM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-Mq_zEJPEP2qLwjxWFo_eqg-1; Tue, 20 Oct 2020 02:50:38 -0400
X-MC-Unique: Mq_zEJPEP2qLwjxWFo_eqg-1
Received: by mail-wm1-f70.google.com with SMTP id l22so75486wmi.4
 for <qemu-trivial@nongnu.org>; Mon, 19 Oct 2020 23:50:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kebR4L1qhoE6f0CRqhCiqc9zsqxXEcNi7ESHYi6RmUQ=;
 b=KAWZ9O6WK/e+Sx9K3RouFthkeK7bBuKoCFTT6ge/xPtjU8Xzc4UunEzrY3Ex1Qwv6x
 8fMlDAIYjXOlxH17fHzVb/RZNM68MKDxp1NKEchCTs4KU7yWropjon3USeIYAXULFmGT
 04Ri8IF+jok8iK3zZ8IDvTwqzdzLRfpCiOXP6IUEdwbq2PSt4sa+u8/bg9JxF96vmkGO
 tEZxK8DWBJzCNNRR4XiL68eobSpd1CfMhq7z4xwgAZTnbY42fLX/hlS2Geos/bBBAjXt
 XwOshAm8n6WDqkkj/lDJgX816LxdyDsU7yZCl2Y/WhVBZYbMSyYrXUTNXooAnPChqNp+
 iUDw==
X-Gm-Message-State: AOAM5333UjBvIu+P2TAdrLbJ/vmvIQtEgVbNzeui+hVexGpaiw+4pY1Z
 +OLeUo5U7R9eG7jxldnIo4mBboMR3EfNBSBq6NFxgZxfUOjYD2/25U/O02wzDqaDuYRatC66BMR
 dTqs/aIONE0/F4OKk9w==
X-Received: by 2002:a1c:6a0a:: with SMTP id f10mr1284338wmc.86.1603176637371; 
 Mon, 19 Oct 2020 23:50:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1s1k/xTbhCFDqlfqmkR6fJOUPhHSJjeBE5HZKfVN3B8Ukg9ofqNOHO1cAu5SBX3wwiDGWRA==
X-Received: by 2002:a1c:6a0a:: with SMTP id f10mr1284331wmc.86.1603176637244; 
 Mon, 19 Oct 2020 23:50:37 -0700 (PDT)
Received: from [192.168.1.36] (237.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.237])
 by smtp.gmail.com with ESMTPSA id d4sm1357956wrp.47.2020.10.19.23.50.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Oct 2020 23:50:36 -0700 (PDT)
Subject: Re: [PATCH v2 8/8] migration: Delete redundant spaces
To: Bihong Yu <yubihong@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: zhengchuan@huawei.com, quintela@redhat.com, dgilbert@redhat.com,
 alex.chen@huawei.com, wanghao232@huawei.com
References: <1602508140-11372-1-git-send-email-yubihong@huawei.com>
 <1602508140-11372-9-git-send-email-yubihong@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0f830c28-82e4-c49d-5068-149a194607a4@redhat.com>
Date: Tue, 20 Oct 2020 08:50:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <1602508140-11372-9-git-send-email-yubihong@huawei.com>
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
X-List-Received-Date: Tue, 20 Oct 2020 06:50:42 -0000

On 10/12/20 3:09 PM, Bihong Yu wrote:
> Signed-off-by: Bihong Yu <yubihong@huawei.com>
> Reviewed-by: Chuan Zheng <zhengchuan@huawei.com>
> ---
>   migration/rdma.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


