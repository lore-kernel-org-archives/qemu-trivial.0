Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ktqSH-0001eI-UZ
	for mharc-qemu-trivial@gnu.org; Mon, 28 Dec 2020 06:12:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ktqSG-0001d8-6a
 for qemu-trivial@nongnu.org; Mon, 28 Dec 2020 06:12:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ktqSE-0003Ud-Ls
 for qemu-trivial@nongnu.org; Mon, 28 Dec 2020 06:12:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609153965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zk5UQGksXRhFLqYMc0FKsbLfo1hQPPJPk+2NFsaqLmw=;
 b=LFcxCq6BBUBNmiCX7ikXm995yN7Ni7ssmZgRHYbWTIUj6Os77B2Cxi5Hhurn5pOs6AIJsz
 MWp1TpllkpVJjGcerUkS7+tNAZz2AQhv5eAj1L1mzg6VMOUo/AffjMd8oWxb26A391pum2
 YxGM07BvnCDcU7gb1zON9lupYK760ZU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-FdK2zSPZOXK5bM4Nyls7sw-1; Mon, 28 Dec 2020 06:12:41 -0500
X-MC-Unique: FdK2zSPZOXK5bM4Nyls7sw-1
Received: by mail-wr1-f71.google.com with SMTP id m20so5709001wrh.2
 for <qemu-trivial@nongnu.org>; Mon, 28 Dec 2020 03:12:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zk5UQGksXRhFLqYMc0FKsbLfo1hQPPJPk+2NFsaqLmw=;
 b=VHSv34IbBwB+KHCJ3fnzkcqxcXL5yo4iWrAztgp9UvdMvLoAmMjH1y3DJmLyww6CE5
 H+JTIHtFnOWjA+q9Ey/zrIaCBq0wzcJD/ulIlbMqjoXvdp5UXrUKKoEPc9Gk1U2BmUZQ
 IhBoiXmM8el+6KknAU/uYo+zUx8w9NRnMAqmBvbkmk/SdqyVJlCixs0H1KzJeUTuZLQn
 a98BDshDBJPrSpamXV4xUkzYwQNWzRm8L0L8Fp3M3yReXVVGyGrjvVXPJgC3HGUD0ZBx
 8kbbMBqjtbKvI/HaFogqqXRcALVBLn85TuTxcij3mggsaoyyir9A5sXHr0MzQ22fl5GI
 If/A==
X-Gm-Message-State: AOAM532Q8UeDLt8MSJyVImyBwWkygAdK36BUvPKV/F6/YPoirEp5S34m
 qne41WgGoDpjcGIJ8ewjg0nNkJ6cUNeEq59otMlQHJDsz1xOt4dI7YB7yeNYYaPjOLWp/DvH0l/
 appRME3V4OkcDu2NTTQ==
X-Received: by 2002:a5d:47a5:: with SMTP id 5mr51669579wrb.109.1609153960610; 
 Mon, 28 Dec 2020 03:12:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJweAdY98ZxtFWUSulnn2yhZQwvf9GNtMJL9R1DdMxUh6hXiGRgw8cfmVfeicdkVqe4WvJZUQQ==
X-Received: by 2002:a5d:47a5:: with SMTP id 5mr51669548wrb.109.1609153960323; 
 Mon, 28 Dec 2020 03:12:40 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id z3sm58115479wrn.59.2020.12.28.03.12.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Dec 2020 03:12:39 -0800 (PST)
Subject: Re: [PATCH 1/4] qobject: open brace '{' following struct go on the
 same line
To: Zhang Han <zhanghan64@huawei.com>, armbru@redhat.com
Cc: alex.chen@huawei.com, hunongda@huawei.com, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org, zhang.zhanghailiang@huawei.com
References: <20201228071129.24563-1-zhanghan64@huawei.com>
 <20201228071129.24563-2-zhanghan64@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <791fabe6-cdab-2891-0dca-393ade874dfe@redhat.com>
Date: Mon, 28 Dec 2020 12:12:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201228071129.24563-2-zhanghan64@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.041,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.829, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 28 Dec 2020 11:12:48 -0000

On 12/28/20 8:11 AM, Zhang Han wrote:
> Put open brace '{' on the same line of struct.
> 
> Signed-off-by: Zhang Han <zhanghan64@huawei.com>
> ---
>  qobject/json-parser.c | 3 +--
>  qobject/qjson.c       | 3 +--
>  2 files changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


