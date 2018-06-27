Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fYBeq-0001J6-10
	for mharc-qemu-trivial@gnu.org; Wed, 27 Jun 2018 10:42:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50455)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fYBen-0001GU-Bo
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 10:42:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fYBel-0006BS-8G
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 10:42:53 -0400
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:35480)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fYBel-0006AE-28
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 10:42:51 -0400
Received: by mail-pf0-x243.google.com with SMTP id c22-v6so1073942pfi.2
	for <qemu-trivial@nongnu.org>; Wed, 27 Jun 2018 07:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=s0ucI9cFW+5zmrwj9LnjGjDwZ7QRZyPvw+5V6w3Jwi4=;
	b=h3QoHUuSxGUDE5O2KoJy9mOLJeczcSVFUwEplIi4UEZiY2JRrTBU+WAgNFZKzxzk7A
	ZHS5ulVZEb8eDDBBh7xz58kWMFJgVcBKEPjOuy9k6udwDSJVLv1mdF1016Hs7tvaaCXg
	I1GLEnhfJoCK5olfXowehvkXlFjA1VLAFq3Z0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=s0ucI9cFW+5zmrwj9LnjGjDwZ7QRZyPvw+5V6w3Jwi4=;
	b=aIB6ds3TYDpv5Tk4FsBt2c2ZpLN/hDkqV7Uy6VRzTf9YVT2C1mj+Sv+96J5sIphHWc
	ynm6GnkGV4MFERo33EYAon5Nomo1U4NQ44N3VEi7JcwhnXr5K5UUsJHBmQxsrO5cmwJ0
	CS4yw0iK+0vmBecFrIcmb9I1Ndxzp9OWtSfPtxXkvLPoU5j0l/ZgBm1oc+PFTbgL9YRC
	++B09wQoBNh76wXoP/hYy+wyZiAO3vM6+yrfZTFqK4d+E4hG/FY3b6xkHfuh9+vxhsuA
	U+gjDcqEtGdBJFFloJrYCCitRqnwhBJEDcHWrgoC3Ljmb9YV4s08x0RRDVk4brCny4gR
	mclA==
X-Gm-Message-State: APt69E21b1whVUp7WieT+aaYnjIEcgtdbJCPhJ3C12dLs28vj3KZOLQE
	zKaEVmVbuZI3QCdCiVsi5DbpkQ==
X-Google-Smtp-Source: AAOMgpfI6IqqjpNbmS09q/aRxWaXSPmwlLPZSmoTaFidmWx5VqT+m3131kdvdD7ujSoQYqvrtLipyA==
X-Received: by 2002:a62:5601:: with SMTP id
	k1-v6mr6200055pfb.212.1530110570137; 
	Wed, 27 Jun 2018 07:42:50 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	i186-v6sm8288052pfg.73.2018.06.27.07.42.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Jun 2018 07:42:49 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
	Eric Blake <eblake@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20180625124238.25339-1-f4bug@amsat.org>
	<20180625124238.25339-47-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <4defeb14-beb7-5244-db11-1b19bc751e5b@linaro.org>
Date: Wed, 27 Jun 2018 07:42:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180625124238.25339-47-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v5 46/46] bsd-user: Use the
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
X-List-Received-Date: Wed, 27 Jun 2018 14:42:54 -0000

On 06/25/2018 05:42 AM, Philippe Mathieu-Daudé wrote:
> It eases code review, unit is explicit.
> 
> Patch generated using:
> 
>   $ git grep -n '[<>][<>]= ?[1-5]0'
> 
> and modified manually.
> 
> Suggested-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  bsd-user/main.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


