Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0183CCD195
	for <qemu-trivial@archiver.kernel.org>; Fri, 17 Oct 2025 09:03:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1v9gLw-0005ba-NO; Fri, 17 Oct 2025 05:02:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xpahos@gmail.com>) id 1v9gLu-0005a7-QS
 for qemu-trivial@nongnu.org; Fri, 17 Oct 2025 05:02:22 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xpahos@gmail.com>) id 1v9gLn-0007ad-4v
 for qemu-trivial@nongnu.org; Fri, 17 Oct 2025 05:02:22 -0400
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-58b025fce96so1593413e87.1
 for <qemu-trivial@nongnu.org>; Fri, 17 Oct 2025 02:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760691727; x=1761296527; darn=nongnu.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8W9epadXBSELzO5xUb4zHxvIU3+NILzN6nwXVIDHUq8=;
 b=BgLMSAI7zISoQXfKF0N/ImDg7ZMWnQMpDaCJItdDKx+T7e4eLquLhxiMHcjqjoaEsU
 Ra3sRINM6UCRdR6+n3gvfWrUeefYp9uXXLirHm9HqD0GVEFjfJzJX4XWMPidHalLpaPT
 rMYLq3hQ4FtWIIn+3PC1FnB5ar1UFQAQJ2NSNayeJy2Y/MvAUusijbCyD2aPc/DumTxy
 3RBL1PEVXvAqp/jxWU6sBYMSgIrjvIizp5eCx619HnHMZVo677J4tBZTLApsaBu8lwuF
 mYbYKQ6WCVwCACz964w6cGeYQn4mgG6ZTNl1E6mUlYo+7weELYUkCraLGkWl5LgPq2FY
 gBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760691727; x=1761296527;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8W9epadXBSELzO5xUb4zHxvIU3+NILzN6nwXVIDHUq8=;
 b=Ip40u31om8R09ZWrNOccBRj6wChZirGS4QmG+N0rTH56yuV66dDMM3yoLylExd8pmy
 XxecqawmhSV4vpvceMGfGWlmzzeYwBAEEVkiz7mKVSCTXs44jNJsfPAFlZrJNmINGSC9
 LI0vI4YOa0439U9jJTcm1Oihv1UaomYJCzTN0W1is9mBG8wcBnzaUW4Jx/ZChm1tSHqs
 QNcejfqvyPY4eAKzG8/D9BpXR25DcTkFeUBP0XEqoVXIPsn3182bwJTsLgJ0X4KVgTvX
 3x0jd/jyTarp08YhmDc7vSeM3hicXPpxWvB8pEYCk+M8bhoS4QAjH/7pZbVkjJftRm7S
 TbTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUPgW33bqWCykBpeAWGVS6nL8R59uTVf5nm9o12n8aAbBUpps/u0G42+3tdapGjyP+HDVExqPotkiKYo8=@nongnu.org
X-Gm-Message-State: AOJu0YxpkYvRgAhtbIDd7nCdhtP8P5xLzkL5iGpi03Er1QkBAY8IazRj
 tA8oiONS6CLsF+jPazjPAuVJWEcdAaurNYbDL6Wcy7uOe35FI2khQgnN
X-Gm-Gg: ASbGncv/brWF444F5HEhoXtRQzRrv/FCYb8vsngrJI81drR4t4DJugDHCpWdcDeyJ5h
 AdftXLvrSKlxmnmmVJ5zXT1jgPjfzx5U6nBFYJskqAR6WdaDkBJ7YlQEAVZkF3v5RQDnbMseUit
 SPnVaiYw5w3Emzpey9DSGNtKbQod2NNVEwbbgVhpoj10zbmQfZXwtAwDLKQ19SGmtzKHMK+akqs
 H6liWpCp3tMHIV5CoEH8bsy3WlZ6o68VYihKBKoCGGd790HcYtsvt25UUqw0Pw1Ng7nDdDifbu1
 BrirU3UuUGQOSB4mH9BkksXE0ZK8r+dDT0y4/r7fKpX5WSEGZF/juuFrgc6vYSyIFjvOw6ZwTz6
 R0LOSXnFoIAdTp+7j+8VjJSbzJqCBgN0GFfqqQaEhKpBdmSMz41ccGvlwS+KJu6tUbFBMbZILPJ
 6c/Z3Hp/CVlKkn6MQP5zQ+zb08idVOciwG
X-Google-Smtp-Source: AGHT+IE0mneS7ORKRBASrY7wNpppZdGMsr9khtqxIlYoMdQz4Skai0BRxGwcIE89NkbLJg6fPKcQdA==
X-Received: by 2002:a05:6512:3503:b0:55f:71ad:590f with SMTP id
 2adb3069b0e04-591d857583cmr1041893e87.53.1760691726868; 
 Fri, 17 Oct 2025 02:02:06 -0700 (PDT)
Received: from smtpclient.apple ([183.81.178.52])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59088212380sm7671842e87.58.2025.10.17.02.02.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 17 Oct 2025 02:02:06 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.2\))
Subject: Re: [PATCH] hw/uefi: fix properties list definition
From: Alexander Gryanko <xpahos@gmail.com>
In-Reply-To: <542c446a-9c63-45a3-b68e-4f72f6ad51ef@tls.msk.ru>
Date: Fri, 17 Oct 2025 18:01:47 +0900
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <27CEC22D-DCBC-4BF5-97B8-114DE2551F28@gmail.com>
References: <20251012-pvvars-fix-props-v1-1-6ca31af626e0@gmail.com>
 <542c446a-9c63-45a3-b68e-4f72f6ad51ef@tls.msk.ru>
To: Michael Tokarev <mjt@tls.msk.ru>
X-Mailer: Apple Mail (2.3776.700.51.11.2)
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=xpahos@gmail.com; helo=mail-lf1-x134.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hello Michael,

> On 14 Oct 2025, at 16:26, Michael Tokarev <mjt@tls.msk.ru> wrote:
>=20
> On 10/13/25 01:36, xpahos@gmail.com wrote:
>> From: Alexander Gryanko <xpahos@gmail.com>
>> Added DEFINE_PROP_END_OF_LIST() to the Property structure definition.
>> This fixes the device_class_set_legacy_reset error when accessing
>> the prop->info field.
>=20
> Please show the context where this is a problem, which error
> are you seeing.
>=20
>> --- a/hw/uefi/var-service-sysbus.c
>> +++ b/hw/uefi/var-service-sysbus.c
>> @@ -39,6 +39,7 @@ static const Property uefi_vars_sysbus_properties[] =
=3D {
>>                       state.disable_custom_mode, false),
>>      DEFINE_PROP_BOOL("use-pio", uefi_vars_sysbus_state,
>>                       state.use_pio, false),
>> +    DEFINE_PROP_END_OF_LIST(),
>=20
> Which qemu version is it?
>=20
> See commit 5fcabe628b8140691dab834a22be549d242b24bd which is in 10.0.
> This symbol (DEFINE_PROP_END_OF_LIST) is not defined (and not used)
> in current qemu.
>=20
> So it looks like this patch isn't needed.

Sorry, while I was trying to figure out what was going on, I discovered =
that I had started fuzzing on the backported branch.

Thank you.

>=20
> Thanks,
>=20
> /mjt


