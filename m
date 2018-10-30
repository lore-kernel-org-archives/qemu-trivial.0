Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHUHX-0001Ub-4H
	for mharc-qemu-trivial@gnu.org; Tue, 30 Oct 2018 09:42:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56303)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gHUHU-0001Q9-I4
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 09:42:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gHUHT-0004t7-QN
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 09:42:04 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:38210)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gHUHT-0004cu-GK
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 09:42:03 -0400
Received: by mail-ot1-x341.google.com with SMTP id f24so5355361otl.5
	for <qemu-trivial@nongnu.org>; Tue, 30 Oct 2018 06:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=U+ZpxlBlUlh90Una4x7wQkF/+r/5WMtVjb+elbgBAvc=;
	b=CFppDPQtETwWfbbKPcby+3p5/f3p7ezsXcazGIt4V9lQfNqi+aEhCj9n56bwJNzNhk
	BrdbPu5MhguKHaJL9hNktEWcY7u64nLFPO2B4C9mfdHU6J9YqJ39wNO9YLxi5Ap3T34T
	98ZFHk4O3YtbvXQJ9DwZbIaqBlyPY/w2P4quw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=U+ZpxlBlUlh90Una4x7wQkF/+r/5WMtVjb+elbgBAvc=;
	b=GI13FJXhpc8HrSc1h6h2bGFX7tXDxHJl6UEI67jN9tiA928A6rKZiZHx2QaEOfuEfW
	eEFmcHBNFlZohUmBsSIWJZXy2kJqEL5gLaFnmipakPQ1DThsR+/NwyvZaO3EycqoO2Jt
	sInKqs4NVZg7fvUGo4b0El3i4quWKWkHuC4ptBdkbX35/9KA9/kld1Gu40+OSlflIcpU
	azR58WXf5Q3trhiU9q5ceeGQjoh+M9aQ56gMQo9T04Pvbf35ucDXVoHmeXeHzpF4drRx
	6VIcsoQZL47nYlTVAB3l+gC1YlyVETKSmReqOTs/tMf6v8qyE1YBuZabSEcDlMfQ6yBx
	1XXQ==
X-Gm-Message-State: AGRZ1gKFYc0oPAaRbT7oDac/n9wdWRNEY0LwGu+unCYyES6F+ZTF3LQd
	lH1KncoGV9jXJJ46xjK1G0yvVosFmxeYRb9NF75kKA==
X-Google-Smtp-Source: AJdET5fIp1Uxc92cYrazTnu4eSqVYKeXnXQjxqEK4dYJn0dzebBnDiA9dnmI3JX4cGin8JnT1r9WiTnsKvy6oSswXLw=
X-Received: by 2002:a9d:64d1:: with SMTP id n17mr10287428otl.151.1540906914821;
	Tue, 30 Oct 2018 06:41:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7c90:0:0:0:0:0 with HTTP; Tue, 30 Oct 2018 06:41:34
	-0700 (PDT)
In-Reply-To: <20181029195931.8747-1-philmd@redhat.com>
References: <20181029195931.8747-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Oct 2018 13:41:34 +0000
Message-ID: <CAFEAcA_JXyRqy2c7C6GqGYFoDPYRmccCorP7-f2U+tDtW2ZiUg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>,
	Samuel Ortiz <sameo@linux.intel.com>, 
	QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-trivial] [PATCH] MAINTAINERS: Remove bouncing email in
 ARM ACPI
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Oct 2018 13:42:05 -0000

On 29 October 2018 at 19:59, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
> Shannon Zhao's email at Huawei is bouncing: remove it.
>
>     X-Failed-Recipients: zhaoshenglong@huawei.com
>     ** Address not found **
>     Your message wasn't delivered to zhaoshenglong@huawei.com because the=
 address couldn't be found, or is unable to receive mail.
>
> Note that the section still contains his personal email (see e59f13d76bb)=
.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d794bd7a66..1aa2728aac 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -625,7 +625,6 @@ F: hw/*/xlnx*.c
>  F: include/hw/*/xlnx*.h
>
>  ARM ACPI Subsystem
> -M: Shannon Zhao <zhaoshenglong@huawei.com>
>  M: Shannon Zhao <shannon.zhaosl@gmail.com>
>  L: qemu-arm@nongnu.org
>  S: Maintained



Applied to target-arm.next, thanks.

-- PMM

