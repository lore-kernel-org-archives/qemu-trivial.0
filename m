Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C82F2CA9ED2
	for <qemu-trivial@archiver.kernel.org>; Mon, 12 Oct 2026 21:00:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1xGN86-0006fP-Ix; Mon, 12 Oct 2026 17:00:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <filip.hejsek@gmail.com>)
 id 1xGN84-0006ex-A1
 for qemu-trivial@nongnu.org; Mon, 12 Oct 2026 17:00:16 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <filip.hejsek@gmail.com>)
 id 1xGN82-00083L-Hb
 for qemu-trivial@nongnu.org; Mon, 12 Oct 2026 17:00:15 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4a022fee0caso20186555e9.1
 for <qemu-trivial@nongnu.org>; Mon, 12 Oct 2026 14:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791838812; x=1792443612; darn=nongnu.org;
 h=mime-version:user-agent:content-transfer-encoding:content-type
 :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=GrtPc/3Yr+GEGva/aXJ3+/Un3nvtpMeG8JuAULk4QDk=;
 b=JtE2dhtcehFQE6plDIaWxpU/U27rcE/M17K34k1yijsjReyE6RU78wOhC97sBa2aYG
 MlmCRweNVwmWROI4IMd9oI/BnR+uBAZ6cDDHdrlwJ36dD8UoE/FJpzLOwz+n16h8CQL4
 mwdw9idPggw6dWcbhkhRIoJQzizSnieB0KZsKUPes1Zh3i8xxAKTF1t2am+/PFcqTq/I
 IzUxIvwgElIY0aUxeK+ZJc2X6uX0tRuweQQtWXC/6eDaVE0ASiaqdPFfYbZSh98/zYUJ
 tYj7kVbVQDom9rw01UrYs/sI+O3GX1XcdpHCKnZwLERcjp8IpsvOqq2sFZZBisvgNmRB
 S0sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791838812; x=1792443612;
 h=mime-version:user-agent:content-transfer-encoding:content-type
 :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=GrtPc/3Yr+GEGva/aXJ3+/Un3nvtpMeG8JuAULk4QDk=;
 b=uyqVb1Nq6AvabQo/yq1pXaZy2R4uAIXMo3O+YYXcaTrWobldBHBD0A/YzYgrIS7ZYD
 cOuEO6kb6t7KRBXkURhs3sqbjKH15cWWJsVv6n2kxAjbiyICESxok5dhrwN6mdi0221L
 Sf9AwsXX0N8GbDOBP4dtbj1hmNHFW4YsWEBANi8jA4UO5eGiQaJRdrekgmH4VaDEnOyL
 9pPSnHSfgZaPmw3e0x5MU2keESS+4v3U2mxUCQU/2daPzGXnrNXY9gAgFIWiYMfduylY
 HFXa+E9de6bwhTOM3tqSCwLTOzimzP7acTwCTq5VPkYZ7TTBVvvG0edacUACMNdOA/3B
 B/eg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwztxwQ1jS90WBqXwtveg3E/jNqWsBv4TckFkdTNlshWB2wf8Dj9PeN+SEStFU0uEoohzw4r+5/sBQnqPo=@nongnu.org
X-Gm-Message-State: AFq9FYLk+Rm35Ry8rONJZtLwXsf23Pih2UwM5lc5a69tWoAqzkK9ixF2
 wGcqM2OnTAhJ/3cHRRJL54pw9QohK2RXOQg7DQLNkjO0qNPTpLfROQxt
X-Gm-Gg: AYBFou12mKwaxJyQXL/S5hK3uyxoJAbrK6aqr24hsAe9oTz19VZvyeqXLuqRI8bqpjT
 41VwmoRIzzB2Rq6Ze8hapsJfrj64LVX7EMyRNaTXo6wVKD6H/XqnP3J0LXjOqj/JWR0W9jgOEag
 uL8UHaMJSCgSbr5KOS7dWDaZfBTFx/V5GbyffZRSeUJnp2BBuujM28CXvnLsBWPoDK0GzsCfi4x
 sPfNjl5hezpjy5lByQaIEcCI6FTe7QhROMhgr1J2Wmq9sU21++2UlEQv1ca9D3uqATultFlwWa6
 xtvK/nNLkM0GlF6VDd1+gCcNo5hYTpQLFflAjwEmrE4oPkzXiYEFMzRAMlHI53WJQI+H7Ol0TO9
 WW+mS1PW1iNy5gNpZB2D1eYq6M58Q9xguUrBKId2rwzCsEdvtbKmGKYeLZ5r8QAFe6TaTwLzbWV
 xc+lh3Ge50NIUuc9uSnNPxv9rO2aOJhy/RVkMsyG25py24+5/VuWiVlcViuCtU3MzG7Clxeph6v
 y5h1BmHou+Q5Ku6VuJHQYCquiGXg+8ewQ==
X-Received: by 2002:a05:600c:4ecd:b0:4a1:96cd:2f60 with SMTP id
 5b1f17b1804b1-4a19ecf4c20mr81981365e9.3.1791838812449; 
 Mon, 12 Oct 2026 14:00:12 -0700 (PDT)
Received: from [10.33.80.40] (mem-185.47.220.165.jmnet.cz. [185.47.220.165])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1a571294fsm3649315e9.3.2026.10.12.14.00.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 14:00:11 -0700 (PDT)
Message-ID: <a7348b0ecf66d8027955774e84e57c9f4065f9fb.camel@gmail.com>
Subject: Re: [PATCH TRIVIAL] treewide: use qemu_dup() instead of dup()
From: Filip Hejsek <filip.hejsek@gmail.com>
To: =?ISO-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, "Daniel
 P." =?ISO-8859-1?Q?Berrang=E9?=	 <berrange@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Michael Tokarev	 <mjt@tls.msk.ru>, Laurent Vivier
 <laurent@vivier.eu>, qemu-trivial@nongnu.org
Date: Mon, 12 Oct 2026 23:00:09 +0200
In-Reply-To: <90fe897aa35405fbada7a440c3fab848d81ea2b0.camel@gmail.com>
References: <20261012-use-qemu-dup-v1-1-03d94852a6c8@gmail.com>
 <CAMxuvazc5iHk=GDysFHVFN0xtf-g75AobhoKdPXaR6_Qz=dDNg@mail.gmail.com>
 <90fe897aa35405fbada7a440c3fab848d81ea2b0.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 
MIME-Version: 1.0
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=filip.hejsek@gmail.com; helo=mail-wm1-x332.google.com
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

On Mon, 2026-10-12 at 22:12 +0200, Filip Hejsek wrote:
> I've actually intentionally left some dup()s unchanged for exactly this
> reason. They are the ones in qemu-nbd.c, migration/cpr-exec.c, and
> under linux-user/ and bsd-user/. I also didn't touch the tests, as I
> didn't consider evaluating them to be worth the effort.

Now that I think about it again, the use in qemu-nbd.c should probably
be replaced too... I'll probably send a v2.

Filip

