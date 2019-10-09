Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iIJKS-00037l-JB
	for mharc-qemu-trivial@gnu.org; Wed, 09 Oct 2019 17:17:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46561)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iIJKN-00035X-LH
 for qemu-trivial@nongnu.org; Wed, 09 Oct 2019 17:17:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iIJKJ-0003Ku-K1
 for qemu-trivial@nongnu.org; Wed, 09 Oct 2019 17:16:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33194)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iIJKJ-0003Kd-DB
 for qemu-trivial@nongnu.org; Wed, 09 Oct 2019 17:16:55 -0400
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 69C593D966
 for <qemu-trivial@nongnu.org>; Wed,  9 Oct 2019 21:16:54 +0000 (UTC)
Received: by mail-wr1-f69.google.com with SMTP id m14so1663726wru.17
 for <qemu-trivial@nongnu.org>; Wed, 09 Oct 2019 14:16:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wSuLv6GKvlpjZvs6trjTcT1wzyAD6I0yI9QYOc6LYts=;
 b=Qo1YVQlofYSNI8nydTW9u2R9yj5oU8MQe+VJdEvq+D0brhCb4hvhYkQVM4ho96/VEO
 gxHMPXGeKPEqvR8/MPrAQ2YbHwxEKOrBW27usSd019i9azGStMIYPB5S73p9TD1o7gT0
 YmcJBfZ70eivnHZqGMuRsMEZpl+w3Oo7VfFCtmhfJAIpmi6rgNTZrkcOM/8O3q/OmN+m
 r0JbDXpjOyBgKuC+L5GhmANledWO2Hogp11o7GGEZeyzLLibfRqQabkDjfMFB0z9cm0j
 7O8lWttFA7+JVmqGCd41YKlPUgmhgAsnnhKa5hK/GbOEgnRZF7fQz0+eOH7YirOjbEGE
 jbgg==
X-Gm-Message-State: APjAAAX0iHRga3qghDcQ+jJddJZt5I9NdCJpVRJ1yfl7Kj73oUcl1tvD
 zz/tlYFbu0A4vkQAIvFDoAomb6/uOdpXnwNVtbWU6k6kDRQobNSs55s998Ax7khgR7uykQEMKar
 +9TetD+Ebm0AMzYQlOg==
X-Received: by 2002:a7b:cd19:: with SMTP id f25mr4443456wmj.154.1570655812885; 
 Wed, 09 Oct 2019 14:16:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz/KzqtNoat+5xxDNXUF4leZmHYsUe+6wTNWtgMXMsMvLpVOZnxEoNsMXshwPzlO5ow057DjQ==
X-Received: by 2002:a7b:cd19:: with SMTP id f25mr4443435wmj.154.1570655812620; 
 Wed, 09 Oct 2019 14:16:52 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:1032:7ea1:7f8f:1e5?
 ([2001:b07:6468:f312:1032:7ea1:7f8f:1e5])
 by smtp.gmail.com with ESMTPSA id r2sm6498797wma.1.2019.10.09.14.16.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2019 14:16:52 -0700 (PDT)
Subject: Re: [PATCHv2 1/2] util/qemu-error: add guest name helper with -msg
 options
To: Mario Smarduch <msmarduch@digitalocean.com>, philmd@redhat.com,
 mtosatti@redhat.com, armbru@redhat.com
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, rth@twiddle.net,
 ehabkost@redhat.com
References: <20191009164459.8209-1-msmarduch@digitalocean.com>
 <20191009164459.8209-2-msmarduch@digitalocean.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <3f24a34d-de91-c996-ffd8-306d0e0ce6a0@redhat.com>
Date: Wed, 9 Oct 2019 23:16:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191009164459.8209-2-msmarduch@digitalocean.com>
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
X-List-Received-Date: Wed, 09 Oct 2019 21:17:01 -0000

On 09/10/19 18:44, Mario Smarduch wrote:
>  };
> @@ -1263,6 +1267,7 @@ static void realtime_init(void)
>  static void configure_msg(QemuOpts *opts)
>  {
>      enable_timestamp_msg = qemu_opt_get_bool(opts, "timestamp", true);
> +    enable_guestname_msg = qemu_opt_get_bool(opts, "name", false);
>  }

Before, the msg option certainly had a timestamp suboption, but this
might not be the case now.  So that "true" needs to become "false".
I'll fix it up when applying.

Paolo

