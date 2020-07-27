Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k04Kv-0002I2-KE
	for mharc-qemu-trivial@gnu.org; Mon, 27 Jul 2020 10:42:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k04Ku-0002EE-1x
 for qemu-trivial@nongnu.org; Mon, 27 Jul 2020 10:42:40 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:22776
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k04Ks-0002do-DS
 for qemu-trivial@nongnu.org; Mon, 27 Jul 2020 10:42:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595860957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LgUcK7AW317W7xaK4NEWuXJcDMIWeZWvFDqzfYiDQR8=;
 b=AIES2OwjG6HvteJhbCvyKeh+4iNfx2J76CGVq9VyCazW9Tr6DiKilKxftAXQqa1CwOc688
 u+tYTMRKYBskoocD2BuLhi4TRk21IEuSRK7nICNMWzaHnhmAtJ9GQ9q7JSsMk/JDKQSnhy
 CQPDasouF6Du/LRYG6we6XWeX7vDtRY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-hh3EHNQBOlmqCLN4sEyW6w-1; Mon, 27 Jul 2020 10:42:35 -0400
X-MC-Unique: hh3EHNQBOlmqCLN4sEyW6w-1
Received: by mail-wr1-f69.google.com with SMTP id 5so3992650wrc.17
 for <qemu-trivial@nongnu.org>; Mon, 27 Jul 2020 07:42:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LgUcK7AW317W7xaK4NEWuXJcDMIWeZWvFDqzfYiDQR8=;
 b=uoDKzRtIyON3l0tvF3zRyqZZwE6a1RGMcSeQ8Ijlsqo5xM7LGfgnN9gyOm00wNs2LY
 zcwa3hsMtHh05LVDM4z/Bew76OzP6lbg80mDUKon/04qfGE4wJKQO2jwp811qpgmNqN2
 /rD5HDGxO11c4aUeUVo+BB77oVWXRhk5r2bm+9udmRDHZu4Gz2LrdBmdES3nLg3A6S7v
 +NtigNubicZm206ywFtIQWUatR7OQNnNj3IYdc0ENRwDY4Ny06OW5c6iteiJeFYBCbPh
 AU7LCHXcWRLToUc3DFRw/c5hAA56t/ENnR1EAfdn51vBhZXFmr0E6cuvaQfwZzQ24l6F
 t31Q==
X-Gm-Message-State: AOAM530GB6YLwo+46mRiP2UeLvf7BJRvvDtGnlqBqqEHuzR47lvzVKrl
 ZLIekQqYyi0040nH3bYZRD7ilwgqFvljmyr89SnLhBZKi+BZj6S1sXHzlN7OvQyw8MVCyK8dtJ0
 xse5R9rIfEdWQnOLaZg==
X-Received: by 2002:a5d:4bc8:: with SMTP id l8mr20234226wrt.159.1595860954434; 
 Mon, 27 Jul 2020 07:42:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdCHtsjjLhqfdsbFH0iueUNGuEBnzdaP2I/FSOdNFxlctFz0hhNlwC0VYuC1vcsNKoBysuvg==
X-Received: by 2002:a5d:4bc8:: with SMTP id l8mr20234212wrt.159.1595860954221; 
 Mon, 27 Jul 2020 07:42:34 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:4502:3ee3:2bae:c612?
 ([2001:b07:6468:f312:4502:3ee3:2bae:c612])
 by smtp.gmail.com with ESMTPSA id i9sm18451892wmb.11.2020.07.27.07.42.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jul 2020 07:42:33 -0700 (PDT)
Subject: Re: [PATCH-for-5.1 v2] hw/isa/isa-superio: Fix IDE controller
 realization
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
References: <20200721124516.9602-1-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1309c64b-3cdd-9512-0d8b-8467b54291f3@redhat.com>
Date: Mon, 27 Jul 2020 16:42:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200721124516.9602-1-f4bug@amsat.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/27 03:37:14
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 27 Jul 2020 14:42:40 -0000

On 21/07/20 14:45, Philippe Mathieu-Daudé wrote:
> When realizing a Super I/O with IDE controller [*], we get:
> 
>   qom/object.c:1684: object_property_try_add_child: Assertion `!child->parent' failed.
>   Aborted (core dumped)
> 
> This is because the device is already realized when we try to
> add the QOM property to the parent. Fix by realizing *after*
> adding the QOM relationship.
> 
> [*] Set ISASuperIOClass::ide.count = N with N not zero
>     (no such thing currently exists; the bug is latent)
> 
> Fixes: e508430619 ("hw/isa/superio: Make the components QOM children")
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> v2: Reword bug is latent (Markus)
> ---
>  hw/isa/isa-superio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/isa/isa-superio.c b/hw/isa/isa-superio.c
> index e2e47d8fd9..179c185695 100644
> --- a/hw/isa/isa-superio.c
> +++ b/hw/isa/isa-superio.c
> @@ -158,8 +158,8 @@ static void isa_superio_realize(DeviceState *dev, Error **errp)
>          if (k->ide.get_irq) {
>              qdev_prop_set_uint32(d, "irq", k->ide.get_irq(sio, 0));
>          }
> -        isa_realize_and_unref(isa, bus, &error_fatal);
>          object_property_add_child(OBJECT(sio), "isa-ide", OBJECT(isa));
> +        isa_realize_and_unref(isa, bus, &error_fatal);
>          sio->ide = isa;
>          trace_superio_create_ide(0,
>                                   k->ide.get_iobase ?
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


