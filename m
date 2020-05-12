Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jYTCB-0006Ho-Iy
	for mharc-qemu-trivial@gnu.org; Tue, 12 May 2020 07:35:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jYTCA-0006GB-22
 for qemu-trivial@nongnu.org; Tue, 12 May 2020 07:35:34 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40750
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jYTC8-000710-HJ
 for qemu-trivial@nongnu.org; Tue, 12 May 2020 07:35:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589283331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+BiTuuhaiRCRuygJo/UfgMumeWw31HiTY05kAioh0sw=;
 b=aI5hNrAW8dWtsg8iX64oeJ+bBnCen+LPzVDJpI6j/48p3MTV4viLvyDnxCGXfnx7f0Zjch
 zf7sMIqGfqZ8EtSUZUWV8QEsREW8lVsbo8vpLJftZ/ytxRA9V6/wC3gG/0l7SyUlFjBNly
 x52UXqYwkSth8uoPvc55swUzjzPNlls=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-TXVKrW_UNmGtkywWHnIT_Q-1; Tue, 12 May 2020 07:35:29 -0400
X-MC-Unique: TXVKrW_UNmGtkywWHnIT_Q-1
Received: by mail-wr1-f70.google.com with SMTP id z10so2796607wrs.2
 for <qemu-trivial@nongnu.org>; Tue, 12 May 2020 04:35:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+BiTuuhaiRCRuygJo/UfgMumeWw31HiTY05kAioh0sw=;
 b=HQ772mrHPoPbj8rBECmB78VpQLP17sKv0yF18up7ypeJOXBtDtFTHhV6+L9ex9VHFh
 GAqkgDM9QiGAhi2o/7+4G75koEi3KMOGy/oUEPrHyz5X1hk/6cyamyfXJIZGGZsx0Fhg
 hk2psUqdxJBGVxCRTS1TTYQo+a411GU/aWl/eZ8AE3ji/b9rYzAJH8Sh4kuRNf6mArVi
 bI/dQtl5ARHyJGw7xQv4wvls/+Ffc029GK+tjG453MB/ppy79DCf47p5hqN5JwvubzmO
 v5anGKJCJYQqofxmYykVrZ/+myg+jzYGGPF9WppvXHWUIgkQhpnNfJLQr/svQueLpgDf
 RGyg==
X-Gm-Message-State: AGi0PuaBRuriuLhyPaOv8cV8Q68cVZ3g9jbe4iNT6hbwOhqekpZvjEsR
 nrEpjufOwfnYsxm6yulmU/RLop1WJauEO+7Bu5z4iNKGOTNsVyGFF9/xnX8lXQGqEchJyjwpuES
 yZVSAsP9oOx9JUchP6A==
X-Received: by 2002:a7b:c5d4:: with SMTP id n20mr38375023wmk.92.1589283328774; 
 Tue, 12 May 2020 04:35:28 -0700 (PDT)
X-Google-Smtp-Source: APiQypIZBWCP2oEj/S8LiXheSW7eg8C7utjhj4b5hLWz7aH6Dpnc1ic28b7BJX+0qQj2+ajALvIbPA==
X-Received: by 2002:a7b:c5d4:: with SMTP id n20mr38374993wmk.92.1589283328508; 
 Tue, 12 May 2020 04:35:28 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:4c95:a679:8cf7:9fb6?
 ([2001:b07:6468:f312:4c95:a679:8cf7:9fb6])
 by smtp.gmail.com with ESMTPSA id g184sm16877850wmg.1.2020.05.12.04.35.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 May 2020 04:35:27 -0700 (PDT)
Subject: Re: [PATCH v4 4/6] scripts/kvm/vmxcap: Use Python 3 interpreter and
 add pseudo-main()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, kvm@vger.kernel.org,
 Eduardo Habkost <ehabkost@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Marcelo Tosatti <mtosatti@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>
References: <20200512103238.7078-1-philmd@redhat.com>
 <20200512103238.7078-5-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2c1a9a41-6e94-c20b-fdbd-445e260507ec@redhat.com>
Date: Tue, 12 May 2020 13:35:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200512103238.7078-5-philmd@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/12 02:20:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Tue, 12 May 2020 11:35:34 -0000

On 12/05/20 12:32, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  scripts/kvm/vmxcap | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/kvm/vmxcap b/scripts/kvm/vmxcap
> index 971ed0e721..6fe66d5f57 100755
> --- a/scripts/kvm/vmxcap
> +++ b/scripts/kvm/vmxcap
> @@ -1,4 +1,4 @@
> -#!/usr/bin/python
> +#!/usr/bin/env python3
>  #
>  # tool for querying VMX capabilities
>  #
> @@ -275,5 +275,6 @@ controls = [
>          ),
>      ]
>  
> -for c in controls:
> -    c.show()
> +if __name__ == '__main__':
> +    for c in controls:
> +        c.show()
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>


