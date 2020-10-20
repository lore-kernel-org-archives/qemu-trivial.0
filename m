Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kUu0t-0004le-8V
	for mharc-qemu-trivial@gnu.org; Tue, 20 Oct 2020 11:57:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kUu0q-0004fF-QD
 for qemu-trivial@nongnu.org; Tue, 20 Oct 2020 11:57:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kUu0o-0003t1-7o
 for qemu-trivial@nongnu.org; Tue, 20 Oct 2020 11:57:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603209440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kipOOKJo5yLUIadBh/0UsO2xryBcw31fxo0+FFKLqio=;
 b=TFU+l49GcfbwYNf1emhGx83n4jaRBTq2CL1wvKJBHkcEQzzKcpew6L/fgRAPZbQp44ffsY
 byl/IXZG7Hjdj3OltsGYiR89fG7D0JcWBt2bIhG34UCr9QegK1g9uajdKXeTBeu8zroimN
 LW4RL9zKcZkhuUUCo0yrRqN3GfI4Qo0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-RSmOicLJNSOKMeJL6iNuKA-1; Tue, 20 Oct 2020 11:57:19 -0400
X-MC-Unique: RSmOicLJNSOKMeJL6iNuKA-1
Received: by mail-wr1-f71.google.com with SMTP id t11so989422wrv.10
 for <qemu-trivial@nongnu.org>; Tue, 20 Oct 2020 08:57:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kipOOKJo5yLUIadBh/0UsO2xryBcw31fxo0+FFKLqio=;
 b=EBOClZohWJuMnDL9QrWfQP4/OLYOcQkUjpxe7hD//JT8qU04E4KO8jJKOvTokQAiHA
 qU7yluM6utOuM948snPgZ2BdupzKspz3eKEmxOeMqrWano6kl7mws7LFQJwLyoupZtIt
 uA0VVKc425Ri0sts8jdhQga5ffpR+Hbh7ffKI/yVLGlQ/xyI0FfaTe4Gj5CNPCGz4L16
 gsnO1p0ttWbupuIrRDaVJRGFdhybKMKNPDtGebXSVxODvhCJgekt3+pOlQ3rhb0zKILn
 lz5rQ88Vv75ouDNB7EF+3a9BDKRNpLeY7jtXAoCqxo7bWgrZx0TPseDDse6j0Mg4y3Mk
 qqww==
X-Gm-Message-State: AOAM530Wrr4G4Yn7PdtdN8sJPWo2gi6tep6/tkpnYUvVGHs+IbU1HzH8
 //4F5dBcPDN1tPLCAMXMEndsEhsRcbrVriYyQU/Lv+NkJQzQq/+ckO/xvot5gs03To/fL1awlmg
 uqgNfa+383i/spdlVgQ==
X-Received: by 2002:a5d:60c4:: with SMTP id x4mr4567472wrt.175.1603209437910; 
 Tue, 20 Oct 2020 08:57:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhS3ShUDinqJWU7Dd1+vqojjQ3+igk2Vlp3d49JcHb8JORTDXlN1VVM9nc1V4rX/r05Okf3A==
X-Received: by 2002:a5d:60c4:: with SMTP id x4mr4567457wrt.175.1603209437718; 
 Tue, 20 Oct 2020 08:57:17 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m14sm3727212wro.43.2020.10.20.08.57.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Oct 2020 08:57:17 -0700 (PDT)
Subject: Re: [PATCH] Remove deprecated -no-kvm option
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, libvir-list@redhat.com
References: <20201020155254.56589-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <cc8719ce-3c7e-ee56-f0eb-849c7a2034f0@redhat.com>
Date: Tue, 20 Oct 2020 17:57:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201020155254.56589-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 01:16:16
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
X-List-Received-Date: Tue, 20 Oct 2020 15:57:25 -0000

On 20/10/20 17:52, Thomas Huth wrote:
> The option has never been mentioned in our documentation, it's been
> deprecated since years, it's marked with QEMU_ARCH_I386 (which does
> not make sense anymore since KVM is available on other architectures,
> too), it does not do anything by default in upstream QEMU (since TCG
> is the default here anyway), and we're spending too much precious time
> each year discussing whether it makes sense to keep this option as a
> nice suger or not... let's finally put an end on this and remove it.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/system/deprecated.rst | 5 -----
>  qemu-options.hx            | 3 ---
>  softmmu/vl.c               | 4 ----
>  3 files changed, 12 deletions(-)
> 
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index 905628f3a0..66ef89b872 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -27,11 +27,6 @@ System emulator command line arguments
>  The ``enforce-config-section`` parameter is replaced by the
>  ``-global migration.send-configuration={on|off}`` option.
>  
> -``-no-kvm`` (since 1.3.0)
> -'''''''''''''''''''''''''
> -
> -The ``-no-kvm`` argument is now a synonym for setting ``-accel tcg``.
> -

And of course it's going to need a v2 because it should be added in the
"removed" section.  It's really cursed. :)

Paolo


