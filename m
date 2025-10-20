Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 442DECCD199
	for <qemu-trivial@archiver.kernel.org>; Mon, 20 Oct 2025 06:11:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vAj6s-0001Le-EJ; Mon, 20 Oct 2025 02:11:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAj6q-0001Ip-Sb
 for qemu-trivial@nongnu.org; Mon, 20 Oct 2025 02:11:09 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAj6o-0003e2-Pb
 for qemu-trivial@nongnu.org; Mon, 20 Oct 2025 02:11:08 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-47114a40161so42987525e9.3
 for <qemu-trivial@nongnu.org>; Sun, 19 Oct 2025 23:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760940664; x=1761545464; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BXXOrptoc81LnYXKppppXYtM6aRpFMZHfbgbW/Xv7a4=;
 b=e8Q/hkx1Jsc/yMZQMkedo1RRSNO8t8n6R/ZCje4iox3aqJopq/0uI33JLcn1qxp/5Y
 L+x5CO4MSZz+OuvqaFc98pkstGlZUXKhuWj9/rgTOlbSSqFDVzlTb2kXMsbqHHm/y4ol
 ATDpnX98l9caKevw9tt+Ip9scv7uhebUTEXHmqrgdP9mvQQQq4EDXr9H3jfHG6O+YtMB
 jRFzFrpDCQ4KErBao+Wzscy4clOd2zSO5OYTrH8Yrsy6HCCWjdJp+pfseVtes+8LzgD1
 6Frwy16Amv558XsK37T/P1OoG47S83jhzGGK7vKTwAOewyiYCchCHTgc3dCoc3DwuqeD
 +sUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760940664; x=1761545464;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BXXOrptoc81LnYXKppppXYtM6aRpFMZHfbgbW/Xv7a4=;
 b=mcNu783REtKV85aYSijOPqpYVstcQIaaqcjOnYbmOQdxeWfBeWFnCMnYB9oz81XbhA
 cObk39RtGbTMgyIAAFezv/F6B28yMYnBKQ7IVDkWcMzZ8x+YEtBYDHwgDBxmLrrSJ3pp
 Rl7iGzsNnvj1m86xdZGbXEHD6Vf4o7UC/jnOYqbg5qiupcOf1GrtCMDRC9cdl9uyIccm
 YHMLwwVp0scC2JmmZUt4mN73ZKQHtlDZWgjBdzlxlPiJIOjMnKPhqmc+TaIHpOVG3GKL
 H9t4zmbK/W62oSOGrLd5vhd0i9XUCZls/odoM48FkyBPMTJBIwuP7G4zbtb3gYjZpQsH
 QM1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9FYv0HgOO6uZncslSuK9PGjbT3ZYCqPwBhKXChSyXtWha4owQWtAfE5OXleGcku3gQNnmo7FH0jFSJDU=@nongnu.org
X-Gm-Message-State: AOJu0Yx1wgHgCFhyZ/uirlhZC1DLQaHfZxGvXQN9dVB0f9jfdXe2+/r+
 JTWglK7k8aS/qLxLEGhvsJd9rjOmP9dc2xBh5KLHHzgDm/UPQRTWWrNOGGuzpRyAoGY=
X-Gm-Gg: ASbGncvS/SsZ0TbR8AyiC4F1/xp3qHV/mmMwxmLCT4hfu9yuOq1GYxGlVz5x/+Z+uy7
 RWBCH0N8TYiWcLVxd8EZr65Tes7lkef5JliCiTRYJ9xkBdPilbzphDYszB4xTpeh7Xrci4kkPa5
 1s7xyxcT3Ox9Ofo219rR5s8nnWQydjdUvzzc/IRw8fCv1juoKQxne40haIdVm8USfu94fyv55eS
 +47DARpnfnkm9KLP909Oc0uyqd/LdumpaWOqrEiSHDMwmm0ss+3bj96SQb8ss/JvaTDx2LCyj5S
 6ZvUyenh/ya1HvdUlCkKM2lwvHARkF7FHxKL+xm2aM5qZiUKvZuh/zNzvuryrSYcWZz4/QQHNsn
 lcvcuUHrwDgFe2qEjQ6DivtSZwI/Net4PgWVIgsojTFfMuf76i3Z2B6CG6iyzefQL8fxwjLO21P
 DF+G3iL8a6go2DpkkNnVWLZYR6UCKB96shCjjIfkeo08pNmr2TOCaqDg==
X-Google-Smtp-Source: AGHT+IF0GrnqoFiHhiKe1Ey1S/CfiDmlKMI9HdKRO5gAV9PLkQgkhZmoQt3Osb6YwY7GwqbTcbMXmg==
X-Received: by 2002:a05:600c:3550:b0:471:14f5:126f with SMTP id
 5b1f17b1804b1-471179141cfmr94029375e9.33.1760940663812; 
 Sun, 19 Oct 2025 23:11:03 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427f00ce3e2sm13494720f8f.47.2025.10.19.23.11.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Oct 2025 23:11:03 -0700 (PDT)
Message-ID: <127dca3e-bc84-4626-b0bb-50eb5267f878@linaro.org>
Date: Mon, 20 Oct 2025 08:11:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/10] tests/qtest/ds1338-test: Reuse from_bcd()
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Zhao Liu <zhao1.liu@intel.com>,
 kvm@vger.kernel.org, Michael Tokarev <mjt@tls.msk.ru>,
 Cameron Esfahani <dirty@apple.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Phil Dennis-Jordan
 <phil@philjordan.eu>, John Snow <jsnow@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>
References: <20251019210303.104718-1-shentey@gmail.com>
 <20251019210303.104718-11-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251019210303.104718-11-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On 19/10/25 23:03, Bernhard Beschow wrote:
> from_bcd() is a public API function which can be unit-tested. Reuse it to avoid
> code duplication.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   tests/qtest/ds1338-test.c | 12 ++++--------
>   1 file changed, 4 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


