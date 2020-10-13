Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kSHzo-0007PH-J3
	for mharc-qemu-trivial@gnu.org; Tue, 13 Oct 2020 06:57:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kSHzm-0007Kl-Q5
 for qemu-trivial@nongnu.org; Tue, 13 Oct 2020 06:57:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kSHzl-0006MV-72
 for qemu-trivial@nongnu.org; Tue, 13 Oct 2020 06:57:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602586648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tPOR8UvJfhV8EWaTgUYjBNeWZODIBwD4pPIQKAcvRQ0=;
 b=dyow12gdCFeoO/zFjkTwnB9jjkq0iv7iXJggQKGE8bFvqYF1GNeDKHwDasAO7fdwr623NM
 adENbSoK1zmAyrhCp8nWXnBhM87d6yD9PFH39wlwzWVziYNPmMTpZpRvZGcM8MrdasObyP
 k/UweVIT5agEW3uonMsQUYGtN5jCR+w=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-cnNogjaQPaCRARP661zm5Q-1; Tue, 13 Oct 2020 06:57:26 -0400
X-MC-Unique: cnNogjaQPaCRARP661zm5Q-1
Received: by mail-wr1-f72.google.com with SMTP id 2so1553333wrd.14
 for <qemu-trivial@nongnu.org>; Tue, 13 Oct 2020 03:57:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tPOR8UvJfhV8EWaTgUYjBNeWZODIBwD4pPIQKAcvRQ0=;
 b=kwuuflbUMS72f+GtgrJgpEz54F4EbYWdr+p59t3YvsRKQKe+l6o5nQMCR90rvxpTAk
 4VCJfeYi+kbWxa7Uno4dWJmHxVr08LSpCtf29TFvFe3qSS+on2qIJ8XSdaX2e1b7o0/K
 UQ3IEqa6jBCZiBLpNqEm8wWDT9R4M5SUq3epDFUQJm17L9XpXKkJ917/ckYenbJE4Oj9
 bDXGCgXlE+xRFhvfnsrSwP4JZHaAUx2pvd5SQWjpUuGW2K5ELWIOTnaetkHSsUbCEr0/
 WZQTzgaHUij5Kr9SQOUfidYW9o1TnA3BK+C8XzugBViPRAK67ySD1+9lpM6vfJjwe2aC
 B6fQ==
X-Gm-Message-State: AOAM530XKEl8WqT4xqj7a/i93mF+ZMAVDZYeZ7/BVeur9z2wHnOcQD3e
 FOMp9rwFKMeFo03oruiQ3AGg2MedG4ihnMXh8DTrBPAo7VHBuJP0Q7caD1fD9PVZUvjnuyvK3dG
 wA+mYK08COXG0iROyOA==
X-Received: by 2002:a7b:cb81:: with SMTP id m1mr15855847wmi.140.1602586645546; 
 Tue, 13 Oct 2020 03:57:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTRAO8FwNEyMWALwBX+2n4BjoC3Vhe+REBAyyQADGKcLnDf20g00IPUNBa4H1TWQjFrMe63w==
X-Received: by 2002:a7b:cb81:: with SMTP id m1mr15855822wmi.140.1602586645230; 
 Tue, 13 Oct 2020 03:57:25 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:61dd:85cb:23fc:fd54?
 ([2001:b07:6468:f312:61dd:85cb:23fc:fd54])
 by smtp.gmail.com with ESMTPSA id k18sm10263779wrx.96.2020.10.13.03.57.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2020 03:57:24 -0700 (PDT)
Subject: Re: [PATCH v2] Makefile: Add *.[ch].inc files to cscope/ctags/TAGS
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <160258069310.900922.1495166540282536628.stgit@bahia.lan>
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a62bfc14-2da7-1e63-0740-7188f82cd89d@redhat.com>
Date: Tue, 13 Oct 2020 12:57:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <160258069310.900922.1495166540282536628.stgit@bahia.lan>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/13 02:06:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Tue, 13 Oct 2020 10:57:31 -0000

On 13/10/20 11:18, Greg Kurz wrote:
> The code base has some C source and header files that don't get indexed
> because their name ends with .inc:
> 
> $ git ls-files "*.[ch].inc" | wc -l
> 66
> 
> Add them to the list.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>
> --
> v2: add the missing \( and \)
> ---
>  Makefile |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index c37e513431fe..3c5a0b0f7a11 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -190,7 +190,7 @@ distclean: clean ninja-distclean
>  	rm -f linux-headers/asm
>  	rm -Rf .sdk
>  
> -find-src-path = find "$(SRC_PATH)/" -path "$(SRC_PATH)/meson" -prune -o -name "*.[chsS]"
> +find-src-path = find "$(SRC_PATH)/" -path "$(SRC_PATH)/meson" -prune -o \( -name "*.[chsS]" -o -name "*.[ch].inc" \)
>  
>  .PHONY: ctags
>  ctags:
> 
> 

Cc: qemu-trivial@nongnu.org


