Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFAF3CD98C5
	for <qemu-trivial@archiver.kernel.org>; Tue,  9 Jun 2026 16:03:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wWysK-0006zI-98; Tue, 09 Jun 2026 12:00:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1wWysF-0006vd-F3
 for qemu-trivial@nongnu.org; Tue, 09 Jun 2026 12:00:19 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1wWysB-0001mj-R5
 for qemu-trivial@nongnu.org; Tue, 09 Jun 2026 12:00:18 -0400
Received: by mail-qt1-x836.google.com with SMTP id
 d75a77b69052e-5177d1ff061so2366421cf.1
 for <qemu-trivial@nongnu.org>; Tue, 09 Jun 2026 09:00:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781020810; cv=none;
 d=google.com; s=arc-20240605;
 b=PvlAbpR+Q5+qinrefXc9UzXyzaP/BJFzQyJdipqbFNw3G89RY4Yym/hOPrXe9BPULM
 CGRF7ibAa1BJS2I5BiZzk97+32Vd0FfpPKBI5sDupfAQtAgc9680V5bt3ix1xQA5SDnF
 wX2cGih7hKv0zElJPtiPYW3Y2zmH517+ijukHKz1opSCesF2rSRn/wO+EAGsJYAEuhr0
 Gs3Enyh3CzJMXHnKwN3t+/HpkfviaQaRK7aCfArpdonwJWHTk5cifmqzH2ja4F3PbXlk
 Oyy1RIDsbKgJbZ3+nw9yW55BKM6koHcogpZFZEsZ4gBoIFc6lc8ktf1Tu7uupWH3b7e7
 9RQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=TwwxK3FbqgNRzq9cSbI+NO5X1AaMIOH6AUHYNp5pS0c=;
 fh=vf1vEeXi6B/6dFBOe4LTvCNvykFVFUNNHZPrOICD6F0=;
 b=MbOkZXEVbCC6war0oK/BSX9nk56ixAhLNn+DAW4PnoQk+6EfpVyDYqMMARKlFBP5EW
 g/eesZ9lGVhYhLOWS4549Q8244iI1KV+I+houB6p3kmf8F4fVxSUYdHc2hndAryevHma
 h4PG8fT35k62ak/MrfhFEX/rSF0kkxMVuvQBJVVlX/s36hU91/zQVUNp0CRHuHgRAe5p
 BFl9WvRwcfK0leKxToXiYlZcRpmbQHanhHpJCbJN4XSXnTdgY/e6KhAt+N2aovDR9Eot
 tK3z9xHaONyFHPgDAtEoRFLk2LRUW2975ADyIf+ON65xNjZwIAHAJjuroVjYkluzt2Ak
 M06w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1781020810; x=1781625610; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TwwxK3FbqgNRzq9cSbI+NO5X1AaMIOH6AUHYNp5pS0c=;
 b=MDyA8+Hc4Qg68ca629kJTf/4xVNY9Fb4cL2Xay3sWEDYM0YUJ5ct0lTMQf5oEvp8VT
 J9C8xz02PNKV015W0VNc/O+MknHtjxj6StVimMeCsUNz1/nK9+x1RJY5A4ERCwUPXcNy
 HBYoUL+4yZkXxkNJeMNomkKTXhi/X+dtrsEpCCEl+i2SyLR4MB5uY4eZbE/gCRKWD/pD
 5bDbWkTjlBuWRss+Ut5VQUxSXk0d28uyThinObUiUE05CYyt7ims5/Pb9tZMwHPbQogq
 bB8wAC5TDS2eHLVEoplw0RbodXVlk4hpOPGnDeyYr5cmACERAB/txtjF/xyQGi5Ovfn8
 iuMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781020810; x=1781625610;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TwwxK3FbqgNRzq9cSbI+NO5X1AaMIOH6AUHYNp5pS0c=;
 b=nr/co2+OQYSOMpBv1wXDf6Az0UlbNppXGgrMgGq2WCO8oXIiLWe1KW8vFKFD5SkiTF
 6S/ffVFdWZqsN+nGLT+aB/qiRGWFOjiCnN6j/4QOoi1m3ZDSh1GglIkbnVfiOSJHlI/7
 SQsVRaDzQFS5dRO6qlOY+DAoXru50zg+HyS4jL4f3+pA1Yiu1qigg6N9CODEC8b7nZJm
 tXoZmIJ7p0enBojqFHMdtFifyQFiomAFBHKXKpbLUMUsuYoV8twQRXCybyodebjSHWTm
 2JThMRqkeor65DLkTZhvbWS/EvNR4BqKqCUOb34h5n0jjCgOsgHlreqPToR1JXzR6NnB
 iiQQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/yF73GK6XsqYM8FRYH/LjRklwHC4ruGhqhGzDL/WmjxsyhrmXLAH+MXb3mgW9I1JMSyU24YqzZhA7tgik=@nongnu.org
