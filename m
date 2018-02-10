Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ekYoq-0005MH-NJ
	for mharc-qemu-trivial@gnu.org; Sat, 10 Feb 2018 12:20:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59944)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ekYom-0005KR-JE
	for qemu-trivial@nongnu.org; Sat, 10 Feb 2018 12:20:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ekYoi-0001BW-O9
	for qemu-trivial@nongnu.org; Sat, 10 Feb 2018 12:20:04 -0500
Received: from mail-pf0-x231.google.com ([2607:f8b0:400e:c00::231]:46399)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ekYoi-0001A6-Hk
	for qemu-trivial@nongnu.org; Sat, 10 Feb 2018 12:20:00 -0500
Received: by mail-pf0-x231.google.com with SMTP id z79so2498843pff.13
	for <qemu-trivial@nongnu.org>; Sat, 10 Feb 2018 09:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=Y4brWbiPhk9l+yts/pq/+QE/eVU0EbM8hDo67+M00bc=;
	b=ZXWl77rFlmPqXFGWK4ryG11QH2HhAP0J+ofg0TSQemHij7rM14Ec/ruLi7UnQ5bRm8
	hnbG+YZ4TUuU7N7fXZuQAN74wOaso0CNzjJ4QJj2nVJU+mhaHAZA8W2GtNzPgORdCMz/
	OIXO8h2guh187EU+rOhxeuM3PBB+94PfsbXjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Y4brWbiPhk9l+yts/pq/+QE/eVU0EbM8hDo67+M00bc=;
	b=nDggPZiHgjeUIXxeCs113Uq5sYCd49Ydhcz7n7skjhvgWPw41N93Z6+IyT6VTqUdwY
	8bNJoXlIkhUytVHbVNH/FEE+luldVM2jn9AUzHmPuRvpFkR5iLjOOTOWeY5NzRvBXlSR
	4ou9GvY1gH1gYHlDoth7tT+hW35N/PA0hpfjB45qUgGjxDlEUfcraS38MBsDzat1Y71j
	eBmvUOXP9Hbxnuu0Oy5FuvzY5JnmqG5tUu1+8AdIarEuYp/Ypu7X+/y2NzfSVGJk0+lG
	G7L8fjilnGJreXxXjrM9xwIndCbBlIzjxnpTABTpOhtviItjvpUwjg1QtY8L9MDd7mMd
	MZ3A==
X-Gm-Message-State: APf1xPCSNU9CAGRPk7iV/1k6/EuOGWhchgsMro4C1exumsmEicGgOrJT
	PeXUI9HhCPGdnUbzqd6k46ICcg==
X-Google-Smtp-Source: AH8x225wq/k1PNDVUuw83ZUE95IFXjg/q6YOdu7WtHJCCZdsrukLd+Kqt78c6h6hALPiB3Yiv+a+zA==
X-Received: by 10.99.110.206 with SMTP id j197mr5358772pgc.152.1518283199103; 
	Sat, 10 Feb 2018 09:19:59 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net.
	[174.21.6.47]) by smtp.gmail.com with ESMTPSA id
	q16sm15993222pfg.43.2018.02.10.09.19.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 10 Feb 2018 09:19:58 -0800 (PST)
To: Michael Tokarev <mjt@tls.msk.ru>, info@mobile-stream.com,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>
References: <1954640316.20171226142913@mobile-stream.com>
	<751c9675-7e93-a907-4b9e-998c50155e84@msgid.tls.msk.ru>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <29427bc8-d37d-a20c-e0ed-aaebffd1c265@linaro.org>
Date: Sat, 10 Feb 2018 09:19:55 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <751c9675-7e93-a907-4b9e-998c50155e84@msgid.tls.msk.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::231
Subject: Re: [Qemu-trivial] [Qemu-devel] fix evsrwu and others for powerpcspe
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
X-List-Received-Date: Sat, 10 Feb 2018 17:20:07 -0000

On 02/09/2018 11:25 PM, Michael Tokarev wrote:
> 26.12.2017 14:29, info@mobile-stream.com wrote:
>> GEN_SPEOP_ARITH2 declares non-local temporaries then calls gen_op_evsrwu/evsrws/evslw which generates branch insn.
> 
> I'm Cc'ing qemu-devel@ for review, since I don't know much about how ppc works.
> 
> Thanks,
> 
> /mjt
> 
>> --- target/ppc/translate/spe-impl.inc.c.orig
>> +++ target/ppc/translate/spe-impl.inc.c
>> @@ -158,8 +158,8 @@
>>          gen_exception(ctx, POWERPC_EXCP_SPEU);                                \
>>          return;                                                               \
>>      }                                                                         \
>> -    t0 = tcg_temp_new_i32();                                                  \
>> -    t1 = tcg_temp_new_i32();                                                  \
>> +    t0 = tcg_temp_local_new_i32();                                                  \
>> +    t1 = tcg_temp_local_new_i32();                                                  \

While that's one possible solution, it would be better to rewrite the helpers
not to use branches.  E.g.

    tcg_gen_andi_i32(t0, arg2, 0x1f);
    tcg_gen_andi_i32(t1, arg2, 0x20);
    tcg_gen_shr_i32(ret, arg1, t0);
    tcg_gen_movi_i32(t0, 0);
    tcg_gen_movcond_i32(TCG_COND_NE, ret, t1, t0, t0, ret);


r~

