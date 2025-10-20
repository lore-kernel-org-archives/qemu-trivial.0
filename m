Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B3FDCCD199
	for <qemu-trivial@archiver.kernel.org>; Mon, 20 Oct 2025 17:23:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vAtb9-0000lY-30; Mon, 20 Oct 2025 13:23:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vAtb6-0000jk-6I
 for qemu-trivial@nongnu.org; Mon, 20 Oct 2025 13:23:04 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vAtb3-00008u-7W
 for qemu-trivial@nongnu.org; Mon, 20 Oct 2025 13:23:03 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b403bb7843eso854530266b.3
 for <qemu-trivial@nongnu.org>; Mon, 20 Oct 2025 10:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760980979; x=1761585779; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sTVhgxwa5kF4SMLkuMH7FPHkTbClk19tO6fpJDEo4Tg=;
 b=X6L5l9ZSa8YAzSKSoGa3kOi/2bZXXX6Kk7+KRiz2flLjCNVwDx9Bg/RwI/D2EgDCTs
 wLV9daDKUaXVYxHA5hF0/xWZ8CppYFhbDqlL5m+FdyhNlKps7HLVmugQJ6E3mkJd0xBC
 m2pi4K16iv5+lSJiyLuTB+3WQ+shXoONY8uHOcauWOlpduq1gzXpaXyZAobBIhTwYlqj
 YGgvNqMUxeyO2sNx+aTCV+rrFhKKdGsty6JPhacArguXlgm2mRue6lX/j4uXVeiNAQ+r
 87AYJI5FwuhTIlwiUhZHz4k2EMUwBtLLJJoiht23DyM7Hz32V/R+0JinISL6mLMTRWsL
 q4/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760980979; x=1761585779;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sTVhgxwa5kF4SMLkuMH7FPHkTbClk19tO6fpJDEo4Tg=;
 b=CHxXU0lZoh/6LvSqjMU00JbKU5qPricNFAk/C5xO6U9gGjzp4B6/RvWBT2d3/rYyzE
 5NO+8ZVLYHaB/wF1n2E5PaBwqThuMqJ9E3KdiPUlngZsviNyOql9dedBN12BhR6JJAlU
 pVsjoCnDbDahqZ+6KTkaa8V/dGJZrpt1ZgQFnkkFB5NYPfgN5m3JOLER4h60yX+sePUD
 Gm82mgpYUkUxFBNS/4Xsg//GcrufsTrRveQLOmNNT0Gle8RuZGkPJlIvQlQs0XpByZZU
 MD3qBAy9OSI9lJQMDv4pjWqjDqhUOnNQxTP4WLNUZw0rygo7H4YHx0BZSOSIxQOcob12
 azdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRwOG2jP4aFFOE/iUWL4j3UKfuZKKKygRItGrlz9085B5cL15EbO8OS+l+6VYNc5Ow0go8JreiMhfaAXQ=@nongnu.org
X-Gm-Message-State: AOJu0YyR6AZlDekFLBUPvzlKEMNpOpTKZIWUBpjOuDqy3ZFE3XZkNgit
 l2zIHpmGAMXWKnr9uQSamPDO1mUYVoQ8cUQNqIefA7xhU0SAyIQLczg7
X-Gm-Gg: ASbGncu7kWw/9IGWkQVrmtfWK0idsEh9gHlvAccT4cF5Ba0JOkuA8ThMwALpnIlcwLw
 aNvLbSM8Fkdf97AW8H9H6ogEOYp59CYnks4VvT60CGIcFPqtbeqRtmTLa+bKouaSxB/skUQA/Qw
 j4fw3wuMk7hVrbjTz5JUd3vMSp9da274qJf745ZjS0giHMbDd0XB2Ts0h0Pj7s5FI4dgq53eYOA
 iprbJAPMFXD8RzRirYeAsinnN+42Gf2OWOtB4j8Udli29L+d3+t72ypsduBUyl2JHJyCJtPkLhm
 XMxnwidc99CN04fY9E/1pAQ9YDjI8fpguye3IcT4XDjl8/Dm4Us9FLpQ0rcZnlDUfjITn3SFrCW
 rVgj3wuVy/wvxukz2dA9vudf9zid6R9UUUjjB4z+k5/4sEHmM/AmIMCY9KnesfaqT5KS9L5bgQb
 bEaUY7E1gBNoxWeTq3FBcIR53BrmHB1ekbYp+8MF4dO8eEb3lxbrQ=
X-Google-Smtp-Source: AGHT+IHgt2qm8Q0ImpaSATgiIuQagmL40lRaChwnudjfSuEr0i1VvBZQPTFmi2bUV3ztpQ8xhTOQUg==
X-Received: by 2002:a17:907:1b10:b0:b2a:5fe5:87c7 with SMTP id
 a640c23a62f3a-b6471d4570emr1820808966b.12.1760980979058; 
 Mon, 20 Oct 2025 10:22:59 -0700 (PDT)
Received: from ehlo.thunderbird.net (ip-109-41-112-59.web.vodafone.de.
 [109.41.112.59]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65e83976afsm850054666b.34.2025.10.20.10.22.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 10:22:58 -0700 (PDT)
Date: Mon, 20 Oct 2025 17:22:57 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Zhao Liu <zhao1.liu@intel.com>,
 kvm@vger.kernel.org, Michael Tokarev <mjt@tls.msk.ru>,
 Cameron Esfahani <dirty@apple.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, John Snow <jsnow@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_08/10=5D_hw/i386/apic=3A_Ensur?=
 =?US-ASCII?Q?e_own_APIC_use_in_apic=5Fmsr=5F=7Bread=2C_write=7D?=
In-Reply-To: <3de8cdd2-ffd9-4f6a-ab2c-fa0782310746@linaro.org>
References: <20251019210303.104718-1-shentey@gmail.com>
 <20251019210303.104718-9-shentey@gmail.com>
 <3de8cdd2-ffd9-4f6a-ab2c-fa0782310746@linaro.org>
Message-ID: <7E49458E-C15B-40F5-A866-F0CB7813D239@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org



Am 20=2E Oktober 2025 06:09:22 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <=
philmd@linaro=2Eorg>:
>On 19/10/25 23:03, Bernhard Beschow wrote:
>> Avoids the `current_cpu` global and seems more robust by not "forgettin=
g" the
>> own APIC and then re-determining it by cpu_get_current_apic() which use=
s the
>> global=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>   include/hw/i386/apic=2Eh               |  4 ++--
>>   hw/intc/apic=2Ec                       | 10 ++--------
>>   target/i386/hvf/hvf=2Ec                |  4 ++--
>>   target/i386/tcg/system/misc_helper=2Ec |  4 ++--
>>   4 files changed, 8 insertions(+), 14 deletions(-)
>
>Good cleanup!
>
>Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>

Thanks! I think it would be possible to remove cpu_get_current_apic() enti=
rely if each local APIC's memory region could be bound to the address space=
 of each CPU=2E However, it seems that the respective root memory regions a=
ren't prepared for that and I didn't want to go into this rabbit hole here =
in this context=2E

Best regards,
Bernhard

