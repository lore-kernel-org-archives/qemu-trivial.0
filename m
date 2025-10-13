Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40976CCD185
	for <qemu-trivial@archiver.kernel.org>; Mon, 13 Oct 2025 19:18:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1v8O38-0005Tl-88; Mon, 13 Oct 2025 15:17:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1v8O35-0005TN-RT
 for qemu-trivial@nongnu.org; Mon, 13 Oct 2025 15:17:35 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1v8O33-0001n0-Vt
 for qemu-trivial@nongnu.org; Mon, 13 Oct 2025 15:17:35 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-46e42deffa8so42999155e9.0
 for <qemu-trivial@nongnu.org>; Mon, 13 Oct 2025 12:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760383052; x=1760987852; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xiK75KG1lswxj6Jv8QlsEsjxImVje5ZiRRxRVvO5CtY=;
 b=D75GnJME5L6IuaXn2jm2B/HNoveBOWw7VSgfnWUxxkYso6agFPbgvccJtBnD99hL77
 ZvKzD51sntgkLjzQ9TymV7SJS/UiNpDaN0u3J/mLvmcoAExAgW4YJj0RkNTv+BSNcBcO
 NgHvaVfeqfXkGw4mtXdPa1/BQRK6cs0jidSTPSYKxvq6ihjg0P7V2DnRElvgWRUQPT1N
 oWaKJWPP/sr7MUB8noWjQCm5JaDoYdLjSItbtzFLIl4BmDA4Ty7wIDVCESiSxagoho44
 0ux95qI3phhl9gHVg6H2dMN5qb7MmObpKhNJx8t1/9H06fEYVHXIp22wvRJEmkqoXMjB
 vLqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760383052; x=1760987852;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xiK75KG1lswxj6Jv8QlsEsjxImVje5ZiRRxRVvO5CtY=;
 b=MvEotYJENEiAdfT1wjoytYseGeScqrdrUafCjSDPZCY39ToWT1hg09owCwoPTnCnn/
 oTvKKYaPKtdz4sDilemNVxn2WbMpa4HFytNplOe3TRHi6CtK0YRe9KRUXRKtZ16c0h3J
 0agg5HOEi9ODuR3sp42E+WZGkf6rtxfFtjClAC7kPsyMaBGM7SO7wOnwg3UFKz9ovFnu
 MuGM2TCIwsUopaPB3DtMzckbguNfvmlVtBhnJuvfK7NV+2eIoTFYhMxERvB2107pUp++
 fCLUB46Fz/pD2wdpAFflFjIZi1wqyMWINrbVX/JJRMMH/qe7z3iALscEn9wzY+Gp4kju
 LjAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWb/CALkDBXQw1/QM21bUoWNM/VkUavdh0Hcm1zIlTtzNI3ammSgMjns6aG3XDcXNoJLNHnCDpRmjLppE=@nongnu.org
X-Gm-Message-State: AOJu0YxjTwE0ZLNcbCHRSXjVmztq85RISzTvUAA2ucd6YxUkqrF/ysCK
 qYh0uqCB2W3kMrOtZ6Lkp3qo3tHbDKLz2xRp9hmWx5jhOR2jEk/3jwQA
X-Gm-Gg: ASbGncsZeqeZvScdh0YC8cnrLswvKeNugiKvk9RpqoIsaLaCfIRsJrnrGmALtXn+pPY
 Kg677gkoOAZku5w1WehpT+BXn15eUiyXQRT35R+8t25TyQiHJsxWCJSGNDftasIEDf4KnebxHXw
 EB1sZIHsjMqBs0otwth5zOabc9U2BNCnoUJtw3AdD2xsxeVQg4YNz668PGIgxr/LBxOFYglyqTy
 /ikd5PPYKdRh7yTVyvrlOmhmWMI9BxIVqnum2gGZfXWmTwl2mh5pYfEsJ1AAF/hoFnALmRXRmGk
 Qz1a72R5jFt9ZjNNuWZc01Jos3C4jz6lmiNyIoSaEJTLEv5tZYyymFZlhuBaWbQnDqtN/hfEbpP
 4iFA5zVkgolthkN5ZvOaWkAQ+Z9YlXZSxumWJoDJuXSmGrD/D4QnK4EifKKxoOHgXjq1tU/dqi2
 JCTZdpFouwaiuDje50GpWb/EfvAAnkGUftFD2CNA==
X-Google-Smtp-Source: AGHT+IHU5wMW6jHCaghZ+f5oYifMHLQNNFD/JSPcjf6kXUliBoNv9hhsI7yXKfx/FCdg5qEQ19dHsQ==
X-Received: by 2002:a05:600c:3acb:b0:46e:2801:84aa with SMTP id
 5b1f17b1804b1-46fa9a21caamr132516145e9.0.1760383051935; 
 Mon, 13 Oct 2025 12:17:31 -0700 (PDT)
Received: from ehlo.thunderbird.net
 (p200300faaf271400a0afdc243fcb5392.dip0.t-ipconnect.de.
 [2003:fa:af27:1400:a0af:dc24:3fcb:5392])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5cf790sm19028061f8f.28.2025.10.13.12.17.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Oct 2025 12:17:31 -0700 (PDT)
Date: Mon, 13 Oct 2025 19:17:28 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
CC: sstabellini@kernel.org, anthony@xenproject.org, paul@xen.org,
 edgar.iglesias@gmail.com, xen-devel@lists.xenproject.org,
 qemu-trivial@nongnu.org
Subject: Re: [PATCH] hw/display/xenfb: Replace unreachable code by abort()
In-Reply-To: <877bwz6oqy.fsf@pond.sub.org>
References: <20250729111226.3627499-1-armbru@redhat.com>
 <877bwz6oqy.fsf@pond.sub.org>
Message-ID: <20C81C5B-912C-49B3-B50A-867C06C134B1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x332.google.com
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



Am 13=2E Oktober 2025 11:10:45 UTC schrieb Markus Armbruster <armbru@redha=
t=2Ecom>:
>Ping?
>
>Markus Armbruster <armbru@redhat=2Ecom> writes:
>
>> xenfb_mouse_event() has a switch statement whose controlling
>> expression move->axis is an enum InputAxis=2E  The enum values are
>> INPUT_AXIS_X and INPUT_AXIS_Y, encoded as 0 and 1=2E  The switch has a
>> case for both axes=2E  In addition, it has an unreachable default label=
=2E
>> This convinces Coverity that move->axis can be greater than 1=2E  It
>> duly reports a buffer overrun when it is used to subscript an array
>> with two elements=2E
>>
>> Replace the unreachable code by abort()=2E
>>
>> Resolves: Coverity CID 1613906
>> Signed-off-by: Markus Armbruster <armbru@redhat=2Ecom>
>> ---
>>  hw/display/xenfb=2Ec | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/hw/display/xenfb=2Ec b/hw/display/xenfb=2Ec
>> index 22822fecea=2E=2E5e6c691779 100644
>> --- a/hw/display/xenfb=2Ec
>> +++ b/hw/display/xenfb=2Ec
>> @@ -283,8 +283,7 @@ static void xenfb_mouse_event(DeviceState *dev, Qem=
uConsole *src,
>>                  scale =3D surface_height(surface) - 1;
>>                  break;
>>              default:
>> -                scale =3D 0x8000;
>> -                break;
>> +                abort();

Don't we prefer g_assert_not_reached() these days, for more expressiveness=
?

Best regards,
Bernhard

>>              }
>>              xenfb->axis[move->axis] =3D move->value * scale / 0x7fff;
>>          }
>
>