X-Gm-Message-State: AOJu0YxpDxy6gVYgV0aQn9wzRwf5YYMYxuuD7IHNNgXE3gI9Mhr/Mum3
 jC2DwimFdGmfnC2UkoCOtE1kpRcB139HUwf653PNhymWcYClkJSGnx/hGOwFUsHdHrd7KJQysT2
 Vq30XiYyaUDTEPYjle2Zh/ePJCjD+SpSsHTtMeTJF
X-Gm-Gg: Acq92OFpK5zfYuStkt5UFm26ye84fkCLcIXJ3Cb9xBRbqflP1EcPdcwnSYHRclKdQPn
 up5eE33N/bP50i7Eynjl7kOOJ/W9TmbZT9s276bWOhwMLOkn3KO2hNNmJzPqRE/ppgeiFFHQWFV
 IE8cgoOQb7/NZSy7sWWR1DLAtZqMy3i6X8ogh0kBzUp82Doharp3GJgzLeO5ok5Am7v/rSGnyIb
 zhyvpS/AEyTc4W9rOkM7fptQTtZiecrT6S9eYQwtIvvy+hKhKNv/QEj68aPinEpZV+v+RZJejCP
 vhPGCOWZ9qpuUwE/QBjDx9MqlzP3880vOUd6cvf8ssPdSeznNQ==
X-Received: by 2002:a05:622a:1b03:b0:50e:38f0:ccb2 with SMTP id
 d75a77b69052e-5179826672fmr38760001cf.15.1781020807491; Tue, 09 Jun 2026
 09:00:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260609105626.1038690-1-thuth@redhat.com>
 <CAFEAcA9O6b02VMuto8VzaEsVi3zTqNtQKG_RcMaPnNdPXGUBhw@mail.gmail.com>
 <CAMvPwGpvpHD+Sx-HZR4FFMJB+W8Rk8LoU0256Q=vwKAdC96HSQ@mail.gmail.com>
 <CAFEAcA9N_O7RZRU+SPTfB_ePasjVZvUsFPhndfQDuHgQ+4Q-5A@mail.gmail.com>
 <CAMvPwGpzAcDxeqSvQmOjzkQn6T91CAmTO31bNs0wmSMqQKG=Qg@mail.gmail.com>
In-Reply-To: <CAMvPwGpzAcDxeqSvQmOjzkQn6T91CAmTO31bNs0wmSMqQKG=Qg@mail.gmail.com>
From: Titus Rwantare <titusr@google.com>
Date: Tue, 9 Jun 2026 08:59:26 -0700
X-Gm-Features: AVVi8CfSCk7cpvbPjjjcictp7Y5ynWYI7fOzBypElkdPKdJ7m307ZuXjj3z5Npc
Message-ID: <CAMvPwGrnh9-UMv5919bLXLF8oLcyTa=coTdqh+1ALNvCKLmOJQ@mail.gmail.com>
Subject: Re: [PATCH] hw/i2c/pmbus_device: Fix a possible crash when requesting
 too many bytes
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=titusr@google.com; helo=mail-qt1-x836.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

oops, the patch series that fixes this needs to be upstreamed.

-Titus

