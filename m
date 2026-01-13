Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA5B7D2D0EE
	for <qemu-trivial@archiver.kernel.org>; Tue, 13 Jan 2026 13:19:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vfeBw-0003Kg-IT; Tue, 13 Jan 2026 08:12:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vfeBu-0003Jh-L0
 for qemu-trivial@nongnu.org; Tue, 13 Jan 2026 08:12:10 -0500
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vfeBt-0002wP-7E
 for qemu-trivial@nongnu.org; Tue, 13 Jan 2026 08:12:10 -0500
Received: by mail-yx1-xb12b.google.com with SMTP id
 956f58d0204a3-644715aad1aso7781008d50.0
 for <qemu-trivial@nongnu.org>; Tue, 13 Jan 2026 05:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768309928; x=1768914728; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sllnZarZq26uZAc+wtPOmNJKeYrKmmlVWQJwR/aLv18=;
 b=fXKUYGEU8tQDfbJhyKxJ5IGvNdLd0J28hwGHcg7LSfBXXH9hnixWNA5VCu0BKKyGnZ
 p1DTxToroN+2xpsfLWUkrR96oKNSGZoQy0DlqJ9ZvDclqDsyawDUdm/mgFldZGEFllNT
 77mCEGlXhXqEmq5H1VIehPsOkpG5pr/MeYYOugETXg89lQ0DrMPHJOyKJ4Zdjl6nsTea
 lCDtqlxNM7VjKQ4KtbcY7IZxjgQTTioip/rBbp7S3aCLpI2pAIB79jEd0ArRTtgktylh
 GShc6K4WayLDrwbm/sqp8QSKmE2WLUP8EQ6JkUNkk5eCZJs8fixJunqPVC2xlcVwG+KH
 5++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768309928; x=1768914728;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sllnZarZq26uZAc+wtPOmNJKeYrKmmlVWQJwR/aLv18=;
 b=RbjgF3WaOLc73f8xgwI1qjx2oB6y76NyZY8N3lBZ0zdp9wXN4TXROmCowzqaNLoVJ3
 Ad3oJsUwATAXfaSo1AI52yhhqVnTtom+WfwAe/pcGAyG5/9/0hgUadWHExspsXWPTgTu
 zupwZnLfQx2wI2MQIiYkwsa7HBCSg6dzA781wuuFRxr4dIFtDtMQNWp6D95oVvj04nOk
 NjMUhj4/2QU9KGzaK7nXOxn+yWqZGjOc/OsQV46q6XGLwi1A09oacOrKIZKedAnNToTc
 Hm9txD916/p1OIsRKTIEbfVoAYTtRQ0NRfvEuOs5rZhYygICXyZ/5F5vD2uBVrGYZvaR
 s8eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXn06oA7dvaKsg2k7q2U7yp6c3ObSV5OTjKaX7gZYzV1joeZ/l128AKJlCUsLJCRoyghrCaBlgS+vHWmnM=@nongnu.org
X-Gm-Message-State: AOJu0Yz694j4pMN16Q2mBKCAmjxxsn5xwNo2ulinNMbYM+zXupCK+H7N
 nbu6yIDaB/k70ZjKF3aEB1IR8fHzKiXkBQIxpsAe7qiTLKzYIjELVN3uuins4RlCFa1PLUsskFU
 YpHol17uM0UGn6Qt7hiHHYB7cZvDLKgAHJyUDo68QjA==
X-Gm-Gg: AY/fxX4ltTlkqz8CvnhZkOvwFRfIPhXNG1IoZlzLyLg76VOS2HJxR8rHizEGs36nCb8
 giNTTOmtiyniyA+CgvAUZ4fOWgL1SMzF3W42IMTZoWI0qfd9ZWrKOMOOfx3Tp/RJkLIvTPBK+j2
 /c3ukFBgviCmJqv0LnJcrqMhP84iEjNwOH0SWN0iloOUmX1iupUfXv8S30N/SnBvvuyup9cH5mF
 SseJrNno34ReOc679SMKpBfRuySutIpZL2amTV6b8i1uTUMXUojEMqf4rbnGn3KbFXRcSOW9FtF
 8/Jr27oN2tOlRf9JxQ6bo6I=
X-Google-Smtp-Source: AGHT+IHoQHVJdYGyr7t2bz9w6shpFAaiY7t6KX/eFKbOTtm88mRQYAdDDLCT59g7FRNXcZNgwGsrRrUbNlvZMRxohSA=
X-Received: by 2002:a05:690e:118a:b0:63f:b605:b7f2 with SMTP id
 956f58d0204a3-648f61ff3b3mr2681309d50.10.1768309927937; Tue, 13 Jan 2026
 05:12:07 -0800 (PST)
MIME-Version: 1.0
References: <20260113130008.910240-1-mjt@tls.msk.ru>
 <20260113130008.910240-2-mjt@tls.msk.ru>
In-Reply-To: <20260113130008.910240-2-mjt@tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Jan 2026 13:11:56 +0000
X-Gm-Features: AZwV_Qhz86aVIko0N3iAKT9lXL6IaQnCAY2HKOp0_3adyOt_qFfHXH15lu3N7pU
Message-ID: <CAFEAcA9Fe2mVx+tY7D7XaYxkJ8sg3akLBVar_ONHEePrjEZGsg@mail.gmail.com>
Subject: Re: [PATCH trivial 1/7] linux-user/syscall.c: assume splice is always
 present
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, 13 Jan 2026 at 13:00, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> splice() &Co are defined since linux 2.6.17.
> Assume it is always present.

Since we're calling the C functions here, the
relevant version is glibc 2.5, but either way these
have been around way longer than our minimum supported
version.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

