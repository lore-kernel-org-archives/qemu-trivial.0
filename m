Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fY3Jq-0007Uv-DC
	for mharc-qemu-trivial@gnu.org; Wed, 27 Jun 2018 01:48:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59105)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY3Jn-0007UH-GD
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 01:48:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY3Jj-0000HX-8V
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 01:48:39 -0400
Received: from mail-pl0-x241.google.com ([2607:f8b0:400e:c01::241]:34126)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY3Jj-0000Gq-2A
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 01:48:35 -0400
Received: by mail-pl0-x241.google.com with SMTP id z9-v6so515865plo.1
	for <qemu-trivial@nongnu.org>; Tue, 26 Jun 2018 22:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=1E5ZNAxwkXV55KT6qA6R8f1RabWsYhe6kruh1JQgIBk=;
	b=Bh5Un55JBV6sZXo4t2BgCR4kw/0cLw1+19xk0E1Bzzih05OW6KyA8TE3sFxdYOy+p7
	vnHTsT/cw0Pmp2BN4P386MfXBFPg8l/0ZHnf30SFgjRKNUlk49R0zDzcJxRnNzeMD5SC
	dYLSfwiXYtHk5evXmUXd4ZmcsMIMSBsptPXw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=1E5ZNAxwkXV55KT6qA6R8f1RabWsYhe6kruh1JQgIBk=;
	b=eljkzXOl1t+hl6SnaBJLuxUaZ96dJqTiegRz/lbt6abfAgXFqElEaq3JJQJiyJqs0u
	B7hsxpHH6yLmBXs4M2DPAXzTlsKu+YhKlbueU4CtZW7nQeNvFCrayDEnXQFs2kqyjp4S
	0kow95dtzLECt/8uXfjJ45dieu/Nm40zrveK6d/E9kK7Knn1U6yUSYTn59zE8Nkj7V7M
	13ypSUiKqcA5Qn4tXUqcpzZz39+mcBdzMju1LCqayeZu188npM/YCUND4eXkdN+GeT76
	Av+JwsbJk+LSxFlifzHeFBhX9ccPEHhfvYbe9XpekNSFkQpKguukGpJlcEUeUKv+N0vA
	KVGg==
X-Gm-Message-State: APt69E0Cg2or5IsL82Vmb4+LHP1fEBY5Jyz6vpJJ659wu+amEGySXiis
	7Oo87MOcGfSUa4S7E3T/bbztuQ==
X-Google-Smtp-Source: ADUXVKLbwW9rDsr8b0CPomQ85B9M3VWVom6ytTv5wZ1jjxsCAIxZj8X6RcyLZ4fCknmPbTAt8utxfQ==
X-Received: by 2002:a17:902:8b86:: with SMTP id
	ay6-v6mr4658130plb.295.1530078513857; 
	Tue, 26 Jun 2018 22:48:33 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	d64-v6sm9148469pfb.99.2018.06.26.22.48.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Jun 2018 22:48:32 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
	"open list:VDI" <qemu-block@nongnu.org>, qemu-trivial@nongnu.org,
	Max Reitz <mreitz@redhat.com>
References: <20180625124238.25339-1-f4bug@amsat.org>
	<20180625124238.25339-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <db5a0c58-4087-61b4-2aab-6f2e96928120@linaro.org>
Date: Tue, 26 Jun 2018 22:48:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180625124238.25339-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v5 02/46] vdi: Use
 definitions from "qemu/units.h"
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
X-List-Received-Date: Wed, 27 Jun 2018 05:48:40 -0000

On 06/25/2018 05:41 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Reviewed-by: Stefan Weil <sw@weilnetz.de>
> ---
>  block/vdi.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


