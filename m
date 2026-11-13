Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D556606A32E
	for <qemu-trivial@archiver.kernel.org>; Fri, 13 Nov 2026 13:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Bo/NRWwc
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1xRrXw-0000fr-Q2; Fri, 13 Nov 2026 08:42:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xRrXo-0000af-Pw
 for qemu-trivial@nongnu.org; Fri, 13 Nov 2026 08:42:21 -0500
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xRrXm-0006YW-11
 for qemu-trivial@nongnu.org; Fri, 13 Nov 2026 08:42:19 -0500
Received: by mail-qv1-xf30.google.com with SMTP id
 6a1803df08f44-91ec2d42231so20922226d6.2
 for <qemu-trivial@nongnu.org>; Fri, 13 Nov 2026 05:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1794577335; x=1795182135; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=CMOsV1+SqDHHYMZ22FsZEoCEqdIMsoSZJR/6s5gN+cQ=;
 b=Bo/NRWwc98rFdPcJHURssIPcFSzXEkb9+Rqh9uzefBw51T7uwYeIdO5kn9ptm/33kZ
 3vRrejjQWfc2uPSTZHrXZnqd6poJtWTC4ok1GbWDGLSSYiZ+KGksjNVSliGLD2tafIFq
 ahl4lcgFJbcA3F+F/PTQJMKQ1ARwVI5bqINJBXErT9p7aK5/1BXUDbY7b3c2RDoRJ1pY
 BSR+2ZL9tIRm7FUEyuX57MjYkOhYQr71de/NYaBQ0U1eX4SZVX/7snGFDvgjuBeRarJ6
 GungRR936Gp3yucqVfVdZYmhYtEpHpUWfqXfkXSHf6suVPyhs5lJ22ZRvs+dYGWLcsS/
 NAig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794577335; x=1795182135;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=CMOsV1+SqDHHYMZ22FsZEoCEqdIMsoSZJR/6s5gN+cQ=;
 b=z0QbRBlMHcMlLQsqL63nxTSdlqelQDbUvQKjTrXrqsqBS7otQJhlIdXnzZOzelcNbz
 M+OZDKUIT6BgSPBiVi6UwPtc2IHQSN4JT/Nt1yBlWCRO1lSFDS89szOZnf0YPf1pdwtO
 PmBy68W9CN1pyff9bavF+w+hNXn9uaWV75XJhSs3akhRgrsiOD9DGX7fCthaxb+1i4b5
 cHjx4NneFJxo3Ep77QDcpQBjLuROAeLtkeXBrWLQ6R14VzrdX9DD3wlbNOSSqzUdP9zx
 Klz58fth0Wd1IzP0ya8zvCt8fDFp0VWZNAXCkKWvNpaff/qCOfQ65rFXd3QWzZ/j2REd
 Kwaw==
X-Gm-Message-State: APuU4Z87Ujk9SQh6Tv+FdTklDzaPd4tpVdKSXiVpnaj7qDJkwwZeQueU
 94Gq41TazYmLMGItwqaJHj+ra4N7iijmMQNjc5j2C7DIw5GMNIV3MLXLnC/SRSuDV+E=
X-Gm-Gg: AYBFou2QCQgvxPgKYk3hl1PYkWoKwGBlB/7i9mIQfb48F9v2fK1jrrSKAZF6xoVwqXK
 IXlvPjTX+Ny32fLWXkwG4Go/OSKeor2nqKmbS8X1rMXizD2XJqT1+6cOzvQE3jm5gRrzRdFZ1j4
 IvO7NmCPg6Ib820AXf4hA9ie+GZysB2S/M90irhZb+tgFWo92b/7dTP4G/2N2l+0Difd/Z37udu
 PXcdZ9DS70b6TSCmRVr0WVUZjHk2mcR+WYfnHzN2orroa+eKI3HYfypQ4UhAZHL7AjpuGH278ED
 FVR3+3Nj+V53MmT9v6XZ393gMGqxJ8v+7iDtmD4T/MMH6K2GC6a50LWAk21b4dDJbbyvEihr9fo
 IPk3dLraIgNvL0mOqkvb9HWcVGS3UPo25kX2EBvzer+QHPQNg2BwMCqfgpQ6iCD3Gh9PTtt9t72
 1DFlj92+vkZKdocg9ygGHWM+VQ+40MWscTByUGkHx1xDtRawBNjxOxOxfbu2nUKGf9N1wJp8IGc
 Rj/4lHimLjx+5GwiKZd/ZIx4Wg1mUhcuE2tt7rbwg5nzp4C/W9s8gWR5kw4/pGnOXMRgeHbZanl
 +xntFZr7nGMN3OqZwuZm8J8u5owkhUKKx98b0RTRX8c=
X-Received: by 2002:a05:6214:2dc2:b0:917:84c2:67ba with SMTP id
 6a1803df08f44-91f242244c1mr35883016d6.34.1794577335257; 
 Fri, 13 Nov 2026 05:42:15 -0800 (PST)
Received: from [172.31.6.230] ([69.196.88.181])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91f23efa2edsm19923076d6.15.2026.11.13.05.42.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2026 05:42:14 -0800 (PST)
Message-ID: <eb81bf45-b43c-4b9c-be45-b38809105214@linaro.org>
Date: Fri, 13 Nov 2026 06:42:11 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL v2 0/5] Trivial patches for 2026-11-12
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20261112191239.2327003-1-mjt@tls.msk.ru>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20261112191239.2327003-1-mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf30.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/12/26 12:12, Michael Tokarev wrote:
> The following changes since commit 29760efaf96bbe5928f8111881eddbf5ac06439e:
> 
>    Update version for v11.2.0-rc0 release (2026-11-10 14:47:54 -0800)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/mjt0k/qemu.git tags/pull-trivial-patches
> 
> for you to fetch changes up to 84d6ea1499d584bc31b64aeae4e0e8528e0da5b4:
> 
>    hw/audio/intel-hda: Belatedly update comment for removal of -soundhw (2026-11-12 13:30:40 +0300)
> 
> ----------------------------------------------------------------
> trivial patches for 2026-11-12.
> 
> Nothing fancy, some stuff collected since long time.
> 
> v2: drop
>     Matthew White (1):
>        configure: --disable-containers should prevent `docker.py probe`
> as it causes questions.

Applied, thanks.

r~

