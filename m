Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F953CF6BEB
	for <qemu-trivial@archiver.kernel.org>; Wed,  7 Jan 2026 05:18:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vdLva-0005ba-1K; Wed, 07 Jan 2026 00:17:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1vdLvY-0005aV-Jj
 for qemu-trivial@nongnu.org; Wed, 07 Jan 2026 00:17:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1vdLvX-0004Bb-3Y
 for qemu-trivial@nongnu.org; Wed, 07 Jan 2026 00:17:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767763063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=qeIjYaEb+mbMDPoiXw5nFZ1DrnW1AbKMoBvjS2g65mw=;
 b=jE0y9h8PMJDmOrpx3ImNK8v8FY90hd33NV9JBwATgyRokOfp4QLazaSqhVsSiMZwy5U2Ag
 5+NNtLu7Z7MtqoPilDV7Srl3zSjhvF260gRmJEOFVd4J548O1HO894Rgf4kpFF5r9rcq9z
 hxgqv0T0v1V/MrzK62YPX8ugc5YDmV4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-373-ikvhkyvXPda1ao_4dglESw-1; Wed, 07 Jan 2026 00:17:42 -0500
X-MC-Unique: ikvhkyvXPda1ao_4dglESw-1
X-Mimecast-MFC-AGG-ID: ikvhkyvXPda1ao_4dglESw_1767763061
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-47d4029340aso16734555e9.3
 for <qemu-trivial@nongnu.org>; Tue, 06 Jan 2026 21:17:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767763061; x=1768367861;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qeIjYaEb+mbMDPoiXw5nFZ1DrnW1AbKMoBvjS2g65mw=;
 b=YjhoM9hedW4zPAOfUJsJoj8qAtxcMB4pslstN3seGOTF8sp+GHIBZEDwFIeYGLE1qO
 kNWs5WAJsAEef1TWFOVmM0zOjBeLweWdY1MpB57QKDSkbm1eNeaXqSjal77AGZA2gRoc
 0dq6NGBOL4TGtfaKrTFznKxq466xUVE/0IElYB6jHhnrlAXFN/YQpciyjpx/S06Xmfun
 +R/8vDUGoUrFxM0OYhm45rhoPPCMh74+07kPPXicKOFQgFkVnMcR+4NZ2MVCibK5XdOf
 DuN+XDOATB6w6kF2V629CO8PJLxzw5SSLt02ICmEaWofJ9SpbcmAMdU6hKIxT6NBUDQN
 qaKw==
X-Gm-Message-State: AOJu0YyIi49jQNp/byCItxlmkMd+a4jBlda8ov7zUV9XTbZL7fjZE95X
 ZUhVD4o3+l3k31XsfiHTFmuvvK3uq6Htp1Fgt6ApIojkM7dmLn+dsGvFIVsFIFoDKq9YeZfyUyd
 B+BrquYXEHsMgld149eN81QG5COsuFJC3aE+CoELRq04RYJtt/ahyJ9wb1/g=
X-Gm-Gg: AY/fxX4yVtdF6oGLOEFoQQUAEcBzMvSrtpJ58jr5DOqf8kj9Ibt6eH0m4EtUtgG0KFF
 LJTpPwqo9WauRhBj9xsJPSQj/kgoUVXNth6SPCOE4VIFSugnDWq1btA7RKTEP73IkmWuE34Hk02
 2gdpaWHQxwy8/mW3QSe1ditfBeK4i0IgtZC5TSCKxkBzg8Ldc40WCUXEG/TxLBJK6tu8jdbAmec
 WuXEroxeuMrZuFTBO15HcqHSx+KbYH4QydRoZRKBT+t3P2xkXbtcAVqkzp8a8P52BtiWytasgzF
 NLqkqVD5n42quUpJ3mtEMEKOUTIqZrBQAwuBA0kSvMv8FNDY9AbHuDmHCqUh7D+fKylVSm9Ay+2
 CNcW9y8I=
X-Received: by 2002:a05:600c:a102:b0:477:7a53:f493 with SMTP id
 5b1f17b1804b1-47d84b32793mr8374495e9.23.1767763060722; 
 Tue, 06 Jan 2026 21:17:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8pHV2doW0GsrviBZTauDNHcFyB0ObZZUYADFZofHOd+Ed2duFfdHEfJiaSVVcdMTKZdiIdA==
X-Received: by 2002:a05:600c:a102:b0:477:7a53:f493 with SMTP id
 5b1f17b1804b1-47d84b32793mr8374365e9.23.1767763060353; 
 Tue, 06 Jan 2026 21:17:40 -0800 (PST)
Received: from [192.168.0.9] ([47.64.114.194])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f653c78sm79724135e9.11.2026.01.06.21.17.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 21:17:39 -0800 (PST)
Message-ID: <5e1a3a65-26bd-4965-a224-0dbe73ae274a@redhat.com>
Date: Wed, 7 Jan 2026 06:17:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/functional/qemu_test/testcase: Fix mismatched
 quotations
To: Yodel Eldar <yodel.eldar@yodel.dev>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
References: <20260106220319.74785-1-yodel.eldar@yodel.dev>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20260106220319.74785-1-yodel.eldar@yodel.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AYv17giYr-iaZUzUa5LFF5GuStWO0-p5-QdftEvv8bw_1767763061
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On 06/01/2026 23.03, Yodel Eldar wrote:
> A debug string incorrectly mixes single-quotes with double-quotes,
> causing the variable within to be treated as a literal. Fix it.
> 
> Signed-off-by: Yodel Eldar <yodel.eldar@yodel.dev>
> ---
>   tests/functional/qemu_test/testcase.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/functional/qemu_test/testcase.py b/tests/functional/qemu_test/testcase.py
> index 58f2740100..ff86c9d187 100644
> --- a/tests/functional/qemu_test/testcase.py
> +++ b/tests/functional/qemu_test/testcase.py
> @@ -349,7 +349,7 @@ def require_netdev(self, netdevname):
>           helptxt = run([self.qemu_bin, '-M', 'none', '-netdev', 'help'],
>                         capture_output=True, check=True, encoding='utf8').stdout
>           if helptxt.find('\n' + netdevname + '\n') < 0:
> -            self.skipTest('no support for " + netdevname + " networking')
> +            self.skipTest('no support for ' + netdevname + ' networking')

Ooops, good catch!

Reviewed-by: Thomas Huth <thuth@redhat.com>


