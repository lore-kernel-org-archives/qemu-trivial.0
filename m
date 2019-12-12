Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ifCOH-0002so-S4
	for mharc-qemu-trivial@gnu.org; Wed, 11 Dec 2019 19:31:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32803)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1ifCOE-0002ol-FI
 for qemu-trivial@nongnu.org; Wed, 11 Dec 2019 19:31:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1ifCOC-0008As-UA
 for qemu-trivial@nongnu.org; Wed, 11 Dec 2019 19:31:34 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:29676
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1ifCOC-00084I-L0
 for qemu-trivial@nongnu.org; Wed, 11 Dec 2019 19:31:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576110684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UJGOP2uBpm5En8S36aOhtvQxYnoYYWbOTtm9lAZdCHs=;
 b=EvYiMiykrf1ImgTOyq7nP8wmIsCMO+e0o1t72i7KvWDggQwf84m2+vkAlC9Wfx0BwwiYtm
 3R4HWslHdXsuPycJonrjpGtHQlgv/J6GYH9Odd0Z8iL1dijOC7kuSH5I0EHGjb+XGEMeMZ
 8bz2iu+rt4ISCOFgBd1KFQbiEVkKH3U=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-hSVf9u5qMQGaMAUbFIFaAQ-1; Wed, 11 Dec 2019 19:31:07 -0500
Received: by mail-wr1-f72.google.com with SMTP id u18so307110wrn.11
 for <qemu-trivial@nongnu.org>; Wed, 11 Dec 2019 16:31:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UJGOP2uBpm5En8S36aOhtvQxYnoYYWbOTtm9lAZdCHs=;
 b=RGhdbCtl0jHbMw+BWGEjtHC7cy9BuafCvouZmSJrqVp6IK2gwG8PiGra65T798SUHd
 1T0IGRQmEKNzjLlOn+YvtiNwtCGuMjLvNijFG7ftWy+1B3b4R/uD2tjK949+7AZ9JLev
 xKGTwLO15q2Xc0hTW0lFB+HBuGWGeYN2JaHwtCI222C1ykcuPpCn0BaePp5AYwGQsFI1
 YY9C0u5JhJICryp/PveJX4yBT6TFiiBdtx2HxUr8s7ptZj/t0Ql/Uf2CcqgBY6ZxGM/h
 Yrocw3rXZTyOwzmUTCc9kM290SbakW74mkXrAUhwkbMIJuRCMZnfWfWj53AmJFsjsYZg
 V3iQ==
X-Gm-Message-State: APjAAAVRm7PkoKky57K/H0bv0k6lKmo1JganiExnzqMIz1xnhPGZptpn
 fmdvkVb/MrXD7R76HRR9Ko86FavnRamH0XRja9ZNojjJKJlR/iQ5ngkvb+DRMEAcAg1AKpFoN9O
 hCSsNnb6Q9wRfuWECtA==
X-Received: by 2002:adf:fa12:: with SMTP id m18mr2711296wrr.309.1576110666142; 
 Wed, 11 Dec 2019 16:31:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqzcqfZatkvH4PnwiUjxdpl7g13EVDB2oLVNPnTsYZZ1kdm4muEW6fxgbOom+YOWS/ntbE1v+Q==
X-Received: by 2002:adf:fa12:: with SMTP id m18mr2711276wrr.309.1576110665845; 
 Wed, 11 Dec 2019 16:31:05 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:e9bb:92e9:fcc3:7ba9?
 ([2001:b07:6468:f312:e9bb:92e9:fcc3:7ba9])
 by smtp.gmail.com with ESMTPSA id f1sm4231998wml.11.2019.12.11.16.31.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2019 16:31:05 -0800 (PST)
Subject: Re: [PATCH 1/1] tests/Makefile: Fix check-report.* targets shown in
 check-help
To: Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org, 
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
References: <20191211204427.4681-1-wainersm@redhat.com>
 <20191211204427.4681-2-wainersm@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <daf920c0-7b3e-5b2e-c865-ccaf39ba1740@redhat.com>
Date: Thu, 12 Dec 2019 01:31:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191211204427.4681-2-wainersm@redhat.com>
Content-Language: en-US
X-MC-Unique: hSVf9u5qMQGaMAUbFIFaAQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Dec 2019 00:31:36 -0000

On 11/12/19 21:44, Wainer dos Santos Moschetta wrote:
> The check-report.html and check-report.xml targets were replaced
> with check-report.tap in commit 9df43317b82 but the check-help
> text was not updated so it still lists check-report.html.
> 
> Fixes: 9df43317b82
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
>  tests/Makefile.include | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index 8566f5f119..680bd8a669 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -16,12 +16,10 @@ check-help:
>  	@echo " $(MAKE) check-softfloat      Run FPU emulation tests"
>  	@echo " $(MAKE) check-acceptance     Run all acceptance (functional) tests"
>  	@echo
> -	@echo " $(MAKE) check-report.html    Generates an HTML test report"
> +	@echo " $(MAKE) check-report.tap     Generates an aggregated TAP test report"
>  	@echo " $(MAKE) check-venv           Creates a Python venv for tests"
>  	@echo " $(MAKE) check-clean          Clean the tests and related data"
>  	@echo
> -	@echo "Please note that HTML reports do not regenerate if the unit tests"
> -	@echo "have not changed."
>  	@echo
>  	@echo "The variable SPEED can be set to control the gtester speed setting."
>  	@echo "Default options are -k and (for $(MAKE) V=1) --verbose; they can be"
> 

Cc: qemu-trivial@nongnu.org


