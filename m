Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC2ECCF9EB
	for <qemu-trivial@archiver.kernel.org>; Mon, 27 Oct 2025 19:13:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vDSeq-0000mW-Fu; Mon, 27 Oct 2025 15:13:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDSen-0000lu-DJ
 for qemu-trivial@nongnu.org; Mon, 27 Oct 2025 15:13:29 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDSed-0004mT-AL
 for qemu-trivial@nongnu.org; Mon, 27 Oct 2025 15:13:29 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-475dd559a83so14115685e9.1
 for <qemu-trivial@nongnu.org>; Mon, 27 Oct 2025 12:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761592394; x=1762197194; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eMgmYSj6byd6s585648zafN2yVdgrRdCeVUV6Qubnc4=;
 b=iDnxQq5ZcdUzZRTnJ6V37WXCZPTs90g04yHEDsMmm3caq+fWnTN9BURVRGl41oph90
 mhIwlSHw8Dl8AuBckD9RLL8wEN8tno3d7U1TOwJtnFt4nbrwXfZ6w0nB1UbJRcx2p22+
 srFX4JrRJAVfVBHvW13cDjaKPO8gxwYlqkAabO6dzxTcoGmI4wwJH+Q34TydgvVgi/X2
 rUwqdsC3a0sN3ee9ahYQmV1EVgVZS+rWW9obIjspK08vvlX29N9T5f0WTsLTHcYUQHgC
 Os9j5A7yVrULGHIUMyHb9f0cXOtA2S2dGvQrQq+iwxcCJB44knjxuqMSqiY5Rls4P2dm
 3I0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761592394; x=1762197194;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eMgmYSj6byd6s585648zafN2yVdgrRdCeVUV6Qubnc4=;
 b=QF51pjkS6gqhrChSLgzvQaHrgb3dznfA3REbg/wieqw0cWsrANOCuXpQrPmfLXSJnS
 u8RWfOBoduUQ1Jt3fIn4qhGb9bCj22XRU13EMK5bNTVjTwPXqQrHV17EnA7V1dHk59Ee
 0kRbMPvel3OgCkdQWGolNmorJBFqqFKcUY/rZ9PLYMISnOBlKKTUKu3jSAuyw+UWqmdH
 X4GJQM/PqdlyFlBt1ZWRrYcHemATOBQN4Fts/fdg0KIOT5DWKmPuvswNyXECNX1OvW7J
 8KsBwWhojZa9I0DFTNOpOcW6S74nHrt3sGyHalDffWbVGgIi7MFgSM/T8gDHR0WyOHfy
 yMAw==
X-Gm-Message-State: AOJu0YwyvcJ86Ey2uZuP4NXlPlF7u7ydeh5osozYCQ0Tmjb3HU2Jchjn
 hFndr7bVjHKUPkkIaIIUPxhG7QztTOmHJ0Qoj6p2mYHsJSIcgHN0JKFWpXmrQybANuo=
X-Gm-Gg: ASbGncvnfvq3I39HNS7kPK0qoJF5BwtfW4X7pAOydOxxEUNhep2LGXmRq5tW6ggXJtV
 2G5cRLEkIP8rXMe/AjWD+Kige9HTu56ZK09V5HOjjIZMR0Jvalh1TbblYMdDVbmEh+GF8jUNOdn
 xOzAxin48vyNHbSlzhG7r/p1TNy1+zhZ/imzobCp7uPyJTu+xsjyGRwJvlAxA9zc7YaY18eFBpL
 j8xOjoc1aFyj3w8D+02RluEvBsTihL1n3b2T1wmhK1uc1fMPc49NqrcZ3YFArdX4PJnAyTqidYn
 PGlwMd3KAROCICgfSFJPTJlLwD0A0byNTvfs1MLj8/qRvniAaViKnqGjfbJGaSgNhvdI8HUZFRr
 hdzxXjvfLDeji/eWdN5ujNLyRvUfDvyKOCEjKUwpDakZ8EWCixg9NzPogRXscr9LTLsMtBP21Ba
 pofq+0cAEsqy40xmaotlLNcGm2GNtDOMh+fq5gGIG/waWeiDwCuniF7A==
X-Google-Smtp-Source: AGHT+IG41sXZLjntQXNIenGWHt99d8Gg6PROXdPaHJJbTZreYJaOvMZrvnqsjfcPC7Tkyrf5bjczDA==
X-Received: by 2002:a05:600c:4e12:b0:46e:1fc2:f9ac with SMTP id
 5b1f17b1804b1-47717dfe76dmr5877095e9.10.1761592393651; 
 Mon, 27 Oct 2025 12:13:13 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd477c92sm150413555e9.2.2025.10.27.12.13.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 12:13:12 -0700 (PDT)
Message-ID: <6bda512b-aee6-4dec-92da-727679efd2db@linaro.org>
Date: Mon, 27 Oct 2025 20:13:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] virtio-net: make VirtIONet.vlans an array instead
 of a pointer
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
References: <20251023135316.31128-1-mjt@tls.msk.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251023135316.31128-1-mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 23/10/25 15:53, Michael Tokarev wrote:
> This is a v2 version of this patchset, rebased on top
> of current master branch (I had to adjust virtio-net changes
> a tiny bit).
> 
> First patch has been reviewed, but never accepted to any
> tree, - I can push it through trivial-patches maybe?
> 
> And the second is a trivial change - removal of another
> weird migration-related macro - but it requires the
> first patch to be applied.  It hasn't been reviewed.
> 
> Thanks,
> 
> /mjt
> 
> Michael Tokarev (2):
>    virtio-net: make VirtIONet.vlans an array instead of a pointer
>    migration/vmstate: remove VMSTATE_BUFFER_POINTER_UNSAFE macro

If no objection, I'm queuing this via mu hw-misc tree.

