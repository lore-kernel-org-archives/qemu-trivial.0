Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hOf4k-0007Tz-5d
	for mharc-qemu-trivial@gnu.org; Thu, 09 May 2019 05:10:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57051)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hOf4i-0007Tj-OW
	for qemu-trivial@nongnu.org; Thu, 09 May 2019 05:10:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hOf4h-0000C5-VL
	for qemu-trivial@nongnu.org; Thu, 09 May 2019 05:10:48 -0400
Received: from mail-wm1-f47.google.com ([209.85.128.47]:36877)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hOf4h-0000Bm-Oj
	for qemu-trivial@nongnu.org; Thu, 09 May 2019 05:10:47 -0400
Received: by mail-wm1-f47.google.com with SMTP id y5so2175288wma.2
	for <qemu-trivial@nongnu.org>; Thu, 09 May 2019 02:10:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Z3XlCPOS6wXqmxqlRkSZtI8P+8EHQho0tRi71AYaKNo=;
	b=PK5FwLvCEfzHdudPK3z/K1yNLVU+cIjKY1gNiqk0W4cIYZrHWxAqriaq6omVO6YuZZ
	yugHVP73snsSodNYSeo4iPdt/43CJ4HFNmeCW+VVNeQ8b4IRNZKPZqXsNKLb0FUhT7fd
	nsLbDVlgmsZ4TiV5Oypv/Hz32w9+qvf/KmSgcTUOfHLVQ9R8vNn6tW2B9siGeh9+DO4e
	h/Jhr6lIVbF8YCnwuZI9GtHqThvEwW9seQXzIc5BPUhoSiynU7c2kUdGW1CwjA5osnPx
	iYxY6H/yx+SNN8B6ghtNdHw9kCegXTv9GTFyJPdtCW7V7b9njSuEUZ+hDgceYP3tFkqm
	SYkw==
X-Gm-Message-State: APjAAAUT+lnPx9U7tusVJxhZRhb3upQynrMJbm7l+1p9AlIVG1toEz2h
	v+QYq7y/8oKdinI+N3WNRG6fk0Lov/tu8g==
X-Google-Smtp-Source: APXvYqxRWww4yBl27dLzYcg84ZOtO0JEmS9WWzc7VFVb5fi3/FxP4cWe28mRFhBx8ThGSdjGNwk8dA==
X-Received: by 2002:a1c:c910:: with SMTP id f16mr2075004wmb.118.1557393046489; 
	Thu, 09 May 2019 02:10:46 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:f572:d55d:64bb:59f8?
	([2001:b07:6468:f312:f572:d55d:64bb:59f8])
	by smtp.gmail.com with ESMTPSA id
	u14sm1722280wrn.30.2019.05.09.02.10.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 May 2019 02:10:45 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20190508150608.3311-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6cb2ea74-b3f8-09f3-90cb-e3b8344e67bd@redhat.com>
Date: Thu, 9 May 2019 11:10:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190508150608.3311-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.47
Subject: Re: [Qemu-trivial] [PATCH] include/exec/poison: Mark TARGET_FMT_lu
 as poisoned, too
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
X-List-Received-Date: Thu, 09 May 2019 09:10:49 -0000

On 08/05/19 10:06, Thomas Huth wrote:
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  include/exec/poison.h | 1 +
>  1 file changed, 1 insertion(+)

Queued, thanks.

Paolo

