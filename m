Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iH98X-0002aJ-52
	for mharc-qemu-trivial@gnu.org; Sun, 06 Oct 2019 12:11:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57630)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iH98V-0002Yr-4m
 for qemu-trivial@nongnu.org; Sun, 06 Oct 2019 12:11:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iH98U-0006wj-5c
 for qemu-trivial@nongnu.org; Sun, 06 Oct 2019 12:11:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39322)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iH98U-0006wI-0e
 for qemu-trivial@nongnu.org; Sun, 06 Oct 2019 12:11:54 -0400
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 04A1A368CF
 for <qemu-trivial@nongnu.org>; Sun,  6 Oct 2019 16:11:53 +0000 (UTC)
Received: by mail-wm1-f72.google.com with SMTP id 190so4593136wme.4
 for <qemu-trivial@nongnu.org>; Sun, 06 Oct 2019 09:11:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T4rtIVyNbX3AmeHViU22cZEfjzHvDZfc22fjcoeRsak=;
 b=dQXHCEmW4RcR/grwIpMNPfv5bXix0PhJq7ZDTZHsy126C81vB4NV1vezJbq8iHfaxH
 f3i38K3x2rUWz6KRWGsPlY76N3pqWUTD+AEQP+W3CxjQcUOUdDq7D0u+1MeVgSwCh7zL
 kZIqXehZrsVcf6Ven7Ci+2fCxU1uZDbYGPyxt5GJNbLYhWocMF2KuWlwNOkgErrxBgwm
 KpRnRkelJGwTCb++6Ytnho/1lX+JKC37V0v8YCeZTCOpZSgBa5VuJFm5Ti3eZMVz8LDQ
 9CnqhnBVqvFn/KKHVfIeSxRCnTvwFcEm8A3waFue8+KfmGWc4XHAR0vFp0W7UsXmUSBr
 0jDg==
X-Gm-Message-State: APjAAAW4jztSiMHZHeITFUuYsiVrrwBq5ZV09h28nMOq9rTPK5gV6tCX
 W+VO8orfOiQGDV818NP5oPWO5mqcN54l5kJJp1np64HHO3pcaHra6EeefLRNjFNtNh6dCJLWcFN
 gsvLpP3fuq3iSJ85SQw==
X-Received: by 2002:adf:eb8d:: with SMTP id t13mr17867298wrn.53.1570378311445; 
 Sun, 06 Oct 2019 09:11:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz+jgBd0V+FfwXx3881WMWzXWPrCQYrF9njBD8483tXNBXQwwPszcV8F+8drh9J1ZfR1ivyug==
X-Received: by 2002:adf:eb8d:: with SMTP id t13mr17867278wrn.53.1570378311168; 
 Sun, 06 Oct 2019 09:11:51 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:e876:e214:dc8e:2846?
 ([2001:b07:6468:f312:e876:e214:dc8e:2846])
 by smtp.gmail.com with ESMTPSA id a71sm11000251wme.11.2019.10.06.09.11.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Oct 2019 09:11:50 -0700 (PDT)
Subject: Re: [PATCH] target/i386: log guest name and memory error type AO, AR
 for MCEs
To: Mario Smarduch <msmarduch@digitalocean.com>, mtosatti@redhat.com,
 armbru@redhat.com
Cc: qemu-devel@nongnu.org, rth@twiddle.net, ehabkost@redhat.com,
 qemu-trivial@nongnu.org
References: <ceb4d639-842a-30bd-5d54-bfacb07b5cc4@digitalocean.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <c78d014f-20f4-d25f-e50a-92c960200d7e@redhat.com>
Date: Sun, 6 Oct 2019 18:11:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ceb4d639-842a-30bd-5d54-bfacb07b5cc4@digitalocean.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Sun, 06 Oct 2019 16:11:56 -0000

On 05/10/19 01:53, Mario Smarduch wrote:
> Guest [Droplet-12345678] 2019-08-02T05:00:11.940270Z qemu-system-x86_64:
> Guest MCE Memory Error at qemu addr 0x7f3c7622f000 and guest 78e42f000
> addr of type BUS_MCEERR_AR injected
> 
> with enterprise logging environment we can to take further actions.
> 
> Signed-off-by: Mario Smarduch <msmarduch@digitalocean.com>

The guest name part should be a separate patch, controlled by "-msg
name=on" or something like that.  The MCE parts look good okay.  Can you
split the patch in two?

Paolo

