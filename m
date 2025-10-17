Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0515BCCD195
	for <qemu-trivial@archiver.kernel.org>; Fri, 17 Oct 2025 19:35:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1v9qDt-0007Nn-IQ; Fri, 17 Oct 2025 15:34:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1v9qDs-0007NF-1A
 for qemu-trivial@nongnu.org; Fri, 17 Oct 2025 15:34:44 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1v9qDq-0000qG-2B
 for qemu-trivial@nongnu.org; Fri, 17 Oct 2025 15:34:43 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3ee12807d97so2105825f8f.0
 for <qemu-trivial@nongnu.org>; Fri, 17 Oct 2025 12:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760729680; x=1761334480; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qMJV026dRbiXNw2a4Oxt82ibZLr50tUzegy5c9LVdz4=;
 b=Dkf3we1HqMa6sHU/Ha1mLOwjrws95Hb3r4NvfXMwppW3IHtjHaSeb5bxpzVyCZDYS7
 X/JLibNAERNx5KZVHthTYXKf3XUcUIdrSq3BWQCerR9zuVMhoJCfRlrhrCbky1dtNiE4
 +OIGz4atPZNhgp0Z9cN18rXHNThr3FPaJV+pFZi1vu3W/WUE1BJnWZBFuh+0ua1lVkn6
 GbMJHgMMlDFUc8jSuatIEksGU0SdxMEZT7kTCk+F49P6XLr0BN72ZBAxKoOn9gIk+wYu
 IdCeVGmPy63LVZXhStEZurUdWlD4AikTXDF2c/BeRnabA+ii/sw9wVgt6q+eEIaSJptu
 vo5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760729680; x=1761334480;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qMJV026dRbiXNw2a4Oxt82ibZLr50tUzegy5c9LVdz4=;
 b=VLXFnLCClzWh+MKohT71UAIzhZUietZvrezO3uprN1bY/seKM7U3UAiqb4FPXsCbpJ
 T1Mv8BQRyD2Cd5rD6I2NNH+/y/QqElFnffDkIYZ/aaTbZjZh33Gkz6lBhqsEeVJ65Xww
 mLG2ZaB9YRRNv6OSefdG0lLOnf8HBgDwjvhgJpRfFGr+s/XU3MPiSoy5Kf1CpHVRKP33
 BUQ1LYdgBBqKuxC+PtDuCEfzMjufKJlQTeY4hsM2dnwroG+po5gWrVboY3iodIEun91q
 z9E4+KhkL8SBXctrXed7JX97LPsrpoUQdb3m6FUzMREbEdquitszWt9rcb/v2L2fUfjd
 aRCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCURWAxXYVR3a54zlmoJBR2XqM5Y6021WxIgxFgynl8KAodpe1IDSQn01uj/gpzFAv1ldb8vYo3wZ0WVyHk=@nongnu.org
X-Gm-Message-State: AOJu0YzciMbPSxQ9Kkyjvt4T0Cq0Lgdb65kB/T3kjYx+oN/51if/klwc
 R5f/TYbXKEXN8p/cDu5hADrSKFTj+mV8WYRIAoJ6n9P9Mww6svnqMK79
X-Gm-Gg: ASbGncvbnz07VHfajIuLotn1ISiXxH+nGzEatZDjCaOFVA9n23nrPrTPdg9OJnX+XmT
 w7FoUSyW5J3AICDhUEmv0tUbGt3di+FBjni7wB4+NdAr5XuWFwDiRnpQOIbNk4AA9McDgHip+oI
 TYWbRuvnAOJnUGcB7tBj+Tf0goc04tJIizMMk1MNvYZrsjpoNGWQHMEnTxSAB1lKHmnTfQPWlTS
 xiXirEA3HmZR/E82Ur80WjffumqutMV8WHOxpazImqi+y5TDdeJJyo12tbU2Vrn+UwSlBEaSrv5
 H0RkIXfNF2nHfk6E2RV7nfcEc2HKjkIFLE9wUILU3DHUWU+Gg7uxxgH1G7awWD0xj1qcLirrOQT
 JcxTUNEMMwoQZgKJzF2DgHH4gJ8tYg9n0/clgXomMCUfj8x9V34otvqRywFjV7OF0JwPs77d6nW
 E2XZdv0yPPB1ZyZIkLYro3OWfA/0Xugl4X5AFngggWl22ns0JTS3d6nABOUxmKIccY4gz/iOVEG
 Bfo5tCPgq0=
X-Google-Smtp-Source: AGHT+IHGjetnftVuysT/GTbROlmqCuOV4BZY3KYmTrCujddx2P4/UmIBc6Wo1oHWDywfaY714OaLRA==
X-Received: by 2002:a05:6000:2887:b0:427:9a9:4604 with SMTP id
 ffacd0b85a97d-42709a9465fmr1647206f8f.45.1760729679739; 
 Fri, 17 Oct 2025 12:34:39 -0700 (PDT)
Received: from ehlo.thunderbird.net
 (p200300faaf271400485132244674f203.dip0.t-ipconnect.de.
 [2003:fa:af27:1400:4851:3224:4674:f203])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4711442d3ddsm95764585e9.5.2025.10.17.12.34.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Oct 2025 12:34:39 -0700 (PDT)
Date: Fri, 17 Oct 2025 19:34:36 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
CC: Roman Bolshakov <rbolshakov@ddn.com>, Laurent Vivier <laurent@vivier.eu>, 
 Eduardo Habkost <eduardo@habkost.net>, Cameron Esfahani <dirty@apple.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Zhao Liu <zhao1.liu@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, qemu-trivial@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Phil Dennis-Jordan <phil@philjordan.eu>, John Snow <jsnow@redhat.com>,
 kvm@vger.kernel.org, Laurent Vivier <lvivier@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_09/11=5D_hw/intc/apic=3A_Ensure_?=
 =?US-ASCII?Q?own_APIC_use_in_apic=5Fregister=5F=7Bread=2C_write=7D?=
In-Reply-To: <f074aed2-7702-4a4a-a7d5-7abeb29ea663@tls.msk.ru>
References: <20251017141117.105944-1-shentey@gmail.com>
 <20251017141117.105944-10-shentey@gmail.com>
 <f074aed2-7702-4a4a-a7d5-7abeb29ea663@tls.msk.ru>
Message-ID: <3C9DA9B8-8836-42F6-85CD-AB60327363EC@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



Am 17=2E Oktober 2025 14:58:50 UTC schrieb Michael Tokarev <mjt@tls=2Emsk=
=2Eru>:
>17=2E10=2E2025 17:11, Bernhard Beschow wrote:
>> =2E=2E=2E In apic_mem_{read,write}, the
>> own APIC instance is available as the opaque parameter
>
>> diff --git a/hw/intc/apic=2Ec b/hw/intc/apic=2Ec
>
>> @@ -876,7 +870,7 @@ static uint64_t apic_mem_read(void *opaque, hwaddr =
addr, unsigned size)
>>       }
>>         index =3D (addr >> 4) & 0xff;
>> -    apic_register_read(index, &val);
>> +    apic_register_read(opaque, index, &val);
>
>I think it would be better to use local variable here:
>
> APICCommonState *s =3D opaque;
>
>and use it down the line=2E  Yes, there's just one usage, but it is
>still clearer this way (in my opinion anyway)=2E
>
>Ditto in apic_mem_write=2E

I agree=2E Will fix in the next iteration=2E

Best regards,
Bernhard

>
>But it's more a nitpick really=2E
>
>Thanks,
>
>/mjt

