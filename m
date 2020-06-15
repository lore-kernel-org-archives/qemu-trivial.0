Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jksSu-0003X2-W1
	for mharc-qemu-trivial@gnu.org; Mon, 15 Jun 2020 13:00:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jksSt-0003Wl-Kc
 for qemu-trivial@nongnu.org; Mon, 15 Jun 2020 13:00:07 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42092
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jksSr-0005J6-8o
 for qemu-trivial@nongnu.org; Mon, 15 Jun 2020 13:00:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592240403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=10u7Yso4tdSWn9I0ZXrfDQrcu7OeT3LpiK4JAy9+lWw=;
 b=PUhgyoBGvNgGYSXPs1mtpbTuzGGjRvXmi5mZY/koFRi6s5LtTTLj3xV02kliUBuLr5K2z0
 aLm1QbUkEZ36AGF0NlG8Ve+XjwA/8QBLlG5974xrIlehOUv2gGWvsAapDcbhdpCvP3C2vS
 FAwgw+YOeuj69N/NjNa2ROURD6/wQNY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-i1zqX-LSN4e3wWCxREiOSQ-1; Mon, 15 Jun 2020 13:00:01 -0400
X-MC-Unique: i1zqX-LSN4e3wWCxREiOSQ-1
Received: by mail-wm1-f69.google.com with SMTP id v24so94830wmh.3
 for <qemu-trivial@nongnu.org>; Mon, 15 Jun 2020 10:00:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=10u7Yso4tdSWn9I0ZXrfDQrcu7OeT3LpiK4JAy9+lWw=;
 b=m4VOkn9ovNQDBOB/uRYwTvEKMsyv1W6Z7PWzThw8n7GT4Cuv/i60RIleQPi+eNySoD
 isY5eLrWx6eYArH+PCGsFDKjdFip/mx5n38XudaMdgNbQQiZbZ8C1OcQifYNiV7EqJ2F
 ZqDCaDYvoh/o38i7Cb5Tp44Tfuc/uLAaXqDh+nhowYyF/MGVWUqi7//R/U8L6JLEuw1w
 gauJ4fy1VAaskkdkq3Q9Ytukw1n+7inwxGEtAV5Laz3W4sAVL8LuMuX/RdBAG+JQ0lwN
 kgb7M+gADDmBd3l1PaGOQv7NTiH+7k4lFxru83viqynOh9/5jF3aiTJHE6UlpQEfo7im
 8ymg==
X-Gm-Message-State: AOAM5324az76Iji74eOYr8/hE44GTsfdsMv8+EFNW4m5tu1Gk6/iZ8sx
 HMr3KCEWGKb11yeziwzqVQ75m89KUlRme9pX0LnOAqodNRPXdBHLH2r5aIa/anv+Dlhoa1lDfjN
 4Uouw1XtnlqtnTr1NOw==
X-Received: by 2002:adf:f512:: with SMTP id q18mr32148916wro.38.1592240400182; 
 Mon, 15 Jun 2020 10:00:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiXdtfU2ldZ4uhu6+kNqs0vhMDnVevCsyLSUBfR6TdlRJsYjUrLyY06RM5Z39PrOvNNdW4Cg==
X-Received: by 2002:adf:f512:: with SMTP id q18mr32148896wro.38.1592240399975; 
 Mon, 15 Jun 2020 09:59:59 -0700 (PDT)
Received: from [192.168.178.58] ([151.48.99.33])
 by smtp.gmail.com with ESMTPSA id b132sm237068wmh.3.2020.06.15.09.59.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2020 09:59:59 -0700 (PDT)
Subject: Re: [PATCH] Makefile: Install qemu-[qmp/ga]-ref.* into the directory
 "interop"
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Yi Wang <wang.yi59@zte.com.cn>, QEMU Developers <qemu-devel@nongnu.org>,
 xue.zhihong@zte.com.cn, QEMU Trivial <qemu-trivial@nongnu.org>,
 wang.liang82@zte.com.cn, Liao Pingfang <liao.pingfang@zte.com.cn>
References: <1591663670-47712-1-git-send-email-wang.yi59@zte.com.cn>
 <94e456a8-0b4f-e1fd-7baa-8f81f36c6872@redhat.com>
 <31290c21-01bb-e191-a166-1595f4fc8549@redhat.com>
 <CAFEAcA-D440Z4-cPdmpMXJcfkxjrHTOvwO2PG5BhyXMzRCQN+w@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <eb11ce18-f1db-1d60-6b8e-3b0ba6ce6993@redhat.com>
Date: Mon, 15 Jun 2020 18:59:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-D440Z4-cPdmpMXJcfkxjrHTOvwO2PG5BhyXMzRCQN+w@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/15 01:17:36
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 15 Jun 2020 17:00:07 -0000

On 15/06/20 18:32, Peter Maydell wrote:
>> Queued, thanks.
> I guess this works, but it's kind of odd because it's installing
> a non-Sphinx document into the Sphinx manual directory.
> 
> I'm hoping we'll be able to land the conversion of the qapigen
> stuff to rst this cycle, which will make this change moot;
> so I suppose it's the most expedient fix for the moment.

I can keep the patch in the queue and not submit it unless really necessary.

Paolo


