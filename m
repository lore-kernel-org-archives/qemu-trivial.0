Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fmhNR-0006Lv-8V
	for mharc-qemu-trivial@gnu.org; Mon, 06 Aug 2018 11:24:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49752)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fmhNO-0006Kl-1f
	for qemu-trivial@nongnu.org; Mon, 06 Aug 2018 11:24:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fmhNK-0005Mk-Rf
	for qemu-trivial@nongnu.org; Mon, 06 Aug 2018 11:24:54 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:37568)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fmhNK-0005MQ-K9
	for qemu-trivial@nongnu.org; Mon, 06 Aug 2018 11:24:50 -0400
Received: by mail-oi0-x241.google.com with SMTP id j205-v6so22906588oib.4
	for <qemu-trivial@nongnu.org>; Mon, 06 Aug 2018 08:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=R5IlPvItUnz05Hfb5YjE4M+FD7citz/81GFHLr9vy7A=;
	b=XVh1ua2vXEFhzW2is2Oy16Z3JDbe39LdBBzVllL4BJ5uqCgBj0puqzJSykktuW0z6a
	POuB5jG49/KdHO5m3PB03540BZ5L/G/WwBBEZEEDZaG0Jfi0UQpiZCj7ldCQsd4Qu86h
	Pmp6MdMLJjToX/1Z1Y6JEsg0Q1nBw2mEi2sWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=R5IlPvItUnz05Hfb5YjE4M+FD7citz/81GFHLr9vy7A=;
	b=IDSzb90f5iM1Ec9XL8+pV7AyMhV7ZOxBC4mt6S0oX7HEfcX3VdtkvXEpmgPcnzDuf6
	wkNQbQByl5MSPIvdZbFRWP0eMd6Gnqry7YeIj7T6OrI1J+OlPu3OahhPXMDsYxXDf+xJ
	CYqtxVv+2Vpq5wmRHD2xsx2oShnP3TVdJUk15VWIEp45pQMzh1HcLFXQwcnTBUTkHK7l
	t/IuGNV2rcvB26AtrB7ha4PP2NiScWQQlv6SO4sJnAWTcDf/MqKf6WQ3z2uMQ2gMaFju
	Ss295t1qX+uIeKnSHlVTOkJ3FiJYKz6Gg2QnbLopzWcOaygysU+svEqKt1dsR4uk1w2O
	/N6g==
X-Gm-Message-State: AOUpUlHEwZoPVz9FdmIOi/sHz7rsvI2K+ovyIfi9z4enMDejupnPmL7K
	Tis8KDzNLgoi+DT+kLwSGCNbmQ==
X-Google-Smtp-Source: AAOMgpdXIaEl5xl3dsuvn+1+fsCQGLrG/wB01gdikqB3iYWc5mJVYJzHp8+G5YtmsBt1EwbY2qAR4Q==
X-Received: by 2002:aca:b3d6:: with SMTP id
	c205-v6mr16260191oif.133.1533569088585; 
	Mon, 06 Aug 2018 08:24:48 -0700 (PDT)
Received: from cloudburst.twiddle.net ([172.56.42.130])
	by smtp.gmail.com with ESMTPSA id
	v202-v6sm10434391oie.47.2018.08.06.08.24.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Aug 2018 08:24:47 -0700 (PDT)
To: Pavel Zbitskiy <pavel.zbitskiy@gmail.com>, qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, qemu-trivial@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>, Alexander Graf <agraf@suse.de>,
	"open list:S390" <qemu-s390x@nongnu.org>,
	Richard Henderson <rth@twiddle.net>
References: <20180805182832.3012-1-pavel.zbitskiy@gmail.com>
	<20180805182832.3012-4-pavel.zbitskiy@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <15c06ae1-5262-85fe-df70-afd570f7efa7@linaro.org>
Date: Mon, 6 Aug 2018 08:24:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180805182832.3012-4-pavel.zbitskiy@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 3/6] target/s390x: fix ipm
 polluting irrelevant bits
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
X-List-Received-Date: Mon, 06 Aug 2018 15:24:55 -0000

On 08/05/2018 11:28 AM, Pavel Zbitskiy wrote:
> +    tcg_gen_andi_i64(t1, psw_mask, 0x00000f0000000000);
> +    tcg_gen_shri_i64(t1, t1, 16);

It would be better to swap these two operations, so that a 64-bit constant
isn't needed for the mask, e.g:

    tcg_gen_shri_i64(t1, psw_mask, 16);
    tcg_gen_andi_i64(t1, t1, 0xf000000);

Or maybe rewrite this whole function with extract/deposit:

    tcg_gen_extract_i64(t1, psw_mask, 40, 4);
    tcg_gen_extu_i32_i64(t2, cc_op);
    tcg_gen_deposit_i64(t1, t1, t2, 4, 60);
    tcg_gen_deposit_i64(o->out, o->out, t1, 24, 8);

But what you have is not wrong so,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

