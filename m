Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fY3K9-0007f6-Qm
	for mharc-qemu-trivial@gnu.org; Wed, 27 Jun 2018 01:49:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59192)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY3K4-0007cc-K6
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 01:48:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY3K1-0000UL-I1
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 01:48:56 -0400
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:41197)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY3K1-0000TV-CS
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 01:48:53 -0400
Received: by mail-pf0-x244.google.com with SMTP id a11-v6so469231pff.8
	for <qemu-trivial@nongnu.org>; Tue, 26 Jun 2018 22:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=tkqAutQtYg01Pt3VJw75Wbgz4xsSosaMLJBOy7zC3JA=;
	b=RXoShCShAplXlTy2mBXYEfJtxyZ14mEgG4IsO2ix7UvCRMSlOFv6rXtn0xY3+EpLl4
	4qHXdziFuy4eIhay7x5X5PdHVF0Nh9D+MaH0i2ZbwWNxueLQlmJKMlpf9OZHKnuKYmuy
	XaUq9rVokBWnXvu9VSEqb7lFs8bjdV6poBGe8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=tkqAutQtYg01Pt3VJw75Wbgz4xsSosaMLJBOy7zC3JA=;
	b=I0ftSPcbI9l93zZmyvc32S/+gWJtuVjHGpVbVMQugAc3r8VrEvFJPMSIiXyuxlTyAO
	e5IjY7MRY+aWXxAXcZCipi/6pSW3FFw8fE74WIjeEdnSfzBRDmRfHVXygK+5USYpzN1m
	plarbG61cfZK6Y4t30UzKKfBy06anqQnCkHNt6QtPkBhb39yydlEbZAvwr++17XgBE/Y
	LW0hbIPAqAm2h0PIGUBgr3v7L/zMpPiptWg1+u6yMEggz+4ZjIrenPCRJQchVqHEFw21
	ttT9x6YrtBDUoWWOnzvuHRAwgvHjyu8REescrmvqbjEadZ1EZAtfAY6TGQw4MtUI0CD/
	Rizw==
X-Gm-Message-State: APt69E2ORmV+D6TfRCBstpkYnNy6P0/XUxTFhE9zabYTyShfe0lgriYX
	A22cBApT23ZiJLzTyZlCYTqtrA==
X-Google-Smtp-Source: AAOMgpfDTvPtqJ2wRlJt3hnOd1QJNz4Gr2fm4Y90aGQ6kwx8JxfPk2FGTKtOD6qVdqcieYXhTblAcA==
X-Received: by 2002:a62:d98f:: with SMTP id b15-v6mr832032pfl.1.1530078532222; 
	Tue, 26 Jun 2018 22:48:52 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	t5-v6sm4748140pfh.32.2018.06.26.22.48.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Jun 2018 22:48:51 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20180625124238.25339-1-f4bug@amsat.org>
	<20180625124238.25339-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <2f295850-cadf-953c-d32a-dc7ce0b9c140@linaro.org>
Date: Tue, 26 Jun 2018 22:48:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180625124238.25339-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v5 01/46] include: Add IEC
 binary prefixes in "qemu/units.h"
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
X-List-Received-Date: Wed, 27 Jun 2018 05:48:57 -0000

On 06/25/2018 05:41 AM, Philippe Mathieu-Daudé wrote:
> Loosely based on 076b35b5a56.
> 
> Suggested-by: Stefan Weil <sw@weilnetz.de>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/qemu/units.h | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 include/qemu/units.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


