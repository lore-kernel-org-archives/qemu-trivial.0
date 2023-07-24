Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qNpux-0008By-BK
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2023 03:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qNpuu-00089c-Qu
 for qemu-trivial@nongnu.org; Mon, 24 Jul 2023 03:23:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qNput-0005BF-0A
 for qemu-trivial@nongnu.org; Mon, 24 Jul 2023 03:23:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690183415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4dBfsQWv6ZCZ8w44qchhHluCSarQNpAQrj8KDirrlpI=;
 b=HBGCpQSVDy5luItdQS8hzdFPxJo6Qz94Dj/H7lU5zfP8vC2l4hJDvOOyXGMVdWOVB7sRmQ
 hE2xlp6Aj9gYk+Wb5NuQ64+1O7qXPnumth+Mm1bxNphHTewO+gHjmAwtn+dYr9VI17ZM0a
 JrtGdXFde1fQxkRyl8asVU3d1ZctRxU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-376-TMAtTM4hORa73hocp1iwrQ-1; Mon, 24 Jul 2023 03:23:33 -0400
X-MC-Unique: TMAtTM4hORa73hocp1iwrQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-31421c900b7so2441120f8f.3
 for <qemu-trivial@nongnu.org>; Mon, 24 Jul 2023 00:23:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690183412; x=1690788212;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4dBfsQWv6ZCZ8w44qchhHluCSarQNpAQrj8KDirrlpI=;
 b=JH8N3UuKSg8x2CEtchgCGxLmMwlORG15FghUXIs+3ph88r2TuyUZlJyhohVruQXQrL
 x/wT5SFh/JIh1cUjBXfkDm0AC84yqQd/9rT36WtmJoyFZRqAmyAmIqA/nuiMvBhkJQcO
 YpoOGXcHuU6ZRaWST6BdAYixydVixrNiwcHxVvbelGjXrmmtLp8hsMm7nzon5+JSMtPM
 12xzrA3la7ibQfGI4akHeF+h7W+mp5h1Q8dEuIFxBzp6mgCLGVkJTE4/An/38TwOwkaR
 b2ieWls17tGKIEQ4so+9e9IJgEZj9KkMme7Dbgcsrh+WQn5MWT3hunTto2PG4Um2TZpQ
 zVhg==
X-Gm-Message-State: ABy/qLaOKoERo8XhTDUNMpwGbpftjjZw9sFr65DxLTiphS7nk+tE/q2K
 7yDqDPQW3PeluPogTTGlXng1230SmglNwec2LcrqfJG/Gs2BD2VFIMyaXd9aqURuUaYhW5fFeHl
 f+CayoWlo5YCZpjkg5w==
X-Received: by 2002:a5d:528d:0:b0:314:3985:b291 with SMTP id
 c13-20020a5d528d000000b003143985b291mr7439270wrv.15.1690183412609; 
 Mon, 24 Jul 2023 00:23:32 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE/X6IqGRIjKf+HbgW3dSd1ed7ZOAKQ8YFuj/OJOgIG2xoB0nLHsc7XWT0h+Oc+y1/MWBz85A==
X-Received: by 2002:a5d:528d:0:b0:314:3985:b291 with SMTP id
 c13-20020a5d528d000000b003143985b291mr7439259wrv.15.1690183412329; 
 Mon, 24 Jul 2023 00:23:32 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-177-165.web.vodafone.de.
 [109.43.177.165]) by smtp.gmail.com with ESMTPSA id
 q4-20020a5d6584000000b002c70ce264bfsm11907288wru.76.2023.07.24.00.23.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jul 2023 00:23:31 -0700 (PDT)
Message-ID: <57bab3e4-f7bb-de3d-d651-46c9d1cc6ea2@redhat.com>
Date: Mon, 24 Jul 2023 09:23:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 0/6] trivial-patches for 2023-07-16
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
References: <20230716115801.1505288-1-mjt@tls.msk.ru>
 <02d123c8-92c6-c7e2-02df-d9ed9d9ba980@tls.msk.ru>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <02d123c8-92c6-c7e2-02df-d9ed9d9ba980@tls.msk.ru>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.093, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 24 Jul 2023 07:23:41 -0000

On 16/07/2023 14.05, Michael Tokarev wrote:
> 16.07.2023 14:57, Michael Tokarev пишет:
>> The following changes since commit 7d07a21ec003724475566073404c5893e36de5e5:
>>
>>    tree-wide spelling fixes in comments and some messages: hw/9pfs 
>> (2023-07-16 13:59:17 +0300)
>>
>> are available in the Git repository at:
>>
>>    https://gitlab.com/mjt0k/qemu.git/ tags/trivial-patches-pull
>>
>> for you to fetch changes up to 7d07a21ec003724475566073404c5893e36de5e5:
>>
>>    tree-wide spelling fixes in comments and some messages: hw/9pfs 
>> (2023-07-16 13:59:17 +0300)
>>
>> ----------------------------------------------------------------
>> trivial-patches for 2023-07-16
>>
>> This contains a doc fix for riscv and reviewed spelling fixes.
>> ----------------------------------------------------------------
> 
> This meant to be a PULL request, not PATCH series.. :)

I guess you have to resend with a PULL in the subject?

  Thomas



