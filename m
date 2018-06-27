Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fY4qI-0005hX-Bn
	for mharc-qemu-trivial@gnu.org; Wed, 27 Jun 2018 03:26:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50583)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY4qF-0005fY-3g
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 03:26:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY4qB-0006zA-48
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 03:26:15 -0400
Received: from mail-pl0-x241.google.com ([2607:f8b0:400e:c01::241]:41264)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY4qA-0006wX-UD
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 03:26:11 -0400
Received: by mail-pl0-x241.google.com with SMTP id w8-v6so632283ply.8
	for <qemu-trivial@nongnu.org>; Wed, 27 Jun 2018 00:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=6viBol9YJNZLoXezaxi9ki9BqzVpT0JL64uYsILwyn8=;
	b=ixAVr6UDv5HqaGsZ6ecqyzIJ20JkkCLQL+mhkESKT+nfP5YzQA+gPo0VemRR474/FY
	iKFBgXiBwrzpOtF9Mzxed5wLHMgebN4xACOtn0tJ5FU9XQtA/l5lYJ8UAzSkFu4bbJ08
	XA1XMTyWfGqTkueR4dAiQZ5vOZ/XtUCJMGovw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=6viBol9YJNZLoXezaxi9ki9BqzVpT0JL64uYsILwyn8=;
	b=gaRq1shJk9y5E3M9PykQFB6r8xOp4XS3ouft62GHJnnIwMxTwEw5XnOwCOElQJhQHZ
	lLVVCuwds7DJKNfgliKSqcAgCnN3jq86lzUmv1ePWBSb7X6nT4nBPzEtfw+o+xD02Lxk
	ei+BfSfTf/msVbPvMgzmVpB2YnbGzmkYdgdHICWeztvsNfu3GT3QvzMhPfSmco/gbYYz
	9fIj00awyE7oTM1R/884whg0BOTFs9MSGnDzAPG7lTv0mw3umj6PePeYt8zzH1wiz6ei
	2U1CScB2LKDrGoYlXCUNiRGKxwIg0Rd+GPJf5hFv4u8JFUYXZUp2mWhMxEGfRkGCVT2r
	rDOQ==
X-Gm-Message-State: APt69E3/lwkCfJ1DwHFYdQO6OT2XiPLDTMxYVrsOUPO/MSs/uYhCi/zW
	UDuY2u6n62BvES20cengrHDOFw==
X-Google-Smtp-Source: ADUXVKIHnYyvlxzxH15acwjK1TiSrqOuZsIJ3PDcyhccoNblr617GRlG3uIxVMHVmeezBbEx7UxV/Q==
X-Received: by 2002:a17:902:bf0b:: with SMTP id
	bi11-v6mr4868795plb.25.1530084369986; 
	Wed, 27 Jun 2018 00:26:09 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	x90-v6sm12398520pfk.151.2018.06.27.00.26.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Jun 2018 00:26:08 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>
Cc: qemu-trivial@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
	qemu-devel@nongnu.org
References: <20180625124238.25339-1-f4bug@amsat.org>
	<20180625124238.25339-38-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <e45c5f02-bb42-2dc2-a898-32fef7fabee6@linaro.org>
Date: Wed, 27 Jun 2018 00:26:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180625124238.25339-38-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v5 37/46] hw/vfio: Use the
 IEC binary prefix definitions
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
X-List-Received-Date: Wed, 27 Jun 2018 07:26:16 -0000

On 06/25/2018 05:42 AM, Philippe Mathieu-Daudé wrote:
> It eases code review, unit is explicit.
> 
> Patch generated using:
> 
>   $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/
> 
> and modified manually.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/vfio/pci-quirks.c | 9 +++++----
>  hw/vfio/pci.c        | 3 ++-
>  2 files changed, 7 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


