Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1svIxH-0005on-Ra
	for mharc-qemu-trivial@gnu.org; Mon, 30 Sep 2024 12:09:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1svIxE-0005lY-JI
 for qemu-trivial@nongnu.org; Mon, 30 Sep 2024 12:08:57 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1svIxB-0002cY-SI
 for qemu-trivial@nongnu.org; Mon, 30 Sep 2024 12:08:55 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5c8967dd2c7so1631171a12.1
 for <qemu-trivial@nongnu.org>; Mon, 30 Sep 2024 09:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727712530; x=1728317330; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tuQSy4+uzylTJyF9z1JjEp55HsXGGY9v5j9uwyRAo7c=;
 b=iIy8DaebT/VOIixmSUacBfFKlEU79EcwBAW9rummJoje+mZxTRdMaym2M/OdDVpYGg
 lAXOu1dJ+ATThjRyeswixLyYCpYc5Pg71SpMo8kHfuGicFVr4UUqz9SKubJDEhPGiEtm
 wRYyFnCY2VRj/c8bwgixeY+3eDt7BCB6QSVavc7MQxMN/+524VzHGaoVMRtV/n8Nr5HN
 dCZZz2K2zThtqh3HyNkToH2eCkaxzlLGEnJDP//L2QBSRJTR8HHyNcw6I2epc7fbe+MR
 XXeqqv4lHZEZIs3VExz+hV/MPJJIGfMPRwzZMSOu4urpexMwCR7maPEcct9iaeQSy20W
 782w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727712530; x=1728317330;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tuQSy4+uzylTJyF9z1JjEp55HsXGGY9v5j9uwyRAo7c=;
 b=DJpXKmInrdgD2nwoQM+qFiuXLf8jXg0GB1a7iYPmT/eKuqIWELl1EadNuose51accH
 wT94AkTosGU+ul+ImXDAFVkYfAv8Duiu70pf0IlHEIvXVzzoIQSA9nbkiNtrjPRK3uAr
 R+AHFp76ETi0ejyt79RNGgu2cOeVNjhabuc6PFTgaD7Wm/L6HdM+rPBvDSb5cDijDPJ1
 MVNtksWAP1vV1OnAcITEdyw1pcdRMqvIQ+kQouJMroj5ZO3QUJ7PCUelW9UQ/fu/Yvdc
 oWhMeV5IiQodWTnq0CBTGr3hUY4uSIeQcOi3wysuIVOKJXt0N1FJX4tQejYSqF0of0SC
 33bQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAOrrm7DYSRC5CCrJdq4sG6d2vMx8iPaaRAmMjBTcmS8rqAVa0nqm6eZVCvAD1xfBve3F5ZLrSfnnFjrY=@nongnu.org
X-Gm-Message-State: AOJu0Yxm6+QArHbKm+FHWr9PCvwBPbsmuTJwGP2cw9J0tfVcuMrCyGu+
 zSd8jN/3thUj5dm1G0kM41DnfiPZtacGOagDXF+SDkbwX90gsNTc2hWTgLQQjIFgWdW0X46mSlt
 H02e8kAaAyJyjeIoQlF1fh7XYdTQSyGAE0SIOt7KPaQS8K3uQ
X-Google-Smtp-Source: AGHT+IEkVH81nsUTmIOlKQMtUzDgAs+UMW1TeSfYGAw/bmggZL5jckB6UgB9XPBwXwv5L2E9lDXUZ738REsYrCqvvEA=
X-Received: by 2002:a05:6402:42d6:b0:5bf:c8:78a with SMTP id
 4fb4d7f45d1cf-5c8824e7e60mr12996770a12.17.1727712530091; Mon, 30 Sep 2024
 09:08:50 -0700 (PDT)
MIME-Version: 1.0
References: <1723deb603afec3fa69a75970cef9aac62d57d62.1726674185.git.quic_mathbern@quicinc.com>
In-Reply-To: <1723deb603afec3fa69a75970cef9aac62d57d62.1726674185.git.quic_mathbern@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Sep 2024 17:08:38 +0100
Message-ID: <CAFEAcA_YGoNywJ88CpHkPsxQpfHDa9V0K+y1jt6iyt6kh4PVdg@mail.gmail.com>
Subject: Re: [PATCH v2] hw: fix memory leak in IRQState allocation
To: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
Cc: qemu-devel@nongnu.org, balaton@eik.bme.hu, mst@redhat.com, 
 bcain@quicinc.com, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
X-List-Received-Date: Mon, 30 Sep 2024 16:08:57 -0000

On Wed, 18 Sept 2024 at 16:44, Matheus Tavares Bernardino
<quic_mathbern@quicinc.com> wrote:
>
> At e72a7f65c1 (hw: Move declaration of IRQState to header and add init
> function, 2024-06-29), we've changed qemu_allocate_irq() to use a
> combination of g_new() + object_initialize() instead of
> IRQ(object_new()). The latter sets obj->free, so that that the memory is
> properly cleaned when the object is finalized, but the former doesn't.
>
> Fixes: e72a7f65c1 (hw: Move declaration of IRQState to header and add init function)
> Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
> In v2: adjusted function init_irq_fields name to reflect it is not
> public and added BALATON's Reviewed-by

I'll pick this one up via target-arm.next, unless anybody
would prefer it to go via some other route.

thanks
-- PMM

