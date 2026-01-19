Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60632D29C2E
	for <qemu-trivial@archiver.kernel.org>; Mon, 19 Jan 2026 14:29:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vhqFu-00049H-PV; Mon, 19 Jan 2026 09:29:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1vhqFq-00047c-K3
 for qemu-trivial@nongnu.org; Mon, 19 Jan 2026 09:29:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1vhqFn-0004Es-Fu
 for qemu-trivial@nongnu.org; Mon, 19 Jan 2026 09:29:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768832954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1hgk05gJ06njDBt18serQQ1IMhEMivPtWRpz68eZz5g=;
 b=heX/dEoox3TdXjeTyO9JKsKeSI3NhYdqbGt8+356atxotFCzG2fYXNyD1KzW5/Scjmia7e
 dqLU8bd7uo2mz+Uv6H4m1MeMKxfYtHwkzSfA3ghGzCfaSIQaSHahNxxYY78plyCYqYrffZ
 uf97htgZaoEqxq3tNVI/DtF1wQWy7uM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-115-pVaLtzIdMxmTimtcBbq9AQ-1; Mon, 19 Jan 2026 09:29:13 -0500
X-MC-Unique: pVaLtzIdMxmTimtcBbq9AQ-1
X-Mimecast-MFC-AGG-ID: pVaLtzIdMxmTimtcBbq9AQ_1768832952
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-47d3ba3a49cso46573975e9.2
 for <qemu-trivial@nongnu.org>; Mon, 19 Jan 2026 06:29:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768832952; x=1769437752;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1hgk05gJ06njDBt18serQQ1IMhEMivPtWRpz68eZz5g=;
 b=Xc0Bg5/mq1JNk0PtCx/ECCV03K8or6pRHMtrSNfooIWP30ef7OWfG+iKT33eJiH/LS
 uKc8CTg9jCdnLHHheOGC8SCoZyJeupHdUMleiMH+zUDoVG++hUdPT0IqEXb68yqc3V4m
 v8hgAGAE0/3RzDmktWcatzZZLspMbQoGE2vT8dWDWAkMhgTnDFG7CexYfn2Pak51iJFE
 ZplK8TlBkwb1Po4CRKuMKHMihcbrmooMRvbh3kDKyo5DUJ42K10Ta/JaHkwEytmxSc6E
 b5YRVFgUMljD5boDIbo5XsNKgeDEsQnI8ywdlKSP236Tqtl/UunkFv2THyy0n2YolcKZ
 Gzgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIrcNgpSZiZdmAj8VSGx2j4ZMhlpEYa2ev/p4L+JXWdlgnO4OEotXwdD5h9L2mlmmRYeA5V7s9Rzxy2xY=@nongnu.org
X-Gm-Message-State: AOJu0YxndqYA+RIYiP9ABKOnpY+Du7pd21J8HPIA8HI5MrqNAQsvzCNc
 Ce0ZIMfRwr8qJDHkJdqcHNfvJ16S1RJXH3hq0tlBOtWdnXG0oQbWCNEAILHwu7fOyUohhz6NFVq
 ZU6RPYGgfRl1SHjo3C38Se9DrlsYKltdglrccPJu86T0PDp9rd4xET98vA2OTSVK9FLM=
X-Gm-Gg: AY/fxX6M7RgGQw7De1iOQWaztopJqjw1c465aTZqDWycPnvVI3HWrFSvqTe3hYEW12j
 NceyatnzBATvDK1g33G4b6/HFdh7EbjK3+DZ0oqVJ0CxK464m5NfNPFclxFlTzWdWjFq0JzvkMz
 X4ng1WxMwyEsE218iIh2GbqCJM+4N9J/DIBJ1JGtXpR48PTByYnWj6dwQnNQ4hCX9IuBRSrrkCg
 Sq48DS7vSPs6JKYkIq7ZHVOFeRi/hfLU/Eim8u9vqNngYmIaQDBYY6AK2c053f9PeS1OjUDkh5l
 D1NcIoQYMLnioJZEbRFyG+I+0nycbNr3n7FQE5D0kx2ofaTnDkzfEZVBsU15Cd93izlQMmb+6+f
 MAt1by3Q=
X-Received: by 2002:a05:600c:e41a:b0:46e:4b79:551 with SMTP id
 5b1f17b1804b1-48024b8a77bmr120474065e9.31.1768832952118; 
 Mon, 19 Jan 2026 06:29:12 -0800 (PST)
X-Received: by 2002:a05:600c:e41a:b0:46e:4b79:551 with SMTP id
 5b1f17b1804b1-48024b8a77bmr120473755e9.31.1768832951741; 
 Mon, 19 Jan 2026 06:29:11 -0800 (PST)
Received: from [192.168.0.9] ([47.64.113.220])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4801fe67780sm80266965e9.16.2026.01.19.06.29.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jan 2026 06:29:11 -0800 (PST)
Message-ID: <711cdf08-7275-4c3f-be6e-ced88f874207@redhat.com>
Date: Mon, 19 Jan 2026 15:29:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH trivial] configure: add ppc target back to container tests
To: Florian Hofhammer <florian.hofhammer@fhofhammer.de>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, qemu-trivial@nongnu.org, qemu-ppc@nongnu.org
References: <018a86fd-b831-4fd6-b479-9d73e2e95ee0@fhofhammer.de>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <018a86fd-b831-4fd6-b479-9d73e2e95ee0@fhofhammer.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dPtaqjmcKIaY_tLNTdymM99696azLECizOw38zvjkxM_1768832952
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.016,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 19/01/2026 11.25, Florian Hofhammer wrote:
> Commit 2ff8c9a298 removed support for 32-bit PPC hosts from the build
> system. Unfortunately, the patch also removed the 32-bit PPC target for
> containerized tests, which leads to an error when trying to run tests,
> e.g., with "make check-tcg":
> "make[1]: *** No rule to make target 'docker-image-debian-ppc-cross',
> needed by 'build-tcg-tests-ppc-linux-user'.  Stop."
> 
> This patch adds the PPC target back for containerized tests.
> 
> Fixes: 2ff8c9a2984bb20e350ae52152812c5370b02e32
> Signed-off-by: Florian Hofhammer <florian.hofhammer@fhofhammer.de>
> ---
>   configure | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index e69b3e474e..1b0af0cf46 100755
> --- a/configure
> +++ b/configure
> @@ -1451,7 +1451,7 @@ probe_target_compiler() {
>           container_image=debian-all-test-cross
>           container_cross_prefix=mips64-linux-gnuabi64-
>           ;;
> -      ppc64|ppc64le)
> +      ppc|ppc64|ppc64le)
>           container_image=debian-all-test-cross
>           container_cross_prefix=powerpc${target_arch#ppc}-linux-gnu-
>           ;;

Reviewed-by: Thomas Huth <thuth@redhat.com>


