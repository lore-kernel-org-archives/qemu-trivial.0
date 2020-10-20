Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kUlRK-00089g-9G
	for mharc-qemu-trivial@gnu.org; Tue, 20 Oct 2020 02:48:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kUlRI-00087J-2d
 for qemu-trivial@nongnu.org; Tue, 20 Oct 2020 02:48:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kUlRF-00057r-9p
 for qemu-trivial@nongnu.org; Tue, 20 Oct 2020 02:48:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603176484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LWLCVTdCZyi5yN6osaeoydriTjPfetkYsvgZHOBfmLM=;
 b=O8IjHcTE37Z7hCHuGtGBgwpkPGL0D8nqCc8n6sOSbm1kz5RuJYPBsDXewPdcgtsv837A/C
 YR5GYYNCIO+dfW2U1kqtyPc7PkYPw5dLycfruHc70zY0Ay86N7TjNJxX3x1Gy6Z/5wc8mu
 FAu6mAxtpN78uxod0vD8yKbWL4cFn/k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-kee_OMgxOC2skEVVKs23Xg-1; Tue, 20 Oct 2020 02:48:02 -0400
X-MC-Unique: kee_OMgxOC2skEVVKs23Xg-1
Received: by mail-wm1-f70.google.com with SMTP id c204so96840wmd.5
 for <qemu-trivial@nongnu.org>; Mon, 19 Oct 2020 23:48:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LWLCVTdCZyi5yN6osaeoydriTjPfetkYsvgZHOBfmLM=;
 b=ayZIJdXLQd2SI5OdakHavh6JJH+BKuG7TzXKru4hM0iyDTi+BbOg8VvYjanKFQQEKi
 BMq97A4tmHTxUUvj5u/xazmj00PGgPDrgJ4sDgJ2e6z+Aq2dAXUQbXpQZX8htG4YMOaJ
 Ebi8GetyoZ0t8MwUp6cKZEFSYimeqZqcgEh2tD79GN3rjBvU12BRIpZ1mQEi5khjy0bm
 q9B7BtyaSSJuubgLNtg6wT2zJYcc23UZH03oTauPuOnuhAkc5xSPidnLp1VTeTtSbbxT
 S3DC/g5vwAly4AYofQb+3b5p2sNkL7EzjadXxvTsMYUCXnckI7gCF8wgyLcriqJBYIop
 UDfw==
X-Gm-Message-State: AOAM532car/awQohdTuxJ9sylp8/MX0xQkoRqA5UWBWpmhiNGQ3ZOPbB
 Q2P/F55M8H/Lwqbw/AL9ZyqeHQLbrVTFesWGQgL4v4ODL95NZccdowsa+SEuiRwdyqXNuhyyK0X
 +9gjDyOzkcHRKF3Y6aA==
X-Received: by 2002:a5d:4088:: with SMTP id o8mr1735802wrp.2.1603176480996;
 Mon, 19 Oct 2020 23:48:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwU0vfChRY++x9/E9BjbEBOJEUMS5arQ6uE+F/hAtLGodyy8xYzxp/YhmKLCFZuZ42ctmVHnQ==
X-Received: by 2002:a5d:4088:: with SMTP id o8mr1735785wrp.2.1603176480839;
 Mon, 19 Oct 2020 23:48:00 -0700 (PDT)
Received: from [192.168.1.36] (237.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.237])
 by smtp.gmail.com with ESMTPSA id p9sm1182138wmm.4.2020.10.19.23.47.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Oct 2020 23:48:00 -0700 (PDT)
Subject: Re: [PATCH v2 5/8] migration: Add braces {} for if statement
To: Bihong Yu <yubihong@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: zhengchuan@huawei.com, quintela@redhat.com, dgilbert@redhat.com,
 alex.chen@huawei.com, wanghao232@huawei.com
References: <1602508140-11372-1-git-send-email-yubihong@huawei.com>
 <1602508140-11372-6-git-send-email-yubihong@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <dc644324-0291-842f-e389-0328ecdfae3f@redhat.com>
Date: Tue, 20 Oct 2020 08:47:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <1602508140-11372-6-git-send-email-yubihong@huawei.com>
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
X-List-Received-Date: Tue, 20 Oct 2020 06:48:08 -0000

On 10/12/20 3:08 PM, Bihong Yu wrote:
> Signed-off-by: Bihong Yu <yubihong@huawei.com>
> Reviewed-by: Chuan Zheng <zhengchuan@huawei.com>
> ---
>   migration/ram.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


