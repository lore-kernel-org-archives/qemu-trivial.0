Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l44Pr-000646-J1
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jan 2021 11:08:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l44Po-000627-WE
 for qemu-trivial@nongnu.org; Mon, 25 Jan 2021 11:08:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l44Pl-00054e-3n
 for qemu-trivial@nongnu.org; Mon, 25 Jan 2021 11:08:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611590908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jBN2dktxTrpO9M6k6ef1tF5vBWOoz39+ja9xurhvQ1s=;
 b=gvZHVoGEaTPPdzn6AmUAdSBVAhcz6thMTFUL6SHHrFg7yXLQNZwiEMfrHuUvuNwZZipeKs
 b+1WjL19Hux9oNKetUNLpR87V/eTZXmspF5XxJCvjAbr692nC7bvkyNC6UEZDLJl0ULMds
 +XFuaIw/0Oz+5NS+JgUJR86iSs2qJsE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-IL1My31gOJKtbCcfsY8iLQ-1; Mon, 25 Jan 2021 11:08:27 -0500
X-MC-Unique: IL1My31gOJKtbCcfsY8iLQ-1
Received: by mail-ej1-f72.google.com with SMTP id j14so3984754eja.15
 for <qemu-trivial@nongnu.org>; Mon, 25 Jan 2021 08:08:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jBN2dktxTrpO9M6k6ef1tF5vBWOoz39+ja9xurhvQ1s=;
 b=itwYMhVUaFWdPzb8Pg6ZQnb6vzYTfNZZTiRPVGRtiTJVpNIvNe+w1RHcB90gtZNQ+c
 qq9Hw4Zq4mj1jGrAf5V7dUHmcSf00ylP/cY722pAMDfqyEKmwpBxKUpEH+uSv0OJL8b7
 rFlWznTdWuPUnhU2elvKRxhMX1oYX1u2mwooWvenA6xyLrTg2Xyde8qpFc4ywbr8MmFg
 rTGdry1LT2BJnK0jYB//CqWj8QbCrAHp+0KTOB4tucrN2PIsCwinu/0kkEmWqnxJaiwe
 dDYlwuCvcRpny7v1sWe5Pz/VXkzvv/O9Oam3REogGezgq1CPmClvk9JSaYt67VMHe1+7
 12dQ==
X-Gm-Message-State: AOAM531rnTSztxAkMwEIB+sMZxInUNOBr4IAgkzVP5+fF0kZijIyOFvi
 r33macnZSWefqi9Ya9vQ7IuSb97zHC3HknFpS9B6qtL3IzBKiZZDKajzFNvTHOxXarQANRxNUfX
 g8whbduHBJ3Mho371Ua0ybbmgm0rMdbMoe4uqOPOcWJLZeQfODYCTGf5Re34Fi1tA5/E=
X-Received: by 2002:aa7:c384:: with SMTP id k4mr1044261edq.23.1611590905843;
 Mon, 25 Jan 2021 08:08:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+CL7sj8/+xEU+PEX8ORng+pepYe+ve9v6GJLYzyNNYntV3DvKzz8xylLmtv11og4Tm0jVyQ==
X-Received: by 2002:aa7:c384:: with SMTP id k4mr1044243edq.23.1611590905622;
 Mon, 25 Jan 2021 08:08:25 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id dm1sm10497599edb.72.2021.01.25.08.08.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 08:08:24 -0800 (PST)
Subject: Re: [PATCH] net/slirp.c: Fix spelling error in error message
To: Doug Evans <dje@google.com>, qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20210122004251.843837-1-dje@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f2162586-0970-14e1-81e2-367fb94dc66e@redhat.com>
Date: Mon, 25 Jan 2021 17:08:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210122004251.843837-1-dje@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
X-List-Received-Date: Mon, 25 Jan 2021 16:08:33 -0000

On 1/22/21 1:42 AM, dje--- via wrote:
> DNS should be DHCP
> 
> Signed-off-by: Doug Evans <dje@google.com>
> ---
>  net/slirp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


