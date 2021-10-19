Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcmEy-0004DF-Hm
	for mharc-qemu-trivial@gnu.org; Tue, 19 Oct 2021 06:21:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mcmEw-00047f-OB
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 06:21:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mcmEt-0005HI-6K
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 06:21:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634638858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2pbnPZY3+TFZq2TV6rE/MWm72YicZVMPUpuBSA+dHb4=;
 b=ac3ULT7as7CFr/kreM/cvrHcyvrNg9aJ7y06/4P0btCgXI/x5UrO9yHX/0+tN7TCvsmTVv
 9FDK2gIj+Yl1mtZDedXPUYdvcwsV3BlmQQE59+sxzQ1k8lUJw4EGBC0Sib08z1CXtal2iy
 YBBmafQLptBegvWNNoaQxauGIRnBXj0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-lKsLlPbFOpmRianPmAG6wA-1; Tue, 19 Oct 2021 06:20:56 -0400
X-MC-Unique: lKsLlPbFOpmRianPmAG6wA-1
Received: by mail-ed1-f69.google.com with SMTP id
 u17-20020a50d511000000b003daa3828c13so17128946edi.12
 for <qemu-trivial@nongnu.org>; Tue, 19 Oct 2021 03:20:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2pbnPZY3+TFZq2TV6rE/MWm72YicZVMPUpuBSA+dHb4=;
 b=d6DpW+0TQicj/5DhQW6Mo3csf1m7eEWqMuq9NBTVNtuv60L5xbqSvzP9PL5/uB1aQw
 MeCD0fjvmydibmSHkTXxWkfQ1U+99fDr/IVbHgYgu6Lc1qQZbYuGKWfNdh1vFPhlxlzq
 mlxFJL2wLdnbrB2VdRHw1x0rxcZNAGE54WWjI0W2mc/8Wex87lOo9yHDOQ9nyFzjyJ0R
 MXHOxY57LtZtYR7c0MCXjQEkoxuQHNTaxk69GL2f7/UUXvySL0xWN09Vp89uaLsrrPd8
 lDHli8/I5QmC8ObS6c+0ft9HaZb7cvUxu2/Q9nE2iyJ9uBv9fmTbu0IozPzswQJ4crJj
 HU+g==
X-Gm-Message-State: AOAM531CgOOpeFa91v0Q0dc0mSieOBAiSHKUM08Pl4OpU4eNGvzSUJ3L
 ZTea/4Eo2pLOZHO6wi8a/nseMpacQ0mAfB0kcNTgT3ANVmz8XHEARDW3TjyAAZUdfbwmdLekt5G
 rAl4wCU36ow9hhiTSXg==
X-Received: by 2002:a17:906:6403:: with SMTP id
 d3mr35351441ejm.37.1634638854705; 
 Tue, 19 Oct 2021 03:20:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3g/ek8HXGczPn9NjWx61w4/u98iMOhx/+iKI46+h+QbKuGYJyFMh7FiYOz3hFPVj1GBhYkQ==
X-Received: by 2002:a17:906:6403:: with SMTP id
 d3mr35351431ejm.37.1634638854515; 
 Tue, 19 Oct 2021 03:20:54 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:8e02:b072:96b1:56d0?
 ([2001:b07:6468:f312:8e02:b072:96b1:56d0])
 by smtp.gmail.com with ESMTPSA id di4sm11154000edb.34.2021.10.19.03.20.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 03:20:54 -0700 (PDT)
Message-ID: <164d5ec6-b29a-eb8a-9bce-3b690039522e@redhat.com>
Date: Tue, 19 Oct 2021 12:20:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] po: update turkish translation
To: Laurent Vivier <laurent@vivier.eu>, =?UTF-8?Q?O=c4=9fuz_Ersen?=
 <oguzersen@protonmail.com>
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <lDpmNUjNrVETJ2QoHoYmSoRvKoEIVFbF4IZAa1R5PVzqPCTh7nmV_ERHQlgYtNJN1Ppagtvelbo4uhSihEd5bSqIxCvGQchEWVpP-ofn2kw=@protonmail.com>
 <57904976-7779-7519-f1e4-f7e800c1145f@vivier.eu>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <57904976-7779-7519-f1e4-f7e800c1145f@vivier.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Tue, 19 Oct 2021 10:21:03 -0000

On 23/09/21 17:26, Laurent Vivier wrote:
> Le 15/08/2021 à 22:24, Oğuz Ersen a écrit :
>> Hi, this is a small patch to update Turkish translation, thanks.
>>
> Please don't send patch as an attachment, use "git send-email" or "git publish" if you can.
> 
> https://wiki.qemu.org/Contribute/SubmitAPatch#Do_not_send_as_an_attachment
> 
> With the help of Google Translate:
> 
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> 
> There is a typo that can be fixed during merge:
> 
>>   msgid "_Copy"
>> -msgstr ""
>> +msgstr "K_opyala"
> 
> s/K_opyala/_Kopyala/

This was intentional, because "K" was already used by the translation 
for "Show Tabs" ("Se_kmeleri Göster").  However, it is possible to keep 
"_Kopyala" if you modify "Show Tabs" instead:

diff --git a/po/tr.po b/po/tr.po
index 2845f3779c..f4f0425c43 100644
--- a/po/tr.po
+++ b/po/tr.po
@@ -61,7 +61,7 @@ msgid "_Grab Input"
  msgstr "Girdiyi _Yakala"

  msgid "Show _Tabs"
-msgstr "Se_kmeleri Göster"
+msgstr "_Sekmeleri Göster"

  msgid "Detach Tab"
  msgstr "Sekmeyi Ayır"


Can you squash this in the commit in your trivial-patches branch?

Paolo


